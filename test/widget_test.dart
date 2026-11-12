import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patient_health_profile/main.dart';
import 'package:patient_health_profile/widgets/doctor_info_card.dart';
import 'package:patient_health_profile/widgets/health_activity_card.dart';
import 'package:patient_health_profile/widgets/patient_info_card.dart';
import 'package:patient_health_profile/widgets/vital_card.dart';

void main() {
  testWidgets('Patient Health Profile Screen smoke and widget test',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const PatientHealthApp());
    await tester.pumpAndSettle();

    // 1. Verify App Bar
    expect(find.text('Patient Profile'), findsOneWidget);
    expect(find.byIcon(Icons.notifications_none_rounded), findsOneWidget);

    // 2. Verify Reusable Widget Types are present
    expect(find.byType(PatientInfoCard), findsOneWidget);
    expect(find.byType(VitalCard), findsNWidgets(4));
    expect(find.byType(DoctorInfoCard), findsOneWidget);
    expect(find.byType(HealthActivityCard), findsOneWidget);

    // 3. Verify Patient Information Details
    expect(find.text('John Smith'), findsOneWidget);
    expect(find.text('28 years'), findsOneWidget);
    expect(find.text('Male'), findsOneWidget);
    expect(find.text('ID: PT-10245'), findsOneWidget);
    expect(find.byIcon(Icons.edit_outlined), findsOneWidget);

    // 4. Verify Health Vitals Section
    expect(find.text('Health Vitals'), findsOneWidget);
    expect(find.text('Heart Rate'), findsOneWidget);
    expect(find.text('72'), findsOneWidget);
    expect(find.text('bpm'), findsOneWidget);

    expect(find.text('Blood Pressure'), findsOneWidget);
    expect(find.text('120/80'), findsOneWidget);
    expect(find.text('mmHg'), findsOneWidget);

    expect(find.text('Temperature'), findsOneWidget);
    expect(find.text('36.8'), findsOneWidget);
    expect(find.text('°C'), findsOneWidget);

    expect(find.text('Oxygen Level'), findsOneWidget);
    expect(find.text('98'), findsOneWidget);
    expect(find.text('%'), findsOneWidget);

    // 5. Verify Assigned Doctor Section
    expect(find.text('Assigned Doctor'), findsOneWidget);
    expect(find.text('Dr. Sarah Johnson'), findsOneWidget);
    expect(find.text('Cardiologist'), findsOneWidget);
    expect(find.textContaining('10 years'), findsOneWidget);
    expect(find.text('City Care Hospital'), findsOneWidget);
    expect(find.text('Call'), findsOneWidget);
    expect(find.text('Message'), findsOneWidget);

    // 6. Verify Recent Health Activity Section
    expect(find.text('Recent Health Activity'), findsOneWidget);
    expect(find.text('10 November 2026'), findsOneWidget);
    expect(find.text('20 November 2026'), findsOneWidget);
    expect(find.text('Healthy'), findsWidgets);

    // 7. Verify Interactions
    await tester.tap(find.text('Call'));
    await tester.pump();
    expect(find.textContaining('Calling Dr. Sarah Johnson'), findsOneWidget);
  });

  testWidgets('Navigation and Privacy AI Assistant screen test',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const PatientHealthApp());
    await tester.pumpAndSettle();

    // Switch to Privacy AI Bot tab
    await tester.tap(find.text('AI Bot'));
    await tester.pumpAndSettle();

    expect(find.text('Privacy AI Assistant'), findsOneWidget);
    expect(find.textContaining('100% On-Device Processing'), findsOneWidget);

    // Switch to Docs tab
    await tester.tap(find.text('Docs'));
    await tester.pumpAndSettle();

    expect(find.text('Project Repository Documentation'), findsOneWidget);
    expect(find.text('ACCURACY_ENHANCEMENT_SUMMARY.md'), findsOneWidget);
    expect(find.text('ENHANCED_DOCUMENT_HANDLING.md'), findsOneWidget);
  });
}
