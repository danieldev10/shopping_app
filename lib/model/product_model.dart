import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
        isRecommended,
        isPopular,
      ];

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageURL'],
      price: snap['price'],
      isRecommended: snap['isRecommended'],
      isPopular: snap['isPopular'],
    );

    return product;
  }

  static List<Product> products = [
    Product(
      name: "Coke",
      category: "Soft Drinks",
      imageUrl:
          "https://images.unsplash.com/photo-1554866585-cd94860890b7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1530&q=80",
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: "Sprite",
      category: "Soft Drinks",
      imageUrl:
          "https://images.unsplash.com/photo-1625772299848-391b6a87d7b3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1587&q=80",
      price: 2.99,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: "Monster",
      category: "Soft Drinks",
      imageUrl:
          "https://images.unsplash.com/photo-1622543925917-763c34d1a86e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1587&q=80",
      price: 3.99,
      isRecommended: false,
      isPopular: false,
    ),
    Product(
      name: "Banana Smoothie",
      category: "Smoothies",
      imageUrl:
          "https://images.unsplash.com/photo-1505576540771-be91e4753e0f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1587&q=80",
      price: 2.99,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: "Chocolate Latte",
      category: "Coffee",
      imageUrl:
          "https://images.unsplash.com/photo-1636188556900-bae3b25e072b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y2hvY29sYXRlJTIwbGF0dGV8ZW58MHx8MHx8&auto=format&fit=crop&w=1600&q=60",
      price: 4.99,
      isRecommended: true,
      isPopular: true,
    ),
  ];
}
