class AuthModel {
  String accessToken;
  String refreshToken;

  AuthModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );
}
