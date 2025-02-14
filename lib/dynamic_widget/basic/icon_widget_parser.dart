import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/icons_helper.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';
class IconWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    return Icon(
      map.containsKey('data') && map['data'] is Map
          ? getIconGuessFavorMaterial2( map['data'])
          : Icons.android,
      size: map.containsKey("size") ? map['size']?.toDouble() : null,
      color: map.containsKey('color') ? parseHexColor(map['color']) : null,
      semanticLabel:
          map.containsKey('semanticLabel') ? map['semanticLabel'] : null,
      textDirection: map.containsKey('textDirection')
          ? parseTextDirection(map['textDirection'])
          : null,
    );
  }

  @override
  String get widgetName => "Icon";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Icon;
    return <String, dynamic>{
      "type": widgetName,
      "data": exportIconGuessFavorMaterial2(realWidget.icon),
      "size": realWidget.size,
      "color": realWidget.color != null
          ? realWidget.color?.exportString
          : null,
      // "color": exportColor(realWidget.color),
      "semanticLabel": realWidget.semanticLabel,
      "textDirection": realWidget.textDirection != null
          ? exportTextDirection(realWidget.textDirection)
          : null,
    };
  }

  @override
  Type get widgetType => Icon;
}
