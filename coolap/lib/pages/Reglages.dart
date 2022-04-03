import 'package:coolap/pages/menu.dart';
import 'package:flutter/material.dart';

class TabBarDemo2 extends StatelessWidget {
  const TabBarDemo2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_run)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.waves)),
              ],
            ),
            title: Center(child: const Text('Sport')),
          ),
          body: const TabBarView(
            children: [
              MyStatefulWidget(),
              MyStatefulWidget(),
              MyStatefulWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

enum niveau { a, b, c }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  niveau? _character = niveau.a;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Niveau',
          style: TextStyle(fontSize: 20),
        ),
        ListTile(
          title: const Text('Débutant'),
          leading: Radio<niveau>(
            value: niveau.a,
            groupValue: _character,
            onChanged: (niveau? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Confirmé'),
          leading: Radio<niveau>(
            value: niveau.b,
            groupValue: _character,
            onChanged: (niveau? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Expert'),
          leading: Radio<niveau>(
            value: niveau.c,
            groupValue: _character,
            onChanged: (niveau? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        Text(
          'Distance',
          style: TextStyle(fontSize: 20),
        ),
        MyStatefulWidgetSlider(),
        Text(
          'Disponibilités',
          style: TextStyle(fontSize: 20),
        ),
        Row(
          children: [
            MyStatefulWidgetCheckBox(),
            Text('Lundi'),
          ],
        ),
        Row(
          children: [
            MyStatefulWidgetCheckBox(),
            Text('Mardi'),
          ],
        ),
        Row(
          children: [
            MyStatefulWidgetCheckBox(),
            Text('Mercredi'),
          ],
        ),
        Row(
          children: [
            MyStatefulWidgetCheckBox(),
            Text('Jeudi'),
          ],
        ),
        Row(
          children: [
            MyStatefulWidgetCheckBox(),
            Text('Vendredi'),
          ],
        ),
        Row(
          children: [
            MyStatefulWidgetCheckBox(),
            Text('Samedi'),
          ],
        ),
        Row(
          children: [
            MyStatefulWidgetCheckBox(),
            Text('Dimanche'),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 15)),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Dashboard()));
          },
          child: const Text('Revenir au menu'),
        ),
      ],
    );
  }
}

class MyStatefulWidgetSlider extends StatefulWidget {
  const MyStatefulWidgetSlider({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidgetSlider> createState() => _MyStatefulWidgetStateSlider();
}

class _MyStatefulWidgetStateSlider extends State<MyStatefulWidgetSlider> {
  double _currentSliderValue = 15;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 5,
      max: 100,
      divisions: 100,
      label: _currentSliderValue.round().toString() + 'km',
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}

class MyStatefulWidgetCheckBox extends StatefulWidget {
  const MyStatefulWidgetCheckBox({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidgetCheckBox> createState() =>
      _MyStatefulWidgetStateCheckBox();
}

class _MyStatefulWidgetStateCheckBox extends State<MyStatefulWidgetCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blue;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
