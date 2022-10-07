import 'package:flutter/material.dart';
import 'package:you_tube_video_player_demo/you_tube_video.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("YouTube Player Demo")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: YouTubeVideo(
            // "https://www.youtube.com/watch?v=qahSlj6A9ts",
            // "https://www.youtube.com/watch?v=pwezb1oHfPA",
            "https://www.youtube.com/watch?v=tUDW5RzmCAk",
          ),
        ),
      ),
    );
  }
}
