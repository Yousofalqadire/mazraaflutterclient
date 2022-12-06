
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mazraa/domin/entities/ad_entity.dart';

import '../../../../constant_values.dart';
import '../../ad_details_screen/ad_deails_page.dart';

class AdPerCategoryItem extends StatelessWidget {
  const AdPerCategoryItem({Key? key,required this.adEntity}) : super(key: key);
  final AdEntity adEntity;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> AdDetailScreenWrapper(adId: adEntity.adId ,)));
      },
      child: Container(
        height: size.height / 3,
           margin:const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white
          ),

        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(adEntity.title,style: Theme.of(context).textTheme.headline5,),
            Image.network('${ConstantValues.path}${adEntity.coverImage}',
              width: size.width,
              height: 200,
              fit: BoxFit.fill,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(adEntity.floors),
                    Text('عدد الغرف'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(adEntity.mobile),
                    Text('الموبايل')
                  ],
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${adEntity.price} JD',textAlign: TextAlign.center,
                 style: Theme.of(context).textTheme.headline4?.merge(TextStyle(
                   color: Colors.lightGreen

                 )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_pin,color: Colors.lightGreen,),
                        Text(adEntity.address)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
