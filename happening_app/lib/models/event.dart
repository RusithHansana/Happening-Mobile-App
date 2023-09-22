enum Category {
  all,
  conference,
  seminar,
  workshop,
  lecture,
  exhibition,
  social,
  sports,
}

class UniversityEvent {
  const UniversityEvent({
    required this.id,
    required this.title,
    required this.place,
    required this.startTime,
    required this.endTime,
    required this.description,
    required this.requirements,
    required this.category,
    required this.imageUrl,
    this.isFeaturedEvent = false,
  });

  final String id;
  final String title;
  final String place;
  final DateTime startTime;
  final DateTime endTime;
  final String description;
  final List<String> requirements;
  final Category category;
  final String imageUrl;
  final bool isFeaturedEvent;
}
