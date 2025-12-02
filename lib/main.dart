// main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

// Core
import 'core/constants/app_colors.dart';

// Destinations
import 'destinations/models/destination_detail_model.dart';
import 'destinations/data/destinations_data.dart';
import 'destinations/screens/destinations_list_screen.dart';
import 'destinations/screens/destination_detail_screen.dart';

// Home
import 'home/screens/home_screen.dart';

// Favorites
import 'favorites/favorites_exports.dart';

// Profile
import 'profile/profile_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const PeruTravelApp());
}

class PeruTravelApp extends StatelessWidget {
  const PeruTravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => FavoritesService()),
        Provider(create: (context) => ProfileService()),
      ],
      child: MaterialApp(
        title: 'PerúTravel',
        theme: ThemeData(
          primaryColor: AppColors.primary,
          primarySwatch: MaterialColor(0xFFFF6B35, {
            50: Color(0xFFFFF1EB),
            100: Color(0xFFFFD9CC),
            200: Color(0xFFFFBEAA),
            300: Color(0xFFFFA388),
            400: Color(0xFFFF8F6F),
            500: Color(0xFFFF6B35),
            600: Color(0xFFEB6130),
            700: Color(0xFFD4562A),
            800: Color(0xFFBE4C25),
            900: Color(0xFF993C1C),
          }),
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
          ),
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
            headlineMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
            bodyLarge: TextStyle(
              fontSize: 16,
              color: AppColors.textPrimary,
            ),
            bodyMedium: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        home: const HomeScreen(),
        routes: {
          '/home': (context) => const HomeScreen(),
          '/destinations': (context) => DestinationsListScreen(
            destinations: DestinationsData.destinations,
          ),
          '/destination_detail': (context) {
            final destination =
            ModalRoute.of(context)!.settings.arguments as DestinationDetail;
            return DestinationDetailScreen(destination: destination);
          },
          '/favorites': (context) => const FavoritesScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/edit_profile': (context) => const EditProfileScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}