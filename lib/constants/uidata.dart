class BarData {
  final String day;
  final double income;
  final double expense;

  BarData(this.day, this.income, this.expense);
}

class Product {
  final String id;
  final String imageUrl;
  final String name;
  final double price;
  final double originalPrice;
  final int discount;


  Product({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.discount,

  });
}
