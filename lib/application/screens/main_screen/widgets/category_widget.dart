
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mazraa/theme_service.dart';
import 'package:provider/provider.dart';

import '../../../../domin/entities/category_entity.dart';
import '../../ads_screen/ads_screen_page.dart';
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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Provider.of<ThemeService>(context).isDarkMode? appTheme.appBarTheme.backgroundColor:  Color(0xFF689F38),
            ),
          ),
          Positioned(
            top: 25.0,
            right: 50.0,
            left: 50.0,
            child: Center(
              child: Column(
                children: [
                 // Image.asset('assets/images/homepage.jpeg'),
                  Text('المزرعة', style: Theme.of(context).textTheme.headlineMedium,),
                  Text('هي بوابتك للعثور على عروض متخصصة للفلل والمزارع للإيجار أو البيع',style: Theme.of(context).textTheme.titleLarge,
                    textDirection: TextDirection.rtl,),
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
              color: Provider.of<ThemeService>(context).isDarkMode? appTheme.scaffoldBackgroundColor: Colors.white,
            ),
             child: Center(
               child: Column(
                 children: [
                   SizedBox(
                     height: MediaQuery.of(context).size.height * 0.15,
                     child: Center(
                       child: Text('اختر ما تبحث عنه',style: Theme.of(context).textTheme.headline4,),

                     ),
                   ),
                   SizedBox(
                     height:MediaQuery.of(context).size.height * 0.25 ,
                     child: Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: Center(
                         child: ListView.builder(
                           scrollDirection: Axis.horizontal,
                             itemCount: widget.categories.length,
                             itemBuilder: (context,index){
                           return InkWell(
                             onTap: (){
                               Navigator.push(context, MaterialPageRoute(
                                   builder: (context)=> AdsPerCategoryWrapper(category:categories[index],)));
                             },
                             child: Padding(
                               padding: EdgeInsets.symmetric(horizontal: 10.0),
                               child: AnimatedContainer(
                                 padding: EdgeInsets.all(25.0),
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(20.0),
                                   color: index / 2 == 0 ? Colors.green : Colors.amber,
                                 ),
                                 margin: EdgeInsets.symmetric(horizontal: 5.0),
                                   width: width,
                                   height: height,
                                   duration:const Duration(seconds: 2),
                                 curve: Curves.easeInOutBack,
                                 child: Center(
                                   child: Text('${categories[index].categoryName}',
                                    style: Theme.of(context).textTheme.headline6?.merge(TextStyle(
                                      color:Provider.of<ThemeService>(context).isDarkMode? Colors.white:Colors.black
                                    )),
                                   ),
                                 ),

                               ),
                             ),
                           );
                         }),
                       ),
                     ),
                   ),
                   Container(
                     width: MediaQuery.of(context).size.width,
                     alignment: Alignment.bottomCenter,
                     height: 150.0,
                     child: ListTile(
                       leading: Icon(Icons.cabin,color: Colors.lightGreen),
                       title: Text('يالله نشوف كل المزارع...',
                         textAlign: TextAlign.center,
                         textDirection: TextDirection.rtl
                         ,style: Theme.of(context).textTheme.bodySmall,),
                       trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.lightGreen,),
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) =>  const AdsScreen()));
                       },
                     ),
                   ),
                 ],
               ),
             ),
          ),
          ),
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
