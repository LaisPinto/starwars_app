import 'package:starwars_app/app/modules/home/models/_export_model.dart';

abstract class HomeServiceInterface {
  Future<List<PeopleModel?>> getPeople();
}
