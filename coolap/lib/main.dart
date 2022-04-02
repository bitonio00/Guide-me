import 'package:coolap/etreguider.dart';
import 'package:coolap/guider.dart';
import 'package:coolap/pages/inscription.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coolap/pages/authenticate/firebase_auth.dart';
import 'package:coolap/pages/authenticate/authenticate.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // Initially display FirstPage
        home: HomePage()
        //FirstPage()

        );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Meetup'),
      ),
      body: ListView(
        children: <Widget>[
          Image(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1500468756762-a401b6f17b46?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80'),
          ),
          const SizedBox(height: 8),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Routing App'),
        ),
        body: Stack(children: <Widget>[
          Image(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1500468756762-a401b6f17b46?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80'),
          ),
          Positioned(
              bottom: 120,
              left: 10,
              child: Text(
                "Avant de commencer, nous devons savoir qui\n se cache derrière l'ecran. \n Etes-vous là pour guider ou pour être guidé ?",
                textAlign: TextAlign.center,
                textScaleFactor: 1.25,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
              )),
          Positioned(
              bottom: 10,
              left: 127.5,
              child: ElevatedButton(
                  child: Text('Je suis là pour guider.'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red[200],
                    onPrimary: Colors.white,
                    onSurface: Colors.grey,
                  ),
                  onPressed: () {
                    // Pushing a route directly, WITHOUT using a named route
                    Navigator.of(context).push(
                      // With MaterialPageRoute, you can pass data between pages,
                      // but if you have a more complex app, you will quickly get lost.
                      MaterialPageRoute(
                          builder: (context) => Guider(
                                data: '',
                              )
                          /* SecondPage(
                            data: 'Hello there from the first page!'),*/
                          ),
                    );
                  })),
          Positioned(
              bottom: 60,
              left: 115,
              child: ElevatedButton(
                  child: Text('Je suis là pour être guidé.'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red[200],
                    onPrimary: Colors.white,
                    onSurface: Colors.grey,
                  ),
                  onPressed: () {
                    // Pushing a route directly, WITHOUT using a named route
                    Navigator.of(context).push(
                      // With MaterialPageRoute, you can pass data between pages,
                      // but if you have a more complex app, you will quickly get lost.
                      MaterialPageRoute(
                          builder: (context) => EtreGuider(
                                data: '',
                              )
                          /*SecondPage(
                            data: 'Hello there from the first page!'),*/
                          ),
                    );
                  })),
        ]));
  }
}

class SecondPage extends StatelessWidget {
  // This is a String for the sake of an example.
  // You can use any type you want.
  final String data;

  SecondPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Second Page',
              style: TextStyle(fontSize: 50),
            ),
            Text(
              data,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
