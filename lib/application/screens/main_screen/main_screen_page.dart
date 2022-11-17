
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazraa/application/screens/main_screen/widgets/category_widget.dart';
import 'package:mazraa/theme_service.dart';
import 'package:provider/provider.dart';

import '../../../domin/entities/category_entity.dart';
import '../ads_screen/ads_screen_page.dart';
import '../items_per_category_screen/ads_per_category_screen.dart';
import 'bloc/main_bloc.dart';

class MainScreenWrapper extends StatelessWidget{
  const MainScreenWrapper({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MainScreenBloc(),
        child:  MainScreen(),
    );
  }
  
} 
class MainScreen extends StatelessWidget {
   MainScreen({Key? key}) : super(key: key);

 List<CategoryEntity> categories = [];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
      elevation: 0,
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
              categories = state.categories;
              return SingleChildScrollView(
                child: CategoryWidget(categories: categories,width:15,height: 15,),
              );
            } else if(state is MainScreenError){
              return Center(child: Text(state.error),);
            }
            return Center(

            );
          },

        ),
      ),
    );
  }
}
