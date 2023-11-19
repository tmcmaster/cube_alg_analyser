// ignore_for_file: invalid_annotation_target

import 'package:cube_alg_analyser/rotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wt_models/wt_models.dart';

part 'algorithm.freezed.dart';
part 'algorithm.g.dart';

@freezed
class Algorithm extends BaseModel<Algorithm> with _$Algorithm {
  static final convert = DslConvert(
    titles: [
      'id',
      'group',
      'moves',
    ],
    jsonToModel: Algorithm.fromJson,
    none: Algorithm.empty(),
  );

  factory Algorithm({
    @Default('') String id,
    @Default('') String group,
    @Default('') String moves,
    @Default([]) List<int> stickers,
  }) = _Algorithm;

  const Algorithm._() : super();

  factory Algorithm.empty() => Algorithm();

  factory Algorithm.fromJson(Map<String, dynamic> json) =>
      _$AlgorithmFromJson(json);

  @override
  String getId() => id;

  @override
  String getTitle() => '$id : $group';

  @override
  List<String> getTitles() => convert.titles();

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
}
