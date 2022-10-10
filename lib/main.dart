import 'package:flutter/material.dart';
import 'package:you_tube_video_player_demo/home_screen.dart';

void main() {
  runApp(const YouTubePlayer());
}

class YouTubePlayer extends StatelessWidget {
  const YouTubePlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const HomeScreen(),
    );
  }
}
