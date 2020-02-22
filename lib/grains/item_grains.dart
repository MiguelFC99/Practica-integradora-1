import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';

class ItemGrains extends StatefulWidget {
  final ProductGrains grains;

  ItemGrains({Key key, this.grains}) : super(key: key);

  @override
  _ItemGrainsState createState() => _ItemGrainsState();
}

class _ItemGrainsState extends State<ItemGrains> {
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
                  color: widget.grains.liked ? Colors.red : Colors.black),
              onPressed: () {
                setState(() {
                  widget.grains.liked = !widget.grains.liked;
                });
              }),
          Expanded(
            child: Container(
              child: Text(
                "${widget.grains.productTitle} \n \$${widget.grains.productPrice}",
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
                "${widget.grains.productImage}",
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