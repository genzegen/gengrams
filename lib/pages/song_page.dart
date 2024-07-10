import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/models/playlist_provider.dart';
import 'package:provider/provider.dart';

import '../components/neu_box.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        //get the playlist
        final playlist = value.playlist;

        //get current song index
        final currentSong = playlist[value.currentSongIndex ?? 0];

        //return Scaffold UI
        return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //app bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //back button
                        IconButton(
                          onPressed: () => {Navigator.pop(context)},
                          icon: const Icon(Icons.arrow_back),
                        ),

                        //title
                        const Text(
                          "P L A Y L I S T",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),

                        //menu button
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.menu),
                        ),
                      ],
                    ),

                    //album artwork
                    NeuBox(
                      child: Column(
                        children: [
                          //image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(currentSong.albumArtImagePath),
                          ),

                          //song and artist name and icon
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //song name and artist
                                    Text(
                                      currentSong.songName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(currentSong.artistsName),
                                  ],
                                ),
                                //heart icon
                                const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    //song duration progress
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //start time
                              Text("0:00"),

                              //shuffle
                              Icon(Icons.shuffle),

                              //repeat
                              Icon(Icons.repeat),

                              //end time
                              Text("0:00")
                            ],
                          ),
                        ),

                        //song duration slider
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 0),
                          ),
                          child: Slider(
                            min: 0,
                            max: 100,
                            value: 50,
                            activeColor: Colors.green,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    //playback controls
                    Row(
                      children: [
                        //skip previous
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: const NeuBox(
                              child: Icon(Icons.skip_previous),
                            ),
                          ),
                        ),

                        const SizedBox(width: 20),

                        //play pause
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () {},
                            child: const NeuBox(
                              child: Icon(Icons.play_arrow),
                            ),
                          ),
                        ),

                        const SizedBox(width: 20),
                        //skip next
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: const NeuBox(
                              child: Icon(Icons.skip_next),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),);
      }
    );
  }
}
