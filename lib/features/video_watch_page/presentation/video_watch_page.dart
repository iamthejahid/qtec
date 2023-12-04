import 'package:app_ui/app_ui.dart';
import 'package:qtec_task/features/home_page/home_page.dart';

class VideoWatchPage extends StatefulWidget {
  static String get path => 'videoWatch';
  static String get name => 'videoWatch';
  final Result videoelement;
  const VideoWatchPage({super.key, required this.videoelement});

  @override
  State<VideoWatchPage> createState() => _VideoWatchPageState();
}

class _VideoWatchPageState extends State<VideoWatchPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
