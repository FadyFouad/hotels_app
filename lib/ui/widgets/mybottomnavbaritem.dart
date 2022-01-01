import 'package:flutter/material.dart';
import 'package:hotels_app/utils/colours.dart';

class MyBottomNavBarItem extends StatelessWidget {
  final int id;
  final int active;
  final VoidCallback function;
  final String text;
  final IconData icon;
  const MyBottomNavBarItem(
      {Key? key, required this.active, required this.function, required this.id, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 9.0),
        decoration: BoxDecoration(
          color: active == id ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: active == id ? Colors.blue[900] : Colors.white,
            ),
            const SizedBox(width: 5),
            active == id
                ? Text(
                    text,
                    style: const TextStyle(
                        color: MyColors.darkBlue, fontWeight: FontWeight.bold),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
