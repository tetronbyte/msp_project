import 'package:flutter/material.dart';

class SongProgressBar extends StatelessWidget {
  final double progress;

  const SongProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: LinearProgressIndicator(
        value: progress,
        backgroundColor: Colors.grey,
        color: Colors.blue,
        minHeight: 5,
      ),
    );
  }
}
