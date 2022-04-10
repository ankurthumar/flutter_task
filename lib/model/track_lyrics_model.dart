// To parse this JSON data, do
//
//     final trackLyricsModel = trackLyricsModelFromJson(jsonString);

import 'package:flutter_task/model/header_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

TrackLyricsModel trackLyricsModelFromJson(String str) =>
    TrackLyricsModel.fromJson(json.decode(str));

String trackLyricsModelToJson(TrackLyricsModel data) =>
    json.encode(data.toJson());

class TrackLyricsModel {
  TrackLyricsModel({
    required this.message,
  });

  final Message message;

  factory TrackLyricsModel.fromJson(Map<String, dynamic> json) =>
      TrackLyricsModel(
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
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
        header: json["header"] == null
            ? null
            : HeaderModel.fromJson(json["header"]),
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "header": header == null ? null : header!.toJson(),
        "body": body == null ? null : body!.toJson(),
      };
}

class Body {
  Body({
    required this.lyrics,
  });

  final LyricsData? lyrics;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        lyrics:
            json["lyrics"] == null ? null : LyricsData.fromJson(json["lyrics"]),
      );

  Map<String, dynamic> toJson() => {
        "lyrics": lyrics == null ? null : lyrics!.toJson(),
      };
}

class LyricsData {
  LyricsData({
    required this.lyricsId,
    required this.explicit,
    required this.lyricsBody,
    required this.scriptTrackingUrl,
    required this.pixelTrackingUrl,
    required this.lyricsCopyright,
    required this.updatedTime,
  });

  final String lyricsId;
  final String explicit;
  final String lyricsBody;
  final String scriptTrackingUrl;
  final String pixelTrackingUrl;
  final String lyricsCopyright;
  final String updatedTime;

  factory LyricsData.fromJson(Map<String, dynamic> json) => LyricsData(
        lyricsId: json["lyrics_id"].toString(),
        explicit: json["explicit"].toString(),
        lyricsBody: json["lyrics_body"],
        scriptTrackingUrl: json["script_tracking_url"],
        pixelTrackingUrl: json["pixel_tracking_url"],
        lyricsCopyright: json["lyrics_copyright"],
        updatedTime: json["updated_time"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "lyrics_id": lyricsId,
        "explicit": explicit,
        "lyrics_body": lyricsBody,
        "script_tracking_url": scriptTrackingUrl,
        "pixel_tracking_url": pixelTrackingUrl,
        "lyrics_copyright": lyricsCopyright,
        "updated_time":
            updatedTime,
      };
}
