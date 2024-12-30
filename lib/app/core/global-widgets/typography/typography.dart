// ignore_for_file: unreachable_switch_default

import 'package:asgard/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

enum AsgardTypographyVariant {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

class AsgardTypography extends StatelessWidget {
  final String text;
  final AsgardTypographyVariant variant;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextDecoration? decoration;
  final TextOverflow? overflow;

  const AsgardTypography({
    super.key,
    required this.text,
    this.variant = AsgardTypographyVariant.bodyLarge,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    this.textAlign,
    this.maxLines,
    this.decoration,
    this.overflow,
  });

  TextStyle _getTextStyle(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textTheme =
        brightness == Brightness.dark ? darkTextTheme : lightTextTheme;

    switch (variant) {
      case AsgardTypographyVariant.displayLarge:
        return textTheme.displayLarge!;
      case AsgardTypographyVariant.displayMedium:
        return textTheme.displayMedium!;
      case AsgardTypographyVariant.displaySmall:
        return textTheme.displaySmall!;
      case AsgardTypographyVariant.headlineLarge:
        return textTheme.headlineLarge!;
      case AsgardTypographyVariant.headlineMedium:
        return textTheme.headlineMedium!;
      case AsgardTypographyVariant.headlineSmall:
        return textTheme.headlineSmall!;
      case AsgardTypographyVariant.bodyLarge:
        return textTheme.bodyLarge!;
      case AsgardTypographyVariant.bodyMedium:
        return textTheme.bodyMedium!;
      case AsgardTypographyVariant.bodySmall:
        return textTheme.bodySmall!;
      case AsgardTypographyVariant.labelLarge:
        return textTheme.labelLarge!;
      case AsgardTypographyVariant.labelMedium:
        return textTheme.labelMedium!;
      case AsgardTypographyVariant.labelSmall:
        return textTheme.labelSmall!;
      default:
        return textTheme.bodyLarge!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = _getTextStyle(context).copyWith(
      color: color ?? _getTextStyle(context).color,
      fontSize: fontSize ?? _getTextStyle(context).fontSize,
      fontWeight: fontWeight ?? _getTextStyle(context).fontWeight,
      letterSpacing: letterSpacing ?? _getTextStyle(context).letterSpacing,
      decoration: decoration ?? _getTextStyle(context).decoration,
      overflow: overflow ?? _getTextStyle(context).overflow,
    );

    return Text(
      text,
      style: textStyle,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      // softWrap: true,
    );
  }
}
