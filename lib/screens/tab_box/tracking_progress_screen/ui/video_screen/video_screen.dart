import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/bloc/task/task_bloc.dart';
import 'package:yoga_app/bloc/task/task_event.dart';
import 'package:yoga_app/bloc/task/task_state.dart';
import 'package:yoga_app/data/model/task_model/task_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final VoidCallback onChange;
  final TaskModel taskModel;

  const YouTubeVideoPlayer(
      {Key? key, required this.videoUrl, required this.onChange, required this.taskModel})
      : super(key: key);

  @override
  _YouTubeVideoPlayerState createState() => _YouTubeVideoPlayerState();
}

class _YouTubeVideoPlayerState extends State<YouTubeVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);

    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 50,
              child: YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  topActions: [
                    BlocBuilder<TaskBloc, TaskState>(
                      builder: (context, state) {
                        return Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: IconButton(
                            onPressed: () {
                              if (_controller.value.isFullScreen) {
                                _controller.toggleFullScreenMode();
                              } else {
                                BlocProvider.of<TaskBloc>(context).add(GetTaskEvent());
                                Navigator.pop(context);
                              }
                            },
                            icon: const Icon(
                                Icons.close, color: Colors.white, size: 20),
                          ),
                        );
                      },
                    )
                  ],
                ),
                builder: (context, player) {
                  return player;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
