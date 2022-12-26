import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_with_firbase/app_theme/app_theme.dart';
import 'package:todo_app_with_firbase/provider/appProvider.dart';
import 'package:todo_app_with_firbase/screens/settings_screen/widgets.dart';


class SettingsScreen extends StatelessWidget {
  //const SettingsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<AppProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40,vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Language',style:Theme.of(context).textTheme.headline2,),
          SizedBox(height: 20,),
          DropLangMenu(),
          SizedBox(height: 20,),
          Text('Mode',style:Theme.of(context).textTheme.headline2),
          SizedBox(height: 20,),
          DropMenuMode(),
      
        ],
       
      ),
    );
  }
}