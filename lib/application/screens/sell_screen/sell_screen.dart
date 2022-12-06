

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mazraa/application/screens/sell_screen/widgets/loaded_sells_inner_screen.dart';
import 'package:mazraa/application/screens/sell_screen/widgets/sell_item.dart';
import 'package:provider/provider.dart';

import 'bloc/sell_bloc.dart';

class SellScreenWrapper extends StatelessWidget {
  const SellScreenWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SellBloc(),
      child:  SellScreen(),
    );
  }
}


class SellScreen extends StatelessWidget {
   SellScreen({Key? key}) : super(key: key);
 TextEditingController filter = TextEditingController();
  double value = 3.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SellBloc,SellState>(
        builder: (context,state){
          if(state is SellInitial){
            Provider.of<SellBloc>(context,listen: false).add(GetSellsEvent());
          }else if(state is SellsLoadingState){
            return const Center(
              child: CircularProgressIndicator(color: Colors.green,),
            );
          } else if(state is SellLoadedState){
            return SellsInnerScreen(sells: state.sells,);
          }else if(state is SellErrorState){
            return Center(child: Text(state.error),);
          }
          return Center();
        },
      ),
    );

  }
  void _showModalBottomSheet(BuildContext context){
    showBottomSheet(context: context,
        builder: (context) => DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.4,
            builder: (context,scrollController)=>Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const Expanded(
                      child: Center(
                        child: Text('تصفية'),
                      ),
                    ),
                  Expanded(
                    child: TextField(
                    controller: filter,
                    decoration:const InputDecoration(
                      hintText: 'بحث',
                      border: OutlineInputBorder(),

                    ),
                    ),
                  ),
                  Expanded(
                      child:StatefulBuilder(
                        builder: (context,state){
                          return  Slider(
                            activeColor: Colors.green,
                            min: 1.0,
                            max: 10.0,
                            value: 8.0, onChanged: (double _value) {
                              state((){
                                value = _value;
                                print(_value);
                              });

                          }
                          );
                        },
                      ),
                  )
                  ],
                ),
              ),
        )));
  }
}
