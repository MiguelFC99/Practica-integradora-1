import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/cart.dart';
import 'package:practica_integradora_uno/profile.dart';
import 'package:practica_integradora_uno/grains/item_grains.dart';
import 'package:practica_integradora_uno/grains/item_grains_details.dart';

class GrainsPage extends StatelessWidget {
  final Map<String, List> productos;

  const GrainsPage({Key key, this.productos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _scaffoldkey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Granos"),
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
        itemCount: productos["GRAINS"].length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) =>
                      ItemGrainsDetails(productos: productos, index: index),
                ),
              );
            },
            child: ItemGrains(grains: productos["GRAINS"][index]),
          );
        },
      ),
    );
  }
}
