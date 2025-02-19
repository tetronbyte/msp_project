import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../widgets/song_progress_bar.dart';

class MusicPlayerScreen extends StatefulWidget {
  final String songTitle;
  final String artistName;
  final String songUrl;

  const MusicPlayerScreen({
    super.key,
    required this.songTitle,
    required this.artistName,
    required this.songUrl,
  });

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer _audioPlayer;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    try {
      await _audioPlayer.setUrl(widget.songUrl);
      _audioPlayer.positionStream.listen((duration) {
        setState(() {
          _progress = duration.inMilliseconds /
              (_audioPlayer.duration?.inMilliseconds ?? 1);
        });
      });
      _audioPlayer.play();
    } catch (e) {
      print("Error loading song: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.songTitle)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Icon(Icons.music_note, size: 100, color: Colors.blue),
          const SizedBox(height: 10),
          Text(
            widget.songTitle,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(widget.artistName, style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 30),
          SongProgressBar(progress: _progress),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.play_arrow, size: 40, color: Colors.blue),
                onPressed: () => _audioPlayer.play(),
              ),
              IconButton(
                icon: const Icon(Icons.pause, size: 40, color: Colors.red),
                onPressed: () => _audioPlayer.pause(),
              ),
              IconButton(
                icon: const Icon(Icons.stop, size: 40, color: Colors.black),
                onPressed: () => _audioPlayer.stop(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
