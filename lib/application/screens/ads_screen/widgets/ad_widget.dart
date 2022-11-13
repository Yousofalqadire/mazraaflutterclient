
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mazraa/constant_values.dart';

class AdWidget extends StatelessWidget {
   AdWidget({Key? key,required this.url,required this.onTap,required this.opacity}) : super(key: key);
   final String url;
   final Function onTap;
   bool opacity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap() ,
      child: Material(
        elevation: 25.0,
        borderRadius: BorderRadius.circular(20.0),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity:opacity?1:0.3,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height:MediaQuery.of(context).orientation == Orientation.portrait? 150:50,
            child: Image.network('${ConstantValues.path}$url',
            width:MediaQuery.of(context).orientation == Orientation.portrait?
            MediaQuery.of(context).size.width * 0.25: MediaQuery.of(context).size.width * 0.10,
            height:MediaQuery.of(context).orientation == Orientation.portrait?150:50 ,
            fit: BoxFit.cover,
              scale: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
