import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/cart.dart';
import 'package:practica_integradora_uno/cups/item_cups.dart';
import 'package:practica_integradora_uno/cups/item_cups_details.dart';
import 'package:practica_integradora_uno/profile.dart';

class CupsPage extends StatelessWidget {
  final Map<String, List> productos;

  const CupsPage({Key key, this.productos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _scaffoldkey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bebidas"),
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
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productos["CUPS"].length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) =>
                      ItemCupsDetails(productos: productos, index: index),
                ),
              );
            },
            child: ItemCups(cups: productos["CUPS"][index]),
          );
        },
      ),
    );
  }
}
