import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const Color primary = Color(0xFF0078FF);
  static const Color primaryDark = Color(0xFF0056B3);

  // Background colors
  static const Color background = Color(0xFF0A0A0A);
  static const Color surface = Color(0xFF1A1A1A);
  static const Color cardBackground = Color(0xFF1E1E1E);

  // Text colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFA0A0A0);
  static const Color textMuted = Color(0xFF707070);

  // Accent colors for service cards
  static const Color serviceWeb = Color(0xFFFFADAD);
  static const Color serviceAI = Color(0xFF9BF6FF);
  static const Color serviceAutomation = Color(0xFFFDFFB6);
  static const Color serviceAPI = Color(0xFFCAFFBF);
  static const Color serviceDeFi = Color(0xFFFFC6FF);
  static const Color serviceConsultation = Color(0xFFFFD6A5);

  // Stats section
  static const Color statsBackground = Color(0xFFFFC107);

  // Contact section
  static const Color contactBackground = Color(0xFFF8BBD0);

  // Testimonial
  static const Color testimonialBackground = Color(0xFFFFA000);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF0078FF), Color(0xFF00D4FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
