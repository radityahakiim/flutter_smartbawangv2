class Item {
  final int? id;
  final int? userId;
  final int? petaniId;
  final String itemName;
  final int quantity;
  final double price;
  final String itemDesc;
  final DateTime tanggalPanen;

  Item(
      {this.id,
      this.userId,
      this.petaniId,
      required this.itemName,
      required this.quantity,
      required this.price,
      required this.tanggalPanen,
      required this.itemDesc});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'petani_id': petaniId,
      'item_name': itemName,
      'item_desc': itemDesc,
      'quantity': quantity,
      'price': price,
      'tanggal_panen': tanggalPanen.toIso8601String(),
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map['id'],
        userId: map['user_id'],
        petaniId: map['petani_id'],
        itemName: map['item_name'],
        quantity: map['quantity'],
        price: map['price'],
        tanggalPanen: DateTime.parse(map['tanggal_panen']),
        itemDesc: map['item_desc']);
  }
}
