// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart';

class EmptyPageWidget extends StatelessWidget {
  const EmptyPageWidget({
    super.key,
    this.text,
    this.buttonTitle,
    this.reloadHandler,
  });
  final VoidCallback? reloadHandler;
  final String? text;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(flex: 10),
          Text(
            text ?? 'Something went wrong',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Spacer(),
          Visibility(
            visible: reloadHandler != null,
            child: ElevatedButton(
              onPressed: reloadHandler,
              child: const Text('Reload'),
            ),
          ),
          const Spacer(flex: 10),
        ],
      ),
    );
  }
}
