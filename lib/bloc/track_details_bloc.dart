import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/model/track_details_data.dart';
import 'package:flutter_task/model/track_lyrics_model.dart';
import 'package:flutter_task/resources/repository.dart';

class TrackDetailsBloc extends Bloc<TrackDetailsEvents, TrackDetailsState> {
  final _repository = Repository();
  late TrackDetailsData responseModel;

  String trackId = "";

  TrackDetailsBloc(this.trackId) : super(const TrackDetailsState()) {
    on<TrackDetailsFetched>((event, emit) {
      _onTrackLyricsFetch(event, emit, trackId);
    });
  }

  Future<void> _onTrackLyricsFetch(TrackDetailsEvents events,
      Emitter<TrackDetailsState> emitter, String trackId) async {
    try {
      final responseModel = await _repository.fetchTrackLyrics(trackId);

      print(responseModel);
      return emit(state.copyWith(
        status: TrackDetailsStatus.success,
        trackLyrics: responseModel,
      ));
    } catch (_) {
      emit(state.copyWith(status: TrackDetailsStatus.failure));
    }
  }
}

class TrackDetailsState extends Equatable {
  final TrackDetailsStatus status;
  final LyricsData? trackLyrics;


  @override
  // TODO: implement props
  List<Object?> get props => [status, trackLyrics];

  const TrackDetailsState(
      {this.status = TrackDetailsStatus.initial, this.trackLyrics});

  TrackDetailsState copyWith({
    TrackDetailsStatus? status,
    LyricsData? trackLyrics,
  }) {
    return TrackDetailsState(status: status!, trackLyrics: trackLyrics);
  }

  @override
  String toString() {
    // TODO: implement toString
    return "super.toString()";
  }
}

abstract class TrackDetailsEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class TrackDetailsFetched extends TrackDetailsEvents {}

enum TrackDetailsStatus { initial, success, failure }
enum TrackLyricsStatus { initial, success, failure }
