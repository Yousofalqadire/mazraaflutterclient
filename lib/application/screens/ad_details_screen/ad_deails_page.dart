
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazraa/application/screens/ad_details_screen/widgets/ad_details_widget.dart';
import 'package:mazraa/application/screens/ad_details_screen/widgets/ad_images_list_widget.dart';
import 'package:mazraa/constant_values.dart';
import 'package:provider/provider.dart';

import '../../../theme_service.dart';
import 'bloc/ad_details_bloc.dart';

class AdDetailScreenWrapper extends StatelessWidget {
  final int adId;
  const AdDetailScreenWrapper({Key? key,required this.adId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdDetailsBloc(),
      child:AdDetailsScreen(adId: adId,),
    );
  }
}

class AdDetailsScreen extends StatelessWidget {
  const AdDetailsScreen({Key? key,required this.adId}) : super(key: key);
 final int adId;
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('$adId'),
        ),
      body: BlocBuilder<AdDetailsBloc,AdDetailsState>(
        builder: (context,state){
          if(state is AdDetailsInitial){
            Provider.of<AdDetailsBloc>(context,listen: false).add(GetAdDetailsEvent(adId: adId));
          }else if(state is AdDetailsLoadingState){
            return Center(
              child: CircularProgressIndicator(color:appTheme.appBarTheme.backgroundColor ,strokeWidth: 4.0,),
            );
          }else if(state is AdDetailsLoadedState){
            return Container(
              width: size.width ,
              height: size.height,

              child: Stack(
                children: [
                  AdImages(images: state.detailsEntity.images!,),
                  Positioned(
                      top: 210,
                      child:  Container(
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:const [
                            Icon(Icons.arrow_back),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      )),
                  Align(
                  alignment: Alignment.bottomCenter,
                    child: Container(
                      width: size.width ,
                      height: size.height * 0.20,
                      decoration:const BoxDecoration(
                        borderRadius: BorderRadius.only(topRight:Radius.circular(20.0),topLeft: Radius.circular(20.0)),

                      ),
                       child: AdDetailsWidget(adDetailsEntity: state.detailsEntity,),
                    ),
              ),
                ],
              ),
            );
          }else if(state is AdDetailsErrorsState){
            return Center(
              child: Text(state.error),
            );
          }
          return Center();
        },
      ),
    );
  }
}
