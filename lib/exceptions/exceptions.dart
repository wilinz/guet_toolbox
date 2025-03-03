class UserNewSystemIDNullException implements Exception {
  final String message;

  UserNewSystemIDNullException([this.message = '用户新系统 ID 为空']);

  @override
  String toString() => 'UserNewSystemIDNullException: $message';
}
