import 'package:flutter/material.dart';

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.color,
    this.trailing,
    this.onTap});

  final IconData icon;
  final String title,subTitle;
  final IconData? trailing;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 20, color: color),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium!.apply(color: color)),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelMedium),
      trailing: Icon(trailing, size: 20, color: color),
      onTap: onTap,
    );
  }
}