import 'package:flutter/widgets.dart';
import 'ok_theme.dart';

class OKHorizontalDivider extends StatelessWidget {
  static const defaultDivider = OKHorizontalDivider(8.0);

  final double height;
  final double color;

  const OKHorizontalDivider(
    this.height, {
    this.color,
  }) : assert(height != null);

  @override
  Widget build(BuildContext context) {
    Color color = this.color ?? OKTheme.dividerColor;

    return Container(
      height: this.height,
      width: double.infinity,
      color: color,
    );
  }
}

class OKVerticalDivider extends StatelessWidget {
  static const defaultDivider = OKVerticalDivider(8.0);

  final double width;
  final double color;

  const OKVerticalDivider(
    this.width, {
    this.color,
  }) : assert(width != null);

  @override
  Widget build(BuildContext context) {
    Color color = this.color ?? OKTheme.dividerColor;

    return Container(
      width: this.width,
      height: double.infinity,
      color: color,
    );
  }
}
