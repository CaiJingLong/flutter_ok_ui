import 'package:flutter/material.dart';
import 'ok_theme.dart';

double get _appbarHeight => OKTheme.appBarTheme.appBarHeight;

class OKAppBar extends PreferredSize {
  /// [String] ,[Widget] or []
  final title;
  final double height;

  final List<Widget> actions;
  final bool centerTitle;

  final Widget leading;

  final Color backgroundColor;

  OKAppBar({
    this.title,
    this.leading,
    double height,
    this.actions,
    this.centerTitle = true,
    this.backgroundColor,
  }) : this.height = height ??= _appbarHeight;

  @override
  Size get preferredSize {
    return Size.fromHeight(height);
  }

  @override
  Widget build(BuildContext context) {
    var titleStyle = new TextStyle(
      fontSize: OKTheme.appBarTheme.fontSize,
      color: OKTheme.appBarTheme.titleTextColor ??
          Theme.of(context).appBarTheme.color,
    );
    var theme = Theme.of(context);
    Widget _title;
    if (title is Text) {
      _title = new Text(
        title.data,
        style: titleStyle,
      );
    } else if (title is Widget) {
      _title = title;
    } else if (title == null) {
      _title = null;
    } else {
      _title = Text(
        title.toString(),
        style: titleStyle,
      );
    }

    return AppBar(
      title: _title,
      actions: actions,
      backgroundColor:
          this.backgroundColor ?? theme.appBarTheme.color ?? theme.primaryColor,
      leading: leading,
      elevation: 0.0,
      centerTitle: centerTitle,
    );
  }
}
