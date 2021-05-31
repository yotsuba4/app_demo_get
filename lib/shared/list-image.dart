import 'package:app_demo_get/models/test/cart-test.dart';
import 'package:app_demo_get/models/test/product-test.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://res.cloudinary.com/ducsine/image/upload/v1622456167/1_qep7fa.jpg',
  'https://res.cloudinary.com/ducsine/image/upload/v1622456167/2_wor9x4.jpg',
  'https://res.cloudinary.com/ducsine/image/upload/v1622456167/3_ormz3k.png',
  'https://res.cloudinary.com/ducsine/image/upload/v1622456167/4_buwbdc.jpg',
  'https://res.cloudinary.com/ducsine/image/upload/v1622456167/5_cmyq6e.jpg',
  'https://res.cloudinary.com/ducsine/image/upload/v1622456167/6_mmi22f.jpg'
];

List filedata = [
  {
    'name': 'Adeleye Ayodeji',
    'pic': 'https://picsum.photos/300/30',
    'message': 'I love to code'
  },
  {
    'name': 'Biggi Man',
    'pic': 'https://picsum.photos/300/30',
    'message': 'Very cool'
  },
  {
    'name': 'Biggi Man',
    'pic': 'https://picsum.photos/300/30',
    'message': 'Very cool'
  },
  {
    'name': 'Biggi Man',
    'pic': 'https://picsum.photos/300/30',
    'message': 'Very cool'
  },
];

List<TestCart> demoCarts = [
  TestCart(product: demoProducts[0], numOfItem: 2),
  TestCart(product: demoProducts[1], numOfItem: 1),
  TestCart(product: demoProducts[3], numOfItem: 1),
];

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
