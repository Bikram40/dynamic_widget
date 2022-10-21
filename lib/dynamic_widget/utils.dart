import 'dart:ui';

import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/drop_cap_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recase/recase.dart';

TextAlign parseTextAlign(String? textAlignString) {
  //left the system decide
  TextAlign textAlign = TextAlign.start;
  switch (textAlignString) {
    case "left":
      textAlign = TextAlign.left;
      break;
    case "right":
      textAlign = TextAlign.right;
      break;
    case "center":
      textAlign = TextAlign.center;
      break;
    case "justify":
      textAlign = TextAlign.justify;
      break;
    case "start":
      textAlign = TextAlign.start;
      break;
    case "end":
      textAlign = TextAlign.end;
      break;
    default:
      textAlign = TextAlign.start;
  }
  return textAlign;
}

String exportTextAlign(TextAlign? textAlign) {
  String rt = "start";
  if (textAlign == TextAlign.left) {
    rt = "left";
  }
  if (textAlign == TextAlign.right) {
    rt = "right";
  }
  if (textAlign == TextAlign.center) {
    rt = "center";
  }
  if (textAlign == TextAlign.justify) {
    rt = "justify";
  }
  if (textAlign == TextAlign.start) {
    rt = "start";
  }
  if (textAlign == TextAlign.end) {
    rt = "end";
  }
  return rt;
}

TextOverflow? parseTextOverflow(String? textOverflowString) {
  TextOverflow? textOverflow;
  switch (textOverflowString) {
    case "ellipsis":
      textOverflow = TextOverflow.ellipsis;
      break;
    case "clip":
      textOverflow = TextOverflow.clip;
      break;
    case "fade":
      textOverflow = TextOverflow.fade;
      break;
  }
  return textOverflow;
}

String exportTextOverflow(TextOverflow? textOverflow) {
  String rt = "ellipsis";
  if (textOverflow == TextOverflow.clip) {
    rt = "clip";
  }

  if (textOverflow == TextOverflow.fade) {
    rt = "fade";
  }
  return rt;
}

TextDecoration parseTextDecoration(String? textDecorationString) {
  TextDecoration textDecoration = TextDecoration.none;
  switch (textDecorationString) {
    case "lineThrough":
      textDecoration = TextDecoration.lineThrough;
      break;
    case "overline":
      textDecoration = TextDecoration.overline;
      break;
    case "underline":
      textDecoration = TextDecoration.underline;
      break;
    case "none":
    default:
      textDecoration = TextDecoration.none;
  }
  return textDecoration;
}

String exportTextDecoration(TextDecoration? decoration) {
  var rt = "none";
  if (decoration == TextDecoration.lineThrough) {
    rt = "lineThrough";
  }

  if (decoration == TextDecoration.overline) {
    rt = "overline";
  }

  if (decoration == TextDecoration.underline) {
    rt = "underline";
  }

  return rt;
}

TextDirection parseTextDirection(String? textDirectionString) {
  TextDirection textDirection = TextDirection.ltr;
  switch (textDirectionString) {
    case 'ltr':
      textDirection = TextDirection.ltr;
      break;
    case 'rtl':
      textDirection = TextDirection.rtl;
      break;
    default:
      textDirection = TextDirection.ltr;
  }
  return textDirection;
}

String exportTextDirection(TextDirection? textDirection) {
  String rt = "ltr";
  if (textDirection == TextDirection.rtl) {
    rt = "rtl";
  }
  return rt;
}

FontWeight parseFontWeight(String? textFontWeight) {
  FontWeight fontWeight = FontWeight.normal;
  switch (textFontWeight) {
    case 'w100':
      fontWeight = FontWeight.w100;
      break;
    case 'w200':
      fontWeight = FontWeight.w200;
      break;
    case 'w300':
      fontWeight = FontWeight.w300;
      break;
    case 'normal':
    case 'w400':
      fontWeight = FontWeight.w400;
      break;
    case 'w500':
      fontWeight = FontWeight.w500;
      break;
    case 'w600':
      fontWeight = FontWeight.w600;
      break;
    case 'bold':
    case 'w700':
      fontWeight = FontWeight.w700;
      break;
    case 'w800':
      fontWeight = FontWeight.w800;
      break;
    case 'w900':
      fontWeight = FontWeight.w900;
      break;
    default:
      fontWeight = FontWeight.normal;
  }
  return fontWeight;
}

String exportFontWeight(FontWeight? fontWeight) {
  String rt = "normal";
  if (fontWeight == FontWeight.w100) {
    rt = "w100";
  }
  if (fontWeight == FontWeight.w200) {
    rt = "w200";
  }
  if (fontWeight == FontWeight.w300) {
    rt = "w300";
  }
  if (fontWeight == FontWeight.w400) {
    rt = "w400";
  }
  if (fontWeight == FontWeight.w500) {
    rt = "w500";
  }
  if (fontWeight == FontWeight.w600) {
    rt = "w600";
  }
  if (fontWeight == FontWeight.w700) {
    rt = "w700";
  }
  if (fontWeight == FontWeight.w800) {
    rt = "w800";
  }
  if (fontWeight == FontWeight.w900) {
    rt = "w900";
  }
  return rt;
}

List<String>? exportColorList(List<Color> colors) {
  List<String> data = [];
  if (colors == null) {
    return null;
  }
  colors.forEach((element) {
    data.add(element.value.toRadixString(16));
  });
  return data;
}

List<Color>? parseColorList(List<String> colors) {
  List<Color> data = [];
  colors.forEach((element) {
    data.add(parseHexColor(element)!);
  });
  return data;
}

Color? parseHexColor(String? hexColorString) {
  if (hexColorString == null) {
    return null;
  }
  hexColorString = hexColorString.toUpperCase().replaceAll("#", "");
  if (hexColorString.length == 6) {
    hexColorString = "FF" + hexColorString;
  }
  int colorInt = int.parse(hexColorString, radix: 16);
  return Color(colorInt);
}

List<Map<String, dynamic>>? exportShadowList(List<Shadow>? shadows) {
  List<Map<String, dynamic>> data = [];
  if (shadows == null) {
    return null;
  }
  shadows.forEach((element) {
    data.add(<String, dynamic>{
      "color":
          element.color != null ? element.color.value.toRadixString(16) : null,
      "offset": exportOffset(element.offset),
      "blurRadius": element.blurRadius
    });
  });
  return data;
}

List<Shadow>? parseShadowList(List<Map<String, dynamic>>? shadowList) {
  List<Shadow>? data = [];
  if (shadowList == null) {
    return null;
  }
  shadowList.forEach((element) {
    data.add(Shadow(
      color: parseHexColor(element['color']) ?? Colors.black,
      offset: parseOffset(element['offset']),
      blurRadius: element['blurRadius'],
    ));
  });
  return data;
}

List<BoxShadow>? parseBoxShadowList(List<Map<String, dynamic>>? shadowList) {
  List<BoxShadow>? data = [];
  if (shadowList == null) {
    return null;
  }
  shadowList.forEach((element) {
    data.add(BoxShadow(
      color: parseHexColor(element['color']) ?? Colors.black,
      offset: parseOffset(element['offset']),
      blurRadius: element['blurRadius'],
    ));
  });
  return data;
}

String? getFontFamilyName(String? fontFamily) {
  if (fontFamily == null) {
    return 'Roboto';
  }
  List<String> data = fontFamily.split('_');
  return data[0].titleCase;
}

Map<String, dynamic>? exportOffset(Offset? offset) {
  return DynamicWidgetBuilder.removeNullFromMap(
      <String, dynamic>{"dx": offset!.dx, "dy": offset.dy});
}

Offset parseOffset(Map<String, dynamic>? offset) {
  return Offset(offset!['dx'], offset['dy']);
}

TextStyle? parseTextStyle(Map<String, dynamic>? map) {
  if (map == null) {
    return null;
  }
  //TODO: more properties need to be implemented, such as decorationColor, decorationStyle, wordSpacing and so on.
  String? color = map['color'];
  String? debugLabel = map['debugLabel'];
  String? decoration = map['decoration'];
  String? fontFamily = getFontFamilyName(map['fontFamily']);
  double? fontSize = map['fontSize']?.toDouble();
  String? fontWeight = map['fontWeight'];
  double? letterSpacing = map['letterSpacing']?.toDouble();
  double? wordSpacing = map['wordSpacing']?.toDouble();
  double? height = map['height']?.toDouble();
  List<Map<String, dynamic>>? shadowList =
      List<Map<String, dynamic>>.from(map['shadows'] ?? []);
  FontStyle fontStyle =
      'italic' == map['fontStyle'] ? FontStyle.italic : FontStyle.normal;
  return GoogleFonts.getFont('$fontFamily',
      textStyle: TextStyle(
          color: parseHexColor(color),
          debugLabel: debugLabel,
          decoration: parseTextDecoration(decoration),
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontStyle: fontStyle,
          fontWeight: parseFontWeight(fontWeight),
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          height: height,
          shadows: parseShadowList(shadowList)));
}

Map<String, dynamic>? exportTextStyle(TextStyle? textStyle) {
  if (textStyle == null) {
    return null;
  }

  return DynamicWidgetBuilder.removeNullFromMap(<String, dynamic>{
    "color": textStyle.color != null
        ? textStyle.color!.value.toRadixString(16)
        : null,
    "debugLabel": textStyle.debugLabel,
    "decoration": exportTextDecoration(textStyle.decoration),
    "fontSize": textStyle.fontSize,
    "fontFamily": textStyle.fontFamily,
    "fontStyle": FontStyle.italic == textStyle.fontStyle ? "italic" : "normal",
    "fontWeight": exportFontWeight(textStyle.fontWeight),
    "letterSpacing": textStyle.letterSpacing,
    "wordSpacing": textStyle.wordSpacing,
    "height": textStyle.height,
    "shadows": exportShadowList(textStyle.shadows)
  });
}

InputDecoration? parseInputDecoration(Map<String, dynamic>? map) {
  if (map == null) {
    return null;
  }
  InputBorder inputBorder = parseInputBorder(map['border']) ?? InputBorder.none;
  return InputDecoration(
    isDense: map['isDense'],
    hintText: map['hintText'],
    labelText: map['labelText'],
    border: inputBorder,
    labelStyle: TextStyle(color: inputBorder.borderSide.color),
    focusedBorder: inputBorder,
    enabledBorder: inputBorder,
  );
}

InputBorder? parseInputBorder(Map<String, dynamic>? map) {
  if (map == null) {
    return null;
  }
  var radius = map['borderRadius'].toString().split(",");
  double topLeft = double.parse(radius[0]);
  double topRight = double.parse(radius[1]);
  double bottomLeft = double.parse(radius[2]);
  double bottomRight = double.parse(radius[3]);
  if (map['type'] == 'OutlineInputBorder') {
    return OutlineInputBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            topRight: Radius.circular(topRight),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight)),
        borderSide: BorderSide(
            color: parseHexColor(map['borderColor']) ?? Colors.transparent,
            width: map['borderWidth'] ?? 1.0));
  } else {
    return UnderlineInputBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            topRight: Radius.circular(topRight),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight)),
        borderSide: BorderSide(
            color: parseHexColor(map['borderColor']) ?? Colors.transparent,
            width: map['borderWidth']));
  }
}

Map<String, dynamic>? exportInputDecoration(InputDecoration? inputDecoration) {
  if (inputDecoration == null) {
    return null;
  }
  return DynamicWidgetBuilder.removeNullFromMap(<String, dynamic>{
    "isDense": inputDecoration.isDense,
    "border": exportInputBorder(inputDecoration.border),
    "hintText": inputDecoration.hintText,
    "labelText": inputDecoration.labelText,
  });
}

Map<String, dynamic>? exportInputBorder(InputBorder? inputBorder) {
  if (inputBorder == null) {
    return null;
  }
  if (inputBorder == InputBorder.none) {
    return null;
  }
  if (inputBorder.runtimeType == OutlineInputBorder) {
    OutlineInputBorder border = inputBorder as OutlineInputBorder;
    BorderRadius borderRadius = border.borderRadius;
    return DynamicWidgetBuilder.removeNullFromMap(<String, dynamic>{
      "type": "OutlineInputBorder",
      "borderColor": border.borderSide.color != null
          ? border.borderSide.color.value.toRadixString(16)
          : null,
      "borderWidth": border.borderSide.width,
      "borderRadius":
          "${borderRadius.topLeft.x},${borderRadius.topRight.x},${borderRadius.bottomLeft.x},${borderRadius.bottomRight.x}",
    });
  }
  if (inputBorder.runtimeType == UnderlineInputBorder) {
    UnderlineInputBorder border = inputBorder as UnderlineInputBorder;
    BorderRadius borderRadius = border.borderRadius;
    return DynamicWidgetBuilder.removeNullFromMap(<String, dynamic>{
      "type": "UnderlineInputBorder",
      "borderColor": border.borderSide.color != null
          ? border.borderSide.color.value.toRadixString(16)
          : null,
      "borderWidth": border.borderSide.width,
      "borderRadius":
          "${borderRadius.topLeft.x},${borderRadius.topRight.x},${borderRadius.bottomLeft.x},${borderRadius.bottomRight.x}",
    });
  }
}

Map<String, dynamic>? exportBoxDecoration(BoxDecoration? boxDecoration) {
  if (boxDecoration == null) {
    return null;
  }
  // var borderRadius = boxDecoration.borderRadius!;
  BorderRadius borderRadius = boxDecoration.borderRadius != null
      ? boxDecoration.borderRadius as BorderRadius
      : BorderRadius.zero;
  Border? border =
      boxDecoration.border == null ? null : boxDecoration.border as Border;
  DecorationImage? decorationImage = boxDecoration.image;
  NetworkImage? image =
      decorationImage != null ? decorationImage.image as NetworkImage : null;
  return DynamicWidgetBuilder.removeNullFromMap(<String, dynamic>{
    "image": image != null ? image.url : null,
    "color": boxDecoration.color != null
        ? boxDecoration.color!.value.toRadixString(16)
        : null,
    "boxFit":
        decorationImage != null ? exportBoxFit(decorationImage.fit) : null,
    "borderRadius":
        "${borderRadius.topLeft.x},${borderRadius.topRight.x},${borderRadius.bottomLeft.x},${borderRadius.bottomRight.x}",
    "boxShadow": exportShadowList(boxDecoration.boxShadow),
    "border": border == null
        ? null
        : "${border.top.width},${border.top.color != null ? border.top.color.value.toRadixString(16) : null}",
  });
}

BoxDecoration? parseBoxDecoration(Map<String, dynamic>? map) {
  if (map == null) {
    return null;
  }
  var radius = map['borderRadius'].toString().split(",");
  var border = map['border'].toString().split(",");
  double topLeft = double.parse(radius[0]);
  double topRight = double.parse(radius[1]);
  double bottomLeft = double.parse(radius[2]);
  double bottomRight = double.parse(radius[3]);
  BoxFit? boxFit =
      map.containsKey('boxFit') ? parseBoxFit(map['boxFit']) : null;
  String? color = map['color'];
  List<Map<String, dynamic>>? shadowList =
      List<Map<String, dynamic>>.from(map['boxShadow'] ?? []);
  return new BoxDecoration(
      image: map['image'] != null
          ? DecorationImage(image: NetworkImage(map['image']), fit: boxFit)
          : null,
      color: parseHexColor(color),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight),
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight)),
      boxShadow: parseBoxShadowList(shadowList),
      border: map['border'] == null || map['border'] == 'null'
          ? null
          : Border.all(
              width: double.parse(border[0]),
              color: parseHexColor(border[1]) ?? Colors.transparent));
}

Alignment? parseAlignment(String? alignmentString) {
  Alignment? alignment;
  switch (alignmentString) {
    case 'topLeft':
      alignment = Alignment.topLeft;
      break;
    case 'topCenter':
      alignment = Alignment.topCenter;
      break;
    case 'topRight':
      alignment = Alignment.topRight;
      break;
    case 'centerLeft':
      alignment = Alignment.centerLeft;
      break;
    case 'center':
      alignment = Alignment.center;
      break;
    case 'centerRight':
      alignment = Alignment.centerRight;
      break;
    case 'bottomLeft':
      alignment = Alignment.bottomLeft;
      break;
    case 'bottomCenter':
      alignment = Alignment.bottomCenter;
      break;
    case 'bottomRight':
      alignment = Alignment.bottomRight;
      break;
  }
  return alignment;
}

const double infinity = 9999999999;

BoxConstraints parseBoxConstraints(Map<String, dynamic>? map) {
  double minWidth = 0.0;
  double maxWidth = double.infinity;
  double minHeight = 0.0;
  double maxHeight = double.infinity;

  if (map != null) {
    if (map.containsKey('minWidth')) {
      var minWidthValue = map['minWidth']?.toDouble();

      if (minWidthValue != null) {
        if (minWidthValue >= infinity) {
          minWidth = double.infinity;
        } else {
          minWidth = minWidthValue;
        }
      }
    }

    if (map.containsKey('maxWidth')) {
      var maxWidthValue = map['maxWidth']?.toDouble();

      if (maxWidthValue != null) {
        if (maxWidthValue >= infinity) {
          maxWidth = double.infinity;
        } else {
          maxWidth = maxWidthValue;
        }
      }
    }

    if (map.containsKey('minHeight')) {
      var minHeightValue = map['minHeight']?.toDouble();

      if (minHeightValue != null) {
        if (minHeightValue >= infinity) {
          minHeight = double.infinity;
        } else {
          minHeight = minHeightValue;
        }
      }
    }

    if (map.containsKey('maxHeight')) {
      var maxHeightValue = map['maxHeight']?.toDouble();

      if (maxHeightValue != null) {
        if (maxHeightValue >= infinity) {
          maxHeight = double.infinity;
        } else {
          maxHeight = maxHeightValue;
        }
      }
    }
  }

  return BoxConstraints(
    minWidth: minWidth,
    maxWidth: maxWidth,
    minHeight: minHeight,
    maxHeight: maxHeight,
  );
}

EdgeInsetsGeometry? parseEdgeInsetsGeometry(String? edgeInsetsGeometryString) {
  //left,top,right,bottom
  if (edgeInsetsGeometryString == null ||
      edgeInsetsGeometryString.trim() == '') {
    return null;
  }
  var values = edgeInsetsGeometryString.split(",");
  return EdgeInsets.only(
      left: double.parse(values[0]),
      top: double.parse(values[1]),
      right: double.parse(values[2]),
      bottom: double.parse(values[3]));
}

CrossAxisAlignment parseCrossAxisAlignment(String? crossAxisAlignmentString) {
  switch (crossAxisAlignmentString) {
    case 'start':
      return CrossAxisAlignment.start;
    case 'end':
      return CrossAxisAlignment.end;
    case 'center':
      return CrossAxisAlignment.center;
    case 'stretch':
      return CrossAxisAlignment.stretch;
    case 'baseline':
      return CrossAxisAlignment.baseline;
  }
  return CrossAxisAlignment.center;
}

String exportCrossAxisAlignment(CrossAxisAlignment crossAxisAlignment) {
  String rt = "center";
  if (crossAxisAlignment == CrossAxisAlignment.start) {
    rt = "start";
  }
  if (crossAxisAlignment == CrossAxisAlignment.end) {
    rt = "end";
  }
  if (crossAxisAlignment == CrossAxisAlignment.center) {
    rt = "center";
  }
  if (crossAxisAlignment == CrossAxisAlignment.stretch) {
    rt = "stretch";
  }
  if (crossAxisAlignment == CrossAxisAlignment.baseline) {
    rt = "baseline";
  }

  return rt;
}

MainAxisAlignment parseMainAxisAlignment(String? mainAxisAlignmentString) {
  switch (mainAxisAlignmentString) {
    case 'start':
      return MainAxisAlignment.start;
    case 'end':
      return MainAxisAlignment.end;
    case 'center':
      return MainAxisAlignment.center;
    case 'spaceBetween':
      return MainAxisAlignment.spaceBetween;
    case 'spaceAround':
      return MainAxisAlignment.spaceAround;
    case 'spaceEvenly':
      return MainAxisAlignment.spaceEvenly;
  }
  return MainAxisAlignment.start;
}

String exportMainAxisAlignment(MainAxisAlignment mainAxisAlignment) {
  String rt = "start";
  if (mainAxisAlignment == MainAxisAlignment.end) {
    rt = "end";
  } else if (mainAxisAlignment == MainAxisAlignment.center) {
    rt = "center";
  } else if (mainAxisAlignment == MainAxisAlignment.spaceBetween) {
    rt = "spaceBetween";
  } else if (mainAxisAlignment == MainAxisAlignment.spaceAround) {
    rt = "spaceAround";
  } else if (mainAxisAlignment == MainAxisAlignment.spaceEvenly) {
    rt = "spaceEvenly";
  }
  return rt;
}

MainAxisSize parseMainAxisSize(String? mainAxisSizeString) =>
    mainAxisSizeString == 'min' ? MainAxisSize.min : MainAxisSize.max;

TextBaseline parseTextBaseline(String? parseTextBaselineString) =>
    'alphabetic' == parseTextBaselineString
        ? TextBaseline.alphabetic
        : TextBaseline.ideographic;

VerticalDirection parseVerticalDirection(String? verticalDirectionString) =>
    'up' == verticalDirectionString
        ? VerticalDirection.up
        : VerticalDirection.down;

String? exportBlendMode(BlendMode? blendMode) {
  if (blendMode == null) {
    return null;
  }
  String rt = "srcIn";
  if (blendMode == BlendMode.clear) {
    rt = "clear";
  }
  if (blendMode == BlendMode.src) {
    rt = "src";
  }
  if (blendMode == BlendMode.dst) {
    rt = "dst";
  }
  if (blendMode == BlendMode.srcOver) {
    rt = "srcOver";
  }
  if (blendMode == BlendMode.dstOver) {
    rt = "dstOver";
  }
  if (blendMode == BlendMode.srcIn) {
    rt = "srcIn";
  }
  if (blendMode == BlendMode.dstIn) {
    rt = "dstIn";
  }
  if (blendMode == BlendMode.srcOut) {
    rt = "srcOut";
  }
  if (blendMode == BlendMode.dstOut) {
    rt = "dstOut";
  }
  if (blendMode == BlendMode.srcATop) {
    rt = "srcATop";
  }
  if (blendMode == BlendMode.dstATop) {
    rt = "dstATop";
  }
  if (blendMode == BlendMode.xor) {
    rt = "xor";
  }
  if (blendMode == BlendMode.plus) {
    rt = "plus";
  }
  if (blendMode == BlendMode.modulate) {
    rt = "modulate";
  }
  if (blendMode == BlendMode.screen) {
    rt = "screen";
  }
  if (blendMode == BlendMode.overlay) {
    rt = "overlay";
  }
  if (blendMode == BlendMode.darken) {
    rt = "darken";
  }
  if (blendMode == BlendMode.lighten) {
    rt = "lighten";
  }
  if (blendMode == BlendMode.colorDodge) {
    rt = "colorDodge";
  }
  if (blendMode == BlendMode.colorBurn) {
    rt = "colorBurn";
  }
  if (blendMode == BlendMode.hardLight) {
    rt = "hardLight";
  }
  if (blendMode == BlendMode.softLight) {
    rt = "softLight";
  }
  if (blendMode == BlendMode.difference) {
    rt = "difference";
  }
  if (blendMode == BlendMode.exclusion) {
    rt = "exclusion";
  }
  if (blendMode == BlendMode.multiply) {
    rt = "multiply";
  }
  if (blendMode == BlendMode.hue) {
    rt = "hue";
  }
  if (blendMode == BlendMode.saturation) {
    rt = "saturation";
  }
  if (blendMode == BlendMode.color) {
    rt = "color";
  }
  if (blendMode == BlendMode.luminosity) {
    rt = "luminosity";
  }

  return rt;
}

BlendMode? parseBlendMode(String? blendModeString) {
  if (blendModeString == null || blendModeString.trim().length == 0) {
    return null;
  }

  switch (blendModeString.trim()) {
    case 'clear':
      return BlendMode.clear;
    case 'src':
      return BlendMode.src;
    case 'dst':
      return BlendMode.dst;
    case 'srcOver':
      return BlendMode.srcOver;
    case 'dstOver':
      return BlendMode.dstOver;
    case 'srcIn':
      return BlendMode.srcIn;
    case 'dstIn':
      return BlendMode.dstIn;
    case 'srcOut':
      return BlendMode.srcOut;
    case 'dstOut':
      return BlendMode.dstOut;
    case 'srcATop':
      return BlendMode.srcATop;
    case 'dstATop':
      return BlendMode.dstATop;
    case 'xor':
      return BlendMode.xor;
    case 'plus':
      return BlendMode.plus;
    case 'modulate':
      return BlendMode.modulate;
    case 'screen':
      return BlendMode.screen;
    case 'overlay':
      return BlendMode.overlay;
    case 'darken':
      return BlendMode.darken;
    case 'lighten':
      return BlendMode.lighten;
    case 'colorDodge':
      return BlendMode.colorDodge;
    case 'colorBurn':
      return BlendMode.colorBurn;
    case 'hardLight':
      return BlendMode.hardLight;
    case 'softLight':
      return BlendMode.softLight;
    case 'difference':
      return BlendMode.difference;
    case 'exclusion':
      return BlendMode.exclusion;
    case 'multiply':
      return BlendMode.multiply;
    case 'hue':
      return BlendMode.hue;
    case 'saturation':
      return BlendMode.saturation;
    case 'color':
      return BlendMode.color;
    case 'luminosity':
      return BlendMode.luminosity;

    default:
      return BlendMode.srcIn;
  }
}

BoxFit? parseBoxFit(String? boxFitString) {
  if (boxFitString == null) {
    return null;
  }

  switch (boxFitString) {
    case 'fill':
      return BoxFit.fill;
    case 'contain':
      return BoxFit.contain;
    case 'cover':
      return BoxFit.cover;
    case 'fitWidth':
      return BoxFit.fitWidth;
    case 'fitHeight':
      return BoxFit.fitHeight;
    case 'none':
      return BoxFit.none;
    case 'scaleDown':
      return BoxFit.scaleDown;
  }

  return null;
}

String exportBoxFit(BoxFit? boxFit) {
  String rt = "cover";
  if (boxFit == BoxFit.fill) {
    rt = "fill";
  }
  if (boxFit == BoxFit.cover) {
    rt = "cover";
  }
  if (boxFit == BoxFit.fitWidth) {
    rt = "fitWidth";
  }
  if (boxFit == BoxFit.fitHeight) {
    rt = "fitHeight";
  }
  if (boxFit == BoxFit.none) {
    rt = "none";
  }
  if (boxFit == BoxFit.scaleDown) {
    rt = "scaleDown";
  }
  return rt;
}

ImageRepeat? parseImageRepeat(String? imageRepeatString) {
  if (imageRepeatString == null) {
    return null;
  }

  switch (imageRepeatString) {
    case 'repeat':
      return ImageRepeat.repeat;
    case 'repeatX':
      return ImageRepeat.repeatX;
    case 'repeatY':
      return ImageRepeat.repeatY;
    case 'noRepeat':
      return ImageRepeat.noRepeat;

    default:
      return ImageRepeat.noRepeat;
  }
}

String exportImageRepeat(ImageRepeat imageRepeat) {
  String rt = "noRepeat";
  if (imageRepeat == ImageRepeat.repeat) {
    rt = "repeat";
  }
  if (imageRepeat == ImageRepeat.repeatX) {
    rt = "repeatX";
  }
  if (imageRepeat == ImageRepeat.repeatY) {
    rt = "repeatY";
  }
  return rt;
}

Rect? parseRect(String? fromLTRBString) {
  if (fromLTRBString == null) {
    return null;
  }
  var strings = fromLTRBString.split(',');
  return Rect.fromLTRB(double.parse(strings[0]), double.parse(strings[1]),
      double.parse(strings[2]), double.parse(strings[3]));
}

String exportRect(Rect rect) {
  return "${rect.left},${rect.top},${rect.right},${rect.bottom}";
}

FilterQuality? parseFilterQuality(String? filterQualityString) {
  if (filterQualityString == null) {
    return null;
  }
  switch (filterQualityString) {
    case 'none':
      return FilterQuality.none;
    case 'low':
      return FilterQuality.low;
    case 'medium':
      return FilterQuality.medium;
    case 'high':
      return FilterQuality.high;
    default:
      return FilterQuality.low;
  }
}

String exportFilterQuality(FilterQuality filterQuality) {
  String rt = "low";
  if (filterQuality == FilterQuality.none) {
    rt = "none";
  }
  if (filterQuality == FilterQuality.low) {
    rt = "low";
  }
  if (filterQuality == FilterQuality.medium) {
    rt = "medium";
  }
  if (filterQuality == FilterQuality.high) {
    rt = "high";
  }
  return rt;
}

String? getLoadMoreUrl(String? url, int currentNo, int? pageSize) {
  if (url == null) {
    return null;
  }

  url = url.trim();
  if (url.contains("?")) {
    url = url +
        "&startNo=" +
        currentNo.toString() +
        "&pageSize=" +
        pageSize.toString();
  } else {
    url = url +
        "?startNo=" +
        currentNo.toString() +
        "&pageSize=" +
        pageSize.toString();
  }
  return url;
}

StackFit? parseStackFit(String? value) {
  if (value == null) return null;

  switch (value) {
    case 'loose':
      return StackFit.loose;
    case 'expand':
      return StackFit.expand;
    case 'passthrough':
      return StackFit.passthrough;
    default:
      return StackFit.loose;
  }
}

String exportStackFit(StackFit stackFit) {
  String rt = "loose";
  if (stackFit == StackFit.expand) {
    rt = "expand";
  } else if (stackFit == StackFit.passthrough) {
    rt = "passthrough";
  }
  return rt;
}

Clip? parseClip(String? value) {
  if (value == null) {
    return null;
  }

  switch (value) {
    case 'none':
      return Clip.none;
    case 'hardEdge':
      return Clip.hardEdge;
    case 'antiAlias':
      return Clip.antiAlias;
    case 'antiAliasWithSaveLayer':
      return Clip.antiAliasWithSaveLayer;
    default:
      return Clip.hardEdge;
  }
}

String exportClip(Clip clip) {
  String rt = "hardEdge";
  if (clip == Clip.none) {
    rt = "none";
  } else if (clip == Clip.hardEdge) {
    rt = "hardEdge";
  } else if (clip == Clip.antiAlias) {
    rt = "antiAlias";
  } else if (clip == Clip.antiAliasWithSaveLayer) {
    rt = "antiAliasWithSaveLayer";
  }
  return rt;
}

Axis parseAxis(String? axisString) {
  if (axisString == null) {
    return Axis.horizontal;
  }

  switch (axisString) {
    case "horizontal":
      return Axis.horizontal;
    case "vertical":
      return Axis.vertical;
  }
  return Axis.horizontal;
}

//WrapAlignment
WrapAlignment parseWrapAlignment(String? wrapAlignmentString) {
  if (wrapAlignmentString == null) {
    return WrapAlignment.start;
  }

  switch (wrapAlignmentString) {
    case "start":
      return WrapAlignment.start;
    case "end":
      return WrapAlignment.end;
    case "center":
      return WrapAlignment.center;
    case "spaceBetween":
      return WrapAlignment.spaceBetween;
    case "spaceAround":
      return WrapAlignment.spaceAround;
    case "spaceEvenly":
      return WrapAlignment.spaceEvenly;
  }
  return WrapAlignment.start;
}

String exportWrapAlignment(WrapAlignment wrapAlignment) {
  String rt = "start";
  if (wrapAlignment == WrapAlignment.end) {
    rt = "end";
  } else if (wrapAlignment == WrapAlignment.center) {
    rt = "center";
  } else if (wrapAlignment == WrapAlignment.spaceBetween) {
    rt = "spaceBetween";
  } else if (wrapAlignment == WrapAlignment.spaceAround) {
    rt = "spaceAround";
  } else if (wrapAlignment == WrapAlignment.spaceEvenly) {
    rt = "spaceEvenly";
  }
  return rt;
}

//WrapCrossAlignment
WrapCrossAlignment parseWrapCrossAlignment(String? wrapCrossAlignmentString) {
  if (wrapCrossAlignmentString == null) {
    return WrapCrossAlignment.start;
  }

  switch (wrapCrossAlignmentString) {
    case "start":
      return WrapCrossAlignment.start;
    case "end":
      return WrapCrossAlignment.end;
    case "center":
      return WrapCrossAlignment.center;
  }

  return WrapCrossAlignment.start;
}

String exportWrapCrossAlignment(WrapCrossAlignment wrapCrossAlignment) {
  String rt = "start";
  if (wrapCrossAlignment == WrapCrossAlignment.end) {
    rt = "end";
  } else if (wrapCrossAlignment == WrapCrossAlignment.center) {
    rt = "center";
  }
  return rt;
}

Clip parseClipBehavior(String? clipBehaviorString) {
  if (clipBehaviorString == null) {
    return Clip.antiAlias;
  }
  switch (clipBehaviorString) {
    case "antiAlias":
      return Clip.antiAlias;
    case "none":
      return Clip.none;
    case "hardEdge":
      return Clip.hardEdge;
    case "antiAliasWithSaveLayer":
      return Clip.antiAliasWithSaveLayer;
  }
  return Clip.antiAlias;
}

String exportClipBehavior(Clip clip) {
  if (clip == Clip.antiAliasWithSaveLayer) {
    return "antiAliasWithSaveLayer";
  }

  if (clip == Clip.hardEdge) {
    return "hardEdge";
  }

  if (clip == Clip.none) {
    return "none";
  }

  return "antiAlias";
}

DropCapMode? parseDropCapMode(String? value) {
  if (value == null) {
    return null;
  }

  switch (value) {
    case 'inside':
      return DropCapMode.inside;
    case 'upwards':
      return DropCapMode.upwards;
    case 'aside':
      return DropCapMode.aside;
    default:
      return DropCapMode.inside;
  }
}

String? exportDropCapMod(DropCapMode? mode) {
  if (mode == null) {
    return null;
  }

  switch (mode) {
    case DropCapMode.inside:
      return "inside";
    case DropCapMode.baseline:
      return "baseline";
    case DropCapMode.aside:
      return "aside";
    case DropCapMode.upwards:
      return "upwards";
    default:
      return "inside";
  }
}

DropCapPosition? parseDropCapPosition(String? value) {
  if (value == null) {
    return null;
  }

  switch (value) {
    case 'start':
      return DropCapPosition.start;
    case 'end':
      return DropCapPosition.end;
    default:
      return DropCapPosition.start;
  }
}

String exportDropCapPosition(DropCapPosition? dropCapPosition) {
  String rt = "start";
  if (dropCapPosition == DropCapPosition.end) {
    rt = "end";
  }
  return rt;
}

DropCap? parseDropCap(Map<String, dynamic>? map, BuildContext buildContext,
    ClickListener? listener) {
  if (map == null) {
    return null;
  }
  return DropCap(
    width: map['width']?.toDouble(),
    height: map['height']?.toDouble(),
    child:
        DynamicWidgetBuilder.buildFromMap(map["child"], buildContext, listener),
  );
}

Map<String, dynamic>? exportDropCap(
    DropCap? dropCap, BuildContext? buildContext) {
  if (dropCap == null) {
    return null;
  }
  return DynamicWidgetBuilder.removeNullFromMap(<String, dynamic>{
    "width": dropCap.width,
    "height": dropCap.height,
    "child": DynamicWidgetBuilder.export(dropCap.child, buildContext),
  });
}

String exportAlignmentDirectional(AlignmentDirectional alignmentDirectional) {
  if (alignmentDirectional == AlignmentDirectional.bottomCenter) {
    return "bottomCenter";
  }

  if (alignmentDirectional == AlignmentDirectional.center) {
    return "center";
  }

  if (alignmentDirectional == AlignmentDirectional.bottomEnd) {
    return "bottomEnd";
  }

  if (alignmentDirectional == AlignmentDirectional.bottomStart) {
    return "bottomStart";
  }

  if (alignmentDirectional == AlignmentDirectional.centerEnd) {
    return "centerEnd";
  }

  if (alignmentDirectional == AlignmentDirectional.centerStart) {
    return "centerStart";
  }

  if (alignmentDirectional == AlignmentDirectional.bottomCenter) {
    return "bottomCenter";
  }

  if (alignmentDirectional == AlignmentDirectional.topCenter) {
    return "topCenter";
  }

  if (alignmentDirectional == AlignmentDirectional.topEnd) {
    return "topEnd";
  }

  if (alignmentDirectional == AlignmentDirectional.topStart) {
    return "topStart";
  }

  return "topStart";
}

String exportAlignment(Alignment? alignment) {
  if (alignment == null) {
    return "center";
  }
  if (alignment == Alignment.center) {
    return "center";
  }
  if (alignment == Alignment.bottomRight) {
    return "bottomRight";
  }
  if (alignment == Alignment.bottomCenter) {
    return "bottomCenter";
  }
  if (alignment == Alignment.bottomLeft) {
    return "bottomLeft";
  }
  if (alignment == Alignment.centerLeft) {
    return "centerLeft";
  }
  if (alignment == Alignment.centerRight) {
    return "centerRight";
  }
  if (alignment == Alignment.topCenter) {
    return "topCenter";
  }
  if (alignment == Alignment.topLeft) {
    return "topLeft";
  }
  if (alignment == Alignment.topRight) {
    return "topRight";
  }
  if (alignment == Alignment.bottomRight) {
    return "bottomRight";
  }

  return "center";
}

Map<String, dynamic> exportConstraints(BoxConstraints constraints) {
  return {
    'minWidth': constraints.minWidth == double.infinity
        ? infinity
        : constraints.minWidth,
    'maxWidth': constraints.maxWidth == double.infinity
        ? infinity
        : constraints.maxWidth,
    'minHeight': constraints.minHeight == double.infinity
        ? infinity
        : constraints.minHeight,
    'maxHeight': constraints.maxHeight == double.infinity
        ? infinity
        : constraints.maxHeight,
  };
}
