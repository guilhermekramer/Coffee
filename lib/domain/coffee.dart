class Coffee{

  int id = 0;
  String name = '';
  double price = 0.0;
  String roast = '';
  String sensory  = '';
  String region = '';
  
  static const String tableName = 'coffee_table';
  static const String idValue = 'id';
  static const String coffeeValue = 'name';
  static const String priceValue = 'price';
  static const String roastValue = 'roast';
  static const String sensoryValue = 'sensory';
  static const String regionValue = 'region';
  

  Coffee(this.name, this.price, this.roast, this.sensory, this.region);

  Coffee.fromMap(Map map) {
    id = map[idValue];
    name = map[coffeeValue];
    price = map[priceValue];
    roast = map[roastValue];
    sensory = map[sensoryValue];
    region = map[regionValue];
  }

  get outroAtributo => null;


   
  Map<String, dynamic> toMap() {
    return {
      coffeeValue: name,
      priceValue: price,
      roastValue: roast,
      sensoryValue: sensory,
      regionValue: region,
    };
  }
}
  

   
  
