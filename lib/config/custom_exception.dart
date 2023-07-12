class CustomException implements Exception {
  final String? msg;

  CustomException(this.msg);

  @override
  String toString() {
    // TODO: implement toString
    return msg ?? "error";
  }
}
