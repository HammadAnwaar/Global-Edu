import 'package:flutter/material.dart';
import 'package:global_edu/constants/app_constants.dart';
import 'package:global_edu/constants/my_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoScreen extends StatefulWidget {
  final String url;
  final String uniLink;

  const VideoScreen({super.key, required this.url, required this.uniLink});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;
  double _currentPosition = 0;
  double _videoDuration = 0;
  bool like = false;
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: MyColors.blue,
          title: const Text(
            "Details",
            style: TextStyle(color: MyColors.white),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: MyColors.white,
              )),
        ),
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
                  Expanded(child: Container()),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.appColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12), // Adjust the value as needed
                          ),
                        ),
                        onPressed: () async {
                          if (await canLaunch(widget.uniLink)) {
                            await launch(widget.uniLink);
                          } else {
                            throw 'Could not launch ${widget.uniLink}';
                          }
                        },
                        child: const Text(
                          "Apply Now",
                          style: TextStyle(color: MyColors.white),
                        ),
                      ),
                    ),
                  ),
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
                      onPressed: () {
                        setState(() {
                          like = !like;
                        });
                      },
                      icon: like == false
                          ? const Icon(
                              Icons.favorite_border,
                              color: MyColors.black,
                            )
                          : const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
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
