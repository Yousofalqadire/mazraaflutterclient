
import 'package:mazraa/domin/entities/ad_entity.dart';
import 'package:mazraa/domin/entities/photo_entity.dart';

class AdDetailsEntity{
  final  int adId;
  final String title;
  final String category;
  final int price;
  final String mobile;
  final String alterMobile;
  final String email;
  final bool isApproved;
  final String postedDate;
  final String address;
  final String floors;
  final String rooms;
   List<AdImage>? images;
    AdDetailsEntity(
       {
         required this.adId,
         required this.title,
         required this.category,
         required this.price,
         required this.mobile,
         required  this.alterMobile,
         required this.email,
         required this.isApproved,
         required this.postedDate,
         required this.address,
         required this.floors,
         required this.rooms,
  });
  factory AdDetailsEntity.fromJson(Map<dynamic,dynamic> json){
    return AdDetailsEntity(adId: json['adId'], title: json['title'], category: json['category'],
        price: json['price'], mobile: json['mobile'], alterMobile: json['alterMobile'],
        email: json['email'], isApproved: json['isApproved'],
        postedDate: json['postedDate'], address: json['address'],
        floors: json['floors'], rooms: json['rooms']);
  }
}