// destinations/models/destination_detail_model.dart
class DestinationDetail {
  final String id;
  final String name;
  final String description;
  final String hours;
  final double price;
  final double rating;
  final int reviewCount;
  final List<String> images;
  final List<PriceTier> pricing;
  final List<String> rules;
  final String location;
  final String bookingUrl;
  final List<String> tips;
  final String weather;
  final String bestSeason;
  final String difficulty;
  final double altitude;

  DestinationDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.hours,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.images,
    required this.pricing,
    required this.rules,
    required this.location,
    required this.bookingUrl,
    required this.tips,
    required this.weather,
    required this.bestSeason,
    required this.difficulty,
    required this.altitude,
  });

  factory DestinationDetail.fromMap(Map<String, dynamic> map) {
    return DestinationDetail(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      hours: map['hours'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      rating: (map['rating'] ?? 0).toDouble(),
      reviewCount: map['reviewCount'] ?? 0,
      images: List<String>.from(map['images'] ?? []),
      pricing: List<PriceTier>.from(
        (map['pricing'] ?? []).map((x) => PriceTier.fromMap(x)),
      ),
      rules: List<String>.from(map['rules'] ?? []),
      location: map['location'] ?? '',
      bookingUrl: map['bookingUrl'] ?? '',
      tips: List<String>.from(map['tips'] ?? []),
      weather: map['weather'] ?? '',
      bestSeason: map['bestSeason'] ?? '',
      difficulty: map['difficulty'] ?? 'Media',
      altitude: (map['altitude'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'hours': hours,
      'price': price,
      'rating': rating,
      'reviewCount': reviewCount,
      'images': images,
      'pricing': pricing.map((x) => x.toMap()).toList(),
      'rules': rules,
      'location': location,
      'bookingUrl': bookingUrl,
      'tips': tips,
      'weather': weather,
      'bestSeason': bestSeason,
      'difficulty': difficulty,
      'altitude': altitude,
    };
  }
}

class PriceTier {
  final String type;
  final double price;
  final String? description;
  final String? conditions;

  PriceTier({
    required this.type,
    required this.price,
    this.description,
    this.conditions,
  });

  factory PriceTier.fromMap(Map<String, dynamic> map) {
    return PriceTier(
      type: map['type'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      description: map['description'],
      conditions: map['conditions'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'price': price,
      'description': description,
      'conditions': conditions,
    };
  }
}