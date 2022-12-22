import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

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
        value: myProvider.dropValue,
        icon: const Icon(Icons.arrow_downward),
        //elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        
        onChanged: (String? value) {
          myProvider.toggleDropMenu(value!);
          //print(dropValue);
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
        value: myProvider.dropModeValue,
        icon: const Icon(Icons.arrow_downward),
        //elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        
        onChanged: (String? value) {
          myProvider.toggleDropMenuMode(value!);
          //print(dropValue);
        },
        items: [
          DropdownMenuItem(
            child: Text('Dark',),value:'Dark'),
            
          DropdownMenuItem(child: Text('Light'),value:'Light',),
        ]
      );
  }
}