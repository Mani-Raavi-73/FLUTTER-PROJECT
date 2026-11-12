class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final String? sourceDocument;
  final double? confidence;

  ChatMessage({
    required this.text,
    required this.isUser,
    DateTime? timestamp,
    this.sourceDocument,
    this.confidence,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'text': text,
        'isUser': isUser,
        'timestamp': timestamp.toIso8601String(),
        'sourceDocument': sourceDocument,
        'confidence': confidence,
      };

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        text: json['text'] as String,
        isUser: json['isUser'] as bool,
        timestamp: DateTime.parse(json['timestamp'] as String),
        sourceDocument: json['sourceDocument'] as String?,
        confidence: (json['confidence'] as num?)?.toDouble(),
      );
}

