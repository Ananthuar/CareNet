import 'package:carenet/screens/indexscreen/indexscreen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final VideoPlayerController videoPlayerController =
      VideoPlayerController.asset("assets/videos/Splash_Screen_Video.mp4");

  bool isInternetAvailable = false;

  @override
  void initState() {
    super.initState();
    initializeVideo();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  Future<void> initializeVideo() async {
    await videoPlayerController.initialize();
    videoPlayerController.setLooping(false);
    videoPlayerController.play();

    // Check internet availability periodically
    checkInternetAvailability();

    // Listen for video playback completion
    videoPlayerController.addListener(() {
      if (videoPlayerController.value.position >= videoPlayerController.value.duration) {
        if (isInternetAvailable) {
          // Video playback ended, navigate to main screen
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const IndexScreen()),
          );
        }
      }
    });
  }

  Future<void> checkInternetAvailability() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      isInternetAvailable =
          connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi;
    });

    // Show snackbar based on internet availability
    if (!isInternetAvailable) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Internet is not available.'),
          duration: Duration(seconds: 5),
        ),
      );
      
    videoPlayerController.setLooping(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: videoPlayerController.value.aspectRatio,
          child: VideoPlayer(videoPlayerController),
        ),
      ),
    );
  }
}
