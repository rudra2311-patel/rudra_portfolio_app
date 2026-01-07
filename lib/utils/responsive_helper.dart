import 'package:flutter/material.dart';

/// Responsive Helper for Mobile-Only Optimizations
/// Desktop layout remains LOCKED and unchanged
class ResponsiveHelper {
  /// Check if device is mobile (width < 800)
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  /// Check if device is tablet (800 <= width < 1200)
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 800 && width < 1200;
  }

  /// Check if device is desktop (width >= 1200)
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  /// Get responsive padding for mobile only
  /// Desktop returns original value unchanged
  static EdgeInsets getResponsivePadding(
    BuildContext context,
    EdgeInsets desktopPadding,
    EdgeInsets mobilePadding,
  ) {
    return isMobile(context) ? mobilePadding : desktopPadding;
  }

  /// Get responsive font size
  /// Desktop returns original size unchanged
  static double getResponsiveFontSize(
    BuildContext context,
    double desktopSize,
    double mobileSize,
  ) {
    return isMobile(context) ? mobileSize : desktopSize;
  }

  /// Get responsive spacing
  /// Desktop returns original spacing unchanged
  static double getResponsiveSpacing(
    BuildContext context,
    double desktopSpacing,
    double mobileSpacing,
  ) {
    return isMobile(context) ? mobileSpacing : desktopSpacing;
  }

  /// Get safe area insets for mobile
  static EdgeInsets getSafeAreaInsets(BuildContext context) {
    return MediaQuery.of(context).padding;
  }

  /// Mobile-specific: Adjust widget dimensions for mobile without affecting desktop
  static double getMobileSafeWidth(BuildContext context, double desktopWidth) {
    if (!isMobile(context)) return desktopWidth; // Desktop unchanged

    final screenWidth = MediaQuery.of(context).size.width;
    final safeWidth = screenWidth * 0.9; // 90% of mobile screen
    return safeWidth < desktopWidth ? safeWidth : desktopWidth;
  }

  /// Mobile-specific: Adjust widget height for mobile without affecting desktop
  static double getMobileSafeHeight(
      BuildContext context, double desktopHeight) {
    if (!isMobile(context)) return desktopHeight; // Desktop unchanged

    final screenHeight = MediaQuery.of(context).size.height;
    final safeHeight = screenHeight * 0.85; // 85% of mobile screen
    return safeHeight < desktopHeight ? safeHeight : desktopHeight;
  }

  /// Get responsive container constraints
  /// Desktop returns original constraints unchanged
  static BoxConstraints getResponsiveConstraints(
    BuildContext context, {
    double? maxWidth,
    double? maxHeight,
    double? mobileMaxWidth,
    double? mobileMaxHeight,
  }) {
    if (isMobile(context)) {
      return BoxConstraints(
        maxWidth: mobileMaxWidth ?? maxWidth ?? double.infinity,
        maxHeight: mobileMaxHeight ?? maxHeight ?? double.infinity,
      );
    }
    return BoxConstraints(
      maxWidth: maxWidth ?? double.infinity,
      maxHeight: maxHeight ?? double.infinity,
    );
  }

  /// Get device-specific scroll physics
  /// Better scroll behavior on mobile
  static ScrollPhysics getScrollPhysics() {
    return const BouncingScrollPhysics();
  }

  /// Mobile-specific: Get viewport fraction for PageView
  static double getViewportFraction(BuildContext context) {
    return isMobile(context) ? 0.85 : 1.0;
  }

  /// Mobile-specific: Enable/disable certain features
  static bool shouldEnableParallax(BuildContext context) {
    // Disable heavy parallax effects on mobile for performance
    return !isMobile(context);
  }

  /// Get responsive icon size
  static double getIconSize(BuildContext context, double desktopSize) {
    return isMobile(context) ? desktopSize * 0.8 : desktopSize;
  }

  /// Get responsive border radius
  static BorderRadius getResponsiveBorderRadius(
    BuildContext context,
    double desktopRadius,
    double mobileRadius,
  ) {
    return BorderRadius.circular(
      isMobile(context) ? mobileRadius : desktopRadius,
    );
  }

  /// Mobile-specific: Check if landscape mode
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  /// Get safe area for mobile notch/home indicator
  static Widget wrapWithSafeArea(Widget child,
      {bool left = true,
      bool right = true,
      bool top = true,
      bool bottom = true}) {
    return SafeArea(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: child,
    );
  }
}
