import 'package:cube_alg_analyser/widget/cubing_algs.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: CubingAlgs(),
          ),
        ],
      ),
    );
  }
}
