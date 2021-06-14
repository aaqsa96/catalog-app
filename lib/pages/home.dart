import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog_app/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog_app/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_catalog_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../utils/routes.dart';
import '../models/catalog.dart';

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
      backgroundColor: context.canvasColor, //in using velocityx
      //backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m12,

          ///give padding of 32 from all sides
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              // to show list
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().p16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.theme.buttonColor,
        //backgroundColor: context.buttonColor,
        child: Icon(CupertinoIcons.cart, color: (Colors.white)),
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
      ),
    );
  }
}
