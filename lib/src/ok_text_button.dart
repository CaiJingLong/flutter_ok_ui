import 'package:flutter/material.dart';
import 'package:ok_ui/src/ok_theme.dart';

class OKTextButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Function onTap;
  final bool enable;
  final Color color;
  final Color splashColor;
  final double radius;
  final TextStyle textStyle;

  const OKTextButton({
    Key key,
    this.width,
    this.height = 40.0,
    this.text = "",
    this.onTap,
    this.enable,
    this.color,
    this.radius = 4.0,
    this.splashColor,
    this.textStyle = const TextStyle(
      fontSize: 14.0,
      color: Colors.white,
    ),
  }) : super(key: key);

  bool get _enable => enable == true && onTap != null;

  Color get _backgroundColor {
    if (!_enable) {
      return OKTheme.disableColor;
    }
    if (this.color != null) {
      return color;
    }

    return OKTheme.themeColor;
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);

    Widget w = Container(
      width: width,
      height: height,
      child: Text(
        this.text ?? "",
        style: textStyle,
      ),
    );

    if (this._enable) {
      w = InkWell(
        child: w,
        onTap: this.onTap,
      );
    }

    w = Material(
      child: w,
      color: _backgroundColor ?? themeData.primaryColor,
    );

    w = ClipRRect(
      borderRadius: BorderRadius.circular(radius),
    );

    if (splashColor != null) {
      var data = themeData.copyWith(
        splashColor: this.splashColor,
      );
      w = Theme(
        data: data,
        child: w,
      );
    }

    return w;
  }
}
