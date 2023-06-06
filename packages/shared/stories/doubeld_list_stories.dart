import 'package:flutter/material.dart';
import 'package:shared/src/ui/doubled_list/doubled_list.dart';

Widget list() => fakeDoubledList();

Widget sliverList() => Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          fakeDoubledSliverList(),
        ],
      ),
    );
