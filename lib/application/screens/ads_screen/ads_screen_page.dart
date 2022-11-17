
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mazraa/application/screens/ads_screen/widgets/ad_widget.dart';
import 'package:mazraa/constant_values.dart';
import 'package:mazraa/domin/dtos/pagination_result.dart';
import 'package:mazraa/theme_service.dart';
import 'package:provider/provider.dart';

import '../../../domin/entities/ad_entity.dart';
import '../ad_details_screen/ad_deails_page.dart';
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
      appBar: AppBar(
        elevation: 0,
        title:const Text('جميع المزارع'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height:size.height ,
          decoration: BoxDecoration(
            //image: DecorationImage(image:AssetImage('assets/images/mazraa.jpg'),fit: BoxFit.cover),
            color:Provider.of<ThemeService>(context).isDarkMode? appTheme.appBarTheme.backgroundColor:  Color(0xFF689F38),
          ),

          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width:MediaQuery.of(context).size.width ,
                  height:MediaQuery.of(context).size.height * 0.30,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image:AssetImage('assets/images/mazraa.jpg'),fit: BoxFit.cover),
                  //  color:Provider.of<ThemeService>(context).isDarkMode? appTheme.appBarTheme.backgroundColor:  Color(0xFF689F38),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width:MediaQuery.of(context).size.width ,
                  height:MediaQuery.of(context).size.height * 0.70,
                   decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
                    color: Provider.of<ThemeService>(context).isDarkMode? appTheme.scaffoldBackgroundColor: Colors.white,
                   ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 25.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 500,
                          child: GridView.builder(
                            itemCount:ads.length,
                              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  crossAxisSpacing: 5.0
                              ),
                              itemBuilder: (context,index){
                                //TODO
                                return AdWidget(ad:ads[index],);
                              },
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: Padding(
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
                                          backgroundColor: appTheme.appBarTheme.backgroundColor,
                                          radius: 20,
                                          child: Text('${index + 1}'),)),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
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

