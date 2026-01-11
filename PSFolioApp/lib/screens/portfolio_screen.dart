import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../constants/data.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Section Title
          Center(
            child: Column(
              children: [
                const Text(
                  'Portfolio',
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

          // Portfolio Items
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: AppData.portfolio.length,
            itemBuilder: (context, index) {
              final project = AppData.portfolio[index];
              return _PortfolioCard(
                title: project['title']!,
                category: project['category']!,
                url: project['url']!,
                index: index,
                onTap: () => _launchUrl(project['url']!),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PortfolioCard extends StatelessWidget {
  final String title;
  final String category;
  final String url;
  final int index;
  final VoidCallback onTap;

  const _PortfolioCard({
    required this.title,
    required this.category,
    required this.url,
    required this.index,
    required this.onTap,
  });

  // Get color based on index
  Color _getCardColor() {
    final colors = [
      AppColors.serviceAI,
      AppColors.serviceDeFi,
      AppColors.serviceWeb,
      AppColors.serviceAutomation,
      AppColors.serviceAPI,
      AppColors.serviceConsultation,
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    final color = _getCardColor();

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                // Project Icon
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    _getProjectIcon(),
                    color: color,
                    size: 28,
                  ),
                ),

                const SizedBox(width: 16),

                // Project Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        category,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary.withOpacity(0.8),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                // Arrow Icon
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_outward,
                    color: color,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(delay: Duration(milliseconds: 50 * index)).slideX(
          begin: 0.1,
          end: 0,
          delay: Duration(milliseconds: 50 * index),
        );
  }

  IconData _getProjectIcon() {
    if (category.toLowerCase().contains('defi') ||
        category.toLowerCase().contains('smart contract') ||
        category.toLowerCase().contains('web3')) {
      return Icons.currency_bitcoin;
    } else if (category.toLowerCase().contains('ai')) {
      return Icons.psychology;
    } else if (category.toLowerCase().contains('backend') ||
        category.toLowerCase().contains('api')) {
      return Icons.dns;
    } else if (category.toLowerCase().contains('nft')) {
      return Icons.image;
    } else {
      return Icons.code;
    }
  }
}
