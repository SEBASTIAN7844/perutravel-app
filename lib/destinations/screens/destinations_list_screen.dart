// destinations/screens/destinations_list_screen.dart
import 'package:flutter/material.dart';
import '../models/destination_detail_model.dart';
import '../widgets/destination_card.dart';
import 'destination_detail_screen.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/constants/app_colors.dart';

class DestinationsListScreen extends StatelessWidget {
  final List<DestinationDetail> destinations;
  final String? title;

  const DestinationsListScreen({
    Key? key,
    required this.destinations,
    this.title = "Destinos Populares",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title!,
        showBackButton: true,
      ),
      backgroundColor: AppColors.background,
      body: destinations.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          final destination = destinations[index];
          return DestinationCard(
            destination: destination,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DestinationDetailScreen(destination: destination),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on_outlined,
            size: 80,
            color: AppColors.textSecondary.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            "No hay destinos disponibles",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Pronto agregaremos más destinos",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}