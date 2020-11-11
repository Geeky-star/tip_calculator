import 'package:flutter/material.dart';

class Item {
  const Item(this.name);
  final String name;
}

class Dropdown extends StatefulWidget {
  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  Item selectedService;

  List<Item> ratings = <Item>[
    const Item('Bad Service'),
    const Item('Good Service'),
    const Item('Fine Service'),
    const Item('Perfect Service')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: DropdownButton<Item>(
        hint: Text("--Choose an Option--"),
        value: selectedService,
        onChanged: (Item value) {
          setState(() {
            selectedService = value;
          });
        },
        items: ratings.map((Item rating) {
          return DropdownMenuItem<Item>(
            value: rating,
            child: Row(
              children: <Widget>[Text(rating.name)],
            ),
          );
        }).toList(),
      ),
    );
  }
}
