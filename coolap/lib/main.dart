import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:coolap/pages/authenticate/firebase_auth.dart';
import 'package:coolap/pages/authenticate/authenticate.dart';

import 'etreguider.dart';
import 'guider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
      home: FirstPage(),
      debugShowCheckedModeBanner: false,
      //,HomePage()
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
          Image.asset('assets/codelab.png'),
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
          title: const Center(child: Text('Guide-Me')),
        ),
        body: Stack(children: <Widget>[
          const Positioned.fill(
            child: Image(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1500468756762-a401b6f17b46?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80"),
              fit: BoxFit.fill,
            ),
          ),
          const Positioned(
              bottom: 110,
              left: 10,
              child: Text(
                "Avant de commencer, nous devons savoir\nqui se cache derrière l'ecran.\n Etes-vous là pour guider ou pour être guidé ?",
                textAlign: TextAlign.center,
                textScaleFactor: 1.35,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
              )),
          Positioned(
              bottom: 10,
              left: 127.5,
              child: ElevatedButton(
                  child: const Text('Je suis là pour guider'),
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
                  child: const Text('Je suis là pour être guidé'),
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
