import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product_cart.dart';

class ItemCart extends StatefulWidget {
  final ProductCart productCart;
  final ValueChanged<double> totalupdate;
  final ValueChanged<bool> delete;
  ItemCart({Key key, this.productCart, this.totalupdate, this.delete})
      : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      color: Colors.grey[300],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              ),
              child: Image.network(
                "${widget.productCart.productImage}",
                fit: BoxFit.fitHeight,
                height: 180,
              ),
            ),
            flex: 3,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "${widget.productCart.productTitle}",
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.favorite,
                            color: widget.productCart.liked
                                ? Colors.red
                                : Colors.black),
                        onPressed: () {
                          setState(() {
                            widget.productCart.liked =
                                !widget.productCart.liked;
                          });
                        }),
                  ],
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                        setState(
                          () {
                            if (widget.productCart.productAmount == 0) {
                              widget.totalupdate(0);
                            } else {
                              widget.productCart.productAmount --;
                              widget.totalupdate(
                                  -1 * widget.productCart.productPrice);
                            }
                          },
                        );
                      },
                    ),
                    Text("${widget.productCart.productAmount}"),
                    IconButton(
                      icon: Icon(Icons.add_circle_outline),
                      onPressed: () {
                        setState(() {
                          ++widget.productCart.productAmount;

                          widget.totalupdate(widget.productCart.productPrice);
                        });
                      },
                    ),
                    Text("\$${widget.productCart.productPrice}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(
                            () {
                              widget.productCart.remove =
                                  !widget.productCart.remove;
                              widget.productCart.productAmount = 0;
                              widget.delete(widget.productCart.remove);
                            },
                          );
                        })
                  ],
                ),
              ],
            ),
            flex: 4,
          ),
        ],
      ),
    );
  }
}
