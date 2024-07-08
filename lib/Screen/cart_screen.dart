import 'package:books_app/Model/model.dart';
import 'package:books_app/Screen/payment_screen.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _removeFromeCart(Book book) {
    setState(() {
      cart.remove(book);
    });
  }

  void _ClearCart() {
    setState(() {
      cart.clear();
    });
  }

  double _calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var book in cart) {
      totalPrice += double.tryParse(book.price) ?? 0.0;
    }
    return totalPrice;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cart"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.grey,
            ),
            onPressed: () => _ClearCart(),
          ),
        ],
      ),
      body: cart.isEmpty
          ? Center(
              child: Text('Your cart is empty'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final book = cart[index];
                      return ListTile(
                        leading: Image.asset(book.imageURL),
                        title: Text(book.title),
                        subtitle: Text('\$${book.price}'),
                        trailing: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () => _removeFromeCart(book),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        'Total: \$${_calculateTotalPrice().toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentPage(onPaymentSuccess: _ClearCart),
                              ),
                          );
                        },
                        child: Text('Pay Now'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}