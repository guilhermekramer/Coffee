import 'dart:ffi';

import 'package:floor/floor.dart';

@entity
class Coffee{

  @primaryKey
  Long id = 0;
  String name = '';
  Double price = 0;
  String roast = '';
  String sensory  = '';
  String region = '';
  
  

  Coffee(this.id, this.name, this.price, this.roast, this.sensory, this.region);
  
}

   
