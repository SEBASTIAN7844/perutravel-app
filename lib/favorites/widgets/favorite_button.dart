// favorites/widgets/favorite_button.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/favorites_service.dart';
import '../../core/constants/app_colors.dart';

class FavoriteButton extends StatefulWidget {
  final String destinationId;
  final String destinationName;
  final String destinationImage;
  final String destinationLocation;
  final double destinationPrice;
  final double destinationRating;
  final double size;

  const FavoriteButton({
    Key? key,
    required this.destinationId,
    required this.destinationName,
    required this.destinationImage,
    required this.destinationLocation,
    required this.destinationPrice,
    required this.destinationRating,
    this.size = 24,
  }) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    final favoritesService = Provider.of<FavoritesService>(context);

    return StreamBuilder<bool>(
      stream: favoritesService.isFavoriteStream(widget.destinationId),
      builder: (context, snapshot) {
        final isFavorite = snapshot.data ?? false;

        return IconButton(
          onPressed: () async {
            if (isFavorite) {
              await favoritesService.removeFromFavoritesByDestinationId(widget.destinationId);
            } else {
              await favoritesService.addToFavorites(
                destinationId: widget.destinationId,
                destinationName: widget.destinationName,
                destinationImage: widget.destinationImage,
                destinationLocation: widget.destinationLocation,
                destinationPrice: widget.destinationPrice,
                destinationRating: widget.destinationRating,
              );
            }
          },
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? AppColors.primary : Colors.white,
            size: widget.size,
          ),
        );
      },
    );
  }
}