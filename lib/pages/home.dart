import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog_app/widgets/drawer.dart';

import '../models/catalog.dart';
import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    /*List<Item> list*/ CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    print(productsData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,

          ///give padding of 32 from all sides
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              // to show list
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App"
            .text
            .xl5
            .bold
            .color(MyTheme.darkBluishColor)
            .make(), //same work like text widget
        "Trending Products".text.make(),
      ],
    );
  }
}

////////////////////catalog list
class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true, //it will give that size of space which list required
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return CatalogItem(catalog: catalog); //named constructor
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
      CatalogImage(image: catalog.image),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
          catalog.desc.text
              .textStyle(context.captionStyle)
              .make(), //make  the color light from name color
          10.heightBox, //sizedbox
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.only(right: 20),
            children: [
              "\$${catalog.price}".text.bold.xl.make(),
              ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyTheme
                          .darkBluishColor) //whether button pressed or not but you have to change the color
                      ),
                  child: "Buy".text.make())
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
