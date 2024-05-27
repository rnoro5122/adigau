class InformationModel {
  final String name, location, time, description, imgUrl;
  final List tags, category;
  final bool isVideo;
  final double like;

  InformationModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        location = json['location'],
        time = json['time'],
        tags = json['tags'],
        description = json['description'],
        category = json['category'],
        isVideo = json['isVideo'],
        like = json['like'],
        imgUrl = json['img_url'];
}
