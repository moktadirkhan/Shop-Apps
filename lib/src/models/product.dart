class Product {
  String? productId;
  String? productName;
  String? merchantId;
  String? merchantName;
  double? regularPrice;
  double? discountedPrice;
  int? discount;
  String? description;
  List<String>? sizes;

  Product({
    this.productId,
    this.productName,
    this.merchantId,
    this.merchantName,
    this.regularPrice,
    this.discountedPrice,
    this.discount,
    this.description,
    this.sizes,
  });
}
