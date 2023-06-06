import 'package:flutter/material.dart';

// ignore: public_member_api_docs
class FakeItem extends StatelessWidget {
  // ignore: public_member_api_docs
  const FakeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height:
            Theme.of(context).textTheme.headlineMedium!.fontSize! * 1.1 + 200.0,
      ),
      alignment: Alignment.center,
      child: Text(
        'FAKE',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
