
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mazraa/constant_values.dart';

import '../../../../domin/entities/photo_entity.dart';
class CarouselImagesSlider extends StatelessWidget {
  const CarouselImagesSlider({Key? key,required this.imageSliders}) : super(key: key);
  final List<AdImage> imageSliders;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.5,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            autoPlay: true,
            viewportFraction: 0.7,
          ),
          items: imageSliders.map((e) => Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
            ),
            padding: EdgeInsets.all(10),
           // alignment: Alignment.center,
            child: Image.network('${ConstantValues.path}/uploads/uploads${e.imageURL}',fit: BoxFit.cover,),
          )).toList(),
        ));
  }
}
