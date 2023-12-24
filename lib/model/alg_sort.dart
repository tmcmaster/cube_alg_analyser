import 'package:cube_alg_analyser/model/last_layer_case.dart';
import 'package:wt_models/wt_models.dart';

enum AlgSort with TitleSupport {
  id('Number', _compareId),
  group('Group', _compareGroup);

  final String title;
  final int Function(LastLayerCase a, LastLayerCase b)? comparator;

  const AlgSort(this.title, this.comparator);

  static int _compareId(LastLayerCase a, LastLayerCase b) =>
      (int.tryParse(a.id) ?? 0).compareTo(int.tryParse(b.id) ?? 0);

  static int _compareGroup(LastLayerCase a, LastLayerCase b) =>
      a.group.compareTo(b.group);

  @override
  String getTitle() => title;
}
