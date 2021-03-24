import 'dart:math';

import 'package:flutter/material.dart';

// a rectangle that:
// (1) has a width to length ratio of two to three; and
// (2) contains:
// (A) one blue vertical stripe that has a width equal to one-third the length of the flag;
// (B) two equal horizontal stripes, the upper stripe white, the lower stripe red, each having a length equal to two-thirds the length of the flag; and
// (C) one white, regular five-pointed star:
// (i) located in the center of the blue stripe;
// (ii) oriented so that one point faces upward; and
// (iii) sized so that the diameter of a circle passing through the five points of the star is equal to three-fourths the width of the blue stripe.

class TexanFlagDemo extends StatefulWidget {
  @override
  _TexanFlagDemoState createState() => _TexanFlagDemoState();
}

class _TexanFlagDemoState extends State<TexanFlagDemo> {
  static const _white = Color(0xFFFFFFFF);
  static const _red = Color(0xFFBF0D3E);
  static const _blue = Color(0xFF00205B);

  static const _widthToHeightRatio = 3 / 2;

  Color _cantonColor = _blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AspectRatio(
        aspectRatio: _widthToHeightRatio,
        child: Stack(
          children: [
            _stripes(),
            _canton(),
            _star(),
          ],
        ),
      ),
    );
  }

  Widget _stripes() {
    return Column(
      children: [
        _stripe(2, color: _white),
        _stripe(2, color: _red),
      ],
    );
  }

  Widget _stripe(int normalParameter, {@required Color color}) {
    return Expanded(child: Container(color: color));
  }

  Widget _canton() {
    return GestureDetector(
      onTap: () {
        _updateCantonColor();
      },
      child: FractionallySizedBox(
        widthFactor: 1 / 3,
        child: Container(
          color: _cantonColor,
        ),
      ),
    );
  }

  void _updateCantonColor() {
    final rand = Random();

    final color = Color.fromARGB(
        128, rand.nextInt(256), rand.nextInt(256), rand.nextInt(256));
    setState(() {
      _cantonColor = color;
    });
  }

  Widget _star() {
    return Align(
      alignment: FractionalOffset(1 / 12 / _widthToHeightRatio, .5),
      child: FractionallySizedBox(
        widthFactor: 1 / 4, // 3/4 * 1/3
        child: AspectRatio(
          aspectRatio: 1,
          child: LayoutBuilder(
            builder: (context, constraint) {
              return Image.asset(
                'images/themoreyouknow.gif',
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
    );
  }
}
