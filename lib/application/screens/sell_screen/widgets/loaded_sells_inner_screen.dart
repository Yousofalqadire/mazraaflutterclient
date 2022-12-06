
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mazraa/application/screens/sell_screen/bloc/sell_bloc.dart';
import 'package:mazraa/application/screens/sell_screen/widgets/sell_item.dart';
import 'package:provider/provider.dart';

import '../../../../domin/entities/ad_entity.dart';
import '../../../../theme_service.dart';

class SellsInnerScreen extends StatefulWidget {
   SellsInnerScreen({Key? key,required this.sells}) : super(key: key);
  List<AdEntity> sells;
  @override
  State<SellsInnerScreen> createState() => _SellsInnerScreenState(sells: sells);
}

class _SellsInnerScreenState extends State<SellsInnerScreen> {
  _SellsInnerScreenState({required this.sells});
  List<AdEntity> sells = [];
  TextEditingController filter = TextEditingController();
  double value=1.0;
  RangeValues? _currentRangeValues ;

  @override
  void initState() {
    super.initState();
    sells.sort((a,b) => a.price.compareTo(b.price));
    _currentRangeValues = RangeValues(sells.first.price.toDouble(), sells.first.price.toDouble());
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
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
        Expanded(
          child: AnimationLimiter(
            child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.4),
              padding:const EdgeInsets.all(16),
              children:List.generate(sells.length, (index){
                return AnimationConfiguration.staggeredGrid(
                    duration:const Duration(milliseconds: 700),
                    position: index, columnCount: 2,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: SellListItem(adEntity: sells[index],),
                      ),
                    ),
                );
              }),
            ),
          ),
        ),
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
                            Provider.of<SellBloc>(context,listen: false).add(SearchEvent(keyWord: filter.text.toString(), sells: sells));
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
                              max: sells.last.price.toDouble(),
                              divisions: 100,
                                labels: RangeLabels(
                                  ((_currentRangeValues!.start/1000000)*100).round().toString(),
                                  ((_currentRangeValues!.end/1000000)*100).round().toString(),
                                ),
                              onChanged: (RangeValues values) {
                                state(() {
                                  _currentRangeValues = values;
                                  print('${_currentRangeValues!.start.toString()} : ${_currentRangeValues!.end.toString()}');
                                });
                              },
                            );
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 25),
                        child: IconButton(
                          color: Colors.green,
                          onPressed: (){
                            Provider.of<SellBloc>(context,listen: false)
                                .add(FilterSellsPriceEvent(sells: sells!,start: _currentRangeValues!.start,end: _currentRangeValues!.end));
                          },icon:Icon(Icons.search,color: Colors.green,),),)
                      ],
                    )
                  ],
                ),
              ),
            )));
  }

}
