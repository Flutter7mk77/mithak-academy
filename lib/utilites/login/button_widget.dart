import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const ButtonWidget({
    Key key,
    @required this.onClicked,
    text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(),
        child: buildContent(),
        onPressed: onClicked,
      );

  Widget buildContent() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Center(child: Text('  أهلا بك')),
            alignment: Alignment.center,
          ),
          SizedBox(
            width: 16,
            // height: 12,
          ),
        ],
      );
}
