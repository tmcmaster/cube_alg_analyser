import 'package:cube_alg_analyser/model/alg_sort.dart';
import 'package:cube_alg_analyser/store/alforithm_store.dart';
import 'package:cube_alg_analyser/store/settings_store.dart';
import 'package:cube_alg_analyser/widget/algorithm_widget.dart';
import 'package:cube_alg_analyser/widget/sort_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wt_app_scaffold/app_scaffolds.dart';
import 'package:wt_app_scaffold/models/app_spacing.dart';

class _CubingAlgsState extends ConsumerState<CubingAlgs> {
  AlgSort sortBy = AlgSort.id;

  @override
  Widget build(BuildContext context) {
    final isAnnotated = ref.watch(SettingsStore.annotateAlgorithms.value);
    final hideNonAnnotated = ref.watch(SettingsStore.hidNonAnnotated.value);

    final algList = ref
        .watch(
          isAnnotated
              ? AlgorithmStore.annotatedAlgorithms
              : AlgorithmStore.algorithms,
        )
        .where((alg) => !hideNonAnnotated || alg.isAnnotated)
        .toList()
      ..sort(sortBy.comparator);

    final spacing = AppSpacing.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SliverPageScaffold(
        pinnedHeader: true,
        header: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: spacing.small,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Sort By: ',
                    style: textTheme.labelLarge,
                  ),
                  SortSelector<AlgSort>(
                    options: AlgSort.values,
                    onChange: (value) {
                      setState(() {
                        sortBy = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.rotate_90_degrees_ccw),
                  ),
                  SizedBox(
                    width: spacing.small,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.rotate_90_degrees_cw),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          children: algList
              .map(
                (a) => AlgorithmWidget(
                  algorithm: a,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class CubingAlgs extends ConsumerStatefulWidget {
  const CubingAlgs({
    super.key,
  });

  @override
  ConsumerState<CubingAlgs> createState() => _CubingAlgsState();
}
