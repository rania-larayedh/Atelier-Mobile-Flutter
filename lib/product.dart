class Product {
  final String name;
  final double price;
  final String image;
  final bool isNew;
  final double rating;
  int quantity;

  Product(
    this.name,
    this.price,
    this.image, {
    this.isNew = false,
    this.rating = 0.0,
    this.quantity = 1,
  });
}
