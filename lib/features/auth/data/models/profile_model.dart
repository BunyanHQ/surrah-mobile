class ProfileModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String fullName;
  final String emailAddress;
  final String phoneNumber;
  final String? profileImage;
  final String theme;
  final String language;
  final bool notificationsEnabled;

  ProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.emailAddress,
    required this.phoneNumber,
    required this.profileImage,
    required this.theme,
    required this.language,
    required this.notificationsEnabled,
  });

  // Register
  ProfileModel.register({
    this.id,
    required this.lastName,
    required this.firstName,
    this.emailAddress = '',
    required this.phoneNumber,
    this.fullName = '',
    this.profileImage,
    this.theme = 'system',
    this.language = 'en',
    this.notificationsEnabled = true,
  });

  // Copy With
  ProfileModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? fullName,
    String? emailAddress,
    String? phoneNumber,
    String? profileImage,
    DateTime? birthday,
    String? theme,
    String? language,
    bool? notificationsEnabled,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      fullName: fullName ?? this.fullName,
      emailAddress: emailAddress ?? this.emailAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImage: profileImage ?? this.profileImage,
      theme: theme ?? this.theme,
      language: language ?? this.language,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }

  // From Json
  factory ProfileModel.fromJson({
    required String emailAddress,
    required Map<String, dynamic> json,
  }) {
    return ProfileModel(
      id: json['id'] as String,
      emailAddress: emailAddress,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      fullName: json['full_name'] as String,
      phoneNumber: json['phone_number'] as String,
      theme: json['theme'] as String? ?? 'system',
      language: json['language'] as String? ?? 'en',
      profileImage: json['profile_image'] as String?,
      notificationsEnabled: json['notifications_enabled'] as bool? ?? true,
    );
  }

  // To Json
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'full_name': fullName.isNotEmpty ? fullName : '$firstName $lastName',
      'phone_number': phoneNumber,
      'profile_image': profileImage,
      'theme': theme,
      'language': language,
      'notifications_enabled': notificationsEnabled,
    };
  }
}
