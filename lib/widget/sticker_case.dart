import 'package:cube_alg_analyser/widget/painter/stickers_painter.dart';
import 'package:flutter/material.dart';

class StickerCase extends StatelessWidget {
  final List<int> stickers;
  const StickerCase({
    super.key,
    required this.stickers,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          height: double.infinity,
          padding: const EdgeInsets.all(10),
          child: CustomPaint(
            painter: StickersPainter(
              stickers: stickers,
            ),
          ),
        ),
      ),
    );
  }
}
