import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final String eventName;
  const Loading({Key? key, this.eventName = "Loading..."}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              strokeWidth: 6.0,
              color: const Color(0xFFF8AB08),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            const SizedBox(width: 16),
            Text(
              eventName,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
