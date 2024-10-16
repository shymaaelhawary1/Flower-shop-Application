class Routes {
  List<Legs>? legs;

  Routes({this.legs});

  factory Routes.fromJson(Map<String, dynamic> json) {
    
    return Routes(
      legs: (json['legs'] as List)
          ?.map((leg) => Legs.fromJson(leg as Map<String, dynamic>))
          ?.toList(),
    );
  }
}

class Legs {
  final String distance;
  final String duration;

  Legs({
    required this.distance,
    required this.duration,
  });

  factory Legs.fromJson(Map<String, dynamic> json) {
    
    return Legs(
      distance: json['distance']['text'] ?? 'N/A',
      duration: json['duration']['text'] ?? 'N/A',
    );
  }
}
