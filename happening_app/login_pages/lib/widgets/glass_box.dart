import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBox extends StatelessWidget {
  const GlassBox({super.key, required this.child, required this.borderRadius});

  final Widget child;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: SizedBox(
          width: double.infinity, // Take up all available width
          child: Stack(
            children: [
              // blur effect
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2,
                  sigmaY: 2,
                ),
                child: Container(),
              ),

              // gradient effect
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color(0xFFEFEFEF).withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(borderRadius),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      const Color(0xFFEFEFEF).withOpacity(0.4),
                      const Color(0xFFEFEFEF).withOpacity(0.1),
                    ],
                  ),
                ),
              ),

              //child
              Center(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
