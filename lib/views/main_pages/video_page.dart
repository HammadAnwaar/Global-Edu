// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:global_edu/my_colors.dart';
// import 'package:video_player/video_player.dart';

// class VideoScreen extends StatefulWidget {
//   const VideoScreen({super.key});

//   @override
//   _VideoScreenState createState() => _VideoScreenState();
// }

// class _VideoScreenState extends State<VideoScreen> {
//   late VideoPlayerController _controller;
//   bool _isPlaying = false;
//   double _currentSliderValue = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset('assets/videos/adat.mp4')
//       ..initialize().then((_) {
//         setState(() {
//           _controller.addListener(() {
//             final bool isPlaying = _controller.value.isPlaying;
//             if (isPlaying != _isPlaying) {
//               setState(() {
//                 _isPlaying = isPlaying;
//               });
//             }
//             setState(() {
//               _currentSliderValue =
//                   _controller.value.position.inSeconds.toDouble();
//             });
//           });
//         });
//       });
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
//         body: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(
//                 height: 300,
//                 width: double.infinity,
//                 child: ClipRRect(
//                     borderRadius: BorderRadius.circular(18),
//                     child: VideoPlayer(_controller)),
//               ),
//               const SizedBox(height: 10),
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
//                               fontWeight: FontWeight.bold, fontSize: 18),
//                         ),
//                         Text("step by step guide")
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
//                             Icons.favorite,
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
//               const SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Slider(
//                   value: _currentSliderValue,
//                   activeColor: MyColors.black,
//                   min: 0.0,
//                   max: _controller.value.duration.inSeconds.toDouble(),
//                   onChanged: (value) {
//                     setState(() {
//                       _currentSliderValue = value;
//                       _controller.seekTo(Duration(seconds: value.toInt()));
//                     });
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 42),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       formatDuration(_controller.value.position),
//                       style: const TextStyle(
//                         color: Colors.black,
//                       ),
//                     ),
//                     Text(
//                       formatDuration(_controller.value.duration),
//                       style: const TextStyle(
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: const Icon(
//                       Icons.replay_10,
//                       color: MyColors.black,
//                     ),
//                     onPressed: () {
//                       _controller.seekTo(Duration(
//                           seconds: _controller.value.position.inSeconds - 5));
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(
//                       _isPlaying ? Icons.pause : Icons.play_arrow,
//                       color: MyColors.black,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _isPlaying ? _controller.pause() : _controller.play();
//                       });
//                     },
//                   ),
//                   IconButton(
//                     icon: const Icon(
//                       Icons.forward_10,
//                       color: MyColors.black,
//                     ),
//                     onPressed: () {
//                       _controller.seekTo(Duration(
//                           seconds: _controller.value.position.inSeconds + 5));
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:video_player/video_player.dart';

// // void main() {
// //   runApp(const VideoApp());
// // }

// // class VideoApp extends StatelessWidget {
// //   const VideoApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return const MaterialApp(
// //       title: 'Video Demo',
// //       home: VideoScreen(),
// //     );
// //   }
// // }

// // class VideoScreen extends StatefulWidget {
// //   const VideoScreen({super.key});

// //   @override
// //   _VideoScreenState createState() => _VideoScreenState();
// // }

// // class _VideoScreenState extends State<VideoScreen> {
// //   late VideoPlayerController _controller;
// //   bool _isPlaying = false;
// //   double _currentSliderValue = 0.0;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = VideoPlayerController.asset('assets/videos/adat.mp4')
// //       ..initialize().then((_) {
// //         setState(() {
// //           _controller.addListener(() {
// //             final bool isPlaying = _controller.value.isPlaying;
// //             if (isPlaying != _isPlaying) {
// //               setState(() {
// //                 _isPlaying = isPlaying;
// //               });
// //             }
// //             setState(() {
// //               _currentSliderValue =
// //                   _controller.value.position.inSeconds.toDouble();
// //             });
// //           });
// //         });
// //       });
// //   }

// //   @override
// //   Widget build(BuildContext context) {

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Video Player'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             AspectRatio(
// //               aspectRatio: _controller.value.aspectRatio,
// //               child: VideoPlayer(_controller),
// //             ),
// //             const SizedBox(height: 20),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 IconButton(
// //                   icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
// //                   onPressed: () {
// //                     setState(() {
// //                       _isPlaying ? _controller.pause() : _controller.play();
// //                     });
// //                   },
// //                 ),
// //                 IconButton(
// //                   icon: const Icon(Icons.skip_previous),
// //                   onPressed: () {
// //                     _controller.seekTo(const Duration(seconds: 0));
// //                   },
// //                 ),
// //                 IconButton(
// //                   icon: const Icon(Icons.fast_rewind),
// //                   onPressed: () {
// //                     _controller.seekTo(Duration(
// //                         seconds: _controller.value.position.inSeconds - 10));
// //                   },
// //                 ),
// //                 IconButton(
// //                   icon: const Icon(Icons.fast_forward),
// //                   onPressed: () {
// //                     _controller.seekTo(Duration(
// //                         seconds: _controller.value.position.inSeconds + 10));
// //                   },
// //                 ),
// //                 IconButton(
// //                   icon: const Icon(Icons.skip_next),
// //                   onPressed: () {
// //                     _controller.seekTo(_controller.value.duration);
// //                   },
// //                 ),
// //               ],
// //             ),
// //             Slider(
// //               value: _currentSliderValue,
// //               min: 0.0,
// //               max: _controller.value.duration.inSeconds.toDouble(),
// //               onChanged: (value) {
// //                 setState(() {
// //                   _currentSliderValue = value;
// //                   _controller.seekTo(Duration(seconds: value.toInt()));
// //                 });
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:global_edu/my_colors.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  double _currentSliderValue = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/adat.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller.addListener(() {
            final bool isPlaying = _controller.value.isPlaying;
            if (isPlaying != _isPlaying) {
              setState(() {
                _isPlaying = isPlaying;
              });
            }
            setState(() {
              _currentSliderValue =
                  _controller.value.position.inSeconds.toDouble();
            });
          });
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    String formatDuration(Duration duration) {
      String twoDigits(int n) => n.toString().padLeft(2, "0");
      String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
      String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.lightColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: VideoPlayer(_controller)),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: MyColors.black,
                    inactiveTrackColor: MyColors.lightColor,
                    thumbColor: MyColors.black,
                    overlayColor: MyColors.black.withOpacity(0.2),
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 10.0,
                    ),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 20.0,
                    ),
                  ),
                  child: Slider(
                    value: _currentSliderValue,
                    min: 0.0,
                    max: _controller.value.duration.inSeconds.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        _currentSliderValue = value;
                        _controller.seekTo(Duration(seconds: value.toInt()));
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 42),
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
                      formatDuration(_controller.value.duration),
                      style: const TextStyle(
                        color: MyColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.replay_10,
                      color: MyColors.black,
                    ),
                    onPressed: () {
                      _controller.seekTo(Duration(
                          seconds: _controller.value.position.inSeconds - 10));
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      _isPlaying
                          ? Icons.pause_circle_filled
                          : Icons.play_circle_filled,
                      color: MyColors.black,
                      size: 50,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPlaying ? _controller.pause() : _controller.play();
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.forward_10,
                      color: MyColors.black,
                    ),
                    onPressed: () {
                      _controller.seekTo(Duration(
                          seconds: _controller.value.position.inSeconds + 10));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
