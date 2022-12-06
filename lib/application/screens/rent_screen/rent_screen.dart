
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazraa/application/screens/rent_screen/bloc/rent_bloc.dart';
import 'package:mazraa/application/screens/rent_screen/widgets/loaded_rent_screen.dart';
import 'package:mazraa/application/screens/sell_screen/bloc/sell_bloc.dart';
import 'package:provider/provider.dart';

class RentScreenWrapper extends StatelessWidget {
  const RentScreenWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RentBloc(),
      child:const RentScreen(),
    );
  }
}


class RentScreen extends StatelessWidget {
  const RentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RentBloc,RentState>(
        builder: (context,state){
          if(state is RentInitial){
            Provider.of<RentBloc>(context,listen: false).add(GetRentsEvent());
          }else if(state is RentLoadingState){
            return const Center(
              child: CircularProgressIndicator(color: Colors.green,),
            );
          }else if(state is RentLoadedState){
            return Center(
               child: LoadedRentScreen(rents: state.rents,),
            );
          }else if(state is RentErrorState){
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
