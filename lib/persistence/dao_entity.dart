
import 'package:floor/floor.dart';
import 'package:segunda_prova/domain/coffee.dart';

@dao
abstract class DAOcoffee{
  
  @Query("Select * from coffee")
  Future<List> findAllCoffee();

  @Query('SELECT name FROM coffee')
  Stream<List<String>> findAllCoffeeName();

  @Query('SELECT * FROM coffee WHERE id = :id')
  Stream<Coffee?> findCoffeeById(int id);

  @Query('SELECT * FROM Coffee WHERE price = :price')
  Future<List<Coffee>> findCoffeesByPrice(double price);

  @Query('SELECT * FROM Coffee WHERE roast = :roast')
  Future<List<Coffee>> findCoffeesByRoast(String roast);

  @Query('SELECT * FROM Coffee WHERE sensory = :sensory')
  Future<List<Coffee>> findCoffeesBySensory(String sensory);

  @Query('SELECT * FROM Coffee WHERE region = :region')
  Future<List<Coffee>> findCoffeesByRegion(String region);

  @insert
  Future<void> insertCoffee(Coffee coffee);

  @update
  Future<void> updateCoffee(Coffee coffee);

  @delete
  Future<void> deleteCoffee(Coffee coffee);

}