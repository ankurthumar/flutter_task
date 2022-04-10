import 'dart:convert';

import 'package:flutter_task/model/track_details_data.dart';
import 'package:flutter_task/model/track_details_main_model.dart';
import 'package:flutter_task/model/track_lyrics_model.dart';
import 'package:flutter_task/model/trending_main_model.dart';
import 'package:http/http.dart' show Client;

class ApiProvider {
  Client client = Client();

  Future<List<TrackList>> fetchTrendingList() async {
    String url =
        "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7";

    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // return NewsModel.fromJson(json.decode(response.body));
      TrendingMainModel responseModel = TrendingMainModel.fromJson(jsonDecode(response.body));
      List<TrackList> trackList = [];
      if(responseModel.message?.header?.statusCode == 200){
        trackList = responseModel.message?.body?.trackList??[];
      }
      return trackList;
    } else {
      throw Exception("Faild to post!");
    }
  }

  Future<TrackDetailsData?> fetchTrackDetails(String trackID) async {
    String url =
        "https://api.musixmatch.com/ws/1.1/track.get?track_id=$trackID&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7";

    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // return NewsModel.fromJson(json.decode(response.body));
      TrackDetailsMainModel responseModel = TrackDetailsMainModel.fromJson(jsonDecode(response.body));
      TrackDetailsData? data;
      if(responseModel.message?.header?.statusCode == 200){
        data = responseModel.message?.body?.track;
      }
      return data;
    } else {
      throw Exception("Faild to post!");
    }
  }

  Future<LyricsData?> fetchTrackLyrics(String trackID) async {
    String url =
        "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackID&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7";

    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      TrackLyricsModel responseModel = TrackLyricsModel.fromJson(jsonDecode(response.body));
      LyricsData? data;
      if(responseModel.message.header?.statusCode == 200){
        data = responseModel.message.body?.lyrics;
      }
      return data;
    } else {
      throw Exception("Faild to post!");
    }
  }
}
