import 'dart:convert';

import 'package:flutter_task/model/header_model.dart';
import 'package:flutter_task/model/track_details_data.dart';
import 'package:flutter_task/model/trending_main_model.dart';

TrackDetailsMainModel trendingMainModelFromJson(String str) =>
    TrackDetailsMainModel.fromJson(json.decode(str));

String trendingMainModelToJson(TrackDetailsMainModel data) =>
    json.encode(data.toJson());

class TrackDetailsMainModel {
  TrackDetailsMainModel({
    required this.message,
  });

  final Message? message;

  factory TrackDetailsMainModel.fromJson(Map<String, dynamic> json) =>
      TrackDetailsMainModel(
        message:
        json["message"] == null ? null : Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message!.toJson(),
  };
}

class Message {
  Message({
    required this.header,
    required this.body,
  });

  final HeaderModel? header;
  final Body? body;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    header: json["header"] == null ? null : HeaderModel.fromJson(json["header"]),
    body: json["body"] == null ? null : Body.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "header": header == null ? null : header!.toJson(),
    "body": body == null ? null : body!.toJson(),
  };
}

class Body {
  Body({
    required this.track,
  });

  final TrackDetailsData? track;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
      track: json["track"] == null ? null : TrackDetailsData.fromJson(json["track"]),

  );

  Map<String, dynamic> toJson() => {
    "track": track == null ? null : track!.toJson(),
  };
}
