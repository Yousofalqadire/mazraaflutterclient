
import '../dtos/pagination_result.dart';

class AdEntity{
 final  int adId;
 final String title;
 final String category;
 final int price;
 final String mobile;
 final String alterMobile;
 final String email;
 final bool isApproved;
 final String coverImage;
 final String postedDate;
 final String address;
 final String floors;
 final String rooms;

  AdEntity(
      {
       required this.adId,
        required this.title,
        required this.category,
        required this.price,
        required this.mobile,
        required this.alterMobile,
        required this.email,
        required this.isApproved,
        required this.coverImage,
        required this.postedDate,
        required  this.address,
        required this.floors,
       required this.rooms,

      });

   factory AdEntity.fromJson(Map<dynamic,dynamic> json){
     return AdEntity(
         adId: json['adId'], title: json['title'], category: json['category'],
         price: json['price'], mobile: json['mobile'], alterMobile: json['alterMobile'],
         email: json['email'], isApproved: json['isApproved'], coverImage: json['coverImage'],
         postedDate: json['postedDate'], address: json['address'], floors: json['floors'],
         rooms: json['rooms']);
   }

}