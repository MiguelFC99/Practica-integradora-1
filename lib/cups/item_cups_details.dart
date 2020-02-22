import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/cart.dart';
import 'package:practica_integradora_uno/cart/payment_page.dart';
import 'package:practica_integradora_uno/models/product_cart.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';
import 'package:practica_integradora_uno/profile.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class ItemCupsDetails extends StatefulWidget {
   final Map<String,List> productos;
   final int index;
  ItemCupsDetails({Key key, this.productos, this.index}) : super(key: key);

  @override
  _ItemCupsDetailsState createState() => _ItemCupsDetailsState();
}

class _ItemCupsDetailsState extends State<ItemCupsDetails> {
  bool ch = false, min = false, la = false;
  bool itmbol = false;
  var _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("${widget.productos["CUPS"][widget.index].productTitle}"),
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
                        "${widget.productos["CUPS"][widget.index].productImage}",
                        height: 180,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.favorite,
                                color: widget
                                        .productos["CUPS"][widget.index].liked
                                    ? Colors.red
                                    : Colors.black),
                            onPressed: () {
                              setState(() {
                                widget.productos["CUPS"][widget.index].liked =
                                    !widget.productos["CUPS"][widget.index]
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
                  "${widget.productos["CUPS"][widget.index].productTitle}",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                    "${widget.productos["CUPS"][widget.index].productDescription}"),
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
                      "\$ ${widget.productos["CUPS"][widget.index].productPrice}",
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
                        backgroundColor: ch? Colors.purpleAccent:null,
                      ),
                      onTap: () {
                        setState(() {
                          ch = !ch;
                          if(ch){
                            min = false;
                            la = false;
                          }
                          widget.productos["CUPS"][widget.index].productColor = ProductColor.CH;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Chip(
                        label: Text(ITEMDRINK_DET_TAM_M),
                        backgroundColor: min? Colors.purpleAccent:null,
                      ),
                      onTap: () {
                        setState(() {
                          min = !min;
                          if(min){
                            ch = false;
                            la = false;
                          }
                          widget.productos["CUPS"][widget.index].productColor = ProductColor.M;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Chip(
                        label: Text(ITEMDRINK_DET_TAM_G),
                        backgroundColor: la? Colors.purpleAccent:null,
                      ),
                      onTap: () {
                        setState(() {
                          la = !la;
                          if(la){
                            min = false;
                            ch = false;
                          }
                          widget.productos["CUPS"][widget.index].productColor = ProductColor.G;
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
                            widget.productos["CUPS"][widget.index]
                                    .productAmount >
                                0) {
                          widget.productos["CUPS"][widget.index]
                              .productAmount = 1;
                          widget.productos["CART"].add(
                              ProductCart.productCartCup(
                                  widget.productos["CUPS"][widget.index]));
                        } else {
                          for (int i = 0;
                              i < widget.productos["CART"].length;
                              i++) {
                            if (widget.productos["CART"][i].productTitle ==
                                widget.productos["CUPS"][widget.index]
                                    .productTitle) {
                              widget.productos["CUPS"][widget.index]
                                  .productAmount += 1;
                              widget.productos["CART"][i].productAmount += 1;
                              itmbol = true;
                            }
                          }
                          if (!itmbol) {
                            widget.productos["CUPS"][widget.index]
                                .productAmount = 1;
                            widget.productos["CART"].add(
                                ProductCart.productCartCup(
                                    widget.productos["CUPS"][widget.index]));
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