import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:starwars_app/app/modules/home/stores/_export_store.dart';

import '../../../../translations/locale_keys.g.dart';
import '../components/_export_component.dart';

class PeoplePage extends StatefulWidget {
  final int id;
  const PeoplePage({
    super.key,
    required this.id,
  });

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  late HomeStore _homeStore;

  Widget _cardData(String title, String result) {
    return Expanded(
      child: Card(
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              result,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailsPeople(Size mediaSize) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.yellow,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10),
            height: mediaSize.height * 0.50,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _cardData(LocaleKeys.Screen_detail_name.tr(), _homeStore.peopleModelObservable.elementAt(widget.id)!.name!),
                _cardData(LocaleKeys.Screen_detail_gender.tr(), _homeStore.peopleModelObservable.elementAt(widget.id)!.gender!),
                _cardData(LocaleKeys.Screen_detail_birthYear.tr(), _homeStore.peopleModelObservable.elementAt(widget.id)!.birthYear!),
                _cardData(LocaleKeys.Screen_detail_eyeColor.tr(), _homeStore.peopleModelObservable.elementAt(widget.id)!.eyeColor!),
                _cardData(LocaleKeys.Screen_detail_hairColor, _homeStore.peopleModelObservable.elementAt(widget.id)!.hairColor!),
                _cardData(LocaleKeys.Screen_detail_height.tr(), _homeStore.peopleModelObservable.elementAt(widget.id)!.height!),
                _cardData(LocaleKeys.Screen_detail_mass.tr(), _homeStore.peopleModelObservable.elementAt(widget.id)!.mass!),
                _cardData(LocaleKeys.Screen_detail_skinColor.tr(), _homeStore.peopleModelObservable.elementAt(widget.id)!.skinColor!),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          LocaleKeys.Screen_detail_title.tr(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fundo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Observer(
            builder: (context) {
              return _homeStore.peopleModelObservable.isEmpty
                  ? const CircularProgressComponent(
                      label: "Carregando...",
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
                      child: _detailsPeople(mediaSize),
                    );
            },
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initPage();
  }

  Future<void> _initPage() async {
    _homeStore = HomeStore();
    await _homeStore.getPeople();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
