class Product {
  int id;
  String productName;
  String productImage;
  String productDescription;
  double price;

  Product(this.id, this.productName, this.productImage, this.productDescription,
      this.price);

  String getName() {
    return productName;
  }

  double getPrice() {
    return price;
  }
}
