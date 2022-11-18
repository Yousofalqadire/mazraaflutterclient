
import 'package:flutter/cupertino.dart';

import '../../../../domin/entities/ad_entity.dart';
import 'ad_per_category_list_item.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AdPErCategoryList extends StatelessWidget {
  const AdPErCategoryList({Key? key,required this.ads}) : super(key: key);
  final List<AdEntity> ads;
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
          child: GridView.count(crossAxisCount: 1,
          children:List.generate(ads.length, (index){
            return AnimationConfiguration.staggeredGrid(
               duration: const Duration(milliseconds: 700),
                position: index,
                columnCount: 2,
                child: ScaleAnimation(
                    child: FadeInAnimation(
                        child: AdPerCategoryItem(adEntity: ads[index],))));
          }),
          ),
    );
  }
}
