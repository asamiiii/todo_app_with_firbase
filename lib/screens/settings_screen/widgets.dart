import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_with_firbase/local/cashe_helper.dart';

import '../../provider/appProvider.dart';

class DropLangMenu extends StatelessWidget {
  const DropLangMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<AppProvider>(context);
    return DropdownButton<String>(
            isDense: true,
            isExpanded: true,
            focusColor:Colors.transparent ,
        value: myProvider.isArabic==true ? 'Arabic' : 'English' ,
        icon: const Icon(Icons.arrow_downward),
        //elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        
        onChanged: (String? value) {
          myProvider.toggleDropMenu(value!);
          myProvider.changeLanguage(value);
          CasheHelper.putIsLangaugeValue('langauge', myProvider.isArabic!);
        },
        items: [
          DropdownMenuItem(
            child: Text('English',),value:'English'),
            
          DropdownMenuItem(child: Text('Arabic'),value:'Arabic',),
        ]
      );
  }
}

class DropMenuMode extends StatelessWidget {
  const DropMenuMode({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<AppProvider>(context);
    return DropdownButton<String>(
            isDense: true,
            isExpanded: true,
            focusColor:Colors.transparent,
        value: myProvider.isDark! ? 'Dark':'Light',
        icon: const Icon(Icons.arrow_downward),
        //elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        
        onChanged: (String? value) {
          myProvider.toggleDropMenuMode(value!);
          myProvider.chooseMode(value);
          CasheHelper.putIsDarkValue('isDark', myProvider.isDark!);
        },
        items: [
          DropdownMenuItem(
            child: Text('Dark',),value:'Dark'),
            
          DropdownMenuItem(child: Text('Light'),value:'Light',),
        ]
      );
  }
}