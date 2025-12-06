import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  final String? svgIcon;
  final IconData? icon;

  final bool isFullWidth;
  final double borderRadius;

  final EdgeInsetsGeometry padding;
  final double? iconSize;

  const CustomActionButton({
    super.key,
    required this.label,
    required this.onTap,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    this.borderColor = Colors.black,
    this.svgIcon,
    this.icon,
    this.isFullWidth = false,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    final buttonChild = Row(
      mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (svgIcon != null)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SvgPicture.asset(
              svgIcon!,
              width: iconSize ?? 22,
              height: iconSize ?? 22,
            ),
          ),
        if (icon != null)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(icon, size: iconSize ?? 22, color: textColor),
          ),
        
        Text(
          label,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ],
    );

    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: padding,
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor),
          ),
        ),
        child: buttonChild,
      ),
    );
  }
}
