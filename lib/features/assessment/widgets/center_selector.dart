import 'package:flutter/material.dart';

class CenterSelector extends StatelessWidget {
  const CenterSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 116,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: CustomPaint(
        painter: _SelectorPainter(),
      ),
    );
  }
}

class _SelectorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFF97316)
      ..style = PaintingStyle.fill;

    // 上半部分 - 较粗
    final topPath = Path()
      ..moveTo(size.width / 2 - 4, 0)
      ..lineTo(size.width / 2 + 4, 0)
      ..lineTo(size.width / 2 + 3, size.height / 2)
      ..lineTo(size.width / 2 - 3, size.height / 2)
      ..close();

    // 下半部分 - 较细
    final bottomPath = Path()
      ..moveTo(size.width / 2 - 3, size.height / 2)
      ..lineTo(size.width / 2 + 3, size.height / 2)
      ..lineTo(size.width / 2 + 4, size.height)
      ..lineTo(size.width / 2 - 4, size.height)
      ..close();

    // 光晕效果
    final glowPaint = Paint()
      ..color = const Color(0xFFF97316).withValues(alpha: 0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8)
      ..style = PaintingStyle.fill;

    // 绘制光晕
    final glowPath = Path()
      ..moveTo(size.width / 2 - 8, -4)
      ..lineTo(size.width / 2 + 8, -4)
      ..lineTo(size.width / 2 + 7, size.height + 4)
      ..lineTo(size.width / 2 - 7, size.height + 4)
      ..close();

    canvas.drawPath(glowPath, glowPaint);

    // 绘制主体
    canvas.drawPath(topPath, paint);
    canvas.drawPath(bottomPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
