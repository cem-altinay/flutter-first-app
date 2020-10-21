class Product {
  int id;
  String name;
  String decription;
  int unitPrice;

  Product(this.name, this.decription, this.unitPrice);
  Product.withId(this.id, this.name, this.decription, this.unitPrice);
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["decription"] = decription;
    map["unitPrice"] = unitPrice;
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  Product.fromObject(dynamic o) {
    this.id = int.tryParse(o["id"].toString());
    this.name = o["name"];
    this.decription = o["decription"];
    this.unitPrice = int.tryParse(o["unitPrice"].toString());
  }
}
