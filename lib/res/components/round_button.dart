import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPresses;
  const RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPresses});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPresses,
      child: Container(
        margin: EdgeInsets.all(2),
        height: 40,
        child:
            Center(child: loading ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Please wait..."),
            ) : Text(title)),
        width: 200,
        decoration: BoxDecoration(
            color: Colors.amberAccent, borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
