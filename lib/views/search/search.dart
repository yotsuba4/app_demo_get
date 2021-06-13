import 'package:app_demo_get/controllers/find-food-controller.dart';
import 'package:app_demo_get/shared/widget/common-items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataSearch extends SearchDelegate<String> {
  FindFoodController findFoodController = Get.find();
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
    if (query == null || query == '') {
      return Center(
        child: Text('no_result'.tr),
      );
    } else {
      findFoodController.fetchFoods(query);
      findFoodController.recents.add(query);
      return Obx(() {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: findFoodController.findFoodPopuler.length,
                itemBuilder: (context, index) {
                  return CommonItemCard(
                      nearByItems: findFoodController.findFoodPopuler[index]);
                }),
          ),
        );
      });
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? findFoodController.recents
        : findFoodController.suggests
            .where((element) => element.startsWith(query.capitalizeFirst))
            .toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          query = findFoodController.suggests[index];
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
