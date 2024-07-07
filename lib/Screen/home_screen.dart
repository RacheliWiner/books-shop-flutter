import 'package:books_app/Screen/cart_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../Model/model.dart';
import 'book_detail.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback toggleDarkMode;
  final bool isDarkMode;

  HomeScreen({required this.toggleDarkMode, required this.isDarkMode});

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Book> displayBooks = books;
  TextEditingController searchController = TextEditingController();

  void _filterBooks(String query) {
    setState(() {
      displayBooks = books.where((book) {
        return book.title.toLowerCase().contains(query.toLowerCase()) ||
            book.author.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books App"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: widget.toggleDarkMode,
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: searchController,
                onChanged: _filterBooks,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search...",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _buildSectionTitle("Books Collection", widget.isDarkMode),
              SizedBox(
                height: 10,
              ),
              buildBooksSlider(displayBooks),
              SizedBox(
                height: 20,
              ),
              _buildSectionTitle("More Books", widget.isDarkMode),
              buildBookList(displayBooks),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isDarkMode) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        color: isDarkMode ? Colors.white : Colors.black,
      ),
    );
  }

  Widget buildBooksSlider(List<Book> books) {
    return CarouselSlider.builder(
      itemCount: books.length,
      itemBuilder: (context, index, child) {
        final book = books[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetailScreen(book: book),
              ),
            );
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(book.imageURL),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  color: Colors.black54,
                  child: Text(
                    book.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 1.7,
        autoPlayInterval: Duration(seconds: 5),
      ),
    );
  }

  Widget buildBookList(List<Book> books) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailScreen(book: book),
                ),
              );
            },
            child: Stack(
              children: [
                Container(
                  width: 180,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(book.imageURL),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
