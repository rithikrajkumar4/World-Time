import 'package:flutter/material.dart';
import 'quotes.dart';
import 'qoutesTemplate.dart';

void main() {
  runApp(MaterialApp(
    home: QuoteList(),
  ));
}

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List <Quotes> qoutes = [
    Quotes(text: 'Be yourself , everyone has been already taken',author:'oscar wilde'),
    Quotes(text: 'I have nothing to declare expect my genius',author:'MG'),
    Quotes(author:"I dont Know",text: 'The truth is rarely pure and never simple')
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        title: Text(
          "Quotes List",
          style: TextStyle(
          color: Colors.grey[100],

          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: qoutes.map((e) =>QuoteCard(
            quote : e,
            delete : () {
              setState(() {
                qoutes.remove(e);
              });
            },
        )
        ).toList()
      ),
    );
  }
}




