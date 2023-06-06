// ignore_for_file: prefer_const_constructors

import 'package:detail_page/detail_page.dart';
import 'package:detail_page/src/blocks/details/detail_bloc.dart';
import 'package:detail_page/src/ui/detail_page_core.dart';
import 'package:flutter/material.dart';

Widget relatedRow() => makeRelatedRowStory();

Widget detailPage() =>
    createDetailPage(id: 1, type: DetailsType.movie, mockNetwork: true);
