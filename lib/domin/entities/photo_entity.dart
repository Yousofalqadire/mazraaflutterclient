
class AdImage{
  final int id;
  final String imageURL;
  final int adId;
  AdImage({required this.id,required this.imageURL,required this.adId});

  factory AdImage.fromJson(Map<dynamic,dynamic> json){
    return AdImage(id: json['id'], imageURL: json['imageURL'], adId: json['adId']);
  }
}