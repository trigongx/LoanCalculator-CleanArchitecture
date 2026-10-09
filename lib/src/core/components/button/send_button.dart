import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  const SendButton({super.key, required this.sendAction, required this.text});

  final void Function() sendAction;
  final String text;

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return TextButton(
      onPressed: () => sendAction.call(),
      style: TextButton.styleFrom(
        backgroundColor: colors.primary,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
      ),
      child: Text(text, style: Theme.of(context).textTheme.labelLarge),
    );
  }
}
