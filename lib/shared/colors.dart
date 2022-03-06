import 'package:flutter/material.dart';

class AllColors {
  factory AllColors() => _instance;
  AllColors._();
  static final AllColors _instance = AllColors._();
  // ignore: non_constant_identifier_names
  Color WHITE = const Color(0xFFFFFFFF);
  // ignore: non_constant_identifier_names
  Color FONT_PRIMARY = const Color(0xff131219);
  // ignore: non_constant_identifier_names
  Color INPUT_GREY_BACKGROUND = const Color(0xFFF7F7FF);
  // ignore: non_constant_identifier_names
  Color LIGHT_GREY = const Color(0xFFBEC0C8);
  // ignore: non_constant_identifier_names
  Color DARK_GREY = const Color(0xFF6D6D79);
  // ignore: non_constant_identifier_names
  Color ORANGE = const Color(0xFFFC7A30);
  // ignore: non_constant_identifier_names
  Color PURPLE = const Color(0xFFD9D9FF);
  // ignore: non_constant_identifier_names
  Color LIGHT_BLUE = const Color(0xFFCFFFFF);
  // ignore: non_constant_identifier_names
  Color BLUE = const Color(0xFFC1D9E9);
  // ignore: non_constant_identifier_names
  Color LIGHT_PINK = const Color(0xFFFED2CF);
  // ignore: non_constant_identifier_names
  Color GREY = const Color(0xFF868A92); // Change it to Hex Later
  // ignore: non_constant_identifier_names
  Color Black = const Color(0xFF000000);
  // ignore: non_constant_identifier_names
  Color GREY_LABEL = const Color(0xFF747481);
  // ignore: non_constant_identifier_names
  Color EVENT_MEMBERS = const Color(0xFFC1D9E9);
  // ignore: non_constant_identifier_names
  Color MILD_GREY = const Color(0xFFE4E4E4);

  // ignore: non_constant_identifier_names
  Color LIGHT_GREY_LABEL = const Color(0xFFB3B6BE);
  // ignore: non_constant_identifier_names
  Color RED = const Color(0xFFe34040);
}

class ContactInitialsColors {
  static final color = {
    'A': const Color(0xFFAA0DFE),
    'B': const Color(0xFF3283FE),
    'C': const Color(0xFF85660D),
    'D': const Color(0xFF782AB6),
    'E': const Color(0xFF565656),
    'F': const Color(0xFF1C8356),
    'G': const Color(0xFF16FF32),
    'H': const Color(0xFFF7E1A0),
    'I': const Color(0xFFE2E2E2),
    'J': const Color(0xFF1CBE4F),
    'K': const Color(0xFFC4451C),
    'L': const Color(0xFFDEA0FD),
    'M': const Color(0xFFFE00FA),
    'N': const Color(0xFF325A9B),
    'O': const Color(0xFFFEAF16),
    'P': const Color(0xFFF8A19F),
    'Q': const Color(0xFF90AD1C),
    'R': const Color(0xFFF6222E),
    'S': const Color(0xFF1CFFCE),
    'T': const Color(0xFF2ED9FF),
    'U': const Color(0xFFB10DA1),
    'V': const Color(0xFFC075A6),
    'W': const Color(0xFFFC1CBF),
    'X': const Color(0xFFB00068),
    'Y': const Color(0xFFFBE426),
    'Z': const Color(0xFFFA0087),
  };

  static Color? getColor(String atsign) {
    if (atsign[0] == '@') {
      return color[atsign[1].toUpperCase()];
    }

    return color[atsign[0].toUpperCase()];
  }
}
