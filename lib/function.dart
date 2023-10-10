import 'package:flutter/material.dart';

import 'main.dart';

class editfunction extends  ChangeNotifier{

  void edit()
  {
     a=true;
    notifyListeners();
  }


}
class fun extends ChangeNotifier{
  void missed()
  {
    a=false;
    notifyListeners();
  }

}