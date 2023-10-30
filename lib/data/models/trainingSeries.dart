class trainingSeries {
  String ? id;
  String? image;

  String? name;
  String? desc;

  trainingSeries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    desc = json['description'];
  }
}
