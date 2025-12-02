// En destinations/screens/destination_detail_screen.dart
// Agregar en el DestinationHeader:

import '../../favorites/widgets/favorite_button.dart';

class DestinationHeader extends StatelessWidget {
  final DestinationDetail destination;

  const DestinationHeader({
    Key? key,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            destination.images.isNotEmpty
                ? Image.network(
              destination.images.first,
              fit: BoxFit.cover,
            )
                : Container(color: AppColors.primaryLight),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.primary,
      leading: IconButton(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        FavoriteButton(
          destinationId: destination.id,
          destinationName: destination.name,
          destinationImage: destination.images.first,
          destinationLocation: destination.location,
          destinationPrice: destination.price,
          destinationRating: destination.rating,
        ),
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.share, color: Colors.white),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}