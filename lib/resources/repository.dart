import 'package:flutter_task/model/track_details_data.dart';
import 'package:flutter_task/model/track_details_main_model.dart';
import 'package:flutter_task/model/track_lyrics_model.dart';
import 'package:flutter_task/model/trending_main_model.dart';
import 'package:flutter_task/resources/trending_api_provider.dart';

class Repository{
  final apiProvider = ApiProvider();

  Future<List<TrackList>> fetchTrendingList() => apiProvider.fetchTrendingList();
  Future<TrackDetailsData?> fetchTrackDetails(String trackId) => apiProvider.fetchTrackDetails(trackId);
  Future<LyricsData?> fetchTrackLyrics(String trackId) => apiProvider.fetchTrackLyrics(trackId);
}