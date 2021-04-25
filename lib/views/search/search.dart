import 'package:app_demo_get/controllers/find-food-controller.dart';
import 'package:app_demo_get/shared/widget/common-items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataSearch extends SearchDelegate<String> {
  FindFoodController findFoodController = Get.put(FindFoodController());

  final foods = [
    'bún bò',
    'bún riêu',
    'bánh cuốn',
    'bánh mì',
    'cơm gà',
    'cơm sườn',
  ];
  final recentFood = [
    'bún bò',
    'bún riêu',
    'bánh cuốn',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    findFoodController.fetchFoods(query);

    return Obx(() {
      return SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: findFoodController.findFoodPopuler.length,
            itemBuilder: (context, index) {
              return CommonItemCard(
                  nearByItems: findFoodController.findFoodPopuler[index]);
            }),
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentFood
        : foods.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.food_bank),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: suggestionList[index].substring(
                  query.length,
                ),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
