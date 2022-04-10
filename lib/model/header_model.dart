
class HeaderModel {
  HeaderModel({
    required this.statusCode,
    required this.executeTime,
  });

  final int statusCode;
  final String executeTime;

  factory HeaderModel.fromJson(Map<String, dynamic> json) => HeaderModel(
    statusCode: json["status_code"],
    executeTime: json["execute_time"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "execute_time": executeTime,
  };
}
