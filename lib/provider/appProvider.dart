import 'package:flutter/material.dart';
import 'package:todo_app_with_firbase/local/cashe_helper.dart';

class AppProvider extends ChangeNotifier {
  DateTime selectedDatee = DateTime.now();
  DateTime onDateChange = DateTime.now();
  int currentIndex = 0;
  String dropValue = 'English';
  String dropModeValue = 'Dark';
  bool? isDark = CasheHelper.getIsDarkValue('isDark');
  String arLanguage = 'ar';
  String enLanguage = 'en';
  bool? isArabic = CasheHelper.getIsDarkValue('langauge');

  void chooseMode(String mode) {
    if (mode == 'Dark') {
      isDark = true;
    } else {
      isDark = false;
    }
  }

   Future<bool> changeLanguage(String? Language)
    async {
      if(Language=='Arabic'){
        isArabic =  true;
        notifyListeners();
        print(isArabic);
     
      }
       else if(Language=='English') {
        isArabic=false;;
        notifyListeners();
        print(isArabic);
       }
       return false;
   }

  toggleNavBar(int index) {
    currentIndex = index;
    notifyListeners();
  }

  toggleDropMenu(String value) {
    dropValue = value;
    notifyListeners();
  }

  toggleDropMenuMode(String value) {
    dropModeValue = value;
    notifyListeners();
  }

  void selectDate(BuildContext context) async {
    DateTime? selectedDate = DateTime.now();

    selectedDate = await showDatePicker(
        context: context,
        initialDate: selectedDatee,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if (selectedDate == null) {
      return;
      //print('-------- Date : $selectedDatee');
    } else {
      selectedDatee = selectedDate;
      notifyListeners();
    }
    print('-------- Date : $selectedDatee');
  }

  void getTaskByDate(DateTime date) {
    onDateChange = date;
    notifyListeners();
  }
}
