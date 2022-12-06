import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mazraa/application/screens/rent_screen/bloc/rent_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../domin/entities/ad_entity.dart';
import '../../../../theme_service.dart';
import '../../sell_screen/widgets/sell_item.dart';

class LoadedRentScreen extends StatefulWidget {
   LoadedRentScreen( {Key? key,required this.rents}) : super(key: key);
  List<AdEntity> rents;
  @override
  State<LoadedRentScreen> createState() => _LoadedRentScreenState(rents: rents);
}

class _LoadedRentScreenState extends State<LoadedRentScreen> {
  _LoadedRentScreenState({required this.rents});
  List<AdEntity> rents;
  TextEditingController filter = TextEditingController();
  double value=1.0;
  RangeValues? _currentRangeValues ;
  @override
  void initState() {
    super.initState();
    rents.sort((a,b) => a.price.compareTo(b.price));
    _currentRangeValues = RangeValues(10, 40);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          child: Center(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:Provider.of<ThemeService>(context).isDarkMode?
                MaterialStateProperty.all(Theme.of(context).appBarTheme.backgroundColor):
                MaterialStateProperty.all(Color(0xFF47B47D)),
              ),
              onPressed: (){
                _showModalBottomSheet(context);
              },
              child:const  Center(child: Icon(Icons.search),),
            ),
          ),
        ),
        Expanded(
            child: AnimationLimiter(
          child: GridView.count(crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.4),
            padding:const EdgeInsets.all(16),
            children: List.generate(rents.length, (index){
              return AnimationConfiguration.staggeredGrid(
                duration: const Duration(milliseconds: 700),
                position: index, columnCount: 2,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: SellListItem(adEntity: rents[index],), // same the sell item we import it from sell folder
                  ),
                ),

              );
            }),
          ),

        ))
      ],
    );
  }
  void _showModalBottomSheet(BuildContext context){
    showBottomSheet(context: context,
        builder: (context) => DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.5,
            builder: (context,scrollController)=>Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text('حسب العنوان'),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: filter,
                        decoration: InputDecoration(
                            hintText: 'بحث',
                            border:const OutlineInputBorder(),
                            suffixIcon: IconButton(onPressed: (){
                              Provider.of<RentBloc>(context,listen: false).add(GetRentsByAddress(address: filter.text.toString(), rents: rents));
                            }, icon:const Icon(Icons.search))
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text('حسب السعر '),

                        StatefulBuilder(
                          builder: (context,state){
                            return  RangeSlider(
                              activeColor: Colors.green,
                              values: _currentRangeValues!,
                              min: 1,
                              max: 100,
                              divisions: 100,
                              labels: RangeLabels(
                                ((_currentRangeValues!.start * 2000)/100).round().toString(),
                                ((_currentRangeValues!.end * 2000)/100).round().toString(),
                              ),
                              onChanged: (RangeValues values) {
                                state(() {
                                  _currentRangeValues = values;
                                });
                              },
                            );
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 25),
                          child: IconButton(
                            color: Colors.green,
                            onPressed: (){
                              Provider.of<RentBloc>(context,listen: false)
                                  .add(GetRentsByPrice(rents: rents!,start: _currentRangeValues!.start,end: _currentRangeValues!.end));
                            },icon:Icon(Icons.search,color: Colors.green,),),)
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
