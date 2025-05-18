import 'package:flutter/material.dart';

/// A utility class that provides standard spacing constants
/// to be used throughout the application UI.
class AppSpacing {
  // Private constructor to prevent instantiation
  AppSpacing._();

  /// Extra extra small spacing - 2.0
  static const double xxs = 2.0;

  /// Extra small spacing - 4.0
  static const double xs = 4.0;

  /// Small spacing - 8.0
  static const double sm = 8.0;

  /// Medium spacing - 12.0
  static const double md = 12.0;

  /// Large spacing - 16.0
  static const double lg = 16.0;

  /// Extra large spacing - 24.0
  static const double xlg = 24.0;

  /// Double extra large spacing - 32.0
  static const double xxlg = 32.0;

  /// Double extra large spacing (legacy) - 48.0
  static const double xxl = 48.0;

  /// Triple extra large spacing - 64.0
  static const double xxxl = 64.0;

  /// Horizontal spacing as SizedBox
  static SizedBox get horizontalXXS => const SizedBox(width: xxs);

  /// xs = 4.0
  static SizedBox get horizontalXS => const SizedBox(width: xs);

  /// sm = 8.0
  static SizedBox get horizontalSM => const SizedBox(width: sm);

  /// md = 12.0
  static SizedBox get horizontalMD => const SizedBox(width: md);

  /// lg = 16.0
  static SizedBox get horizontalLG => const SizedBox(width: lg);

  /// xlg = 24.0
  static SizedBox get horizontalXLG => const SizedBox(width: xlg);

  /// xxlg = 32.0
  static SizedBox get horizontalXXLG => const SizedBox(width: xxlg);

  /// Vertical spacing as SizedBox
  /// xxs = 2.0
  static SizedBox get verticalXXS => const SizedBox(height: xxs);

  /// xs = 4.0
  static SizedBox get verticalXS => const SizedBox(height: xs);

  /// sm = 8.0
  static SizedBox get verticalSM => const SizedBox(height: sm);

  /// md = 12.0
  static SizedBox get verticalMD => const SizedBox(height: md);

  /// lg = 16.0
  static SizedBox get verticalLG => const SizedBox(height: lg);

  /// xlg = 24.0
  static SizedBox get verticalXLG => const SizedBox(height: xlg);

  /// xxlg = 32.0
  static SizedBox get verticalXXLG => const SizedBox(height: xxlg);

  /// xxxl = 64.0
  static SizedBox get verticalXXXL => const SizedBox(height: xxxl);
}
