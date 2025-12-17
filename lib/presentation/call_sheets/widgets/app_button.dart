import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  final String label;
  final String? icon;
  final String? suffixIcon;
  final VoidCallback? onTap;

  // Colors / Border
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  final double borderWidth;
  final Gradient? gradient;

  // Layout
  final double borderRadius;
  final EdgeInsets padding;
  final double iconSize;
  final double spacing;
  final bool fullWidth;

  // Size
  final double? width;
  final double height;

  // Effects
  final double elevation;
  final Color? shadowColor;
  final Color? splashColor;

  // Loading
  final bool isLoading;
  final TextStyle? textStyle;

  const AppButton({
    super.key,
    required this.label,
    required this.onTap,

    this.icon,
    this.suffixIcon,

    // Colors
    this.buttonColor,
    this.textColor,
    this.borderColor,
    this.borderWidth = 1,
    this.gradient,

    // Layout
    this.borderRadius = 8,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.iconSize = 20,
    this.spacing = 8,

    this.fullWidth = false,

    // Size
    this.width,
    this.height = 48,

    // Effects
    this.elevation = 0,
    this.shadowColor,
    this.splashColor,

    // Loading
    this.isLoading = false,
    this.textStyle,
  });

  //   @override
  //   Widget build(BuildContext context) {
  //     final Color defaultTextColor = textColor ?? Colors.black;

  //     final Widget content = Row(
  //       mainAxisSize: MainAxisSize.min,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         if (icon != null)
  //           SvgPicture.asset(icon!, width: iconSize, height: iconSize),
  //         if (icon != null) SizedBox(width: spacing),

  //         if (!isLoading)
  //           Flexible(
  //             child: FittedBox(
  //               fit: BoxFit.scaleDown,
  //               child: Text(
  //                 label,
  //                 style:
  //                     textStyle ??
  //                     GoogleFonts.montserrat(
  //                       color: defaultTextColor,
  //                       fontSize: 14,
  //                       fontWeight: FontWeight.w600,
  //                     ),
  //               ),
  //             ),
  //           )
  //         else
  //           SizedBox(
  //             width: 18,
  //             height: 18,
  //             child: CircularProgressIndicator(
  //               strokeWidth: 2,
  //               color: defaultTextColor,
  //             ),
  //           ),

  //         if (suffixIcon != null) SizedBox(width: spacing),
  //         if (suffixIcon != null)
  //           SvgPicture.asset(suffixIcon!, width: iconSize, height: iconSize),
  //       ],
  //     );

  //     final ButtonStyle style = ButtonStyle(
  //       minimumSize: MaterialStateProperty.all(Size(width ?? 0, height)),
  //       padding: MaterialStateProperty.all(padding),
  //       elevation: MaterialStateProperty.all(elevation),
  //       backgroundColor: MaterialStateProperty.all(
  //         buttonColor ?? Colors.transparent,
  //       ),
  //       foregroundColor: MaterialStateProperty.all(defaultTextColor),
  //       shadowColor: MaterialStateProperty.all(shadowColor),
  //       overlayColor: MaterialStateProperty.all(splashColor),
  //       shape: MaterialStateProperty.all(
  //         RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(borderRadius),
  //           side: BorderSide(
  //             color: borderColor ?? Colors.transparent,
  //             width: borderWidth,
  //           ),
  //         ),
  //       ),
  //     );

  //     // return SizedBox(
  //     //   width: fullWidth ? double.infinity : width,
  //     //   height: height,
  //     //   child: ElevatedButton(onPressed: onTap, style: style, child: content),
  //     // );
  //     return SizedBox(
  //   width: fullWidth ? double.infinity : width,
  //   height: height,
  //   child: Container(
  //     decoration: BoxDecoration(
  //       gradient: gradient, // 👈 gradient applied here
  //       borderRadius: BorderRadius.circular(borderRadius),
  //       boxShadow: elevation > 0
  //           ? [
  //               BoxShadow(
  //                 color: shadowColor ?? Colors.black.withOpacity(0.2),
  //                 blurRadius: elevation,
  //               ),
  //             ]
  //           : null,
  //     ),
  //     child: ElevatedButton(
  //       onPressed: onTap,
  //       style: style.copyWith(
  //         backgroundColor: MaterialStateProperty.all(
  //           gradient != null ? Colors.transparent : buttonColor,
  //         ),
  //         shadowColor: MaterialStateProperty.all(Colors.transparent),
  //       ),
  //       child: content,
  //     ),
  //   ),
  // );

  //   }

  @override
  Widget build(BuildContext context) {
    final Color defaultTextColor = textColor ?? Colors.black;

    final Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null)
          SvgPicture.asset(icon!, width: iconSize, height: iconSize),
        if (icon != null) SizedBox(width: spacing),

        if (!isLoading)
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:
                textStyle ??
                GoogleFonts.montserrat(
                  color: defaultTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
          )
        else
          SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: defaultTextColor,
            ),
          ),

        if (suffixIcon != null) SizedBox(width: spacing),
        if (suffixIcon != null)
          SvgPicture.asset(suffixIcon!, width: iconSize, height: iconSize),
      ],
    );

    final ButtonStyle style = ElevatedButton.styleFrom(
      elevation: elevation,
      padding: padding,
      foregroundColor: defaultTextColor,
      shadowColor: Colors.transparent,
      backgroundColor: gradient != null
          ? Colors.transparent
          : (buttonColor ?? Colors.transparent),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(
          color: borderColor ?? Colors.transparent,
          width: borderWidth,
        ),
      ),
    );

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: height,
        minWidth: fullWidth ? double.infinity : (width ?? 0),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: elevation > 0
              ? [
                  BoxShadow(
                    color: shadowColor ?? Colors.black.withOpacity(0.2),
                    blurRadius: elevation,
                  ),
                ]
              : null,
        ),
        child: ElevatedButton(onPressed: onTap, style: style, child: content),
      ),
    );
  }
}
