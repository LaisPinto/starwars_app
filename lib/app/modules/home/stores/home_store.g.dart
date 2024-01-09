// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on BaseHomeStore, Store {
  late final _$peopleModelAtom =
      Atom(name: 'BaseHomeStore.peopleModel', context: context);

  @override
  PeopleModel? get peopleModel {
    _$peopleModelAtom.reportRead();
    return super.peopleModel;
  }

  @override
  set peopleModel(PeopleModel? value) {
    _$peopleModelAtom.reportWrite(value, super.peopleModel, () {
      super.peopleModel = value;
    });
  }

  late final _$peopleModelObservableAtom =
      Atom(name: 'BaseHomeStore.peopleModelObservable', context: context);

  @override
  List<PeopleModel?> get peopleModelObservable {
    _$peopleModelObservableAtom.reportRead();
    return super.peopleModelObservable;
  }

  @override
  set peopleModelObservable(List<PeopleModel?> value) {
    _$peopleModelObservableAtom.reportWrite(value, super.peopleModelObservable,
        () {
      super.peopleModelObservable = value;
    });
  }

  late final _$isPeopleLoadingAtom =
      Atom(name: 'BaseHomeStore.isPeopleLoading', context: context);

  @override
  bool get isPeopleLoading {
    _$isPeopleLoadingAtom.reportRead();
    return super.isPeopleLoading;
  }

  @override
  set isPeopleLoading(bool value) {
    _$isPeopleLoadingAtom.reportWrite(value, super.isPeopleLoading, () {
      super.isPeopleLoading = value;
    });
  }

  late final _$getPeopleAsyncAction =
      AsyncAction('BaseHomeStore.getPeople', context: context);

  @override
  Future<void> getPeople() {
    return _$getPeopleAsyncAction.run(() => super.getPeople());
  }

  @override
  String toString() {
    return '''
peopleModel: ${peopleModel},
peopleModelObservable: ${peopleModelObservable},
isPeopleLoading: ${isPeopleLoading}
    ''';
  }
}
