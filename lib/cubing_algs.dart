import 'package:cube_alg_analyser/algorithm_service.dart';
import 'package:cube_alg_analyser/algorithm_widget.dart';
import 'package:cube_alg_analyser/model/algorithm.dart';
import 'package:flutter/material.dart';

class CubingAlgs extends StatelessWidget {
  const CubingAlgs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FutureBuilder<List<Algorithm>>(
        future: AlgorithmService.loadAndAnaliseAlgorithms(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final algList = snapshot.data!;
              return ListView(
                children: algList
                    .map(
                      (a) => AlgorithmWidget(
                        algorithm: a,
                      ),
                    )
                    .whereType<Widget>()
                    .toList(),
              );
            } else {
              return const Center(
                child: Text('No alg data found'),
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('Error: ${snapshot.error.toString()}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
