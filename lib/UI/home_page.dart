import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:yuk_mancing/Model/category.dart';

import 'package:yuk_mancing/UI/Widget/HomeWidget/list_place.dart';
import 'package:yuk_mancing/UI/Widget/HomeWidget/username_text.dart';
import 'package:yuk_mancing/UI/details_page.dart';
import 'package:yuk_mancing/providers/place_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isFavorit = true;
  bool isInit = true;
  bool _isloading = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<Placesdata>(context).getdataplace();
      setState(() {
        _isloading = false;
      });
    }
    isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final allPlaceProvider = Provider.of<Placesdata>(context);
    return DefaultTabController(
      length: categoryData.length,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 130,
                      height: 35,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Assets/Images/Logo.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isFavorit = !_isFavorit;
                        });
                      },
                      icon: Icon(_isFavorit
                          ? CupertinoIcons.bell
                          : CupertinoIcons.bell_fill),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: UsernameText(
                    data: allPlaceProvider.userid,
                  ),
                ),
                // const Category(),
                const SizedBox(
                  height: 10,
                ),
                TabBar(
                  labelPadding: const EdgeInsets.all(0),
                  indicator: BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  indicatorPadding: const EdgeInsets.all(5),
                  isScrollable: true,
                  labelColor: kWhite,
                  unselectedLabelColor: kLightGray,
                  labelStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  tabs: categorydata.map(
                    (e) {
                      return Tab(
                        child: Container(
                          margin: const EdgeInsets.only(right: 23, left: 20),
                          child: Text(
                            e.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: "Monstserrat",
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: (allPlaceProvider.tempat.isEmpty)
                        ? const Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator())
                        : TabBarView(
                            children: [
                              ListView.builder(
                                padding: const EdgeInsets.only(top: 10),
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: allPlaceProvider.recommended.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailsPage(
                                            pickplace: allPlaceProvider
                                                .recommended[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: ListPlace(
                                      tempatdata:
                                          allPlaceProvider.recommended[index],
                                    ),
                                  );
                                },
                              ),
                              ListView.builder(
                                padding: const EdgeInsets.only(top: 10),
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: allPlaceProvider.popular.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailsPage(
                                            pickplace:
                                                allPlaceProvider.tempat[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: ListPlace(
                                      tempatdata:
                                          allPlaceProvider.popular[index],
                                    ),
                                  );
                                },
                              ),
                              ListView.builder(
                                padding: const EdgeInsets.only(top: 10),
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: allPlaceProvider.newplace.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailsPage(
                                            pickplace:
                                                allPlaceProvider.tempat[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: ListPlace(
                                      tempatdata:
                                          allPlaceProvider.newplace[index],
                                    ),
                                  );
                                },
                              ),
                              ListView.builder(
                                padding: const EdgeInsets.only(top: 10),
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: allPlaceProvider.bestplace.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailsPage(
                                            pickplace:
                                                allPlaceProvider.tempat[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: ListPlace(
                                      tempatdata:
                                          allPlaceProvider.bestplace[index],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
