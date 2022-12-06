
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:http/http.dart' as http;
import 'package:mazraa/application/screens/ads_screen/widgets/ad_widget.dart';
import 'package:mazraa/constant_values.dart';
import 'package:mazraa/domin/dtos/pagination_result.dart';
import 'package:mazraa/theme_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../domin/entities/ad_entity.dart';
import '../ad_details_screen/ad_deails_page.dart';
import '../sell_screen/widgets/sell_item.dart';
class AdsScreen extends StatefulWidget {
  const AdsScreen({Key? key}) : super(key: key);

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  List<AdEntity> ads = [];
  PaginationResult? paginationResult;
  @override
  void initState() {
    super.initState();
    getAllAds();

  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Theme.of(context);
    return Scaffold(

      body: Column(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: 120,
              color:Provider.of<ThemeService>(context).isDarkMode? Theme.of(context).appBarTheme.backgroundColor: Color(0xFF47B47D),
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/images/m_Ico.png',width: 90,height: 90,)
                ),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: AnimationLimiter(
            child: GridView.count(crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.4),
              padding:const EdgeInsets.all(16),
              children: List.generate(ads.length, (index){
                return AnimationConfiguration.staggeredGrid(
                  duration: const Duration(milliseconds: 700),
                  position: index, columnCount: 2,
                  child: ScaleAnimation(
                    child: FadeInAnimation(
                      child: SellListItem(adEntity: ads[index],), // same the sell item we import it from sell folder
                    ),
                  ),

                );
              }),
            ),

          )),
          Expanded(
              flex: 1,
              child:ClipPath(
                clipper: WaveClipperOne(reverse: true),
                child: Container(
                  height: size.height,
                  color: Provider.of<ThemeService>(context).isDarkMode?Theme.of(context).appBarTheme.backgroundColor:
                  Color(0xFF47B47D),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100.0),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: paginationResult?.totalPages,
                        itemBuilder: (context,index){
                          return Center(
                            child: TextButton(
                                onPressed: (){
                                  getAdsPerPage(index +1);
                                },
                                child: CircleAvatar(
                                  backgroundColor: Color(0xFFE8CB00),
                                  radius: 20,
                                  child: Text('${index + 1}'),)),
                          );
                        }),
                  ),
                ),
              ),

          ),
        ],
      ),

    );
  }
  Future getAllAds() async{
    ads = [];
    final response = await http.get(
      Uri.parse('${ConstantValues.baseUrl}ads/get-all-ads'),
    );
    if(response.statusCode == 200){
      var jsonBody = jsonDecode(response.body);
      final pagination = jsonDecode(response.headers['pagination'] as String);
      for(Map ad in jsonBody){
        ads.add(AdEntity.fromJson(ad));
      }
      paginationResult = PaginationResult(
          pagination['currentPage'],
          pagination['itemsPerPage'],
          pagination['totalItems'],
          pagination['totalPages']
      );
      setState(() {

      });
    }
  }
  Future getAdsPerPage(int pageNumber)async{
    ads = [];
    final response = await http.get(
      Uri.parse('${ConstantValues.baseUrl}ads/get-all-ads?PageNumber=$pageNumber&PageSize=5')
    );
    if(response.statusCode == 200){
      var jsonBody = jsonDecode(response.body);
      for(Map ad in jsonBody){
        ads.add(AdEntity.fromJson(ad));
      }
      setState(() {

      });
    }
  }

}

