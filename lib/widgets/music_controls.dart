import 'package:flutter/material.dart';

class MusicControls extends StatelessWidget {
  const MusicControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.skip_previous, size: 40),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.play_arrow, size: 50),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.skip_next, size: 40),
          onPressed: () {},
        ),
      ],
    );
  }
}
