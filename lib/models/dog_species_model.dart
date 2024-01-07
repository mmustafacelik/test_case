import 'dart:convert';

class DogSpeciesModel {
  Map<String, List<String>>? message;
  String? status;
  String? error;
  Map<String, String>? photo;

  DogSpeciesModel({
    this.message,
    this.status,
  });

  DogSpeciesModel copyWith({
    Map<String, List<String>>? message,
    String? status,
  }) =>
      DogSpeciesModel(
        message: message ?? this.message,
        status: status ?? this.status,
      );

  factory DogSpeciesModel.fromRawJson(String str) =>
      DogSpeciesModel.fromJson(json.decode(str));
  DogSpeciesModel.withError(String errorMessage) {
    error = errorMessage;
  }
  String toRawJson() => json.encode(toJson());

  factory DogSpeciesModel.fromJson(Map<String, dynamic> json) =>
      DogSpeciesModel(
        message: Map.from(json["message"]!).map((k, v) =>
            MapEntry<String, List<String>>(
                k, List<String>.from(v.map((x) => x)))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": Map.from(message!).map((k, v) =>
            MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
        "status": status,
      };
}
