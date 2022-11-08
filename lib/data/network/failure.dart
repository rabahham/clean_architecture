class Failure {
  int code; // 200,201,400,303,500 end so on
  String message;
  Failure({
    required this.code,
    required this.message,
  });
}
