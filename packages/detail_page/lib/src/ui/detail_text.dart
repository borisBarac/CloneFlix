// ignore_for_file: type_annotate_public_apis

import 'package:detail_page/src/ui/shared_consts.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared_helpers.dart';

/// Description text with truncation and expansion on click
class DetailText extends StatefulWidget {
  ///
  const DetailText(this.text, {super.key});

  ///
  final String text;

  @override
  State<DetailText> createState() => _DetailTextState();
}

class _DetailTextState extends State<DetailText> {
  var isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(
        () {
          isExpanded = !isExpanded;
        },
      ),
      child: Padding(
        padding: defaultEdges,
        child: Text(
          widget.text,
          textAlign: TextAlign.justify,
          maxLines: isExpanded ? null : 2,
          overflow: isExpanded ? null : TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
