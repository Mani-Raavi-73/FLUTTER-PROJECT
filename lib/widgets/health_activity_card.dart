import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HealthActivityCard extends StatelessWidget {
  final String lastCheckup;
  final String nextAppointment;
  final String currentStatus;

  const HealthActivityCard({
    super.key,
    this.lastCheckup = '10 November 2026',
    this.nextAppointment = '20 November 2026',
    this.currentStatus = 'Healthy',
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
          // Current Status Banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: AppTheme.statusGreenBg,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: AppTheme.statusGreenText.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.health_and_safety_rounded,
                    size: 18,
                    color: AppTheme.statusGreenText,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Current Status',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        currentStatus,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.statusGreenText,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.statusGreenText,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Optimal',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Last Checkup Row
          _buildActivityItem(
            context: context,
            icon: Icons.event_available_rounded,
            iconBgColor: const Color(0xFFE3F2FD),
            iconColor: AppTheme.primaryBlue,
            title: 'Last Checkup',
            date: lastCheckup,
            badgeLabel: 'Completed',
            badgeBgColor: const Color(0xFFF1F5F9),
            badgeTextColor: AppTheme.textSecondary,
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Divider(height: 1, color: AppTheme.borderColor),
          ),

          // Next Appointment Row
          _buildActivityItem(
            context: context,
            icon: Icons.calendar_month_rounded,
            iconBgColor: const Color(0xFFFFF3E0),
            iconColor: const Color(0xFFFB8C00),
            title: 'Next Appointment',
            date: nextAppointment,
            badgeLabel: 'Confirmed',
            badgeBgColor: const Color(0xFFFFF8E1),
            badgeTextColor: const Color(0xFFF57C00),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem({
    required BuildContext context,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String date,
    required String badgeLabel,
    required Color badgeBgColor,
    required Color badgeTextColor,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppTheme.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: badgeBgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            badgeLabel,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: badgeTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
