import 'package:flutter/material.dart';
import '../../../size_config.dart';

class HomeCard extends StatelessWidget {
  final Function press;
  final int amount;
  final String text;

  const HomeCard({Key key, this.press, this.amount, this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    // Now we dont this Aspect ratio
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(defaultSize * 1.8), //18
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 5), blurRadius: 10)
            ]),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(defaultSize * 2), //20
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "$amount",
                      style: TextStyle(
                          fontSize: defaultSize * 3.7, //22
                          color: Colors.black),
                    ),
                    SizedBox(height: defaultSize * 0.5), // 5
                    Text(
                      "$text",
                      style: TextStyle(color: Colors.black),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(width: defaultSize * 0.5), //5
          ],
        ),
      ),
    );
  }
}
