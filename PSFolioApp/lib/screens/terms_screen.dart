import 'package:flutter/material.dart';
import '../constants/colors.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Terms of Service',
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
              'Acceptance of Terms',
              'By accessing and using the PSFolio mobile application ("App"), you accept and agree to be bound by the terms and provisions of this agreement. If you do not agree to these terms, please do not use our App.',
            ),
            _buildSection(
              'Description of Service',
              'PSFolio is a personal portfolio application showcasing the professional work, skills, and services of Pranjal Surana. The App provides information about development services, past projects, client testimonials, and contact information.',
            ),
            _buildSection(
              'Use of the App',
              '''You agree to use the App only for lawful purposes and in a way that does not infringe the rights of, restrict, or inhibit anyone else\'s use of the App. You agree not to:

• Use the App in any way that violates applicable laws
• Attempt to gain unauthorized access to our systems
• Transmit any malware, viruses, or harmful code
• Collect or harvest any information from the App
• Use automated systems to access the App''',
            ),
            _buildSection(
              'Intellectual Property',
              'All content in this App, including but not limited to text, graphics, logos, images, and software, is the property of Pranjal Surana and is protected by intellectual property laws. You may not reproduce, distribute, or create derivative works without prior written permission.',
            ),
            _buildSection(
              'External Links',
              'The App contains links to external websites and projects. These links are provided for convenience and informational purposes only. We are not responsible for the content, accuracy, or practices of any third-party websites.',
            ),
            _buildSection(
              'Contact Form',
              'When you use the contact form, you agree to provide accurate information. Any messages sent through the App may be used to respond to your inquiries. We are not obligated to respond to all messages.',
            ),
            _buildSection(
              'Disclaimer',
              '''THE APP IS PROVIDED "AS IS" WITHOUT WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED. WE DO NOT GUARANTEE THAT:

• The App will be available at all times
• The App will be error-free or virus-free
• The information in the App is complete or accurate
• Any defects will be corrected''',
            ),
            _buildSection(
              'Limitation of Liability',
              'In no event shall Pranjal Surana be liable for any indirect, incidental, special, consequential, or punitive damages arising from your use of or inability to use the App.',
            ),
            _buildSection(
              'Changes to Terms',
              'We reserve the right to modify these Terms of Service at any time. Changes will be effective immediately upon posting in the App. Your continued use of the App constitutes acceptance of the modified terms.',
            ),
            _buildSection(
              'Governing Law',
              'These Terms shall be governed by and construed in accordance with the laws of India, without regard to its conflict of law provisions.',
            ),
            _buildSection(
              'Contact Information',
              'For any questions regarding these Terms of Service, please contact:\n\nEmail: 99ps.work@gmail.com\nLocation: Jaipur, Rajasthan, India',
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
