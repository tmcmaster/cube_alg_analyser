import 'package:cube_alg_analyser/model/last_layer_case.dart';
import 'package:cube_alg_analyser/widget/last_layer_case_card.dart';
import 'package:flutter/material.dart';

class LastLayerCasesGrid extends StatelessWidget {
  const LastLayerCasesGrid({
    super.key,
    required this.caseList,
  });

  final List<LastLayerCase> caseList;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth ~/ 200;
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 0.6,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 16.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return LastLayerCaseCard(
              lastLayerCase: caseList[index],
            );
          },
          itemCount:
              caseList.length, // You can change this based on your data size
        );
      },
    );
  }
}
