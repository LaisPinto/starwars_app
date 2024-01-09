import 'package:mobx/mobx.dart';
import 'package:starwars_app/app/modules/home/interfaces/_export_interface.dart';
import 'package:starwars_app/app/modules/home/models/_export_model.dart';
import 'package:starwars_app/app/modules/home/services/_export_service.dart';

part 'home_store.g.dart';

class HomeStore = BaseHomeStore with _$HomeStore;

abstract class BaseHomeStore with Store {
  HomeServiceInterface homeServiceInterface = HomeService();

  @observable
  PeopleModel? peopleModel;

  @observable
  List<PeopleModel?> peopleModelObservable = ObservableList();

  @observable
  bool isPeopleLoading = false;

  @action
  Future<void> getPeople() async {
    isPeopleLoading = false;
    try {
      peopleModelObservable = await homeServiceInterface.getPeople();
    } catch (error) {
      rethrow;
    } finally {
      isPeopleLoading = false;
    }
  }
}
