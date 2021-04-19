import 'package:app_demo_get/controllers/find_food_controller.dart';
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
    var listfoods = findFoodController.fetchFoods(query);
    return listfoods == null
        ? Container(
            height: 100.0,
            width: 100.0,
            child: Card(
              color: Colors.red,
              shape: StadiumBorder(),
              child: Center(
                child: Text('Khong co du lieu'),
              ),
            ),
          )
        : Obx(() {
            return Container(
              height: 100.0,
              width: 100.0,
              child: Card(
                color: Colors.red,
                shape: StadiumBorder(),
                child: Center(
                  child: Text(listfoods[0]),
                ),
              ),
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
