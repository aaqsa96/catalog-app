import 'package:flutter/material.dart';
import 'package:flutter_catalog_app/models/catalog.dart';
import 'package:flutter_catalog_app/pages/home_detail_page.dart';
import 'package:flutter_catalog_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

////////////////////catalog list
class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true, //it will give that size of space which list required
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomeDetailPage(catalog: catalog)));
              },
              child: CatalogItem(catalog: catalog)); //named constructor
        });
  }
}

///////////////////CatalogItem/////////////////
class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(
            key:
                key); //assert will give you a warninig at debug time that this value is going to be empty
  @override
  Widget build(BuildContext context) {
    return VxBox(
            child: Row(children: [
      Hero(
          tag: Key(catalog.id
              .toString()), //tag in hero connect the screens/widgets and show animation and both should contain same tag
          child: CatalogImage(image: catalog.image)),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
          catalog.desc.text
              .textStyle(context.captionStyle)
              .make(), //make  the color light from name color
          //10.heightBox, //sizedbox
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            // buttonPadding: EdgeInsets.only(right: 20),
            children: [
              "\$${catalog.price}".text.bold.xl.make(),
              ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyTheme
                          .darkBluishColor) //whether button pressed or not but you have to change the color
                      ),
                  child: "Add to Cart".text.make())
            ],
          )
        ],
      ))
    ]))
        .white
        .roundedLg
        .square(150)
        .make()
        .py16(); //PY will give padding at top and bottom and roundlg will round the corners of cards
  }
}
