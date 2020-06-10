import 'package:flutter/material.dart';
import '../model/product.dart';
import '../utils/utils.dart';
import 'product_detail_page.dart';

class HomeProductPage extends StatelessWidget{

  final ProductListModal list;
  HomeProductPage(this.list);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: deviceWidth,
      color: Colors.white,
      padding: EdgeInsets.only(top: 10,bottom: 10,left: 7.5),
      child: _build(context, deviceWidth),
    );
  }

  Widget _build(BuildContext context, double deviceWidth){

    double itemWidth = deviceWidth * 168.5 / 360;
    double imageWidth = deviceWidth * 110.0 / 360;

    List<Widget> listWigdets = list.data.map((i){
      var bgColor = string2Color('#f8f8f8');
      var titleColor = string2Color('#db5d41');
      var subTitleColor = string2Color('#999999');

      return GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(item:i)),
          );
        },
        child: Container(
            width: itemWidth,
            margin: EdgeInsets.only(bottom: 15,left: 2),
            padding: EdgeInsets.only(top:10,left: 13,bottom: 7),
            color: bgColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  i.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15,color: titleColor),
                ),
                Text(
                  i.desc,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15,color: subTitleColor),
                ),
                Container(
                  alignment: Alignment(0, 0),
                  margin: EdgeInsets.only(top:5),
//                child: Image.network(
//                  i.imageUrl,
//                  width: imageWidth,
//                  height: imageWidth,
//                ),
                    child: Image.asset(
                      i.imageUrl,
                      width: imageWidth,
                      height: imageWidth,
                    ),
                )
              ],
            ),
        ),
      );
    }).toList();

    //标题及产品列表
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 5,bottom: 10),
          child: Text('最新产品', style: TextStyle(
              fontSize: 16.0,
              color: Color.fromRGBO(51, 51, 51, 1)
          ),),
        ),
        Wrap(
          spacing: 2,
          children: listWigdets,
        ),
      ],
    );
  }
}