import 'package:flutter/material.dart';

class ItemPayment extends StatelessWidget {
  final String title;
  final String image;

  const ItemPayment({Key key, this.title, this.image}) : super(key: key);

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
            child: Container(
              child: Text(
                "$title",
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
                topRight: Radius.circular(2.0),
                bottomRight: Radius.circular(2.0),
              ),
              child: Image.network(
                "$image",
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