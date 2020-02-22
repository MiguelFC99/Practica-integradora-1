import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/item_cart.dart';
import 'package:practica_integradora_uno/cart/payment_page.dart';
import 'package:practica_integradora_uno/models/product_cart.dart';
import 'package:practica_integradora_uno/profile.dart';


class Cart extends StatefulWidget {
  final List<ProductCart> proCartList;

  Cart({
    Key key,
    this.proCartList,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

mixin FeedPageState {
}

class _CartState extends State<Cart> {
  
  double _total = 0;
  @override
  void initState() {
    super.initState();
    for (var ob in widget.proCartList) {

      _total += (ob.productPrice * ob.productAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cart"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.only(bottom: 30, left: 15, right: 15, top: 10),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: widget.proCartList.length,
                    itemBuilder: (BuildContext context, int index) {
                     return ItemCart(
                        delete: _upListCart,
                        totalupdate: _pUpd,
                        productCart: widget.proCartList[index],
                      );
                    },
                  ),
                ),
                flex: 5,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Total\n \$$_total MX",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                flex: 1,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        child: Text("PAGAR"),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => PaymentPage()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  void _pUpd(double nwp) {
    setState(() {
      _total += nwp;
    });
  }
  void _upListCart(bool b){
      int i = 0;
      setState(() {
        while(i < widget.proCartList.length){
        if(widget.proCartList[i].remove == true ){
          widget.proCartList[i].productAmount = 0;
          _pUpd(-_total);
          widget.proCartList.removeAt(i);
          _openDialogCredito();
          break;
        }
        i++;
      }
      });
      

  }

  Future<void> _openDialogCredito() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Carrito de compras'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Se ha eliminado un articulo de tu carrito'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Aceptar'),
            onPressed: () {
              
              Navigator.of(context).pop(Cart(proCartList: widget.proCartList));
            },
          ),
        ],
      );
    },
  );
  }




}
