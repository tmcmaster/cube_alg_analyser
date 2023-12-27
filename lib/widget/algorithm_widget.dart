import 'package:cube_alg_analyser/model/algorithm.dart';
import 'package:flutter/material.dart';

class AlgorithmWidget extends StatelessWidget {
  final Algorithm algorithm;

  const AlgorithmWidget({
    super.key,
    required this.algorithm,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: algorithm.moves
          .map(
            (m) => Text(
              m.join(' '),
              style: textTheme.titleMedium,
            ),
          )
          .toList(),
    );
  }
}
