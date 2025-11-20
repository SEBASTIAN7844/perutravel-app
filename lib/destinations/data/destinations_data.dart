// destinations/data/destinations_data.dart
import '../models/destination_detail_model.dart';

class DestinationsData {
  static final List<DestinationDetail> destinations = [
    DestinationDetail(
      id: '1',
      name: 'Machu Picchu',
      description: 'Santuario histórico inca en Cusco, una de las 7 maravillas del mundo moderno',
      hours: '6:00 AM - 5:00 PM',
      price: 152.0,
      rating: 4.7,
      reviewCount: 2845,
      images: [
        'https://images.unsplash.com/photo-1587595431973-160d0d94add1?w=800',
        'https://images.unsplash.com/photo-1526392060635-9d6019884377?w=800',
        'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800',
      ],
      pricing: [
        PriceTier(
          type: 'General Extranjero',
          price: 152.0,
          description: 'Adultos internacionales',
        ),
        PriceTier(
          type: 'Estudiante Extranjero',
          price: 77.0,
          description: 'Con carnet internacional',
          conditions: 'Menores de 25 años',
        ),
        PriceTier(
          type: 'General Nacional',
          price: 64.0,
          description: 'Adultos peruanos',
        ),
        PriceTier(
          type: 'Estudiante Nacional',
          price: 32.0,
          description: 'Con carnet universitario',
        ),
      ],
      rules: [
        'Respeta las áreas restringidas',
        'No subir a las estructuras arqueológicas',
        'No llevar mascotas',
        'No usar drones sin permiso',
        'No dejar basura',
        'Respetar el silencio en zonas sagradas',
        'Seguir siempre los senderos marcados',
      ],
      location: 'Cusco, Perú',
      bookingUrl: 'https://www.machupicchu.gob.pe/tickets',
      tips: [
        'Lleva agua y protector solar',
        'Usa calzado cómodo para caminar',
        'Aclimatate 2 días en Cusco antes de visitar',
        'Lleva efectivo en soles',
        'Reserva con anticipación (especialmente en temporada alta)',
        'Contrata un guía certificado',
      ],
      weather: 'Templado, 10°C - 20°C',
      bestSeason: 'Abril a Octubre',
      difficulty: 'Media',
      altitude: 2430.0,
    ),
    DestinationDetail(
      id: '2',
      name: 'Huacachina',
      description: 'Oasis en el desierto de Ica con dunas espectaculares',
      hours: 'Todo el día',
      price: 40.0,
      rating: 4.3,
      reviewCount: 892,
      images: [
        'https://images.unsplash.com/photo-1583531352301-afb28ac6d234?w=800',
        'https://images.unsplash.com/photo-1574484189074-97eae13d57c9?w=800',
      ],
      pricing: [
        PriceTier(
          type: 'Tubo en dunas',
          price: 40.0,
          description: 'Por persona - 30 minutos',
        ),
        PriceTier(
          type: 'Tour buggy + sandboard',
          price: 80.0,
          description: 'Aventura completa - 2 horas',
        ),
      ],
      rules: [
        'Usar protector solar siempre',
        'Mantenerse hidratado',
        'Seguir instrucciones del guía',
        'No alejarse del grupo',
        'Usar gafas de sol',
      ],
      location: 'Ica, Perú',
      bookingUrl: 'https://www.huacachina.com/tours',
      tips: [
        'Lleva ropa ligera y fresca',
        'Protege tu cámara de la arena',
        'Disfruta el atardecer en las dunas',
        'Prueba los vinos locales',
        'Visita las bodegas de pisco',
      ],
      weather: 'Cálido y seco, 20°C - 30°C',
      bestSeason: 'Todo el año',
      difficulty: 'Fácil',
      altitude: 400.0,
    ),
  ];

  static DestinationDetail getDestinationById(String id) {
    return destinations.firstWhere((dest) => dest.id == id);
  }

  static List<DestinationDetail> getPopularDestinations() {
    return destinations.where((dest) => dest.rating >= 4.0).toList();
  }
}