// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppColors {
  // Helper method to generate color with opacity
  static Color _withOpacity(Color color, double opacity) =>
      color.withOpacity(opacity);

  static Color _fromHex(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  // Primary Color Palette
  static Color primary100 = _fromHex('#D5F2D9');
  static Color primary200 = _fromHex('#D5F2D9');
  static Color primary300 = _fromHex('#90E79C');
  static Color primary400 = _fromHex('#75DF83');
  static Color primary500 = _fromHex('#5AC268'); // Default
  static Color primary600 = _fromHex('#3CBE4E');
  static Color primary700 = _fromHex('#28A739');
  static Color primary800 = _fromHex('#239332');
  static Color primary900 = _fromHex('#239332');

  static Color primary90 = _withOpacity(primary500, 0.90);
  static Color primary80 = _withOpacity(primary500, 0.80);
  static Color primary20 = _withOpacity(primary500, 0.20);
  static Color primary10 = _withOpacity(primary500, 0.10);
  static Color primary5 = _withOpacity(primary500, 0.05);

  // Secondary Color Palette
  static Color secondary100 = _fromHex('#F5D0F8');
  static Color secondary200 = _fromHex('#EB9AF2');
  static Color secondary300 = _fromHex('#E17AEA');
  static Color secondary400 = _fromHex('#D756E2');
  static Color secondary500 = _fromHex('#B330BE'); // Default
  static Color secondary600 = _fromHex('#A524AF');
  static Color secondary700 = _fromHex('#9718A1');
  static Color secondary800 = _fromHex('#85178E');
  static Color secondary900 = _fromHex('#5E0D65');

  static Color secondary90 = _withOpacity(secondary500, 0.90);
  static Color secondary80 = _withOpacity(secondary500, 0.80);
  static Color secondary20 = _withOpacity(secondary500, 0.20);
  static Color secondary10 = _withOpacity(secondary500, 0.10);
  static Color secondary5 = _withOpacity(secondary500, 0.05);

  // Tertiary Color Palette
  static Color tertiary100 = _fromHex('#CEDFF1');
  static Color tertiary200 = _fromHex('#ACC8E4');
  static Color tertiary300 = _fromHex('#6DA3DB');
  static Color tertiary400 = _fromHex('#3793F2');
  static Color tertiary500 = _fromHex('#0478EF'); // Default
  static Color tertiary600 = _fromHex('#0C6ED2');
  static Color tertiary700 = _fromHex('#0B67C6');
  static Color tertiary800 = _fromHex('#0E5CAC');
  static Color tertiary900 = _fromHex('#084F99');

  static Color tertiary90 = _withOpacity(tertiary500, 0.90);
  static Color tertiary80 = _withOpacity(tertiary500, 0.80);
  static Color tertiary20 = _withOpacity(tertiary500, 0.20);
  static Color tertiary10 = _withOpacity(tertiary500, 0.10);
  static Color tertiary5 = _withOpacity(tertiary500, 0.05);

  // Dark Shades
  static Color dark600 = _fromHex('#000000');
  static Color dark500 = _fromHex('#101811');
  static Color dark90 = _withOpacity(dark500, 0.90);
  static Color dark80 = _withOpacity(dark500, 0.80);
  static Color dark20 = _withOpacity(dark500, 0.20);
  static Color dark10 = _withOpacity(dark500, 0.10);
  static Color dark5 = _withOpacity(dark500, 0.05);

  // Gray Shades
  static Color gray600 = _fromHex('#9796A1');
  static Color gray500 = _fromHex('#9DA49E');
  static Color gray90 = _withOpacity(gray500, 0.90);
  static Color gray80 = _withOpacity(gray500, 0.80);
  static Color gray20 = _withOpacity(gray500, 0.20);
  static Color gray10 = _withOpacity(gray500, 0.10);
  static Color gray5 = _withOpacity(gray500, 0.05);

  // Light Shades
  static Color light500 = _fromHex('#D9E1E1');
  static Color light90 = _withOpacity(light500, 0.90);
  static Color light80 = _withOpacity(light500, 0.80);
  static Color light20 = _withOpacity(light500, 0.20);
  static Color light10 = _withOpacity(light500, 0.10);
  static Color light5 = _withOpacity(light500, 0.05);

  // White Shades
  static const Color white500 = Color(0xFFFFFFFF);
  static Color white90 = _withOpacity(white500, 0.90);
  static Color white80 = _withOpacity(white500, 0.80);
  static Color white20 = _withOpacity(white500, 0.20);
  static Color white10 = _withOpacity(white500, 0.10);
  static Color white5 = _withOpacity(white500, 0.05);

  // Gradient Definitions
  static Gradient gradientPrimaryToSecondary = LinearGradient(
    colors: [_fromHex('#8ED35E'), primary500],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static Gradient gradientTertiaryToSecondary = LinearGradient(
    colors: [tertiary500, _fromHex('#4CC5FE')],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static Gradient gradientPrimaryToTertiary = LinearGradient(
    colors: [_fromHex('#5D30BE'), secondary500],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
