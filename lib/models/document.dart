class Document {
  final String id;
  final String name;
  final String content;
  final DateTime uploadedAt;
  final int? sizeBytes;
  final String? filePath;

  Document({
    required this.id,
    required this.name,
    required this.content,
    DateTime? uploadedAt,
    this.sizeBytes,
    this.filePath,
  }) : uploadedAt = uploadedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'content': content,
        'uploadedAt': uploadedAt.toIso8601String(),
        'sizeBytes': sizeBytes,
        'filePath': filePath,
      };

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        id: json['id'] as String? ?? '',
        name: json['name'] as String? ?? 'Untitled',
        content: json['content'] as String? ?? '',
        uploadedAt: json['uploadedAt'] != null
            ? DateTime.parse(json['uploadedAt'] as String)
            : DateTime.now(),
        sizeBytes: json['sizeBytes'] as int?,
        filePath: json['filePath'] as String?,
      );
}

