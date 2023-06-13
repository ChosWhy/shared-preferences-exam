class UserModel {
  String? name;
  late bool notification;
  late bool darkMode;
  late bool google;
  late bool facebook;

  UserModel(
      {this.name,
      this.notification = true,
      this.darkMode = false,
      this.google = false,
      this.facebook = false}); //default variables

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    notification = json['notification'];
    darkMode = json['darkMode'];
    google = json['google'];
    facebook = json['facebook'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['notification'] = notification;
    data['darkMode'] = darkMode;
    data['google'] = google;
    data['facebook'] = facebook;
    return data;
  }
}
