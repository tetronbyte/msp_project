import 'package:flutter/material.dart';
import 'music_player_screen.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> songs = [
    {
      "title": "Song One",
      "artist": "Artist A",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"
    },
    {
      "title": "Song Two",
      "artist": "Artist B",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Music Player")),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.music_note, color: Colors.blue),
            title: Text(songs[index]["title"]!),
            subtitle: Text(songs[index]["artist"]!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MusicPlayerScreen(
                    songTitle: songs[index]["title"]!,
                    artistName: songs[index]["artist"]!,
                    songUrl: songs[index]["url"]!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
