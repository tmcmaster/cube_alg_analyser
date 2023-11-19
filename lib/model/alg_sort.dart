import 'package:cube_alg_analyser/model/algorithm.dart';
import 'package:wt_models/wt_models.dart';

enum AlgSort with TitleSupport {
  id('Number', _compareId),
  group('Group', _compareGroup);

  final String title;
  final int Function(Algorithm a, Algorithm b)? comparator;

  const AlgSort(this.title, this.comparator);

  static int _compareId(Algorithm a, Algorithm b) =>
      (int.tryParse(a.id) ?? 0).compareTo(int.tryParse(b.id) ?? 0);

  static int _compareGroup(Algorithm a, Algorithm b) =>
      a.group.compareTo(b.group);

  @override
  String getTitle() => title;
}
