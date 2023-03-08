parseHttpLocation(final String rawUri, final String location) {
  var location1 = location;
  String uri;
  if (!location1.contains("://")) {
    final schemaEndIndex = rawUri.indexOf("://") + 3;
    print(rawUri.substring(schemaEndIndex));
    var index = location1.startsWith("/")
        ? rawUri.indexOf("/", schemaEndIndex)
        : rawUri.substring(schemaEndIndex).lastIndexOf("/") + schemaEndIndex;
    if (index == -1) index = rawUri.length - 1;
    var baseUrl = rawUri.substring(0, index + 1);
    if (baseUrl.endsWith("/")) {
      baseUrl = baseUrl.substring(0, baseUrl.length - 1);
    }
    if (location1.startsWith("/")) {
      location1 = location1.substring(1);
    }
    uri = baseUrl + "/" + location1;
  } else {
    uri = location1;
  }
  return uri;
}