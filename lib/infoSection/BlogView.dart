import 'package:flutter/material.dart';
import 'package:project_pcbuildhelper/Services/Database.dart';
import 'package:project_pcbuildhelper/infoSection/ArticleView.dart';

class BlogView extends StatefulWidget {
  final String category;
  const BlogView({Key key, @required this.category}) : super(key: key);

  @override
  _BlogViewState createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  DatabaseService dbconn = new DatabaseService();

  Stream blogsStream;

  // ignore: non_constant_identifier_names
  Widget BlogsList() {
    ScrollController _controller = new ScrollController();
    if (blogsStream == null) {
      return Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
    } else {
      return Container(
          child: ListView(shrinkWrap: true, children: [
        Column(
          children: <Widget>[
            StreamBuilder(
              stream: blogsStream,
              builder: (context, streamSnapshot) {
                if (streamSnapshot.data == null) {
                  return CircularProgressIndicator();
                }
                return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    controller: _controller,
                    itemCount: streamSnapshot.data.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return BlogsTile(
                        authorName:
                            streamSnapshot.data.docs[index].data()['Author'],
                        title: streamSnapshot.data.docs[index].data()["Title"],
                        article:
                            streamSnapshot.data.docs[index].data()['Article'],
                        imgUrl:
                            streamSnapshot.data.docs[index].data()['imageURL'],
                      );
                    });
              },
            )
          ],
        ),
      ]));
    }
  }

  @override
  void initState() {
    dbconn.getData(widget.category).then((result) {
      setState(() {
        blogsStream = result;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Blog View",
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(250, 10, 0, 20),
      ),
      backgroundColor: Color.fromARGB(255, 4, 7, 50),
      body: BlogsList(),
    );
  }
}

class BlogsTile extends StatelessWidget {
  String imgUrl, title, article, authorName;
  BlogsTile(
      {@required this.imgUrl,
      @required this.title,
      @required this.article,
      @required this.authorName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ArticleView(
                  title: title,
                  imageURL: imgUrl,
                  author: authorName,
                  article: article,
                )));
        print(article);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10, top: 10),
        height: 150,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imgUrl,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 170,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      //background: ,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'By ' + authorName,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        //background: ,
                        color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
