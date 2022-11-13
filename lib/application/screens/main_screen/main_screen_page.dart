
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazraa/theme_service.dart';
import 'package:provider/provider.dart';

import '../ads_screen/ads_screen_page.dart';
import '../items_per_category_screen/ads_per_category_screen.dart';
import 'bloc/main_bloc.dart';

class MainScreenWrapper extends StatelessWidget{
  const MainScreenWrapper({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MainScreenBloc(),
        child: const MainScreen(),
    );
  }
  
} 
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('اتصل بنا',style: Theme.of(context).textTheme.bodySmall,),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            )
          ],
        ),
      ),
      appBar: AppBar(

        title: const Text('الصفحة الرئيسية'),
        actions: [
          Switch(value: Provider.of<ThemeService>(context).isDarkMode, onChanged: (_){
            Provider.of<ThemeService>(context,listen: false).toggleTheme();
          })
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<MainScreenBloc,MainScreenState>(
          builder: (context,state){
            if(state is MainScreenInitial){
              Provider.of<MainScreenBloc>(context,listen: false).add(GetCategoryEvent());
              return Center(
                child: Text('getting data'),
              );
            }
            if(state is MainScreenLoading){
              return  Center(
                child: CircularProgressIndicator(
                  color: appTheme.primaryColor,
                ),
              );
            }else if(state is MainScreenLoaded){
              return SingleChildScrollView(
                child: Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 15.0),
                   child: Column(
                     children: [
                       SizedBox(
                         height: MediaQuery.of(context).size.height * 0.15,
                         child: Container(
                             alignment: Alignment.center,
                             child: Text('المزرعة',style: Theme.of(context).textTheme.headline2?.merge(
                                 TextStyle(
                                   color:Provider.of<ThemeService>(context).isDarkMode? Colors.white: appTheme.appBarTheme.backgroundColor,
                                   fontWeight: FontWeight.w500
                                 )),)),
                       ),
                       SizedBox(
                         height: MediaQuery.of(context).size.height * 0.15,
                         child: Container(
                           child: Center(
                             child: Text('...عن ماذا تبحث ',
                             style: Theme.of(context).textTheme.headline4?.merge(
                               TextStyle(
                                 color:Provider.of<ThemeService>(context).isDarkMode? Colors.white:
                                 appTheme.colorScheme.onSecondary
                               ),
                             ),
                             ),
                           ),
                         ),
                       ),
                       SizedBox(
                         height: MediaQuery.of(context).size.height * 0.35,
                         child: ListView.builder(
                           scrollDirection: Axis.horizontal,
                             itemBuilder: (context,index){
                           return Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(25.0),
                             ),
                             margin: EdgeInsets.all(5.0),
                             child: InkWell(
                               onTap: (){
                                 Navigator.push(context, MaterialPageRoute(
                                     builder: (context)=> AdsPerCategoryWrapper(category: state.categories[index],)));
                               },
                               child: Material(
                                 elevation: 15.0,
                                 shadowColor: Colors.black54,

                                 child: Container(
                                   color: appTheme.appBarTheme.backgroundColor,
                                   width: MediaQuery.of(context).size.width * 0.45,
                                   height: 100,
                                   padding: const EdgeInsets.all(25.0),
                                   child: Center(
                                     child: Column(

                                       children: [
                                         CircleAvatar(
                                             child: Image.asset('assets/images/category.png',
                                             fit: BoxFit.fill,
                                             ),
                                           radius: 50.0,
                                         ),
                                         Text(state.categories[index].categoryName,
                                          style: Theme.of(context).textTheme.headline4?.merge(
                                              const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold
                                          )),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                           );
                         },
                           itemCount: state.categories.length,
                           padding:const EdgeInsets.all(25.0),

                         ),
                       ),
                     ],
                   ),

                ),
              );
            }else if(state is MainScreenError){
              return Center(child: Text(state.error),);
            }
            return Center(

            );
          },

        ),
      ),

      bottomNavigationBar: IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const AdsScreen()));
      },
          icon: const Icon(Icons.featured_play_list_outlined)),
    );
  }
}
