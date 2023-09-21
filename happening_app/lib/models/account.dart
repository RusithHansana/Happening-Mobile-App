import 'package:happening_app/models/event.dart';

class StudentAccount {
  StudentAccount({
    required this.studentName,
    required this.indexNumber,
    required this.email,
    required this.password,
    this.isAdmin = false,
    required this.imagePath,
  });

  final String studentName;
  final String indexNumber;
  final String email;
  final String password;
  final List<UniversityEvent> favoriteEvents = [];
  final List<UniversityEvent> registeredEvents = [];
  final bool isAdmin;
  final String imagePath; // Path to the student's image, nullable
}
