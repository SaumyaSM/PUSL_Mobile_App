import 'package:flutter/material.dart';

class UnboardingContent {
  String image;
  String title;
  String description;
  UnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      image: "images/appscreen1.jpg",
      title: 'Select from our\nBest Menu',
      description: 'Pick your food from our menu\nMore than 50 items'),
  UnboardingContent(
      image: "images/cod.png",
      title: 'Easy payment methods',
      description:
          'You can pay cash on delivery and\nCard payment is available'),
  UnboardingContent(
      image: "images/order.jpg",
      title: 'Quick delivery',
      description: 'Deliver your food at your\ndoorstep'),
];
