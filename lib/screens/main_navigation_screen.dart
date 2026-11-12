import 'package:flutter/material.dart';
import 'patient_profile_screen.dart';
import 'privacy_chat_screen.dart';
import '../theme/app_theme.dart';

class MainNavigationScreen extends StatefulWidget {
  final int initialIndex;

  const MainNavigationScreen({super.key, this.initialIndex = 0});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late int _currentIndex;

  final List<Widget> _screens = const [
    PatientProfileScreen(),
    PrivacyChatScreen(),
    ProjectDocsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        elevation: 8,
        indicatorColor: AppTheme.lightBlue,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.health_and_safety_outlined),
            selectedIcon: Icon(Icons.health_and_safety_rounded, color: AppTheme.primaryBlue),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.smart_toy_outlined),
            selectedIcon: Icon(Icons.smart_toy_rounded, color: AppTheme.primaryBlue),
            label: 'AI Bot',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book_rounded, color: AppTheme.primaryBlue),
            label: 'Docs',
          ),
        ],
      ),
    );
  }
}

class ProjectDocsScreen extends StatelessWidget {
  const ProjectDocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBackground,
      appBar: AppBar(
        title: const Text('Project Repository Documentation'),
        backgroundColor: AppTheme.scaffoldBackground,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildDocTile(
            context,
            title: 'ACCURACY_ENHANCEMENT_SUMMARY.md',
            subtitle: 'AI Accuracy Benchmark & Evaluation Metrics (93.4% accuracy)',
            icon: Icons.analytics_outlined,
          ),
          _buildDocTile(
            context,
            title: 'ENHANCED_DOCUMENT_HANDLING.md',
            subtitle: 'Multi-Format Text Extraction & Offline Parsing Architecture',
            icon: Icons.document_scanner_outlined,
          ),
          _buildDocTile(
            context,
            title: 'CLEANUP_SUMMARY.md',
            subtitle: 'Code Refactoring & Repository Cleanup Report',
            icon: Icons.cleaning_services_outlined,
          ),
          _buildDocTile(
            context,
            title: 'ENHANCED_ACCURACY_GUIDE.md',
            subtitle: 'Implementation guide for enhanced intent and entity scoring',
            icon: Icons.menu_book_outlined,
          ),
          _buildDocTile(
            context,
            title: 'SOURCE_TRANSPARENCY_ACCURACY.md',
            subtitle: 'Source attribution system for trustworthy medical & private data',
            icon: Icons.fact_check_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildDocTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppTheme.borderColor),
          ),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.lightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppTheme.primaryBlue, size: 22),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Document "$title" is available in project root.'),
                duration: const Duration(seconds: 2),
              ),
            );
          },
        ),
      ),
    );
  }
}
