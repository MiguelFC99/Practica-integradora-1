import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/item_payment.dart';
import 'package:practica_integradora_uno/home/home.dart';
import 'package:practica_integradora_uno/profile.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({Key key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagos"),
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
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openDialog,
            child: ItemPayment(
              title: "Tarjeta de crédito",
              image:
                  "https://www.openpay.mx/img/tarjetas/img_headerTARJETAS@2x.png",
            ),
          ),
          GestureDetector(
            onTap: _openDialog,
            child: ItemPayment(
              title: "PayPal",
              image:
                  "https://upload.wikimedia.org/wikipedia/commons/a/a4/Paypal_2014_logo.png",
            ),
          ),
          GestureDetector(
            onTap: _openDialog,
            child: ItemPayment(
              title: "Tarjeta de regalo ",
              image:
                  "https://cdn.shopify.com/s/files/1/0638/9453/products/tarjeta-regalo_grande.png",
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Image.network(
            'https://www.dw.com/image/44469116_303.jpg',
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.beenhere), onPressed: () {}),
                    Column(
                      children: <Widget>[
                        Text("¡Orden exitosa!"),
                        Text("Cupping shop"),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 9,
                ),
                Text(
                    "Tu orden ha sido registrada, gracias por tu compra. Puedes seguir adquiriendo nuestros productos.")
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('ACEPTAR'),
              onPressed: () {
                Navigator.of(context).pop(Home(title: APP_TITLE));
              },
            ),
          ],
        );
      },
    );
  }
}
