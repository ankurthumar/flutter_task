class TrackDetailsData {
  TrackDetailsData({
    required this.trackId,
    required this.trackName,
    required this.trackNameTranslationList,
    required this.trackRating,
    required this.commontrackId,
    required this.instrumental,
    required this.explicit,
    required this.hasLyrics,
    required this.hasSubtitles,
    required this.hasRichsync,
    required this.numFavourite,
    required this.albumId,
    required this.albumName,
    required this.artistId,
    required this.artistName,
    required this.trackShareUrl,
    required this.trackEditUrl,
    required this.restricted,
    required this.updatedTime,
    required this.primaryGenres,
  });

  final String trackId;
  final String trackName;
  final List<dynamic> trackNameTranslationList;
  final String trackRating;
  final String commontrackId;
  final String instrumental;
  final String explicit;
  final String hasLyrics;
  final String hasSubtitles;
  final String hasRichsync;
  final String numFavourite;
  final String albumId;
  final String albumName;
  final String artistId;
  final String artistName;
  final String trackShareUrl;
  final String trackEditUrl;
  final String restricted;
  final String updatedTime;
  final PrimaryGenres? primaryGenres;

  factory TrackDetailsData.fromJson(Map<String, dynamic> json) => TrackDetailsData(
    trackId: json["track_id"].toString(),
    trackName: json["track_name"],
    trackNameTranslationList: json["track_name_translation_list"] == null
        ? []
        : List<dynamic>.from(
        json["track_name_translation_list"].map((x) => x)),
    trackRating: json["track_rating"].toString(),
    commontrackId: json["commontrack_id"].toString(),
    instrumental: json["instrumental"].toString(),
    explicit: json["explicit"].toString(),
    hasLyrics: json["has_lyrics"].toString(),
    hasSubtitles: json["has_subtitles"].toString(),
    hasRichsync: json["has_richsync"].toString(),
    numFavourite: json["num_favourite"].toString(),
    albumId: json["album_id"].toString(),
    albumName: json["album_name"],
    artistId: json["artist_id"].toString(),
    artistName: json["artist_name"],
    trackShareUrl: json["track_share_url"],
    trackEditUrl: json["track_edit_url"],
    restricted: json["restricted"].toString(),
    updatedTime: json["updated_time"],
    primaryGenres: json["primary_genres"] == null
        ? null
        : PrimaryGenres.fromJson(json["primary_genres"]),
  );

  Map<String, dynamic> toJson() => {
    "track_id": trackId,
    "track_name": trackName,
    "track_name_translation_list": trackNameTranslationList == null
        ? null
        : List<dynamic>.from(trackNameTranslationList.map((x) => x)),
    "track_rating": trackRating,
    "commontrack_id": commontrackId,
    "instrumental": instrumental,
    "explicit": explicit,
    "has_lyrics": hasLyrics,
    "has_subtitles": hasSubtitles,
    "has_richsync": hasRichsync,
    "num_favourite": numFavourite,
    "album_id": albumId,
    "album_name": albumName,
    "artist_id": artistId,
    "artist_name": artistName,
    "track_share_url": trackShareUrl,
    "track_edit_url": trackEditUrl,
    "restricted": restricted,
    "updated_time": updatedTime,
    "primary_genres":
    primaryGenres == null ? null : primaryGenres!.toJson(),
  };
}

class PrimaryGenres {
  PrimaryGenres({
    required this.musicGenreList,
  });

  final List<dynamic> musicGenreList;

  factory PrimaryGenres.fromJson(Map<String, dynamic> json) => PrimaryGenres(
    musicGenreList: json["music_genre_list"] == null
        ? []
        : List<dynamic>.from(json["music_genre_list"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "music_genre_list": musicGenreList == null
        ? null
        : List<dynamic>.from(musicGenreList.map((x) => x)),
  };
}
