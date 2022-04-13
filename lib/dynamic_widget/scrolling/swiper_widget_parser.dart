import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class SwiperWidgetParser extends WidgetParser {
  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    SwiperWidget swiperWidget = widget as SwiperWidget;
    return <String, dynamic>{
      "type": "SwiperWidget",
      "children": DynamicWidgetBuilder.exportWidgets(
          swiperWidget.children!, buildContext),
      "itemCount": swiperWidget.itemCount,
      "itemWidth": swiperWidget.itemWidth,
      "layout":
          swiperWidget.layout != null ? swiperWidget.layout!.index.toInt() : 0,
      "viewportFraction": swiperWidget.viewportFraction,
      "autoplay": swiperWidget.autoplay,
      "pagination": swiperWidget.pagination,
      "scale": swiperWidget.scale
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    return SwiperWidget(
        pagination: map['pagination'],
        children: DynamicWidgetBuilder.buildWidgets(
            map['children'], buildContext, listener),
        itemCount: map['itemCount'],
        itemWidth: map['itemWidth'],
        layout: SwiperLayout.values[map['layout']],
        viewportFraction: map['viewportFraction'],
        autoplay: map['autoplay'],
        scale: map['scale']);
  }

  @override
  String get widgetName => 'SwiperWidget';

  @override
  Type get widgetType => SwiperWidget;
}

class SwiperWidget extends StatelessWidget {
  final int? itemCount;
  final double? itemWidth;
  final SwiperLayout? layout;
  final double? viewportFraction;
  final bool? autoplay;
  final bool? pagination;
  List<Widget>? children;
  final double? scale;

  SwiperWidget(
      {this.itemCount,
      this.itemWidth,
      this.layout,
      this.viewportFraction,
      this.autoplay,
      required this.pagination,
      this.scale,
      this.children});

  //If there are no more items, it should not try to load more data while scroll
  //to bottom.

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (context, index) {
        return children != null ? children![index] : Container();
      },
      itemCount: children!.length,
      itemWidth: itemWidth ?? 200,
      layout: layout,
      customLayoutOption: new CustomLayoutOption(startIndex: -1, stateCount: 3)
          .addRotate([-25.0 / 180, 0.0, 25.0 / 180]).addTranslate([
        new Offset(-370.0, -40.0),
        new Offset(0.0, 0.0),
        new Offset(370.0, -40.0)
      ]),
      viewportFraction: viewportFraction ?? 0.5,
      autoplay: autoplay ?? false,
      pagination: pagination ?? false
          ? new SwiperPagination(
              builder: const DotSwiperPaginationBuilder(
                  size: 10.0, activeSize: 10.0, space: 5.0))
          : null,
      scale: scale,
    );
  }
}
