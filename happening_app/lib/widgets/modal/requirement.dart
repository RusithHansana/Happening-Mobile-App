import 'package:flutter/material.dart';

// A widget to display a single requirement item
class RequirementItem extends StatelessWidget {
  const RequirementItem({
    super.key,
    required this.requirement,
  });

  final String requirement;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8,
      ),
      child: Row(
        children: <Widget>[
          // Checkmark icon to indicate a requirement
          const Icon(
            Icons.check_circle_outline,
            size: 24.0,
            color: Colors.white,
          ),
          const SizedBox(width: 6.0), // Add spacing between icon and text
          Flexible(
            child: Text(
              requirement, // Display the requirement text
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
