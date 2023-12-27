import 'package:cube_alg_analyser/model/last_layer_case.dart';
import 'package:cube_alg_analyser/widget/algorithm_widget.dart';
import 'package:cube_alg_analyser/widget/responsive_card.dart';
import 'package:cube_alg_analyser/widget/sticker_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wt_app_scaffold/app_scaffolds.dart';

class LastLayerCaseCard extends ConsumerWidget {
  final LastLayerCase lastLayerCase;

  const LastLayerCaseCard({
    super.key,
    required this.lastLayerCase,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ResponsiveCard(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                lastLayerCase.id,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  ref.read(GoRouterMenuApp.goRouter).push(
                        '/cube',
                        extra: lastLayerCase.algorithms.first.movesString,
                      );
                },
                icon: const Icon(
                  Icons.play_arrow,
                ),
              ),
            ],
          ),
          subtitle: lastLayerCase.algorithms.isEmpty
              ? null
              : AlgorithmWidget(
                  algorithm: lastLayerCase.algorithms.first,
                ),
          picture: SizedBox(
            height: 150,
            child: StickerCase(
              stickers: lastLayerCase.stickers,
            ),
          ),
          actions: [
            Column(
              children: [
                if (lastLayerCase.name != lastLayerCase.set)
                  Text(
                    lastLayerCase.name,
                    style: textTheme.titleMedium,
                  ),
                Text(
                  lastLayerCase.set,
                  style: textTheme.titleMedium,
                ),
                Text(
                  lastLayerCase.group,
                  style: textTheme.titleMedium,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
