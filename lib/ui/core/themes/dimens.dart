//gotten from the flutter compass_app just because it was a good example and a good starting point.
import 'package:flutter/material.dart';

abstract final class Dimens {
  const Dimens();

  /// General horizontal padding used to separate UI items
  static const paddingHorizontal = 20.0;

  /// General vertical padding used to separate UI items
  static const paddingVertical = 24.0;

  static const paddingCard = 16.0;
  static const paddingCardHorizontal = 12.0;
  static const paddingCardVertical = 8.0;
  static const paddingButton = 12.0;
  static const paddingButtonHorizontal = 16.0;
  static const paddingButtonVertical = 8.0;
  static const paddingTextField = 12.0;
  static const textCardHeightFactor = 0.1;
  static const textCardWidthFactor = 0.2;

  /// Horizontal padding for screen edges
  double get paddingScreenHorizontal;

  /// Vertical padding for screen edges
  double get paddingScreenVertical;

  double get profilePictureSize;

  /// Horizontal symmetric padding for screen edges
  EdgeInsets get edgeInsetsScreenHorizontal =>
      EdgeInsets.symmetric(horizontal: paddingScreenHorizontal);

  static double textCardHeight(BuildContext context) =>
      MediaQuery.of(context).size.height * textCardHeightFactor;

  static double textCardWidth(BuildContext context) =>
      MediaQuery.of(context).size.height * textCardWidthFactor;

  /// Symmetric padding for screen edges
  EdgeInsets get edgeInsetsScreenSymmetric => EdgeInsets.symmetric(
        horizontal: paddingScreenHorizontal,
        vertical: paddingScreenVertical,
      );

  static const Dimens desktop = _DimensDesktop();
  static const Dimens mobile = _DimensMobile();

  /// Get dimensions definition based on screen size
  factory Dimens.of(BuildContext context) =>
      switch (MediaQuery.of(context).size.width) {
        > 600 && <= 800 => Dimens.desktop,
        _ => Dimens.mobile,
      };
}

/// Mobile dimensions
final class _DimensMobile extends Dimens {
  @override
  final double paddingScreenHorizontal = Dimens.paddingHorizontal;

  @override
  final double paddingScreenVertical = Dimens.paddingVertical;

  @override
  final double profilePictureSize = 64.0;

  const _DimensMobile();
}

/// Desktop/Web dimensions
final class _DimensDesktop extends Dimens {
  @override
  final double paddingScreenHorizontal = 100.0;

  @override
  final double paddingScreenVertical = 64.0;

  @override
  final double profilePictureSize = 128.0;

  const _DimensDesktop();
}
