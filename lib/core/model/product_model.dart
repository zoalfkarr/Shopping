class Product {
  final int? id;
  final String title;
  final String quantity;
  Product({this.id, required this.title, required this.quantity});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'quantity': quantity};
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      quantity: map['quantity'],
    );
  }
}
