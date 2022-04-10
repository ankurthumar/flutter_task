import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(const NetworkState()) {
    on<NetworkFetched>(_onNetworkListener);
  }

  Future<void> _onNetworkListener(
      NetworkEvent event, Emitter<NetworkState> emitter) async {
    if (state.status == NetworkStatus.initial) {
      Connectivity().onConnectivityChanged.listen((status) {
       return status == ConnectivityResult.mobile || status == ConnectivityResult.wifi
            ? emit(state.copyWith(status: NetworkStatus.online))
            : emit(state.copyWith(status: NetworkStatus.offline));
      });
    }
  }
}

enum NetworkStatus { initial, online, offline }

class NetworkState extends Equatable {
  final NetworkStatus status;

  @override
  // TODO: implement props
  List<Object?> get props => [status];

  const NetworkState({this.status = NetworkStatus.initial});

  NetworkState copyWith({
    required NetworkStatus status,
  }) {
    return NetworkState(status: status);
  }
}

abstract class NetworkEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class NetworkFetched extends NetworkEvent {}
