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

  final EdgeInsets padding;

  const OKTextButton({
    Key key,
    this.width = 80.0,
    this.height = 40.0,
    this.text = "",
    this.onTap,
    this.enable = true,
    this.color,
    this.radius = 4.0,
    this.padding,
    this.splashColor,
    this.textStyle = const TextStyle(
      fontSize: 16.0,
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
      alignment: Alignment.center,
      child: Text(
        this.text ?? "",
        style: textStyle,
      ),
    );

    if (this._enable) {
      w = InkWell(
        onTap: this.onTap,
        child: w,
      );
    }

    w = Material(
      color: _backgroundColor ?? themeData.primaryColor,
      child: w,
    );

    w = ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: w,
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

    if (padding != null) {
      w = Padding(
        padding: padding,
        child: w,
      );
    }

    return w;
  }
}
