
import 'dart:math';

import 'package:flutter/material.dart';

enum ProductColor { CH, M, G }

class ProductCup {
  String productTitle; // nombre del producto
  String productDescription; // descripcion del producto
  String productImage; // url de imagen del producto
  ProductColor productColor; // tamano del producto
  double productPrice; // precio del producto autocalculado
  int productAmount; // cantidad de producto por comprar
  bool liked;

  ProductCup({
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productColor,
    @required this.productAmount,
    this.liked = false,
  }) {
    // inicializa el precio de acuerdo al weight del producto
    productPrice = productPriceCalculator();
  }

  double productPriceCalculator() {
    if (this.productColor == ProductColor.CH)
      return (20 + Random().nextInt(40)).toDouble();
    if (this.productColor == ProductColor.M)
      return (40 + Random().nextInt(60)).toDouble();
    return 9999.0;
  }
}