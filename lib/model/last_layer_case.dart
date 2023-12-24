// ignore_for_file: invalid_annotation_target

import 'package:cube_alg_analyser/model/algorithm.dart';
import 'package:cube_alg_analyser/model/rotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wt_models/wt_models.dart';

part 'last_layer_case.freezed.dart';
part 'last_layer_case.g.dart';

@freezed
class LastLayerCase extends BaseModel<LastLayerCase> with _$LastLayerCase {
  static final convert = DslConvert(
    titles: [
      'id',
      'group',
      'moves',
    ],
    jsonToModel: LastLayerCase.fromJson,
    none: LastLayerCase.empty(),
  );

  factory LastLayerCase({
    @Default('') String id,
    @Default('') String group,
    @Default([])
    @JsonKey(fromJson: LastLayerCase.jsonToAlgorithms)
    List<Algorithm> algorithms,
    @Default([]) List<int> stickers,
  }) = _LastLayerCase;

  LastLayerCase._() : super();

  factory LastLayerCase.empty() => LastLayerCase();

  factory LastLayerCase.fromJson(Map<String, dynamic> json) =>
      _$LastLayerCaseFromJson(json);

  @override
  String getId() => id;

  @override
  String getTitle() => '$id : $group';

  @override
  List<String> getTitles() => convert.titles();

  static List<Algorithm> jsonToAlgorithms(dynamic algStrings) {
    return algStrings is List
        ? algStrings
            .map(
              (algString) => Algorithm(moves: algString.toString()),
            )
            .toList()
        : [];
  }

  String get moves => algorithms.isEmpty ? '' : algorithms[0].moves;

  bool get isAnnotated => algorithms.isNotEmpty && algorithms[0].isAnnotated;

  String get reverse => algorithms.isEmpty ? '' : algorithms[0].reverse;

  String rotate(Rotation rotation) =>
      algorithms.isEmpty ? '' : algorithms[0].rotate(rotation);

  LastLayerCase annotate(List<String> sequenceList) {
    return copyWith(
        algorithms: algorithms
            .map(
              (algorithm) => algorithm.annotate(sequenceList),
            )
            .toList());
  }
}
