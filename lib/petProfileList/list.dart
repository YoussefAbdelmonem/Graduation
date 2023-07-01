import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meaw/core/components/colors.dart';
import 'package:meaw/core/components/components.dart';
import 'package:meaw/petProfileList/addCat/addCat.dart';
import 'package:meaw/petProfileList/petProfileListCubit/cubit.dart';
import 'package:meaw/petProfileList/petProfileListCubit/petComponent.dart';
import 'package:meaw/petProfileList/petProfileListCubit/states.dart';
import 'package:meaw/screens/editCatProfile/editCatProfile.dart';
import 'package:meaw/screens/profileScreen/profileScreen.dart';

import '../data/models/catModel.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PetProfileListCubit, PetProfileListStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    appBaar(
                        context: context,
                        label: 'My Pet',
                        screen: ProfileScreen(),
                        width: 130.0.w),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          StreamBuilder<QuerySnapshot>(
                              stream:
                                  PetProfileListCubit.get(context).getCats(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  List<CatModel> catModel = [];
                                  for (var doc in snapshot.data!.docs) {
                                    var data =
                                        doc.data() as Map<String, dynamic>;
                                    catModel.add(CatModel(
                                        name: data['name'],
                                        year: data['year'],
                                        catImage: data['catImage'],
                                        gender: data['gender'],
                                        id: data["id"]));
                                  }
                                  List<Widget> mWidgets = [];

                                  catModel.map((e) {
                                    var c = petItem(e: e);
                                    mWidgets.add(c);
                                  }).toList();

                                  mWidgets.insert(
                                      0,
                                      InkWell(
                                        onTap: () {
                                          navigateTo(context, AddCatScreen());
                                        },
                                        child: addItem(),
                                      ));

                                  return GridView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      physics: BouncingScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 30,
                                        mainAxisSpacing: 10,
                                      ),
                                      itemCount: mWidgets.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                            onTap: () {
                                              print(
                                                  "Index is: ${catModel[index - 1].year}");
                                              navigateTo(
                                                  context,
                                                  EditCatScreen(
                                                    catModel: catModel,
                                                    index: index - 1,
                                                    name: catModel[index - 1]
                                                        .name!,
                                                    year: catModel[index - 1]
                                                        .year!,
                                                    gender: catModel[index - 1]
                                                        .gender!,
                                                  ));
                                            },
                                            child: mWidgets[index]);
                                      });
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: defaultColor,
                                    ),
                                  );
                                }
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
