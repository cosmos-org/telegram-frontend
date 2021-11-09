import 'package:flutter/material.dart';
import 'package:project_telegram/constants.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String centerText;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final VoidCallback? leftOnPressed;
  final VoidCallback? rightOnPressed;

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  const Header({
    Key? key,
    required this.centerText,
    this.leftIcon,
    this.rightIcon,
    this.leftOnPressed, this.rightOnPressed,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: kPrimaryColor,
        leading: Button(
          icon: leftIcon,
          onPressed: leftOnPressed,
        ),
        title: Center(
          child: Text(centerText),
        ),
        actions: <Widget>[
          Button(
            icon: rightIcon,
            onPressed: rightOnPressed
          ),
        ]
    );
  }
}

class Button extends StatelessWidget {
  final IconData? icon;

  // final String? label;
  final VoidCallback? onPressed;

  const Button({
    Key? key,
    this.icon,
    // this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      icon != null ? IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
      ): const Icon(null);
  }
}
