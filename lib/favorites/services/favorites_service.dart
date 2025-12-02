// favorites/services/favorites_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/favorite_model.dart';

class FavoritesService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Obtener todos los favoritos del usuario actual
  Stream<List<Favorite>> getFavoritesStream() {
    final user = _auth.currentUser;
    if (user == null) {
      return Stream.value([]);
    }

    return _firestore
        .collection('favorites')
        .where('userId', isEqualTo: user.uid)
        .orderBy('addedAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Favorite.fromFirestore(doc)).toList();
    });
  }

  // Agregar a favoritos
  Future<bool> addToFavorites({
    required String destinationId,
    required String destinationName,
    required String destinationImage,
    required String destinationLocation,
    required double destinationPrice,
    required double destinationRating,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return false;
      }

      // Verificar si ya existe en favoritos
      final existingFavorite = await _firestore
          .collection('favorites')
          .where('userId', isEqualTo: user.uid)
          .where('destinationId', isEqualTo: destinationId)
          .get();

      if (existingFavorite.docs.isNotEmpty) {
        return true;
      }

      // Agregar nuevo favorito
      await _firestore.collection('favorites').add({
        'userId': user.uid,
        'destinationId': destinationId,
        'destinationName': destinationName,
        'destinationImage': destinationImage,
        'destinationLocation': destinationLocation,
        'destinationPrice': destinationPrice,
        'destinationRating': destinationRating,
        'addedAt': Timestamp.now(),
      });

      return true;
    } catch (e) {
      print('Error adding to favorites: $e');
      return false;
    }
  }

  // Eliminar de favoritos
  Future<bool> removeFromFavorites(String favoriteId) async {
    try {
      await _firestore.collection('favorites').doc(favoriteId).delete();
      return true;
    } catch (e) {
      print('Error removing from favorites: $e');
      return false;
    }
  }

  // Eliminar por destinationId
  Future<bool> removeFromFavoritesByDestinationId(String destinationId) async {
    try {
      final user = _auth.currentUser;
      if (user == null) return false;

      final favorite = await _firestore
          .collection('favorites')
          .where('userId', isEqualTo: user.uid)
          .where('destinationId', isEqualTo: destinationId)
          .get();

      if (favorite.docs.isNotEmpty) {
        await _firestore.collection('favorites').doc(favorite.docs.first.id).delete();
        return true;
      }
      return false;
    } catch (e) {
      print('Error removing favorite by destinationId: $e');
      return false;
    }
  }

  // Verificar si un destino está en favoritos
  Stream<bool> isFavoriteStream(String destinationId) {
    final user = _auth.currentUser;
    if (user == null) {
      return Stream.value(false);
    }

    return _firestore
        .collection('favorites')
        .where('userId', isEqualTo: user.uid)
        .where('destinationId', isEqualTo: destinationId)
        .snapshots()
        .map((snapshot) => snapshot.docs.isNotEmpty);
  }

  // Obtener contador de favoritos
  Stream<int> getFavoritesCountStream() {
    final user = _auth.currentUser;
    if (user == null) {
      return Stream.value(0);
    }

    return _firestore
        .collection('favorites')
        .where('userId', isEqualTo: user.uid)
        .snapshots()
        .map((snapshot) => snapshot.docs.length);
  }
}