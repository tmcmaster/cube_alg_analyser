// ignore_for_file: prefer_single_quotes

enum Rotation {
  y(_y),
  yPrime(_yPrimer);

  final String? Function(String move) translate;

  const Rotation(this.translate);

  static String? _translation(String move, Map<String, String> map) {
    return move == move.toUpperCase()
        ? map[move]
        : map[move.toUpperCase()]?.toLowerCase();
  }

  static String? _y(String move) {
    return _translation(move, const {
      "R": "F",
      "R'": "F'",
      "R2": "F2",
      "L": "B",
      "L'": "B'",
      "L2": "B2",
      "F": "L",
      "F'": "L'",
      "F2": "L2",
      "B": "R",
      "B'": "R'",
      "B2": "R2",
      "U": "U",
      "U'": "U'",
      "U2": "U2",
      "D": "D",
      "D'": "D'",
      "D2": "D2",
      "M": "S",
      "M'": "S'",
      "M2": "S2",
      "S": "M'",
      "S'": "M",
      "S2": "M2",
      "E": "E",
      "E'": "E'",
      "E2": "E2",
    });
  }

  static String? _yPrimer(String move) {
    return _translation(move, const {
      "R": "B",
      "R'": "B'",
      "R2": "B2",
      "L": "F",
      "L'": "F'",
      "L2": "F2",
      "F": "R",
      "F'": "R'",
      "F2": "R2",
      "B": "L",
      "B'": "L'",
      "B2": "L2",
      "U": "U",
      "U'": "U'",
      "U2": "U2",
      "D": "D",
      "D'": "D'",
      "D2": "D2",
      "M": "S'",
      "M'": "S",
      "M2": "S2",
      "S": "M",
      "S'": "M'",
      "S2": "M2",
      "E": "E",
      "E'": "E'",
      "E2": "E2",
    });
  }
}
