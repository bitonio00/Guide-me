import 'package:coolap/pages/inscription.dart';
import 'package:flutter/material.dart';

class EtreGuider extends StatelessWidget {
  // This is a String for the sake of an example.
  // You can use any type you want.
  final String data;

  EtreGuider({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Malvoyant'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Être guidé, c’est quoi ?\n\n\n',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "Être guidé, c’est être accompagné par un bénévole afin de pratiquer son sport en sécurité.\nC'est aussi l'occaion de nouer des liens solides.",
              style: TextStyle(fontSize: 20),
            ),
            Positioned(
                bottom: 10,
                left: 127.5,
                child: ElevatedButton(
                    child: Text("S'inscrire"),
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
