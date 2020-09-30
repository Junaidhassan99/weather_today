import 'package:flutter/material.dart';

class GeneralUtilities {
  static Map<String, double> getSizes(GlobalKey globalKey) {
    final RenderBox renderBoxWidget =
        globalKey.currentContext.findRenderObject();
    final widgetHeight = renderBoxWidget.size.height;
    final widgetWidth = renderBoxWidget.size.width;
    print("widgetHeight of Widget: $widgetHeight");
    print("widgetWidth of Widget: $widgetWidth");

    return {
      'widgetHeight': widgetHeight,
      'widgetWidth': widgetWidth,
    };
  }
}
