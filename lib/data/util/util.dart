String getStudentId(String url) {
  int lastSlashIndex = url.lastIndexOf('/');
  int end = url.lastIndexOf('?');
  if (end == -1) {
    end = url.length;
  }
  String studentId = url.substring(lastSlashIndex + 1, end);
  return studentId;
}
