// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

Widget enabledRefresh() => EmptyPageWidget(reloadHandler: () {});

Widget disabledRefresh() => EmptyPageWidget();
