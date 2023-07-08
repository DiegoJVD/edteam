import "package:flutter/material.dart";

class TextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final Function(String)? textEntry;

  const TextInput(
      {Key? key, this.controller, required this.title, this.textEntry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                    fontWeight:
                        Theme.of(context).textTheme.bodySmall!.fontWeight,
                    color: Colors.grey[600])),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: controller,
                onChanged: (value) {
                  if (textEntry != null) {
                    textEntry!(value);
                  }
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    disabledBorder: InputBorder.none),
              ),
            )
          ],
        ));
  }
}
