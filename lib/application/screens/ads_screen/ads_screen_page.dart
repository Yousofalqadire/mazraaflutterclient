
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mazraa/application/screens/ads_screen/widgets/ad_widget.dart';
import 'package:mazraa/constant_values.dart';
import 'package:mazraa/domin/dtos/pagination_result.dart';

import '../../../domin/entities/ad_entity.dart';
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
    final appTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title:const Text('جميع الاعلانات'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height:MediaQuery.of(context).orientation == Orientation.portrait?
              MediaQuery.of(context).size.height * 0.70:MediaQuery.of(context).size.height * 0.50,
              child: GridView.builder(
                padding: MediaQuery.of(context).orientation == Orientation.landscape? EdgeInsets.all(50.0):EdgeInsets.all(5.0),
                itemCount: ads.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      crossAxisCount:MediaQuery.of(context).orientation == Orientation.portrait? 2:3),
                  itemBuilder: (context,index){
                    return AdWidget(url:ads[index].coverImage ,onTap: (){},);
                  })
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
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
          ],
        ),
      )
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

