import 'package:coolap/pages/inscription.dart';
import 'package:flutter/material.dart';

class Guider extends StatelessWidget {
  // This is a String for the sake of an example.
  // You can use any type you want.
  final String data;

  Guider({
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
              'Guider, c’est quoi ? ',
              style: TextStyle(fontSize: 50),
            ),
            Text(
              "Guider c'est s'éxercer tout en permettant aux autres de s'éxercer  ",
              style: TextStyle(fontSize: 20),
            ),
            Positioned(
                bottom: 10,
                left: 127.5,
                child: ElevatedButton(
                    child: Text("s'inscrire"),
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
                          builder: (context) => InscriptionPage(
                              // remplace second page par le nom de la page
                              ),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
