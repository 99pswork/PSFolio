import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/colors.dart';
import '../constants/data.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  Color _getServiceColor(String colorName) {
    switch (colorName) {
      case 'serviceWeb':
        return AppColors.serviceWeb;
      case 'serviceAI':
        return AppColors.serviceAI;
      case 'serviceAutomation':
        return AppColors.serviceAutomation;
      case 'serviceAPI':
        return AppColors.serviceAPI;
      case 'serviceDeFi':
        return AppColors.serviceDeFi;
      case 'serviceConsultation':
        return AppColors.serviceConsultation;
      default:
        return AppColors.primary;
    }
  }

  IconData _getServiceIcon(String iconName) {
    switch (iconName) {
      case 'briefcase':
        return Icons.work;
      case 'brain':
        return Icons.psychology;
      case 'cogs':
        return Icons.settings;
      case 'plug':
        return Icons.api;
      case 'coins':
        return Icons.currency_bitcoin;
      case 'comments':
        return Icons.forum;
      default:
        return Icons.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Center(
            child: Column(
              children: [
                const Text(
                  'Services',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn().slideY(begin: -0.2, end: 0),

          const SizedBox(height: 30),

          // Services Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.95,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: AppData.services.length,
            itemBuilder: (context, index) {
              final service = AppData.services[index];
              final color = _getServiceColor(service['color'] as String);
              final icon = _getServiceIcon(service['icon'] as String);

              return _ServiceCard(
                title: service['title'] as String,
                icon: icon,
                color: color,
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final int index;

  const _ServiceCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.4),
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 28,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: Duration(milliseconds: 100 * index)).scale(
          begin: const Offset(0.8, 0.8),
          end: const Offset(1, 1),
          delay: Duration(milliseconds: 100 * index),
        );
  }
}
