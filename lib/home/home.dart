import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/cart.dart';
import 'package:practica_integradora_uno/cups/cups_page.dart';
import 'package:practica_integradora_uno/drinks/drinks_page.dart';
import 'package:practica_integradora_uno/grains/gains_page.dart';
import 'package:practica_integradora_uno/home/item_home.dart';
import 'package:practica_integradora_uno/models/product_cart.dart';

import 'package:practica_integradora_uno/models/product_repository.dart';
import 'package:practica_integradora_uno/profile.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, List> productos;
  List<ProductCart> listCart;
  void initState() {
    listCart = List<ProductCart>();
    productos = Map();
    productos["DRINKS"] = ProductRepository.loadProducts(ProductType.BEBIDAS);
    productos["GRAINS"] = ProductRepository.loadProducts(ProductType.GRANO);
    productos["CUPS"] = ProductRepository.loadProducts(ProductType.TAZAS);
    productos["CART"] = listCart;
    super.initState();
  }

  Widget build(BuildContext context) {
    var _scaffoldkey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              if (productos["CART"].length == 0) {
                _scaffoldkey.currentState
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text("No tienes articulos en el carrito..."),
                    ),
                  );
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => Cart(
                            proCartList: productos["CART"],
                          )),
                );
              }
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openDrinksPage,
            child: ItemHome(
              title: "Bebidas",
              image: "https://i.blogs.es/723857/cafe_como/450_1000.jpg",
            ),
          ),
          GestureDetector(
            onTap: _openGrainsPage,
            child: ItemHome(
              title: "Cafe en grano",
              image: "https://www.elplural.com/uploads/s1/34/84/2/cafe.jpeg",
            ),
          ),
          GestureDetector(
            onTap: _openCupsPage,
            child: ItemHome(
              title: "Tazas",
              image: "https://i.blogs.es/723857/cafe_como/450_1000.jpg",
            ),
          )
        ],
      ),
    );
  }

  void _openDrinksPage() {

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DrinksPage(productos: productos)));
  }

  void _openGrainsPage() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => GrainsPage(productos: productos)));
  }

  void _openCupsPage() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CupsPage(productos: productos)));
  }
}
