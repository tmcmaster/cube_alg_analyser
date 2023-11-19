import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_universal/webview_universal.dart';
import 'package:wt_app_scaffold/app_scaffolds.dart';

class TestCubePage extends StatefulWidget {
  final String moves;
  const TestCubePage({
    super.key,
    required this.moves,
  });

  @override
  State<TestCubePage> createState() => _TestCubePageState();

  factory TestCubePage.fromState(GoRouterState? state) {
    if (state != null && state.extra != null) {
      final moves = Uri.encodeFull(state.extra! as String);
      return TestCubePage(
        moves: moves,
      );
    } else {
      throw Exception('List ID was not supplied as a route parameter.');
    }
  }
}

class _TestCubePageState extends State<TestCubePage> {
  static const String baseUrl =
      'https://tmcmaster.github.io/cube_alg_analyser/';
  // static const String baseUrl = 'http://localhost:8000';

  WebViewController webViewController = WebViewController();

  @override
  void initState() {
    super.initState();
    webViewController.init(
      context: context,
      setState: setState,
      uri: Uri.parse('$baseUrl/cube/index.html'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: FittedBox(
          child: SizedBox(
            width: 520,
            height: 520,
            child: RestrictedWebView(
              backgroundColor: Colors.transparent,
              url: '$baseUrl/cube/index.html?${widget.moves}',
            ),
          ),
        ),
      ),
    );
  }
}
