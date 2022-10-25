library icons_helper;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter_named/font_awesome_flutter_named.dart';
import 'package:material_icons_named/material_icons_named.dart';

// Returns an icon by examining the name for the format ICON_LIBRARY.ICON_NAME and if not, looks for a Material icon of the ICON_NAME
// For example fa.fiveHundredPx returns the icon named fiveHundredPx in the FontAwesome lib, if it didn't exist, it'd try to return the material icon named fiveHundredPx, otherwise you get null.
// If you don't use the dot notation described it will attempt to get you an icon favoring the Material icon set using getIconGuessFavorMaterial
IconData? getIconUsingPrefix({required String name}) {
  final List<String> split = name.split('.');

  if (split.length > 1) {
    name = split[1];
    if (split[0].toLowerCase() == 'fa' ||
        split[0].toLowerCase() == 'fontawesome') {
      return getFontAwesomeIcon(name: name);
    }
  } else {
    return getIconGuessFavorMaterial(name: name);
  }

  return getMaterialIcon(name: name);
}

// Returns an icon named in name favoring Font Awesome
IconData? getIconGuessFavorFA({String? name}) {
  if (faIconNameMapping[name!] != null) {
    return faIconNameMapping[name];
  } else {
    return materialIcons[name];
  }
}

// Returns an icon named in name favoring Material
IconData? getIconGuessFavorMaterial({String? name}) {
  if (materialIcons[name!] != null) {
    return materialIcons[name];
  } else {
    return faIconNameMapping[name];
  }
}

String exportIconGuessFavorMaterial(IconData? iconData) {
  for (var entry in materialIcons.entries) {
    if (entry.value == iconData) {
      return entry.key;
    }
  }
  for (var entry in faIconNameMapping.entries) {
    if (entry.value == iconData) {
      return entry.key;
    }
  }
  return "android";
}

Map<String, dynamic>? exportIconGuessFavorMaterial2(IconData? iconData) {
  if (iconData != null) {
    return {
      'codePoint': iconData
          .toString()
          .replaceAll('IconData(U+0', '')
          .replaceAll(')', ''),
      'fontFamily': iconData.fontFamily ?? '',
      'fontPackage': iconData.fontPackage ?? '',
      'matchTextDirection': iconData.matchTextDirection
    };
  }
  return null;
}

IconData? getIconGuessFavorMaterial2(Map<String, dynamic>? iconMap) {
  if (iconMap != null) {
    var code;
    if (iconMap['fontFamily'] == 'MaterialIcons') {
      code = '0x' + iconMap['codePoint'].toString().toLowerCase();
    } else if (iconMap['fontFamily'] == 'FontAwesomeSolid') {
      code = '0x' + iconMap['codePoint'].toString().toLowerCase();
    }
    return IconData(
      int.parse(code),
      fontFamily: iconMap['fontFamily'],
      // fontPackage: iconMap['fontPackage'],
      matchTextDirection: iconMap['matchTextDirection'],
    );
  }
  return null;
}

// Kinda self explanatory, no?
IconData? getMaterialIcon({String? name}) {
  return materialIcons[name!];
}

// Kinda self explanatory, no?
IconData? getFontAwesomeIcon({String? name}) {
  return faIconNameMapping[name!];
}
