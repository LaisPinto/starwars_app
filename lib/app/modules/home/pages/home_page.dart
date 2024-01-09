import 'package:flutter/material.dart';
import 'package:starwars_app/app/modules/home/models/_export_model.dart';
import 'package:starwars_app/app/modules/home/pages/people_page.dart';
import 'package:starwars_app/app/modules/home/stores/_export_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../utils/_export_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeStore _homeStore;

  Widget _listPeople() {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemBuilder: (context, index) {
          PeopleModel? peopleModel = _homeStore.peopleModelObservable.elementAt(index);
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PeoplePage(
                  id: index,
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.10),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.yellow,
                          child: Text(
                            FormatUserName.getAvatarLetters(
                              name: peopleModel!.name!,
                            ),
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Colors.black,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        peopleModel.name!,
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        itemCount: _homeStore.peopleModelObservable.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              return SafeArea(
                child: Column(
                  children: [
                    _listPeople(),
                  ],
                ),
              );
            },
          ),
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
}
