import 'package:flutter/material.dart';

class LoadingText extends StatelessWidget {
  final Widget text;
  final Widget? customIndicator;
  final double indicatorSize;
  final double? indicatorStrokeWidth;
  final double? intervalSize;

  const LoadingText(
      {super.key,
        required this.text,
        required this.indicatorSize,
        this.customIndicator,
        this.indicatorStrokeWidth,
        this.intervalSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(child: text),
        SizedBox(
          width: intervalSize ?? 8,
        ),
        SizedBox(
            width: indicatorSize,
            height: indicatorSize,
            child: customIndicator ??
                CircularProgressIndicator(
                  strokeWidth: indicatorStrokeWidth ?? 2,
                ))
      ],
    );
  }
}