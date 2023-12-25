// ignore_for_file: invalid_annotation_target

import 'package:cube_alg_analyser/model/rotation.dart';
import 'package:cube_alg_analyser/service/sequence_finder.dart';

class Algorithm {
  final List<List<String>> moves;

  Algorithm._(List<List<String>> moves) : moves = moves;

  String get movesString => moves.map((m) => m.join(' ')).join(' ');

  bool get isAnnotated => movesString.contains('[');

  String get reverse => movesString
      .split(' ')
      .reversed
      .map(
        (move) =>
            move.endsWith("'") ? move.substring(0, move.length - 1) : "$move'",
      )
      .join(' ');

  String rotate(Rotation rotation) {
    return movesString
        .split(' ')
        .map(
          (move) => rotation.translate(move),
        )
        .join(' ');
  }

  factory Algorithm.fromString(String algString) {
    return Algorithm._(
      algString
          .split(' . ')
          .map(
            (e) => e.split(' ').toList(),
          )
          .toList(),
    );
  }

  Algorithm annotate(List<String> sequenceList) {
    return Algorithm.fromString(
      SequenceFinder.replace(movesString, sequenceList),
    );
  }

  static List<Algorithm> jsonToAlgorithms(dynamic algStrings) {
    return algStrings is List
        ? algStrings
            .map(
              (algString) => Algorithm.fromString(algString.toString()),
            )
            .toList()
        : [];
  }

  String toJson() {
    return moves.map((m) => m.join(' ')).join(' . ');
  }
}
