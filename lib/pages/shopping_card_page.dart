import 'package:flutter/material.dart';

class ShoppingCardPage extends StatelessWidget {
  const ShoppingCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart Page'),
      ),
      body: SafeArea(
        child: Center(
          child: Text("Shopping Cart Page"),
        ),
      ),
    );
  }
}
