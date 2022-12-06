

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domin/entities/category_entity.dart';
import '../ads_screen/ads_screen_page.dart';
import '../items_per_category_screen/ads_per_category_screen.dart';
import '../populars_screen/popular_screen.dart';
import '../rent_screen/rent_screen.dart';
import '../sell_screen/sell_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.categories}) : super(key: key);
  final List<CategoryEntity> categories;
  @override
  State<HomeScreen> createState() => _HomeScreenState(categories: categories);
}

class _HomeScreenState extends State<HomeScreen>  {
  _HomeScreenState({required this.categories});
  final List<CategoryEntity> categories;
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return  DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('mazare3.com'),
          backgroundColor: appTheme.appBarTheme.backgroundColor,
          elevation: 0,
          bottom:const TabBar(
            tabs: [
              Tab(icon: Text('الأشهر',),),
              Tab(icon: Text('بيع',),),
              Tab(icon: Text('ايجار',),),
              Tab(icon: Text('كل المزارع',),),
            ],
          ),
        ),
        body:const TabBarView(
          children: [
            PopularScreen(),
            SellScreenWrapper(),
            RentScreenWrapper(),
            AdsScreen()
          ],
        ),
      ),
    );
  }
}
