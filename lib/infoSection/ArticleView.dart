import 'package:flutter/material.dart';

class ArticleView extends StatefulWidget {
  final String imageURL, title, author, article;
  const ArticleView(
      {Key key,
      @required this.imageURL,
      @required this.title,
      @required this.author,
      @required this.article})
      : super(key: key);

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Color.fromARGB(250, 10, 0, 20),
      ),
      backgroundColor: Color.fromARGB(255, 4, 7, 50),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //height: 150,
              child: Image.network(
                widget.imageURL,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'By ' + widget.author,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue)),
              //height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // alignment: ,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  widget.article,
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
