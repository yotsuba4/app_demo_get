import 'package:flutter/material.dart';

class RelatedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          width: 120,
          margin: EdgeInsets.only(
            right: 15,
          ),
          child: Image.network(
            'https://res.cloudinary.com/ducsine/image/upload/v1618754430/zwbfgxnyuxogoeqnwbxc.jpg',
            fit: BoxFit.cover,
          ),
        );
      },
      itemCount: 5,
    );
  }
}
