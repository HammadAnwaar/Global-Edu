// import 'package:flutter/material.dart';
// import 'package:global_edu/my_colors.dart';
// import 'package:video_player/video_player.dart';

// class VideoScreen extends StatefulWidget {
//   final String url;
//   const VideoScreen({super.key, required this.url});

//   @override
//   _VideoScreenState createState() => _VideoScreenState();
// }

// class _VideoScreenState extends State<VideoScreen> {
//   late VideoPlayerController _controller;
//   bool _isPlaying = false;
//   double _currentSliderValue = 0.0;
//   bool _isInitialized = false;

//   @override
//   void initState() {
//     super.initState();
//     _initializeVideoPlayer();
//   }

//   void _initializeVideoPlayer() {
//     _controller = VideoPlayerController.asset(widget.url)
//       ..initialize().then((_) {
//         setState(() {
//           _isInitialized = true;
//           _controller.addListener(_videoPlayerListener);
//         });
//       }).catchError((error) {
//         print('Error initializing video player: $error');
//       });
//   }

//   void _videoPlayerListener() {
//     final bool isPlaying = _controller.value.isPlaying;
//     if (isPlaying != _isPlaying) {
//       setState(() {
//         _isPlaying = isPlaying;
//       });
//     }
//     setState(() {
//       _currentSliderValue = _controller.value.position.inSeconds.toDouble();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     String formatDuration(Duration duration) {
//       String twoDigits(int n) => n.toString().padLeft(2, "0");
//       String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
//       String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
//       return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
//     }

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: MyColors.lightColor,
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               if (_isInitialized)
//                 SizedBox(
//                   height: 400,
//                   width: double.infinity,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(18),
//                     child: VideoPlayer(_controller),
//                   ),
//                 )
//               else
//                 const Center(child: CircularProgressIndicator()),
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 22),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "University",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                             color: MyColors.black,
//                           ),
//                         ),
//                         Text(
//                           "Step by step guide",
//                           style: TextStyle(color: MyColors.black),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         IconButton(
//                           icon: const Icon(
//                             Icons.download,
//                             color: MyColors.black,
//                           ),
//                           onPressed: () {},
//                         ),
//                         IconButton(
//                           icon: const Icon(
//                             Icons.favorite_border,
//                             color: MyColors.black,
//                           ),
//                           onPressed: () {
//                             setState(() {});
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               if (_isInitialized)
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: SliderTheme(
//                     data: SliderTheme.of(context).copyWith(
//                       activeTrackColor: MyColors.black,
//                       inactiveTrackColor: MyColors.lightColor,
//                       thumbColor: MyColors.black,
//                       overlayColor: MyColors.black.withOpacity(0.2),
//                       thumbShape: const RoundSliderThumbShape(
//                         enabledThumbRadius: 10.0,
//                       ),
//                       overlayShape: const RoundSliderOverlayShape(
//                         overlayRadius: 20.0,
//                       ),
//                     ),
//                     child: Slider(
//                       value: _currentSliderValue,
//                       min: 0.0,
//                       max: _controller.value.duration.inSeconds.toDouble(),
//                       onChanged: (value) {
//                         setState(() {
//                           _currentSliderValue = value;
//                           _controller.seekTo(Duration(seconds: value.toInt()));
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//               if (_isInitialized)
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 42),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         formatDuration(_controller.value.position),
//                         style: const TextStyle(
//                           color: MyColors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         formatDuration(_controller.value.duration),
//                         style: const TextStyle(
//                           color: MyColors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               const SizedBox(
//                 height: 20,
//               ),
//               if (_isInitialized)
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(
//                       icon: const Icon(
//                         Icons.replay_10,
//                         color: MyColors.black,
//                       ),
//                       onPressed: () {
//                         _controller.seekTo(Duration(
//                             seconds:
//                                 _controller.value.position.inSeconds - 10));
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         _isPlaying
//                             ? Icons.pause_circle_filled
//                             : Icons.play_circle_filled,
//                         color: MyColors.black,
//                         size: 50,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _isPlaying ? _controller.pause() : _controller.play();
//                         });
//                       },
//                     ),
//                     IconButton(
//                       icon: const Icon(
//                         Icons.forward_10,
//                         color: MyColors.black,
//                       ),
//                       onPressed: () {
//                         _controller.seekTo(Duration(
//                             seconds:
//                                 _controller.value.position.inSeconds + 10));
//                       },
//                     ),
//                   ],
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.removeListener(_videoPlayerListener);
//     _controller.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:global_edu/app_constants.dart';
import 'package:global_edu/my_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  final String url;

  const VideoScreen({super.key, required this.url});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;
  double _currentPosition = 0;
  double _videoDuration = 0;
  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.url);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    _controller.addListener(_videoPlayerListener);
  }

  void _videoPlayerListener() {
    if (_controller.value.isReady && mounted) {
      setState(() {
        _currentPosition = _controller.value.position.inSeconds.toDouble();
        _videoDuration = _controller.metadata.duration.inSeconds.toDouble();
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_videoPlayerListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: OrientationBuilder(
          builder: (context, orientation) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.info_outline),
                        const SizedBox(
                          width: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              style: const TextStyle(
                                  color: MyColors.black, fontSize: 16),
                              children: [
                                const TextSpan(
                                  text: "Watch video to learn more about \n",
                                ),
                                TextSpan(
                                  text: AppConstants.uniName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.blue,
                                      fontSize: 18),
                                ),
                                const TextSpan(
                                  text: " here.",
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.blueAccent,
                      ),
                    ),
                  ),
                  _buildPortraitControls(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPortraitControls() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "University",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: MyColors.black,
                      ),
                    ),
                    Text(
                      "Step by step guide",
                      style: TextStyle(color: MyColors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.download,
                        color: MyColors.black,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        color: MyColors.black,
                      ),
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          _buildSeekBar(),
          _buildForwardReverseButtons(),
        ],
      ),
    );
  }

  Widget _buildSeekBar() {
    return Column(
      children: [
        Slider(
          value: _currentPosition,
          min: 0,
          max: _videoDuration,
          onChanged: (value) {
            setState(() {
              _currentPosition = value;
            });
            _controller.seekTo(Duration(seconds: value.toInt()));
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatDuration(_controller.value.position),
                style: const TextStyle(
                  color: MyColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                formatDuration(_controller.metadata.duration),
                style: const TextStyle(
                  color: MyColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget _buildForwardReverseButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(Icons.replay_10),
          onPressed: () {
            final newPosition =
                _controller.value.position - const Duration(seconds: 10);
            _controller.seekTo(newPosition);
          },
        ),
        IconButton(
          icon: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: () {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
            setState(() {});
          },
        ),
        IconButton(
          icon: const Icon(Icons.forward_10),
          onPressed: () {
            final newPosition =
                _controller.value.position + const Duration(seconds: 10);
            _controller.seekTo(newPosition);
          },
        ),
      ],
    );
  }
}
