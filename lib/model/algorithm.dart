// ignore_for_file: invalid_annotation_target

import 'package:cube_alg_analyser/model/rotation.dart';
import 'package:cube_alg_analyser/service/sequence_finder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wt_models/wt_models.dart';

part 'algorithm.freezed.dart';
part 'algorithm.g.dart';

@freezed
class Algorithm extends BaseModel<Algorithm> with _$Algorithm {
  static final convert = DslConvert(
    titles: [
      'moves',
    ],
    jsonToModel: Algorithm.fromJson,
    none: Algorithm.empty(),
  );

  factory Algorithm({
    @Default('') String moves,
  }) = _Algorithm;

  Algorithm._() : super();

  factory Algorithm.empty() => Algorithm();

  factory Algorithm.fromJson(Map<String, dynamic> json) =>
      _$AlgorithmFromJson(json);

  @override
  String getId() => moves;

  @override
  String getTitle() => moves;

  @override
  List<String> getTitles() => convert.titles();

  bool get isAnnotated => moves.contains('[');

  String get reverse => moves
      .split(' ')
      .reversed
      .map(
        (move) =>
            move.endsWith("'") ? move.substring(0, move.length - 1) : "$move'",
      )
      .join(' ');

  String rotate(Rotation rotation) {
    return moves
        .split(' ')
        .map(
          (move) => rotation.translate(move),
        )
        .join(' ');
  }

  factory Algorithm.fromString(String algString) {
    return Algorithm(moves: algString);
  }

  Algorithm annotate(List<String> sequenceList) {
    return copyWith(
      moves: SequenceFinder.replace(moves, sequenceList),
    );
  }
}
