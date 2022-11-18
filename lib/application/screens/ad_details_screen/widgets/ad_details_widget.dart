
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mazraa/domin/entities/ad_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

class AdDetailsWidget extends StatefulWidget {
   AdDetailsWidget({Key? key,required this.adDetailsEntity,}) : super(key: key);
  final AdDetailsEntity adDetailsEntity;

  @override
  State<AdDetailsWidget> createState() => _AdDetailsWidgetState(adDetailsEntity: adDetailsEntity,
      );
}

class _AdDetailsWidgetState extends State<AdDetailsWidget> {
  final AdDetailsEntity adDetailsEntity;
   double _width = 5.0;
   double _height = 5.0;
  _AdDetailsWidgetState({required this.adDetailsEntity,});
  @override
  void initState() {
    super.initState();
    createAnimation();
  }
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Material(
        elevation: 25.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //TODO
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOutBack,
                  width: _width,
                  height: _height,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
                      color: appTheme.appBarTheme.backgroundColor
                    ),
                    child: IconButton(

                        onPressed: (){}, icon: Icon(Icons.location_pin)),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOutBack,
                  width: _width,
                  height: _height,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
                      color: appTheme.appBarTheme.backgroundColor
                    ),
                    child: IconButton(

                        onPressed: () async{
                          final Uri  phone= Uri.parse('tel:${adDetailsEntity.mobile}');
                          await urlLauncher.launchUrl(phone);

                        }, icon: Icon(Icons.phone)),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOutBack,
                  width: _width,
                  height: _height,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
                      color:appTheme.appBarTheme.backgroundColor
                    ),
                    child: IconButton(

                        onPressed: (){
                          final Uri email = Uri.parse('mailto:${adDetailsEntity.email}');
                          urlLauncher.launchUrl(email);
                        }, icon: Icon(Icons.email)),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
 Future createAnimation()async{
    await Future.delayed(Duration(milliseconds: 500),(){
      _width += 50;
      _height += 50;
      setState(() {
      });
    });

  }
}
