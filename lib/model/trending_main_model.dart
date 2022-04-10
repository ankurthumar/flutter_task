import 'package:flutter_task/model/header_model.dart';
import 'package:flutter_task/model/track_details_data.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

TrendingMainModel trendingMainModelFromJson(String str) =>
    TrendingMainModel.fromJson(json.decode(str));

String trendingMainModelToJson(TrendingMainModel data) =>
    json.encode(data.toJson());

class TrendingMainModel {
  TrendingMainModel({
    this.message,
  });

  final Message? message;

  factory TrendingMainModel.fromJson(Map<String, dynamic> json) =>
      TrendingMainModel(
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
    required this.trackList,
  });

  final List<TrackList> trackList;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        trackList: json["track_list"] == null
            ? []
            : List<TrackList>.from(
                json["track_list"].map((x) => TrackList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "track_list": List<dynamic>.from(trackList.map((x) => x.toJson())),
      };
}

class TrackList {
  TrackList({
    required this.track,
  });

  final TrackDetailsData? track;

  factory TrackList.fromJson(Map<String, dynamic> json) => TrackList(
        track: json["track"] == null ? null : TrackDetailsData.fromJson(json["track"]),
      );

  Map<String, dynamic> toJson() => {
        "track": track == null ? null : track!.toJson(),
      };
}