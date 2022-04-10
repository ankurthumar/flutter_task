import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/model/trending_main_model.dart';
import 'package:flutter_task/resources/repository.dart';

class TrendingBloc extends Bloc<TrendingEvents, TrendingState> {
  final _repository = Repository();
  late TrendingMainModel responseModel;

  TrendingBloc() : super(const TrendingState()) {
    on<TrendingFetched>(_onTrendingFetch);
  }

  Future<void> _onTrendingFetch(
      TrendingEvents events, Emitter<TrendingState> emitter) async {
    try {
      if (state.status == TrendingStatus.initial) {
        final responseModel = await _repository.fetchTrendingList();
        return emit(state.copyWith(
          status: TrendingStatus.success,
          trackList: responseModel,
        ));
      }
    } catch (_) {
      emit(state.copyWith(status: TrendingStatus.failure));
    }
  }
}

class TrendingState extends Equatable {
  final TrendingStatus status;
  final List<TrackList> trackList;

  @override
  // TODO: implement props
  List<Object?> get props => [status, trackList];

  const TrendingState(
      {this.status = TrendingStatus.initial, this.trackList = const <TrackList>[]});

  TrendingState copyWith({
    TrendingStatus? status,
    List<TrackList>? trackList,
  }) {
    return TrendingState(status: status!, trackList: trackList??[]);
  }

  @override
  String toString() {
    // TODO: implement toString
    return "super.toString()";
  }
}

abstract class TrendingEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class TrendingFetched extends TrendingEvents {}

enum TrendingStatus { initial, success, failure }
