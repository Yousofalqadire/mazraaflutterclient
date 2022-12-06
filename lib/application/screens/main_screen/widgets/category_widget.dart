/// this screen has been changed
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:mazraa/theme_service.dart';
import 'package:provider/provider.dart';

import '../../../../domin/entities/category_entity.dart';
import '../../ads_screen/ads_screen_page.dart';
import '../../home_screen/home_screen.dart';
import '../../items_per_category_screen/ads_per_category_screen.dart';

class CategoryWidget extends StatefulWidget {
   CategoryWidget({Key? key,required this.categories,required this.width,required this.height}) : super(key: key);
  List<CategoryEntity> categories;
   double width;
   double height;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState(categories: categories,width: width,height: height);
}

class _CategoryWidgetState extends State<CategoryWidget> {
  _CategoryWidgetState({ required this.categories, required this.height,required this.width});
  final List<CategoryEntity> categories;
  double width ;
  double height;

  @override
  void initState() {
    super.initState();
    createAnim();
  }
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20)),
              ),
              child:  Container(
                height: 200,
                decoration: BoxDecoration(
                 // borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  gradient: LinearGradient(
                    colors:Provider.of<ThemeService>(context).isDarkMode?[
                      Colors.blueGrey.shade400,
                      Colors.blueGrey.shade700
                    ]: [
                      Color(0xFFE8CB00),
                      Color(0xFF47B47D),

                    ],
                    begin: Alignment.bottomCenter
                  )
                ),
                child: Center(child: Image.asset('assets/images/m_Ico.png',
                  width: size.width *0.50,
                  height: size.height * 0.50,
                ),
                ),
              ),
            ),
          ),
          Expanded(child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
            ),
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
             child: Container(

               child: Column(
                 children: [
                   Text('مرحبا بكم في ',style: appTheme.textTheme.headline4,),
                   Text('Mazare3.com',style: appTheme.textTheme.headline4,),
                   Text('دعونا نجد الأفضل لراحتك تطبيق مزارع بوابتك للعثور على أفضل عروض الفيلا و المزارع و الشاليهات للايجار و الشراء',
                    style: appTheme.textTheme.titleLarge,
                     textAlign: TextAlign.center,
                   ),
                   ElevatedButton(
                       style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.all(appTheme.appBarTheme.backgroundColor),
                         shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                         padding: MaterialStateProperty.all(EdgeInsets.all(15))
                       ),
                       onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(categories:categories,)));
                       }, child: Center(
                     child: Icon(Icons.arrow_forward),
                   ))
                 ],
               ),
             ),
            ),
          ))
        ],
      ),
    );
  }
 Future createAnim() async{
    await   Future.delayed(Duration(microseconds: 500),(){
      width += 130;
      height += 50;
      setState(() {

      });
    });
 }
}
