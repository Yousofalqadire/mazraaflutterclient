
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mazraa/application/screens/items_per_category_screen/bloc/adpercategory_bloc.dart';
import 'package:mazraa/constant_values.dart';
import 'package:mazraa/domin/entities/ad_entity.dart';
import 'package:mazraa/theme_service.dart';
import 'package:provider/provider.dart';

import '../../ad_details_screen/ad_deails_page.dart';

class AdWidget extends StatelessWidget {
 const  AdWidget({Key? key,required this.ad,}) : super(key: key);
   final AdEntity ad;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Theme.of(context);
    return Container(
       margin: EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 25.0,
        borderRadius: BorderRadius.circular(20.0),
        child: Column(
          children: [
            Text(ad.category == "Rent"?'ايجار':'بيع',style: TextStyle(
              color:  appTheme.appBarTheme.backgroundColor,
            ),),
            Container(
              child: Image.network('${ConstantValues.path}${ad.coverImage}',
              width: size.width * 0.50,
              height: size.height * 0.10,
              fit: BoxFit.cover,
                scale: 2.0,
              ),
            ),
            Text('${ad.title}'),
            Text('${ad.postedDate}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('عدد الغرف'),
               Text('${ad.rooms}')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('العنوان'),
                Text('${ad.address}')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('السعر'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${ad.price}',style:TextStyle(
                       color: Provider.of<ThemeService>(context).isDarkMode?
                       Colors.green: appTheme.appBarTheme.backgroundColor,
                    ),),
                    Icon(Icons.attach_money_rounded, color: Provider.of<ThemeService>(context).isDarkMode?
                    Colors.green: appTheme.appBarTheme.backgroundColor,)
                  ],
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AdDetailScreenWrapper( adId: ad.adId,)));
                  },
                  child: Center(
                    child: Icon(Icons.add_card_sharp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
