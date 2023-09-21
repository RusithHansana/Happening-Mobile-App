import 'package:happening_app/models/account.dart';

final List<StudentAccount> dummyStudentAccounts = [
  StudentAccount(
    studentName: "John Doe",
    indexNumber: "12345",
    email: "john@example.com",
    password: "password1",
    isAdmin: true,
    imagePath: "path/to/image1",
  ),
  StudentAccount(
    studentName: "Jane Smith",
    indexNumber: "67890",
    email: "jane@example.com",
    password: "password2",
    isAdmin: false,
    imagePath: "path/to/image2",
  ),
  // Add more dummy objects as needed...
  StudentAccount(
    studentName: "Alice Johnson",
    indexNumber: "54321",
    email: "alice@example.com",
    password: "password3",
    isAdmin: true,
    imagePath: "path/to/image3",
  ),
  StudentAccount(
    studentName: "Bob Williams",
    indexNumber: "98765",
    email: "bob@example.com",
    password: "password4",
    isAdmin: false,
    imagePath: "path/to/image4",
  ),
];

StudentAccount currentAccount = dummyStudentAccounts[0];
