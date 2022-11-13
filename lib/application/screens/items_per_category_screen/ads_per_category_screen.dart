
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../domin/entities/category_entity.dart';
import 'bloc/adpercategory_bloc.dart';

class AdsPerCategoryWrapper extends StatelessWidget {
  const AdsPerCategoryWrapper({Key? key,required this.category}) : super(key: key);
  final CategoryEntity category;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdPerCategoryBloc(),
      child:AdPerCategoryScreen(category: category,) ,
    );
  }
}


class AdPerCategoryScreen extends StatelessWidget {
  const AdPerCategoryScreen({Key? key,required this.category}) : super(key: key);
 final CategoryEntity category;
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(category.categoryName),
      ),
      body: BlocBuilder<AdPerCategoryBloc,AdPerCategoryState>(
        builder: (context,state){
          if(state is AdPercCategoryInitial){
            Provider.of<AdPerCategoryBloc>(context,listen: false).add(GetAdsPerCategoryEvent(category: category.categoryName));
          }else if (state is AdsPerCategoryLoadingState){
            return Center(child: CircularProgressIndicator(color:appTheme.appBarTheme.backgroundColor ,),);
          }else if (state is AdsPerCategoryLoadedState){
            return Center(child: Text(state.ads[0].address),);
          }else if(state is AdsPerCategoryErrorState){
            return Center(child: Text(state.error),);
          }
          return Placeholder();
        },
      ),
    );
  }
}
