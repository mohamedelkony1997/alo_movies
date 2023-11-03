class trainingSeries {
  String ? id;
  String? image;

  String? name;
  String? coachName;

  trainingSeries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['seriesName'];
    image = json['image'];
    coachName = json['coachesNames'];
  }
}
