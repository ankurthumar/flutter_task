import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/bloc/network_bloc.dart';
import 'package:flutter_task/bloc/trending_bloc.dart';
import 'package:flutter_task/screens/track_details_view.dart';

class TrackListingView extends StatelessWidget {
  const TrackListingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trending", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: BlocProvider(
          create: (context) => NetworkBloc()..add(NetworkFetched()),
          child: BlocBuilder<NetworkBloc, NetworkState>(
            builder: (context, state) {
              switch (state.status) {
                case NetworkStatus.offline:
                  return const Center(
                    child: Text("No Internet Connection"),
                  );
                case NetworkStatus.online:
                  return BlocProvider(
                      create: (context) =>
                          TrendingBloc()..add(TrendingFetched()),
                      child: BlocBuilder<TrendingBloc, TrendingState>(
                        builder: (context, state) {
                          switch (state.status) {
                            case TrendingStatus.failure:
                              return const Center(
                                child: Text("Request Fail"),
                              );
                            case TrendingStatus.success:
                              return state.trackList.isEmpty
                                  ? const Center(
                                      child: Text("No Data Found"),
                                    )
                                  : ListView.builder(
                                      padding: const EdgeInsets.all(10),
                                      itemCount: state.trackList.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TrackDetailsView(
                                                    trackData: state
                                                        .trackList[index]
                                                        .track!,
                                                  ),
                                                ));
                                          },
                                          behavior: HitTestBehavior.opaque,
                                          child: Column(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Icon(
                                                        Icons.library_music,
                                                        color: Colors.grey),
                                                    const SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            state
                                                                    .trackList[
                                                                        index]
                                                                    .track
                                                                    ?.trackName ??
                                                                "N/A",
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16.0),
                                                            softWrap: true,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          const SizedBox(
                                                            height: 8.0,
                                                          ),
                                                          Text(
                                                            state
                                                                    .trackList[
                                                                        index]
                                                                    .track
                                                                    ?.albumName ??
                                                                "N/A",
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        14.0),
                                                            softWrap: true,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Container(
                                                      width: 80.0,
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        state
                                                                .trackList[
                                                                    index]
                                                                .track
                                                                ?.artistName ??
                                                            "N/A",
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14.0,
                                                        ),
                                                        softWrap: true,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 3,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 1.0,
                                                decoration: const BoxDecoration(
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                            default:
                              return const Center(
                                  child: CircularProgressIndicator());
                          }
                        },
                      ));
                default:
                  return Container();
              }
            },
          )),
    );
  }
}
