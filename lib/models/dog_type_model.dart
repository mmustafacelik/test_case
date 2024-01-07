import 'dart:convert';

class DogTypeModel {
  List<String>? message;
  String? status;
  String? error;

  DogTypeModel({
    this.message,
    this.status,
    this.error,
  });

  DogTypeModel copyWith({
    List<String>? message,
    String? status,
  }) =>
      DogTypeModel(
        message: message ?? this.message,
        status: status ?? this.status,
      );
  DogTypeModel.withError(String errorMessage) {
    error = errorMessage;
  }
  factory DogTypeModel.fromRawJson(String str) =>
      DogTypeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DogTypeModel.fromJson(Map<String, dynamic> json) => DogTypeModel(
        message: json["message"] == null
            ? []
            : List<String>.from(json["message"]!.map((x) => x)),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message":
            message == null ? [] : List<dynamic>.from(message!.map((x) => x)),
        "status": status,
      };
}
