import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app_with_firbase/screens/settings_screen/widgets.dart';


class SettingsScreen extends StatelessWidget {
  //const SettingsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40,vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context).language,style:Theme.of(context).textTheme.headline2,),
          SizedBox(height: 20,),
          DropLangMenu(),
          SizedBox(height: 20,),
          Text(AppLocalizations.of(context).mode,style:Theme.of(context).textTheme.headline2),
          SizedBox(height: 20,),
          DropMenuMode(),
      
        ],
       
      ),
    );
  }
}