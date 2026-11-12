import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PatientInfoCard extends StatelessWidget {
  final String name;
  final String age;
  final String gender;
  final String patientId;
  final VoidCallback? onEdit;

  const PatientInfoCard({
    super.key,
    this.name = 'John Smith',
    this.age = '28 years',
    this.gender = 'Male',
    this.patientId = 'PT-10245',
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.borderColor),
        boxShadow: AppTheme.cardShadow,
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Circular Patient Profile Photo
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppTheme.primaryBlue.withValues(alpha: 0.35),
                        width: 2,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 34,
                      backgroundColor: AppTheme.lightBlue,
                      child: Icon(
                        Icons.person_rounded,
                        size: 42,
                        color: AppTheme.primaryBlue,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Color(0xFF10B981), // Active green
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),

              // Patient Details Arranged Vertically using Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Patient Name and Status
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.textPrimary,
                              letterSpacing: -0.3,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.verified_rounded,
                          size: 18,
                          color: AppTheme.primaryBlue,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),

                    // Age and Gender tags
                    Row(
                      children: [
                        _buildInfoTag(
                          icon: Icons.cake_outlined,
                          label: age,
                        ),
                        const SizedBox(width: 8),
                        _buildInfoTag(
                          icon: Icons.male_rounded,
                          label: gender,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Patient ID
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.scaffoldBackground,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: AppTheme.borderColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.badge_outlined,
                            size: 14,
                            color: AppTheme.textSecondary,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'ID: $patientId',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.textSecondary,
                              fontFamily: 'monospace',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Edit Profile Icon
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.scaffoldBackground,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.borderColor),
                ),
                child: IconButton(
                  icon: const Icon(Icons.edit_outlined),
                  iconSize: 20,
                  color: AppTheme.primaryBlue,
                  tooltip: 'Edit Profile',
                  onPressed: onEdit ??
                      () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Edit profile tapped'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTag({required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.scaffoldBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: AppTheme.textSecondary),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
