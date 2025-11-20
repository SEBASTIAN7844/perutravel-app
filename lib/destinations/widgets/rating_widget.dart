// destinations/widgets/rating_widget.dart
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  final int reviewCount;
  final double iconSize;
  final bool showReviewCount;

  const RatingWidget({
    Key? key,
    required this.rating,
    required this.reviewCount,
    this.iconSize = 16.0,
    this.showReviewCount = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Estrellas
        ...List.generate(5, (index) {
          if (index < rating.floor()) {
            // Estrella llena
            return Icon(
              Icons.star,
              color: AppColors.primary,
              size: iconSize,
            );
          } else if (index == rating.floor() && rating % 1 != 0) {
            // Media estrella
            return Icon(
              Icons.star_half,
              color: AppColors.primary,
              size: iconSize,
            );
          } else {
            // Estrella vacía
            return Icon(
              Icons.star_border,
              color: AppColors.primary,
              size: iconSize,
            );
          }
        }),

        if (showReviewCount) ...[
          const SizedBox(width: 4),
          Text(
            rating.toStringAsFixed(1),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            '($reviewCount)',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }
}