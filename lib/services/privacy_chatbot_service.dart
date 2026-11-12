import 'dart:math';
import '../models/document.dart';
import '../models/personal_data.dart';

class ChatResponse {
  final String text;
  final String? sourceDocument;
  final double confidence;

  ChatResponse({
    required this.text,
    this.sourceDocument,
    this.confidence = 0.95,
  });
}

/// 100% Offline, Privacy-Preserving AI Service
class PrivacyChatbotService {
  final List<Document> _documents = [];
  late PersonalData _personalData;

  PrivacyChatbotService() {
    _initializeDefaultData();
  }

  void _initializeDefaultData() {
    _personalData = PersonalData(
      name: 'John Smith',
      email: 'john.smith@medmail.com',
      phone: '+1-555-0124',
      address: '742 Evergreen Terrace, Springfield',
      dateOfBirth: '1998-05-14',
      occupation: 'Software Engineer',
      preferences: {
        'preferredDoctor': 'Dr. Sarah Johnson',
        'bloodType': 'O+',
        'language': 'English',
      },
      interests: ['Cardiology Health', 'Running', 'Tech', 'Nutrition'],
    );

    // Built-in offline health and privacy documents
    _documents.addAll([
      Document(
        id: 'doc-1',
        name: 'Patient_Health_Record.txt',
        content: '''
Patient Name: John Smith
Age: 28 years | Gender: Male | Patient ID: PT-10245
Assigned Doctor: Dr. Sarah Johnson (Cardiologist, City Care Hospital)
Latest Vitals (Updated 10 Nov 2026):
- Heart Rate: 72 bpm (Normal resting rate)
- Blood Pressure: 120/80 mmHg (Optimal cardiovascular reading)
- Body Temperature: 36.8 °C (Normal core body temperature)
- Oxygen Saturation (SpO2): 98% (Healthy arterial oxygen level)
Recent Activity:
- Last Routine Checkup: 10 November 2026 (Completed, all vitals stable)
- Next Follow-up Appointment: 20 November 2026 at City Care Hospital
Status: Healthy. No acute issues detected.
''',
      ),
      Document(
        id: 'doc-2',
        name: 'Privacy_Preserving_Architecture.md',
        content: '''
Privacy-Preserving Offline Chatbot Architecture:
- 100% on-device processing with zero network transmission.
- Local TF-IDF search and n-gram keyword vectorization.
- Personal data stored strictly in local memory and sandbox storage.
- Source transparency: Every factual answer references its source document.
- Zero analytics, telemetry, or third-party cloud dependencies.
''',
      ),
      Document(
        id: 'doc-3',
        name: 'Cardiology_Care_Guidelines.txt',
        content: '''
Cardiovascular Health Best Practices:
1. Maintain resting heart rate between 60-100 bpm.
2. Blood pressure should be monitored regularly; 120/80 mmHg is ideal.
3. Oxygen levels above 95% indicate proper respiratory and lung function.
4. Regular follow-ups with Dr. Sarah Johnson ensure optimal cardiovascular management.
''',
      ),
    ]);
  }

  List<Document> get loadedDocuments => List.unmodifiable(_documents);
  PersonalData get personalData => _personalData;

  void addDocument(String name, String content) {
    _documents.add(
      Document(
        id: 'doc-${DateTime.now().millisecondsSinceEpoch}',
        name: name,
        content: content,
        sizeBytes: content.length,
      ),
    );
  }

  Future<ChatResponse> processQuery(String query) async {
    final queryLower = query.toLowerCase().trim();

    // 1. Greetings
    if (_matches(queryLower, ['hello', 'hi', 'hey', 'good morning', 'greetings', 'howdy'])) {
      return ChatResponse(
        text: '👋 Hello! I am your 100% offline, privacy-preserving AI assistant. '
            'All your health records and personal data remain strictly on this device. '
            'How can I help you today?',
        confidence: 0.98,
      );
    }

    // 2. Farewells
    if (_matches(queryLower, ['bye', 'goodbye', 'see you', 'farewell', 'good night'])) {
      return ChatResponse(
        text: 'Take care! Feel free to ask whenever you need information about your health profile or documents.',
        confidence: 0.96,
      );
    }

    // 3. Help / Capabilities
    if (_matches(queryLower, ['help', 'what can you do', 'features', 'capabilities', 'who are you'])) {
      return ChatResponse(
        text: '🔒 **Privacy AI Assistant Capabilities:**\n\n'
            '• **Personal Profile Queries**: Ask for your name, email, phone, age, doctor, or ID.\n'
            '• **Health Vitals Queries**: Inquire about heart rate, blood pressure, temperature, or oxygen level.\n'
            '• **Document Search**: Search across local offline records (e.g. "search for blood pressure").\n'
            '• **100% Offline Security**: No data is ever sent to external cloud servers.',
        confidence: 0.95,
      );
    }

    // 4. Personal Data Queries
    if (queryLower.contains('name')) {
      return ChatResponse(
        text: 'Your registered patient name is **${_personalData.name}**.',
        sourceDocument: 'Patient_Health_Record.txt',
        confidence: 0.99,
      );
    }

    if (queryLower.contains('email')) {
      return ChatResponse(
        text: 'Your email address is **${_personalData.email}**.',
        confidence: 0.99,
      );
    }

    if (queryLower.contains('phone') || queryLower.contains('contact')) {
      return ChatResponse(
        text: 'Your contact number is **${_personalData.phone}**.',
        confidence: 0.99,
      );
    }

    if (queryLower.contains('doctor') || queryLower.contains('cardiologist')) {
      return ChatResponse(
        text: 'Your assigned doctor is **Dr. Sarah Johnson**, Cardiologist at City Care Hospital (10 years experience).',
        sourceDocument: 'Patient_Health_Record.txt',
        confidence: 0.98,
      );
    }

    if (queryLower.contains('heart rate') || queryLower.contains('pulse') || queryLower.contains('bpm')) {
      return ChatResponse(
        text: 'Your latest recorded **Heart Rate** is **72 bpm**, which is within the normal healthy resting range.',
        sourceDocument: 'Patient_Health_Record.txt',
        confidence: 0.98,
      );
    }

    if (queryLower.contains('blood pressure') || queryLower.contains('bp')) {
      return ChatResponse(
        text: 'Your latest recorded **Blood Pressure** is **120/80 mmHg** (Optimal condition).',
        sourceDocument: 'Patient_Health_Record.txt',
        confidence: 0.98,
      );
    }

    if (queryLower.contains('temperature') || queryLower.contains('temp')) {
      return ChatResponse(
        text: 'Your recorded **Body Temperature** is **36.8 °C**, which is normal.',
        sourceDocument: 'Patient_Health_Record.txt',
        confidence: 0.98,
      );
    }

    if (queryLower.contains('oxygen') || queryLower.contains('spo2')) {
      return ChatResponse(
        text: 'Your recorded **Oxygen Level** is **98%** (Optimal saturation).',
        sourceDocument: 'Patient_Health_Record.txt',
        confidence: 0.98,
      );
    }

    if (queryLower.contains('appointment') || queryLower.contains('checkup') || queryLower.contains('next visit')) {
      return ChatResponse(
        text: '• **Last Checkup**: 10 November 2026 (Completed)\n'
            '• **Next Appointment**: 20 November 2026 at City Care Hospital with Dr. Sarah Johnson.\n'
            '• **Current Status**: Healthy',
        sourceDocument: 'Patient_Health_Record.txt',
        confidence: 0.97,
      );
    }

    // 5. Document Semantic / Keyword Search
    final docMatch = _searchDocuments(queryLower);
    if (docMatch != null) {
      return docMatch;
    }

    // 6. Fallback response
    return ChatResponse(
      text: 'I could not find an exact match for "$query" in your offline records. '
          'You can ask about:\n'
          '- "What are my vitals?"\n'
          '- "Who is my assigned doctor?"\n'
          '- "When is my next appointment?"\n'
          '- "Show my profile details"',
      confidence: 0.65,
    );
  }

  bool _matches(String query, List<String> triggers) {
    for (final trigger in triggers) {
      if (query == trigger || query.startsWith('$trigger ') || query.endsWith(' $trigger')) {
        return true;
      }
    }
    return false;
  }

  ChatResponse? _searchDocuments(String query) {
    final searchTerms = query
        .replaceAll(RegExp(r'[^\w\s]'), '')
        .split(' ')
        .where((word) => word.length > 2 && !_stopWords.contains(word))
        .toList();

    if (searchTerms.isEmpty) return null;

    Document? bestDoc;
    String bestSnippet = '';
    int maxHits = 0;

    for (final doc in _documents) {
      final lines = doc.content.split('\n');
      for (final line in lines) {
        int hits = 0;
        final lineLower = line.toLowerCase();
        for (final term in searchTerms) {
          if (lineLower.contains(term)) {
            hits++;
          }
        }
        if (hits > maxHits) {
          maxHits = hits;
          bestDoc = doc;
          bestSnippet = line.trim();
        }
      }
    }

    if (bestDoc != null && maxHits > 0) {
      final score = min(0.95, 0.75 + (maxHits * 0.08));
      return ChatResponse(
        text: 'Found relevant information in **${bestDoc.name}**:\n\n> "$bestSnippet"',
        sourceDocument: bestDoc.name,
        confidence: score,
      );
    }

    return null;
  }

  static const Set<String> _stopWords = {
    'the', 'is', 'at', 'which', 'on', 'a', 'an', 'and', 'or', 'for', 'with', 'in', 'of', 'to', 'what', 'show', 'tell', 'me', 'my'
  };
}
