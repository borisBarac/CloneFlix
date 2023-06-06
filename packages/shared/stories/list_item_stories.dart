// ignore: lines_longer_than_80_chars
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_colored_box

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

Widget listItem() => Stack(
      children: [
        Container(color: Colors.green),
        ListItem(
          imagePath:
              'https://image.tmdb.org/t/p/original/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg',
        ),
      ],
    );
