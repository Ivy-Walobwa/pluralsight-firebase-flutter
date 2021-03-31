import 'package:flutter/material.dart';
import 'package:wiredbrain/models/sugar_cube.dart';

class CoffeeSugar extends StatelessWidget {
  CoffeeSugar({
    Key? key,
    required this.sugar,
    required this.onPressed,
  }) : super(key: key);

  final CoffeeSugarCube sugar;
  final Function(CoffeeSugarCube) onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          "Sugar",
          style: TextStyle(
            color: Colors.grey.shade700,
          ),
        ),
        SizedBox(width: 40),
        IconButton(
          icon: Icon(
            CoffeeSugarCube.no.iconData,
            color: getColor(sugar == CoffeeSugarCube.no),
          ),
          onPressed: () {
            onPressed(CoffeeSugarCube.no);
          },
        ),
        IconButton(
          icon: Icon(
            CoffeeSugarCube.one.iconData,
            color: getColor(sugar == CoffeeSugarCube.one),
          ),
          onPressed: () {
            onPressed(CoffeeSugarCube.one);
          },
        ),
        IconButton(
          icon: Row(
            children: <Widget>[
              Icon(
                CoffeeSugarCube.two.iconData,
                color: getColor(sugar == CoffeeSugarCube.two),
              ),
              Flexible(
                child: Icon(
                  CoffeeSugarCube.two.iconData,
                  color: getColor(sugar == CoffeeSugarCube.two),
                ),
              ),
            ],
          ),
          onPressed: () {
            onPressed(CoffeeSugarCube.two);
          },
        ),
      ],
    );
  }

  getColor(bool isSelected) {
    return isSelected ? Colors.brown.shade800 : Colors.grey.shade400;
  }
}
