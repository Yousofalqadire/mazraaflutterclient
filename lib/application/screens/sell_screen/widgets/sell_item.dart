

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mazraa/constant_values.dart';
import 'package:mazraa/domin/entities/ad_entity.dart';
import 'package:mazraa/theme_service.dart';
import 'package:provider/provider.dart';

import '../../ad_details_screen/ad_deails_page.dart';

class SellListItem extends StatelessWidget {
  const SellListItem({Key? key,required this.adEntity}) : super(key: key);
 final AdEntity adEntity;
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Material(
      elevation: 10,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10),),
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding:const EdgeInsets.all(6),
         decoration: BoxDecoration(
           color: Provider.of<ThemeService>(context).isDarkMode?Theme.of(context).appBarTheme.backgroundColor:
               Colors.white
         ),
        child: Column(
          children: [
            Expanded(
              child: Image.network('${ConstantValues.path}${adEntity.coverImage}',
                fit: BoxFit.cover,
              ),
            ),
            Text(adEntity.title),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('${adEntity.price}JD'),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color(0xFF47B47D)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> AdDetailScreenWrapper( adId: adEntity.adId,)));

                    },
                    child: const Icon(Icons.add,color: Colors.white,)),

              ],
            )
          ],
        ),
       ),
    );
  }
}
