import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class CommonWidgets {
  // Rating Stars Widget
  static Widget buildRatingStars({
    required double rating,
    double size = 16,
    Color color = AppTheme.googleAmber,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < rating.floor()
              ? Icons.star
              : index < rating
              ? Icons.star_half
              : Icons.star_border,
          size: size,
          color: color,
        );
      }),
    );
  }

  static Widget buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color iconColor = AppTheme.googleBlue,
    Color textColor = AppTheme.googleBlue,
    double iconSize = 24,
    double textSize = 12,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: iconSize, color: iconColor),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: textSize,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Info Row Widget
  static Widget buildInfoRow({
    required IconData icon,
    required String text,
    Color iconColor = AppTheme.primaryGrey,
    Color textColor = AppTheme.primaryGrey,
    double iconSize = 20,
    double textSize = 14,
    bool isLink = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: iconSize, color: iconColor),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: textSize,
              color: isLink ? AppTheme.googleBlue : textColor,
              decoration: isLink ? TextDecoration.underline : null,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }

  static Widget buildPhotoCounterBadge(int currentIndex, int totalCount) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '${currentIndex + 1}/${totalCount.clamp(0, 5)}',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Business Status Badge
  static Widget buildBusinessStatusBadge(String? status) {
    if (status == null) return SizedBox.shrink();

    Color statusColor;
    switch (status.toLowerCase()) {
      case 'operational':
        statusColor = AppTheme.businessOpen;
        break;
      case 'closed_temporarily':
        statusColor = AppTheme.businessClosingSoon;
        break;
      case 'closed_permanently':
        statusColor = AppTheme.businessClosed;
        break;
      default:
        statusColor = AppTheme.primaryGrey;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: statusColor.withOpacity(0.3)),
      ),
      child: Text(
        status.replaceAll('_', ' ').toUpperCase(),
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: statusColor,
        ),
      ),
    );
  }

  // Loading Placeholder
  static Widget buildLoadingPlaceholder({
    double? width,
    double? height,
    Color backgroundColor = AppTheme.surfaceGrey,
    Color progressColor = AppTheme.googleBlue,
  }) {
    return Container(
      width: width,
      height: height,
      color: backgroundColor,
      child: Center(
        child: CircularProgressIndicator(strokeWidth: 2, color: progressColor),
      ),
    );
  }

  // Error Placeholder
  static Widget buildErrorPlaceholder({
    double? width,
    double? height,
    IconData icon = Icons.image_not_supported,
    double iconSize = 48,
    Color backgroundColor = AppTheme.lightGrey,
    Color iconColor = AppTheme.iconGrey,
    String? message,
  }) {
    return Container(
      width: width,
      height: height,
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: iconSize, color: iconColor),
          if (message != null) ...[
            SizedBox(height: 8),
            Text(
              message,
              style: AppTheme.captionText.copyWith(color: iconColor),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }

  // Rounded Container
  static Widget buildRoundedContainer({
    required Widget child,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    Color? borderColor,
    double borderRadius = 8,
  }) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppTheme.lightGrey,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }

  // Divider Line
  static Widget buildDivider({
    double height = 1,
    Color color = AppTheme.dividerGrey,
    EdgeInsetsGeometry margin = const EdgeInsets.symmetric(vertical: 16),
  }) {
    return Container(margin: margin, height: height, color: color);
  }
}
