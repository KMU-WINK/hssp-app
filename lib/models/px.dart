class PX{
  final String id;
  final String name;
  final String thumbnail;

  PX({this.id, this.name, this.thumbnail});

  factory PX.fromJson(Map<String, dynamic> json){
    return PX(
      id: json['id'] as String,
      name: json['name'] as String,
      thumbnail: json['thumbnail'] as String,
    );
  }
}