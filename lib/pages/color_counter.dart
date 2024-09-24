import 'package:flutter/cupertino.dart';

class ColorCounter extends InheritedWidget   {
  const ColorCounter({super.key, required super.child, this.color, this.count});

  final Color? color;
  final int? count;

  static ColorCounter? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorCounter>();
  }

  @override
  bool updateShouldNotify(ColorCounter oldWidget) {
    return color != oldWidget.color || count != oldWidget.count;
  }

}