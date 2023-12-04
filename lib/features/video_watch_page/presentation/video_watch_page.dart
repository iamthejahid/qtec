import 'package:app_ui/app_ui.dart';
import 'package:chewie/chewie.dart';
import 'package:qtec_task/features/home_page/home_page.dart';
import 'package:video_player/video_player.dart';

class VideoWatchPage extends StatefulWidget {
  static String get path => 'videoWatch';
  static String get name => 'videoWatch';
  final Result videoelement;
  const VideoWatchPage({super.key, required this.videoelement});

  @override
  State<VideoWatchPage> createState() => _VideoWatchPageState();
}

class _VideoWatchPageState extends State<VideoWatchPage> {
  late final videoPlayerController;
  late final chewieController;

  Widget? playerWidget;

  initializingTheController() async {
    videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoelement.manifest!));

    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );

    playerWidget = Chewie(
      controller: chewieController,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    initializingTheController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 120.h, child: playerWidget),
            Text('Hello'),
          ],
        ),
      ),
    );
  }
}
