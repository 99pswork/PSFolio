import 'package:flutter/material.dart';
import '../constants/colors.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy Policy',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'Effective Date',
              'December 27, 2024',
            ),
            _buildSection(
              'Introduction',
              'Welcome to PSFolio ("we," "our," or "us"). This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application. Please read this privacy policy carefully.',
            ),
            _buildSection(
              'Information We Collect',
              '''We may collect the following types of information:

• Personal Information: Name, email address, and any information you voluntarily provide through the contact form.

• Usage Data: Information about how you interact with our app, including pages visited and features used.

• Device Information: Device type, operating system, and unique device identifiers.''',
            ),
            _buildSection(
              'How We Use Your Information',
              '''We use the information we collect to:

• Respond to your inquiries and contact requests
• Improve and optimize our app experience
• Analyze usage patterns to enhance functionality
• Communicate with you about updates or changes''',
            ),
            _buildSection(
              'Information Sharing',
              '''We do not sell, trade, or rent your personal information to third parties. We may share information only in the following cases:

• With your consent
• To comply with legal obligations
• To protect our rights and safety''',
            ),
            _buildSection(
              'Data Security',
              'We implement appropriate security measures to protect your personal information. However, no method of transmission over the internet is 100% secure.',
            ),
            _buildSection(
              'Third-Party Links',
              'Our app may contain links to third-party websites (LinkedIn, Twitter, GitHub, portfolio project links). We are not responsible for the privacy practices of these external sites.',
            ),
            _buildSection(
              'Children\'s Privacy',
              'Our app is not intended for children under 13. We do not knowingly collect personal information from children under 13.',
            ),
            _buildSection(
              'Changes to This Policy',
              'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy in the app.',
            ),
            _buildSection(
              'Contact Us',
              'If you have questions about this Privacy Policy, please contact us at:\n\nEmail: 99ps.work@gmail.com',
            ),
            const SizedBox(height: 40),
            Center(
              child: Text(
                '© 2024 Pranjal Surana. All Rights Reserved.',
                style: TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
