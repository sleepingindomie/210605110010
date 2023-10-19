import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderPage extends StatelessWidget {
  final String? loggedInUsername;
  final List<Map<String, dynamic>> cartItems;
  final DateTime orderDateTime;

  OrderPage({
    required this.loggedInUsername,
    required this.cartItems,
    required this.orderDateTime,
  });

  @override
  Widget build(BuildContext context) {
    // Format tanggal sesuai dengan preferensi lokal pengguna
    String formattedDateTime = DateFormat('dd MMMM yyyy, HH:mm').format(orderDateTime);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pesananmu'),
        backgroundColor: Color.fromARGB(255, 21, 156, 156), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Detail Pesanan:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Pemesan: ${loggedInUsername ?? "Tamu"}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Tanggal Pesanan: $formattedDateTime',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Item yang Dibeli:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Tampilkan daftar item yang ada dalam cartItems
            if (cartItems.isNotEmpty) // Tampilkan daftar item hanya jika ada item dalam cartItems
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartItems[index];
                    final itemTitle = cartItem['title'];
                    final itemPrice = cartItem['price'];
                    final quantity = cartItem['quantity'] ?? 1; // Ambil variabel quantity

                    return ListTile(
                      title: Text(itemTitle),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Harga: $itemPrice'),
                          Text('Jumlah: $quantity'),
                        ],
                      ),
                    );
                  },
                ),
              ),
            if (cartItems.isEmpty) // Tampilkan pesan jika cartItems kosong
              Text('Belum ada item yang dibeli.'),
          ],
        ),
      ),
    );
  }
}
