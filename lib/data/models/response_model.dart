class Response {
  bool success;
  String message;
  dynamic data;

  Response({
    required this.success,
    required this.message,
    required this.data,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        success: json["success"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data,
      };
}
