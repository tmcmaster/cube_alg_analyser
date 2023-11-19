// import 'package:cube_alg_analyser/rotation.dart';
//
// class Algorithm {
//   final int id;
//   final String group;
//   final String moves;
//   final List<int> stickers;
//   Algorithm({
//     required this.id,
//     required this.group,
//     required this.moves,
//     required this.stickers,
//   });
//
//   factory Algorithm.fromJson(Map<String, dynamic> jsonMap) {
//     final algMap = {
//       for (final e in jsonMap.entries) e.key: e.value.toString(),
//     };
//     return Algorithm(
//       id: int.tryParse(algMap['id'] ?? "0") ?? 0,
//       group: algMap['group'] ?? 'Unknown',
//       moves: algMap['alg'] ?? '',
//       stickers: (algMap.containsKey('stickers')
//               ? algMap['stickers']! as List<int>
//               : [])
//           .whereType<int>()
//           .toList(),
//     );
//   }
//
//   @override
//   String toString() => moves;
//
//   String get reverse => moves
//       .split(' ')
//       .reversed
//       .map(
//         (move) =>
//             move.endsWith("'") ? move.substring(0, move.length - 1) : "$move'",
//       )
//       .join(' ');
//
//   String rotate(Rotation rotation) {
//     return moves
//         .split(' ')
//         .map(
//           (move) => rotation.translate(move),
//         )
//         .join(' ');
//   }
//
//   Algorithm copyWith({String? moves}) {
//     return Algorithm(
//       id: id,
//       group: group,
//       moves: moves ?? this.moves,
//       stickers: stickers,
//     );
//   }
// }
