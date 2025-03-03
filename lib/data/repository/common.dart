class NotLoggedInException implements Exception {
  final String message;

  NotLoggedInException([this.message = 'User is not logged in']);

  @override
  String toString() => 'NotLoggedInException: $message';
}
