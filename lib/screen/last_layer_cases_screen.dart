import 'package:cube_alg_analyser/model/alg_sort.dart';
import 'package:cube_alg_analyser/store/last_layer_cases_store.dart';
import 'package:cube_alg_analyser/widget/last_layer_cases_grid.dart';
import 'package:cube_alg_analyser/widget/sort_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wt_app_scaffold/models/app_spacing.dart';

class LastLayerCasesScreen extends ConsumerStatefulWidget {
  const LastLayerCasesScreen({
    super.key,
  });

  @override
  ConsumerState<LastLayerCasesScreen> createState() => _CubingAlgsState();
}

class _CubingAlgsState extends ConsumerState<LastLayerCasesScreen> {
  AlgSort sortBy = AlgSort.id;
  bool annotateAlgorithms = false;
  bool hideNonAnnotated = false;

  @override
  Widget build(BuildContext context) {
    final caseList = ref
        .watch(
          annotateAlgorithms
              ? LastLayersCaseStore.annotatedLastLayerCases
              : LastLayersCaseStore.allCases,
        )
        .toList()
      ..sort(sortBy.comparator);

    final spacing = AppSpacing.of(context);
    final textTheme = Theme.of(context).textTheme;
    // final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: spacing.small,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Sort By: ',
                          style: textTheme.labelLarge,
                        ),
                      ),
                      const SizedBox(width: 4),
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
            Expanded(
              child: LastLayerCasesGrid(caseList: caseList),
            ),
          ],
        ),
      ),
    );
  }
}
