import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';

class ItemCups extends StatefulWidget {
  final ProductCup cups;
  ItemCups({Key key, this.cups}) : super(key: key);

  @override
  _ItemCupsState createState() => _ItemCupsState();
}

class _ItemCupsState extends State<ItemCups> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      color: Colors.grey[300],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.favorite,
                  color: widget.cups.liked ? Colors.red : Colors.black),
              onPressed: () {
                setState(() {
                  widget.cups.liked = !widget.cups.liked;
                });
              }),
          Expanded(
            child: Container(
              child: Text(
                "${widget.cups.productTitle} \n \$${widget.cups.productPrice}",
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              ),
              child: Image.network(
                "${widget.cups.productImage}",
                fit: BoxFit.fitHeight,
                height: 180,
              ),
            ),
            flex: 3,
          ),
        ],
      ),
    );
  }
}