import 'package:app_demo_get/productmodule/controllers/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FoodListView extends StatelessWidget {
  final FoodController foodController = Get.put(FoodController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test get'),
      ),
      body: Obx(() {
        if (foodController.isLoading.value)
          return Center(
            child: CircularProgressIndicator(),
          );
        else
          return ListView.builder(
              itemCount: foodController.foodList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 150,
                          height: 100,
                          margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              foodController.foodList[index].image,
                              width: 150,
                              height: 100,
                              fit: BoxFit.fill,
                              color: Colors.purple,
                              colorBlendMode: BlendMode.color,
                            ),
                          ),
                        ),
                        Text(foodController.foodList[index].foodName),
                        GestureDetector(
                          child: Obx(() => Container(
                              width: 50,
                              height: 50,
                              color: foodController.color.value
                              /* ? Colors.black
                                    : Colors.white, */
                              )),
                          onTap: () {
                            foodController.doimaucolor();
                          },
                        )
                      ],
                    ),
                  ],
                );
              });
      }),
    );
  }
}
