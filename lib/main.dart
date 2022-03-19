import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Discover and Share',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LView(),
    );
  }
}

class LView extends StatefulWidget {
  @override
  _LViewState createState() => _LViewState();
}

class _LViewState extends State<LView> {
  bool isLiked = false;
  var likes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: drawer(),
      body: myStore(),
    );
  }

  //APPBAR CODE
  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Pixabay',
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          letterSpacing: 1,
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }

  //DRAWER CODE
  Drawer drawer() {
    return Drawer(
      child: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.black87,
            width: 100,
            height: 100,
            child: const DrawerHeader(
              child: Text(
                'iStock',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .5,
                ),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.picture_in_picture,
              size: 15,
            ),
            title: Text(
              'Photos',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.picture_in_picture,
              size: 15,
            ),
            title: Text(
              'Images',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //STORE CODE
  Widget myStore() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          richText(),
          rowView(
              'https://cdn.pixabay.com/photo/2021/03/16/21/46/tea-6101059_1280.jpg',
              'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
          const Divider(),
          rowView(
              'https://cdn.pixabay.com/photo/2015/06/24/01/15/coffee-819362_1280.jpg',
              'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.'),
          const Divider(),
          rowView(
              'https://cdn.pixabay.com/photo/2015/05/25/14/29/tea-783352_1280.jpg',
              'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.'),
        ],
      ),
    );
  }

  //WELCOME MESSAGE
  Widget richText() {
    return Center(
      child: RichText(
        text: const TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'Welcome To My Store',
              style: TextStyle(
                fontSize: 32,
                color: Colors.lightBlue,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //ROW VIEW
  Widget rowView(_url, _msgdec) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(2.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(_url),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              _msgdec,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            icon: Icon(
              isLiked == false
                  ? Icons.favorite_border_outlined
                  : Icons.favorite,
              color: Colors.red,
              size: 15,
            ),
            onPressed: () {
              setState(
                () {
                  if (isLiked) {
                    likes--;
                    isLiked = false;

                    //SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Feel Bad!'),
                        duration: const Duration(
                          seconds: 3,
                        ),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      ),
                    );
                  } else {
                    likes++;
                    isLiked = true;

                    //SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Feel Good!'),
                        duration: const Duration(
                          seconds: 3,
                        ),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      ),
                    );
                  }
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            child: Text(
              likes.toString(),
            ),
          ),
        ],
      ),
    );
  }

  showMySnack(content) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: content,
        duration: const Duration(
          seconds: 3,
        ),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}
