class InformationModel {
  final String name, location, time, description, category, imgUrl;
  final List tags;
  final bool isVideo;
  final int likes;
  final double likeRatio;

  InformationModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        location = json['location'],
        time = json['time'],
        tags = json['tags'],
        description = json['description'],
        category = json['category'],
        isVideo = json['isVideo'],
        likes = json['likes'],
        likeRatio = json['like_ratio'],
        imgUrl = json['img_url'];
}
