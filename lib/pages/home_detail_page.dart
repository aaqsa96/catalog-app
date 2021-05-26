import 'package:flutter/material.dart';
import 'package:flutter_catalog_app/models/catalog.dart';
import 'package:flutter_catalog_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.only(right: 20),
        children: [
          "\$${catalog.price}".text.bold.xl4.make(),
          ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyTheme
                          .darkBluishColor) //whether button pressed or not but you have to change the color
                      ),
                  child: "Buy".text.make())
              .wh(100, 30)
        ],
      ).p32(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id
                  .toString()), //tag in hero connect the screens/widgets and show animation and both should contain same tag
              child: Image.network(catalog.image),
            ).p16().h32(context),
            Expanded(
              child: VxArc(
                height: 30,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  width: context.screenWidth,
                  child: Column(children: [
                    catalog.name.text.xl
                        .color(MyTheme.darkBluishColor)
                        .bold
                        .make(),
                    catalog.desc.text.xl
                        .textStyle(context.captionStyle)
                        .make(), //make  the color light from name color
                    10.heightBox,
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
