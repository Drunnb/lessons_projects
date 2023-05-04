class UserModel {
  final String? userName;
  final String? url;
  final String? images;

  UserModel({
    this.userName,
    this.url,
    this.images,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['username'],
      images: json['images']?['jpg']?['image_url'],
      url: json['url'],
    );
  }
}
