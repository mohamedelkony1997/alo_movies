class OverView {
  String? id;
  String? image;
  int? runTime;
  String? name;
  String? coachName;
  String? intensity;
  String? difficulty;
  String? coachDesc;
  String? imageprofile;
  String? video;

  OverView.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['seriesName'];
    image = json['image'];
    runTime = json['runTime'];
    coachDesc = json['coachDesc'];
    video = json['video'];
    imageprofile = json['imageprofile'];
    difficulty = json['difficulty'];
    intensity = json['intensity'];
    coachName = json['coachesNames'];
  }
}
