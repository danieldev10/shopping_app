// ignore_for_file: prefer_const_constructors

import 'package:debut/model/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  Map productQuantity(products) {
    var quantity = Map();
    
    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }

  @override
  List<Object?> get props => [products];

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(subtotal) {
    if (subtotal >= 30.0) {
      return 0;
    } else {
      return 10.0;
    }
  }

  double total(subtotal) {
    return subtotal + deliveryFee(subtotal);
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 30) {
      return "You have FREE delivery";
    } else {
      double missung = 30.0 - subtotal;
      return "Add \$${missung.toStringAsFixed(2)} for FREE delivery";
    }
  }

  String get subtotalString => subtotal.toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subtotal);
  String get totalString => total(subtotal).toStringAsFixed(2);
}
