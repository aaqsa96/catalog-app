import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

/////catalogimage
class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p16
        .color(Colors.white)
        .make()
        .p16()
        .w40(context);
  }
}