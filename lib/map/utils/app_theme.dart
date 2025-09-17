import 'package:flutter/material.dart';

class AppTheme {
  // Color constants - centralizing repeated color usage
  static const Color primaryGrey = Color(0xFF757575); // Grey shade 600
  static const Color secondaryGrey = Color(0xFF616161); // Grey shade 700
  static const Color lightGrey = Color(0xFFF5F5F5); // Grey shade 100
  static const Color dividerGrey = Color(0xFFE0E0E0); // Grey shade 300
  static const Color iconGrey = Color(0xFF9E9E9E); // Grey shade 500
  static const Color surfaceGrey = Color(0xFFFAFAFA); // Grey shade 50
  static const Color darkGrey = Color(0xFF424242); // Grey shade 800
  static const Color borderGrey = Color(0xFFEEEEEE); // Grey shade 200
  static const Color hintGrey = Color(
    0xFFBDBDBD,
  ); // Grey shade 400  // Google Maps style colors
  static const Color googleBlue = Color(0xFF1976D2);
  static const Color googleBlueLight = Color(0xFF42A5F5);
  static const Color googleGreen = Color(0xFF4CAF50);
  static const Color googleOrange = Color(0xFFFF9800);
  static const Color googleRed = Color(0xFFE53935);
  static const Color googleAmber = Color(0xFFFFB300);

  // Business status colors
  static const Color businessClosed = Color(0xFFD32F2F);
  static const Color businessOpen = Color(0xFF388E3C);
  static const Color businessClosingSoon = Color(0xFFF57C00);

  // Text styles for consistency
  static const TextStyle titleText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: darkGrey,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 14,
    color: secondaryGrey,
    height: 1.3,
  );

  static const TextStyle captionText = TextStyle(
    fontSize: 12,
    color: primaryGrey,
  );

  // Common decoration styles
  static final BoxDecoration cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
  );

  static final BoxDecoration roundedContainer = BoxDecoration(
    color: lightGrey,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: dividerGrey),
  );

  // Common padding values
  static const EdgeInsets defaultPadding = EdgeInsets.all(16);
  static const EdgeInsets smallPadding = EdgeInsets.all(8);
  static const EdgeInsets largePadding = EdgeInsets.all(24);
}
