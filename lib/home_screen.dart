import 'package:flutter/material.dart';
import 'package:you_tube_video_player_demo/you_tube_video.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("YouTube Demo"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: VideoPlayer(
            "https://www.youtube.com/watch?v=qahSlj6A9ts",
          ),
        ),
      ),
    );
  }
}
