class DioUtil {
    static Dio _instance;//method for getting dio instance  Dio getInstance() {
    if(_instance ==null)

    {
        _instance = createDioInstance();
    }
    return _instance;
}

    Dio createDioInstance() {
        var dio = Dio();// adding interceptor    dio.interceptors.clear();
        dio.interceptors.add(InterceptorsWrapper(onRequest:(options, handler){
            return handler.next(options);
        },onResponse:
        (response, handler){
            if (response != null) {
                return handler.next(response);
            } else {
                return null;
            }
        },onError:
        (DioError e, handler)async {

            if (e.response != null) {
                if (e.response.statusCode == 401) {//catch the 401 here
                    dio.interceptors.requestLock.lock();
                    dio.interceptors.responseLock.lock();
                    RequestOptions requestOptions = e.requestOptions;

                    await refreshToken ();
                    Repository repository = Repository();
                    var accessToken = await repository.readData("accessToken");
                    final opts =new Options(method:requestOptions.method);
                    dio.options.headers["Authorization"] = "Bearer " + accessToken;
                    dio.options.headers["Accept"] = "*/*";
                    dio.interceptors.requestLock.unlock();
                    dio.interceptors.responseLock.unlock();
                    final response =await dio.request(requestOptions.path,
                            options:opts,
                            cancelToken:requestOptions.cancelToken,
                            onReceiveProgress:requestOptions.onReceiveProgress,
                            data:requestOptions.data,
                            queryParameters:requestOptions.queryParameters);
                    if (response != null) {
                        handler.resolve(response);
                    } else {
                        return null;
                    }
                } else {
                    handler.next(e);
                }
            }

        }));
        return dio;
    }

    static refreshToken() async {
        Response response;
        Repository repository = Repository();
        var dio = Dio();
        final Uri apiUrl = Uri.parse(BASE_PATH + "auth/reIssueAccessToken");
        var refreshToken = await repository.readData("refreshToken");
        dio.options.headers["Authorization"] = "Bearer " + refreshToken;
        try {
            response = await dio.postUri(apiUrl);
            if (response.statusCode == 200) {
                LoginResponse loginResponse =
                        LoginResponse.fromJson(jsonDecode(response.toString()));
                repository.addValue('accessToken', loginResponse.data.accessToken);
                repository.addValue('refreshToken', loginResponse.data.refreshToken);
            } else {
                print(response.toString()); //TODO: logout
            }
        } catch (e) {
            print(e.toString()); //TODO: logout
        }
    }
}