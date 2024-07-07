import 'package:books_app/Model/model.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class CartScreen extends StatefulWidget {
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _removeItemFromCart(Book book) {
    setState(() {
      cart.remove(book);
    });
  }

  void _clearCart() {
    setState(() {
      cart.clear();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red,),
            onPressed: () => _clearCart(),
          ),
        ],
      ),
      body: cart.isEmpty
          ? Center(
              child: Text("You havn't added anything to your cart"),
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
                        subtitle: Text("\$" + book.price),
                        trailing: IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            _removeItemFromCart(book);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => PaymentPage(onPaymentSuccess: _clearCart),
                      //   ),
                      // );
                    },
                    child: Text("Pay Now"),
                  ),
                ),
              ],
            ),
    );
  }
}
