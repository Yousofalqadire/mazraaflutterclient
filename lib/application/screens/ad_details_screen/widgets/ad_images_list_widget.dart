
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constant_values.dart';
import '../../../../domin/entities/photo_entity.dart';

class AdImages extends StatefulWidget {
  const AdImages({Key? key,required this.images}) : super(key: key);
 final List<AdImage> images;
  @override
  State<AdImages> createState() => _AdImagesState(images: images);
}

class _AdImagesState extends State<AdImages> {
  _AdImagesState({required this.images});

  List<AdImage> images;
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Positioned(
      top:0.0,
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: size.height * 0.80,
          child: Container(
            width: size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context,index){
                  return Card(
                    elevation: 15.0,
                    shadowColor: Colors.black54,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(10.0),
                      child: Image.network('${ConstantValues.path}/uploads/uploads${images[index].imageURL}',
                        fit: BoxFit.cover,
                        width: size.width,
                        height: size.height,
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
