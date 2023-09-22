import 'dart:ui';
import 'package:flutter/material.dart';

class GlassButton extends StatelessWidget {
  const GlassButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(64),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            // Background Blur effect
            _buildBackgroundBlurEffect(),

            // Glass Container with Gradient and Label
            _buildGlassContainer(),
          ],
        ),
      ),
    );
  }

  // Function to create the background blur effect
  Widget _buildBackgroundBlurEffect() {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5,
        sigmaY: 5,
      ),
      child: Container(),
    );
  }

  // Function to create the glass container with gradient and label
  Widget _buildGlassContainer() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(64.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Colors.white.withOpacity(0.4),
            Colors.white.withOpacity(0.1),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white, // Customize text color
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
