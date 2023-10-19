import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  final String? loggedInUsername;
  final List<Map<String, dynamic>> cartItems;

  CheckoutPage({
    required this.loggedInUsername,
    required this.cartItems, required String itemTitle, required String itemPrice,
  });

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Ringkasan Pesanan:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
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
            // Tampilkan daftar item yang ada dalam widget.cartItems
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = widget.cartItems[index];
                final itemTitle = cartItem['title'];
                final itemPrice = cartItem['price'];
                int quantity = cartItem['quantity'] ?? 1;

                return ListTile(
                  title: Text(itemTitle),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Harga: $itemPrice'),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // Kurangi jumlah buku
                              setState(() {
                                if (quantity > 1) {
                                  quantity--;
                                } else {
                                  // Hapus item jika jumlah mencapai 0
                                  widget.cartItems.removeAt(index);
                                }
                              });
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text('$quantity'), // Tampilkan jumlah buku
                          IconButton(
                            onPressed: () {
                              // Tambah jumlah buku
                              setState(() {
                                quantity++;
                              });
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle logic saat tombol "Selesaikan Pembelian" ditekan
                // Misalnya, simpan pesanan ke database atau lakukan tindakan lainnya
                // Setelah itu, bisa navigasi ke halaman konfirmasi atau halaman lainnya.
              },
              child: Text('Selesaikan Pembelian'),
            ),
          ],
        ),
      ),
    );
  }
}
