import 'package:cloud_firestore/cloud_firestore.dart';

class Favorite {
  final String id;
  final String userId;
  final String destinationId;
  final String destinationName;
  final String destinationImage;
  final String destinationLocation;
  final double destinationPrice;
  final double destinationRating;
  final DateTime addedAt;

  Favorite({
    required this.id,
    required this.userId,
    required this.destinationId,
    required this.destinationName,
    required this.destinationImage,
    required this.destinationLocation,
    required this.destinationPrice,
    required this.destinationRating,
    required this.addedAt,
  });

  factory Favorite.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Favorite(
      id: doc.id,
      userId: data['userId'] ?? '',
      destinationId: data['destinationId'] ?? '',
      destinationName: data['destinationName'] ?? '',
      destinationImage: data['destinationImage'] ?? '',
      destinationLocation: data['destinationLocation'] ?? '',
      destinationPrice: (data['destinationPrice'] ?? 0).toDouble(),
      destinationRating: (data['destinationRating'] ?? 0).toDouble(),
      addedAt: (data['addedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'destinationId': destinationId,
      'destinationName': destinationName,
      'destinationImage': destinationImage,
      'destinationLocation': destinationLocation,
      'destinationPrice': destinationPrice,
      'destinationRating': destinationRating,
      'addedAt': Timestamp.fromDate(addedAt),
    };
  }
}