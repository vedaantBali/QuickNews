import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff121212),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Quick'),
            Text(
              'News',
              style: TextStyle(color: Colors.indigoAccent),
            )
          ],
        ),
      ),
    );
  }
}