import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter100/model/product.dart';
import 'package:flutter100/services/product.dart';
import 'product_list_page.dart';

//状态可变继承widget
class ProductPage extends StatefulWidget {
  @override
  ProductPageState createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  ProductListModal listData = ProductListModal([]);

  int page = 0;

  void getProductList() async {
    var data = await getProductResult(page++);
    ProductListModal list = ProductListModal.fromJson(data);

    setState(() {
      listData.data.addAll(list.data);
    });
  }

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // PageView
    return ProductResultListWidget(
      listData,
      getNextPage: () => getProductList(),
    );
  }
}