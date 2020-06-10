class ProductItemModal{
  String desc;
  String type;
  String name;
  String imageUrl;

  ProductItemModal({
    this.desc,
    this.imageUrl,
    this.name,
    this.type
  });

  factory ProductItemModal.fromJson(dynamic json){
    return ProductItemModal(
        desc: json['desc'],
        type: json['type'],
        name: json['name'],
        imageUrl: json['imageUrl']
    );
  }
}

class ProductListModal{

  List<ProductItemModal> data;
  ProductListModal(this.data);

  factory ProductListModal.fromJson(List json){
    return ProductListModal(
        json.map((i) => ProductItemModal.fromJson((i))).toList()
    );
  }
}