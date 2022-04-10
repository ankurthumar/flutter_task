import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/bloc/track_details_bloc.dart';
import 'package:flutter_task/model/track_details_data.dart';

class TrackDetailsView extends StatelessWidget {
  TrackDetailsData trackData;

  TrackDetailsView({Key? key, required this.trackData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            const Text("Track Details", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back, color: Colors.black),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocProvider(
          create: (context) =>
              TrackDetailsBloc(trackData.trackId)..add(TrackDetailsFetched()),
          child: BlocBuilder<TrackDetailsBloc, TrackDetailsState>(
              builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.all(10),
              children: [
                getDetailsWidget("Name", trackData.trackName),
                getDetailsWidget("Artist", trackData.artistName),
                getDetailsWidget("Album Name", trackData.albumName),
                getDetailsWidget("Explicit", trackData.explicit),
                getDetailsWidget("Rating", trackData.trackRating),
                getDetailsWidget(
                    "Lyrics",
                    state.status == TrackDetailsStatus.success
                        ? state.trackLyrics == null
                            ? "No Lyric Found"
                            : state.trackLyrics?.lyricsBody ?? "N/A"
                        : "No Lyric Found"),
              ],
            );
          })),
    );
  }

  Widget getDetailsWidget(String title, String data) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 14.0),
          softWrap: true,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          data,
          style: const TextStyle(color: Colors.black, fontSize: 18.0),
          softWrap: true,
        ),
        const SizedBox(
          height: 12.0,
        )
      ],
    );
  }
}
