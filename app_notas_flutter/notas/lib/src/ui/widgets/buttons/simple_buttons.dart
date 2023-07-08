import "package:flutter/material.dart";
import "package:notas/src/core/controllers/theme_controller.dart";


class MediumButton extends StatelessWidget {
  final String? title;
  final bool isPrimary;
  final IconData? icon;
  final Function? onTap;

  const MediumButton({Key? key, this.title, this.isPrimary = true, this.icon, required this.onTap}) : super(key: key);

  Color getColor(BuildContext context) {
    if (isPrimary) {
      return ThemeController.instance.primaryButton();
    } else {
      return ThemeController.instance.secondaryButton();
    }
  }

  Color getTextColor(BuildContext context) {
    return !ThemeController.instance.lightValue ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: getColor(context),
        borderRadius: BorderRadius.circular(32)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        icon != null ? Icon(icon, color: ThemeController.instance.background(),) : SizedBox(width: icon != null ? 8 : 0,),
        Text(title!, style: TextStyle(color: getTextColor(context)),),
      ]),
    );
  }
}