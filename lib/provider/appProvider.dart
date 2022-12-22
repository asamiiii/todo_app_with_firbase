import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier{
  DateTime selectedDatee =DateTime.now();
  DateTime onDateChange =DateTime.now(); 
  int currentIndex = 0;
  String dropValue = 'English';
  String dropModeValue = 'Dark';

  toggleNavBar(int index){
     currentIndex = index;
     notifyListeners();
  }

    toggleDropMenu(String value){
     dropValue = value;
     notifyListeners();
  }
  toggleDropMenuMode(String value){
     dropModeValue = value;
     notifyListeners();
  }

  
  void selectDate(BuildContext context)async{
                DateTime? selectedDate = DateTime.now();
                
                 selectedDate= await showDatePicker(
                  context: context,
                  initialDate: selectedDatee,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)));

                  if(selectedDate==null){return;}
                  else{
                    
                    selectedDatee=selectedDate;
                    notifyListeners();
                  }
                  print(selectedDate);
                  
              }

  void getTaskByDate(DateTime date){
       onDateChange = date ;
       notifyListeners();
  }
}