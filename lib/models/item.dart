class Item {
  final String name;
  final String price;
  final String imagePath;
  final String description;
  String selectedSize;
  int selectedQuantity;

  Item({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
    this.selectedSize = '',
    this.selectedQuantity = 0,
  });
}