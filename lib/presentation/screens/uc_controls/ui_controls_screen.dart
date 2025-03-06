import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controls'),
      ),
      body: _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDEveloper = true;
  Transportation selectTrasnsportation = Transportation.car;
  bool wantsBreagast = false;



  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('DEveloper'),
          subtitle: const Text('adiconal controls'),
          value: isDEveloper,
          onChanged: (value) => setState(() {
            isDEveloper = !isDEveloper;
          }),
        ),
        ExpansionTile(
          title: const Text('Trasnporte'),
          subtitle: const Text("Selected trasnportation"),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              value: Transportation.car,
              groupValue: selectTrasnsportation,
              onChanged: (value) => setState(() {
                selectTrasnsportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('By plane'),
              value: Transportation.plane,
              groupValue: selectTrasnsportation,
              onChanged: (value) => setState(() {
                selectTrasnsportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('By bote'),
              value: Transportation.boat,
              groupValue: selectTrasnsportation,
              onChanged: (value) => setState(() {
                selectTrasnsportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('By submarine'),
              value: Transportation.submarine,
              groupValue: selectTrasnsportation,
              onChanged: (value) => setState(() {
                selectTrasnsportation = Transportation.submarine;
              }),
            ),
          ],
        ),
        
        ElevatedButton(
          child: const Text('Obtain Value'),
          onPressed: () => print(selectTrasnsportation.name),
        ),
        CheckboxListTile(
          title: const Text("Quire desayuno ?"),
          subtitle: const Text("Seguro?"),
          value: wantsBreagast,
          onChanged: (value) => setState(() {
            wantsBreagast = !wantsBreagast;
          }),
        ),
      ],
    );
  }
}
