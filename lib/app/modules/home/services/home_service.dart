import 'package:starwars_app/app/modules/core/_export_core.dart';
import 'package:starwars_app/app/modules/home/interfaces/_export_interface.dart';
import 'package:starwars_app/app/modules/home/models/_export_model.dart';
import 'package:starwars_app/app/modules/home/services/_export_service.dart';

class HomeService implements HomeServiceInterface {
  @override
  Future<List<PeopleModel?>> getPeople() async {
    String url = AppConstant.peopleURL;
    try {
      final response = await Network.internal().get(
        url: url,
        headers: HomeModelHeader.getHomeModelHeader(),
      );
      final List<dynamic> results = response['results'];

      print("result: $results");

      return results.map<PeopleModel>((home) => PeopleModel.fromMap(home)).toList();
    } catch (error) {
      rethrow;
    }
  }
}
