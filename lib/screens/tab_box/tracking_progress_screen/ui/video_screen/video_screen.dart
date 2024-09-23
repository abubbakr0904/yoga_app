import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  // Correct the video ID to only the YouTube video ID, not the full URL.
  YoutubePlayerController controller = YoutubePlayerController(
    initialVideoId: 'G9R4lPHlcG8', // Correct video ID
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Screen"),
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: controller,
            liveUIColor: Colors.amber,
            showVideoProgressIndicator: true,
            onReady: () {
              // You can add logic here for when the player is ready, if needed.
            },
          ),
        ],
      ),
    );
  }
}
