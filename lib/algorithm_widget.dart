import 'package:cube_alg_analyser/model/algorithm.dart';
import 'package:cube_alg_analyser/sticker_case.dart';
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
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      Text(
                        algorithm.id.toString(),
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        algorithm.group,
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      algorithm.moves,
                      style: textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            height: double.infinity,
            child: StickerCase(
              stickers: algorithm.stickers,
            ),
          ),
        ],
      ),
    );
  }
}
