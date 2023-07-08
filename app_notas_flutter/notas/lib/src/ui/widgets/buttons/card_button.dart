import "package:flutter/material.dart";
import "package:notas/src/core/controllers/theme_controller.dart";

class CardButton extends StatelessWidget {
  final String? title;
  final bool isPrimary;
  final IconData? icon;
  final Function? onTap;

  const CardButton(
      {Key? key,
      this.title,
      this.isPrimary = true,
      required this.icon,
      required this.onTap})
      : super(key: key);

  Color getColor(BuildContext context) {
    return ThemeController.instance.background();
  }

  Color getTextColor(BuildContext context) {
    return ThemeController.instance.lightValue ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      height: 100,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: getColor(context),
          borderRadius: BorderRadius.circular(8)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        icon != null
            ? Icon(
                icon,
                size: 28,
                color: getTextColor(context),
              )
            : SizedBox(),
        SizedBox(
          height: 8,
        ),
        Text(
          title!,
          style: TextStyle(
            color: getTextColor(context),
          ),
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
