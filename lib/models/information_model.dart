class InformationModel {
  final String title, thumb, id;

  InformationModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
