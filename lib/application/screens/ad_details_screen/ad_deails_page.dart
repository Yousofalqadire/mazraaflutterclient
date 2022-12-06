
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazraa/application/screens/ad_details_screen/widgets/ad_details_widget.dart';
import 'package:mazraa/application/screens/ad_details_screen/widgets/carousel_slider_images.dart';
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
            return Column(
              children: [
                Expanded(
                  flex: 2,
                  child: CarouselImagesSlider(imageSliders: state.detailsEntity.images!,),),
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF47B47D),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(state.detailsEntity.discription,textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                ),),
                Expanded(

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AdDetailsWidget(adDetailsEntity: state.detailsEntity,),
                  ),)
              ],
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
