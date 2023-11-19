import 'package:flutter/material.dart';
import 'package:webview_universal/webview_universal.dart';
import 'package:wt_app_scaffold/app_scaffolds.dart';

class TestCubePage extends StatefulWidget {
  const TestCubePage({super.key});

  @override
  State<TestCubePage> createState() => _TestCubePageState();
}

class _TestCubePageState extends State<TestCubePage> {
  WebViewController webViewController = WebViewController();

  @override
  void initState() {
    super.initState();
    webViewController.init(
      context: context,
      setState: setState,
      uri: Uri.parse(
          'https://tmcmaster.github.io/cube_alg_analyser/cube/index.html'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: RestrictedWebView(
        backgroundColor: Colors.transparent,
        url: 'http://localhost:8000/index.html',
      ),
    );
  }
}
