// destinations/screens/destination_detail_screen.dart
import 'package:flutter/material.dart';
import '../models/destination_detail_model.dart';
import '../widgets/destination_header.dart';
import '../widgets/pricing_section.dart';
import '../widgets/rules_section.dart';
import '../widgets/gallery_section.dart';
import '../widgets/booking_button.dart';
import '../widgets/info_card.dart';
import '../widgets/rating_widget.dart';
import '../../core/constants/app_colors.dart';

class DestinationDetailScreen extends StatelessWidget {
  final DestinationDetail destination;

  const DestinationDetailScreen({
    Key? key,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // Header con imagen
          DestinationHeader(destination: destination),

          // Contenido principal
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Información básica
                  _buildBasicInfoSection(),
                  const SizedBox(height: 20),

                  // Cards de información rápida
                  _buildInfoCards(),
                  const SizedBox(height: 20),

                  // Precios
                  PricingSection(pricing: destination.pricing),
                  const SizedBox(height: 20),

                  // Galería
                  if (destination.images.length > 1) ...[
                    GallerySection(images: destination.images),
                    const SizedBox(height: 20),
                  ],

                  // Reglas
                  RulesSection(rules: destination.rules),
                  const SizedBox(height: 20),

                  // Consejos
                  _buildTipsSection(),
                  const SizedBox(height: 80), // Espacio para el botón flotante
                ],
              ),
            ),
          ),
        ],
      ),

      // Botón flotante de compra
      floatingActionButton: BookingButton(bookingUrl: destination.bookingUrl),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildBasicInfoSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            destination.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            destination.description,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          RatingWidget(
            rating: destination.rating,
            reviewCount: destination.reviewCount,
            iconSize: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCards() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.6,
      children: [
        InfoCard(
          icon: Icons.access_time,
          title: 'Horario',
          value: destination.hours,
          iconColor: AppColors.primary,
        ),
        InfoCard(
          icon: Icons.location_on,
          title: 'Ubicación',
          value: destination.location,
          iconColor: AppColors.accent,
        ),
        InfoCard(
          icon: Icons.terrain,
          title: 'Altitud',
          value: '${destination.altitude.toInt()} msnm',
          iconColor: AppColors.warning,
        ),
        InfoCard(
          icon: Icons.schedule,
          title: 'Dificultad',
          value: destination.difficulty,
          iconColor: AppColors.textSecondary,
        ),
      ],
    );
  }

  Widget _buildTipsSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lightbulb_outline, color: AppColors.warning),
              const SizedBox(width: 8),
              const Text(
                'Consejos para tu visita',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...destination.tips.asMap().entries.map((entry) {
            final index = entry.key;
            final tip = entry.value;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      tip,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}