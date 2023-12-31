import '/models/event.dart';

final List<UniversityEvent> universityEvents = [
  UniversityEvent(
    id: "11",
    title: "Rasoga",
    place: "Campus Amphitheater",
    startTime: DateTime(2023, 11, 8, 16, 0),
    endTime: DateTime(2023, 11, 8, 22, 0),
    description:
        "Experience the magic of music at our annual Music Festival. Enjoy performances by student bands, solo artists, and special guest musicians.",
    requirements: [
      "Love for music",
      "Blanket or lawn chair",
      "Cash for concessions"
    ],
    category: Category.social,
    imageUrl: 'assets/img/events/Events/rasoga.jpg',
    isFeaturedEvent: true,
  ),
  UniversityEvent(
    id: "1",
    title: "Annual Science Conference",
    place: "Campus Auditorium",
    startTime: DateTime(2023, 10, 15, 9, 0),
    endTime: DateTime(2023, 10, 17, 17, 0),
    description:
        "Join us for the Annual Science Conference where experts from around the world will discuss the latest breakthroughs in various scientific fields.",
    requirements: ["Student ID", "Registration fee", "Laptop for workshops"],
    category: Category.conference,
    imageUrl: "assets/img/events/Events/1 (1).jpg",
    isFeaturedEvent: true,
  ),
  UniversityEvent(
    id: "2",
    title: "Career Development Workshop",
    place: "Career Center",
    startTime: DateTime(2023, 11, 5, 14, 0),
    endTime: DateTime(2023, 11, 5, 16, 0),
    description:
        "This workshop will help you build essential skills for a successful career. Topics include resume writing, interview techniques, and networking strategies.",
    requirements: ["Resume", "Notebook", "Professional attire"],
    category: Category.workshop,
    imageUrl: "assets/img/events/Events/1 (2).jpg",
  ),
  UniversityEvent(
    id: "3",
    title: "International Relations Seminar",
    place: "Room 302, Humanities Building",
    startTime: DateTime(2023, 9, 25, 10, 0),
    endTime: DateTime(2023, 9, 25, 12, 0),
    description:
        "Explore global politics and diplomacy in this seminar featuring renowned experts. Gain insights into the complex world of international relations.",
    requirements: ["Interest in international affairs", "Open mind"],
    category: Category.seminar,
    imageUrl: "assets/img/events/Events/1 (4).jpg",
    isFeaturedEvent: true,
  ),
  UniversityEvent(
    id: "4",
    title: "Art Exhibition Opening Night",
    place: "Campus Art Gallery",
    startTime: DateTime(2023, 10, 8, 18, 0),
    endTime: DateTime(2023, 10, 8, 20, 0),
    description:
        "Be part of the grand opening of our latest art exhibition showcasing works from talented local artists. Enjoy an evening of creativity and culture.",
    requirements: ["Art enthusiast", "Dress code: Smart casual"],
    category: Category.exhibition,
    imageUrl: "assets/img/events/Events/1 (3).jpg",
    isFeaturedEvent: true,
  ),
  UniversityEvent(
    id: "5",
    title: "Physics Lecture Series",
    place: "Physics Department Lecture Hall",
    startTime: DateTime(2023, 9, 30, 15, 0),
    endTime: DateTime(2023, 9, 30, 17, 0),
    description:
        "Join us for a fascinating lecture on quantum mechanics by Dr. Elizabeth Smith. This is part of our ongoing Physics Lecture Series.",
    requirements: ["Interest in physics", "Note-taking materials"],
    category: Category.lecture,
    imageUrl: "assets/img/events/Events/1 (6).jpg",
  ),
  UniversityEvent(
    id: "6",
    title: "Sports Day",
    place: "Campus Sports Complex",
    startTime: DateTime(2023, 11, 20, 8, 0),
    endTime: DateTime(2023, 11, 20, 18, 0),
    description:
        "Get ready for a day of sports and fun! Participate in various sporting events, from basketball to track and field, and compete for exciting prizes.",
    requirements: ["Sports attire", "Water bottle", "Competitive spirit"],
    category: Category.sports,
    imageUrl: "assets/img/events/Events/1 (5).jpg",
  ),
  UniversityEvent(
    id: "7",
    title: "Environmental Conservation Workshop",
    place: "Green Campus Initiative Center",
    startTime: DateTime(2023, 10, 12, 10, 0),
    endTime: DateTime(2023, 10, 12, 12, 0),
    description:
        "Learn about sustainable practices and environmental conservation in this workshop. Discover ways to make a positive impact on our planet.",
    requirements: ["Reusable water bottle", "Interest in environmental issues"],
    category: Category.workshop,
    imageUrl: "assets/img/events/Events/1 (8).jpg",
  ),
  UniversityEvent(
    id: "8",
    title: "Music Festival",
    place: "Campus Amphitheater",
    startTime: DateTime(2023, 11, 8, 16, 0),
    endTime: DateTime(2023, 11, 8, 22, 0),
    description:
        "Experience the magic of music at our annual Music Festival. Enjoy performances by student bands, solo artists, and special guest musicians.",
    requirements: [
      "Love for music",
      "Blanket or lawn chair",
      "Cash for concessions"
    ],
    category: Category.social,
    imageUrl: "assets/img/events/Events/1 (9).jpg",
    isFeaturedEvent: true,
  ),
  UniversityEvent(
    id: "9",
    title: "Robotics Workshop",
    place: "Engineering Lab",
    startTime: DateTime(2023, 10, 5, 13, 0),
    endTime: DateTime(2023, 10, 5, 16, 0),
    description:
        "Get hands-on experience in robotics! This workshop will cover robot design, programming, and a friendly robot competition.",
    requirements: ["Interest in robotics", "Basic knowledge of programming"],
    category: Category.workshop,
    imageUrl: "assets/img/events/Events/1(10).jpg",
  ),
  UniversityEvent(
    id: "10",
    title: "Annual Conference",
    place: "Campus Auditorium",
    startTime: DateTime(2023, 10, 15, 9, 0),
    endTime: DateTime(2023, 10, 17, 17, 0),
    description:
        "Join us for the Annual Science Conference where experts from around the world will discuss the latest breakthroughs in various scientific fields.",
    requirements: ["Student ID", "Registration fee", "Laptop for workshops"],
    category: Category.conference,
    imageUrl: "assets/img/events/Events/1(11).jpg",
    isFeaturedEvent: true,
  ),
];
