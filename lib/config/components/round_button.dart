import 'package:flutter/material.dart';
import 'package:youtube_bloc_tutorial/config/style/colors/app_colors.dart';

class RoundButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  final double width, height;
  final Color btnColor, titleColor;
  final double fontSize;

  const RoundButton(
      {super.key,
      this.width = 180,
      this.height = 44,
      this.btnColor = AppColors.blueButtonColor,
      this.titleColor = AppColors.whiteColor,
      this.fontSize = 16,
      required this.title,
      required this.onPressed});

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.btnColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
            child: Text(
          widget.title,
          style: TextStyle(fontSize: widget.fontSize, color: widget.titleColor),
        )),
      ),
    );
  }
}
