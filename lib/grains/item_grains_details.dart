import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/cart.dart';
import 'package:practica_integradora_uno/cart/payment_page.dart';
import 'package:practica_integradora_uno/models/product_cart.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';
import 'package:practica_integradora_uno/profile.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class ItemGrainsDetails extends StatefulWidget {
   final Map<String,List> productos;
   final int index;
  
  ItemGrainsDetails({Key key, this.productos, this.index}) : super(key: key);

  @override
  _ItemGrainsDetailsState createState() => _ItemGrainsDetailsState();
}

class _ItemGrainsDetailsState extends State<ItemGrainsDetails> {
  bool cua = false, kil = false;
  var _scaffoldkey = GlobalKey<ScaffoldState>();
  bool itmbol = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("${widget.productos["GRAINS"][widget.index].productTitle}"),
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
              if (widget.productos["CART"].length == 0) {
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
                            proCartList: widget.productos["CART"],
                          )),
                );
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      child: Image.network(
                        "${widget.productos["GRAINS"][widget.index].productImage}",
                        height: 180,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.favorite,
                                color: widget
                                        .productos["GRAINS"][widget.index].liked
                                    ? Colors.red
                                    : Colors.black),
                            onPressed: () {
                              setState(() {
                                widget.productos["GRAINS"][widget.index].liked =
                                    !widget.productos["GRAINS"][widget.index]
                                        .liked;
                              });
                            })
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "${widget.productos["GRAINS"][widget.index].productTitle}",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                    "${widget.productos["GRAINS"][widget.index].productDescription}"),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      ITEMDRINK_DET_SIZES,
                    ),
                    Text(
                      "\$ ${widget.productos["GRAINS"][widget.index].productPrice}",
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      child: Chip(
                        label: Text(ITEMDRINK_DET_TAM_C),
                        backgroundColor: cua? Colors.purpleAccent:null,
                      ),
                      onTap: () {
                        setState(() {
                          cua = !cua;
                          if(cua){
                            kil = false;
                          }
                          widget.productos["GRAINS"][widget.index].productWeight = ProductWeight.CUARTO;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Chip(
                        label: Text(ITEMDRINK_DET_TAM_M),
                        backgroundColor: kil? Colors.purpleAccent:null,
                      ),
                      onTap: () {
                        setState(() {
                          kil = !kil;
                          if(kil){
                            cua = false;
                          }
                          widget.productos["GRAINS"][widget.index].productWeight = ProductWeight.KILO;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child:
                          Text(ITEMDRINK_DET_ADDC, textAlign: TextAlign.center),
                      onPressed: () {
                        _scaffoldkey.currentState
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text("Artículo agregado al carrito!"),
                            ),
                          );
                        if (widget.productos["CART"].length == 0 &&
                            widget.productos["GRAINS"][widget.index]
                                    .productAmount >
                                0) {
                          widget.productos["GRAINS"][widget.index]
                              .productAmount = 1;
                          widget.productos["CART"].add(
                              ProductCart.productCartGrain(
                                  widget.productos["GRAINS"][widget.index]));
                        } else {
                          for (int i = 0;
                              i < widget.productos["CART"].length;
                              i++) {
                            if (widget.productos["CART"][i].productTitle ==
                                widget.productos["GRAINS"][widget.index]
                                    .productTitle) {
                              widget.productos["GRAINS"][widget.index]
                                  .productAmount += 1;
                              widget.productos["CART"][i].productAmount += 1;
                              itmbol = true;
                            }
                          }
                          if (!itmbol) {
                            widget.productos["GRAINS"][widget.index]
                                .productAmount = 1;
                            widget.productos["CART"].add(
                                ProductCart.productCartGrain(
                                    widget.productos["GRAINS"][widget.index]));
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text(
                        ITEMDRINK_DET_COMH,
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => PaymentPage()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}