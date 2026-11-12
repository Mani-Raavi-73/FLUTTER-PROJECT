class PersonalData {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String dateOfBirth;
  final String occupation;
  final Map<String, dynamic> preferences;
  final List<String> interests;

  PersonalData({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.dateOfBirth,
    required this.occupation,
    required this.preferences,
    required this.interests,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
        'dateOfBirth': dateOfBirth,
        'occupation': occupation,
        'preferences': preferences,
        'interests': interests,
      };

  factory PersonalData.fromJson(Map<String, dynamic> json) => PersonalData(
        name: json['name'] as String? ?? 'John Smith',
        email: json['email'] as String? ?? 'john.smith@example.com',
        phone: json['phone'] as String? ?? '+1-555-0123',
        address: json['address'] as String? ?? '123 Health Ave, City Care Hospital Area',
        dateOfBirth: json['dateOfBirth'] as String? ?? '1998-05-14',
        occupation: json['occupation'] as String? ?? 'Software Engineer',
        preferences: Map<String, dynamic>.from(json['preferences'] as Map? ?? {}),
        interests: List<String>.from(json['interests'] as List? ?? ['Fitness', 'Reading', 'Coding']),
      );
}

