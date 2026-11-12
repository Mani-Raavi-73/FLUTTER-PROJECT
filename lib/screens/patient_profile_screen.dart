import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/doctor_info_card.dart';
import '../widgets/health_activity_card.dart';
import '../widgets/patient_info_card.dart';
import '../widgets/section_header.dart';
import '../widgets/vital_card.dart';

class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.scaffoldBackground,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 16,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Center(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.borderColor),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 16,
                  color: AppTheme.textPrimary,
                ),
                tooltip: 'Back',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Back navigation pressed'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        title: const Text(
          'Patient Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
            letterSpacing: -0.3,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Stack(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppTheme.borderColor),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.notifications_none_rounded,
                        color: AppTheme.textPrimary,
                        size: 20,
                      ),
                      tooltip: 'Notifications',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('No new notifications'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEF4444),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: ConstrainedBox(
              // Constrain max width for great responsiveness on web, tablet & desktop
              constraints: const BoxConstraints(maxWidth: 640),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section B: Patient Information Card
                    const PatientInfoCard(
                      name: 'John Smith',
                      age: '28 years',
                      gender: 'Male',
                      patientId: 'PT-10245',
                    ),

                    const SizedBox(height: 24),

                    // Section C: Health Vitals
                    const SectionHeader(
                      title: 'Health Vitals',
                      subtitle: 'Updated today at 09:45 AM',
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.sync_rounded,
                            size: 15,
                            color: AppTheme.primaryBlue,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Live Sync',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.primaryBlue,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Two-Column Grid Arranged using Row and Column widgets
                    const Column(
                      children: [
                        // First Row: Heart Rate & Blood Pressure
                        Row(
                          children: [
                            Expanded(
                              child: VitalCard(
                                title: 'Heart Rate',
                                value: '72',
                                unit: 'bpm',
                                icon: Icons.favorite_rounded,
                                backgroundColor: AppTheme.heartRateBg,
                                accentColor: AppTheme.heartRateAccent,
                                status: 'Normal',
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: VitalCard(
                                title: 'Blood Pressure',
                                value: '120/80',
                                unit: 'mmHg',
                                icon: Icons.speed_rounded,
                                backgroundColor: AppTheme.bloodPressureBg,
                                accentColor: AppTheme.bloodPressureAccent,
                                status: 'Optimal',
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 12),

                        // Second Row: Temperature & Oxygen Level
                        Row(
                          children: [
                            Expanded(
                              child: VitalCard(
                                title: 'Temperature',
                                value: '36.8',
                                unit: '°C',
                                icon: Icons.thermostat_rounded,
                                backgroundColor: AppTheme.temperatureBg,
                                accentColor: AppTheme.temperatureAccent,
                                status: 'Normal',
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: VitalCard(
                                title: 'Oxygen Level',
                                value: '98',
                                unit: '%',
                                icon: Icons.air_rounded,
                                backgroundColor: AppTheme.oxygenBg,
                                accentColor: AppTheme.oxygenAccent,
                                status: 'Healthy',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Section D: Assigned Doctor
                    const SectionHeader(
                      title: 'Assigned Doctor',
                      subtitle: 'Primary Care Physician',
                    ),

                    const SizedBox(height: 12),

                    const DoctorInfoCard(
                      name: 'Dr. Sarah Johnson',
                      specialization: 'Cardiologist',
                      experience: '10 years',
                      hospital: 'City Care Hospital',
                    ),

                    const SizedBox(height: 24),

                    // Section E: Additional Information
                    const SectionHeader(
                      title: 'Recent Health Activity',
                      subtitle: 'History & Scheduled visits',
                    ),

                    const SizedBox(height: 12),

                    const HealthActivityCard(
                      lastCheckup: '10 November 2026',
                      nextAppointment: '20 November 2026',
                      currentStatus: 'Healthy',
                    ),

                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
