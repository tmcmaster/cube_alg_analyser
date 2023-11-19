import 'dart:math';

import 'package:flutter/material.dart';

class StickersPainter extends CustomPainter {
  final int rows = 3;
  final int cols = 3;
  final double gridMargin = 20.0;
  final double squareMargin = 5.0;
  final edgeMargin = 8;

  final Paint gridPaintOn = Paint()
    ..color = Colors.yellow
    ..strokeWidth = 1.0;

  final Paint gridPaintOff = Paint()
    ..color = Colors.grey.shade400
    ..strokeWidth = 1.0;

  final List<int> stickers;
  StickersPainter({
    required this.stickers,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double gridWidth = size.width - 2 * gridMargin;
    final double gridHeight = size.height - 2 * gridMargin;

    final double squareWidth = (gridWidth - (cols - 1) * squareMargin) / cols;
    final double squareHeight = (gridHeight - (rows - 1) * squareMargin) / rows;

    // final stickers = [1, 1, 2, 4, 3, 1, 1];
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        final double startX = gridMargin + c * (squareWidth + squareMargin);
        final double startY = gridMargin + r * (squareHeight + squareMargin);

        // Center Stickers
        canvas.drawRect(
          Rect.fromPoints(
            Offset(startX, startY),
            Offset(startX + squareWidth, startY + squareHeight),
          ),
          isStickerOn(stickers, r + 2, c) ? gridPaintOn : gridPaintOff,
        );

        final edgeSize = squareHeight / 4;

        // Top Edge
        if (r == 0) {
          canvas.drawRect(
            Rect.fromPoints(
              Offset(
                startX,
                startY - edgeSize - edgeMargin,
              ),
              Offset(
                startX + squareWidth,
                startY - edgeMargin,
              ),
            ),
            isStickerOn(stickers, 1, c) ? gridPaintOn : gridPaintOff,
          );
        }

        // Bottom Edge
        if (r == rows - 1) {
          canvas.drawRect(
            Rect.fromPoints(
              Offset(
                startX,
                startY + edgeMargin + squareWidth,
              ),
              Offset(
                startX + squareWidth,
                startY + edgeMargin + edgeSize + squareWidth,
              ),
            ),
            isStickerOn(stickers, 5, c) ? gridPaintOn : gridPaintOff,
          );
        }

        // Left Edge
        if (c == 0) {
          canvas.drawRect(
            Rect.fromPoints(
              Offset(
                startX - edgeSize - edgeMargin,
                startY,
              ),
              Offset(
                startX - edgeMargin,
                startY + squareHeight,
              ),
            ),
            isStickerOn(stickers, 0, r) ? gridPaintOn : gridPaintOff,
          );
        }

        // Right Edge
        if (c == cols - 1) {
          canvas.drawRect(
            Rect.fromPoints(
              Offset(
                startX + squareWidth + edgeMargin,
                startY,
              ),
              Offset(
                startX + squareWidth + edgeMargin + edgeSize,
                startY + squareHeight,
              ),
            ),
            isStickerOn(stickers, 6, r) ? gridPaintOn : gridPaintOff,
          );
        }
      }
    }
  }

  bool isStickerOn(List<int> stickers, int group, int index) {
    if (stickers.isEmpty || stickers.length < group + 1) {
      return false;
    }
    return stickers[group] & pow(2, 2 - index).toInt() != 0;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
