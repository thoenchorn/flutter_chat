import 'package:chat_flutter/shared/color/app_color.dart';
import 'package:chat_flutter/shared/theme/app_theme.dart';
import 'package:chat_flutter/shared/widgets/custom_animate_border.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom({
    required this.label,
    this.suffix,
    this.isPhone,
    this.onSuffixTap,
    this.onPrefixTap,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction = TextInputAction.done,
    this.onSubmitted,
    this.enabled = true,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines = 1,
    super.key,
    this.prefixIcon,
  });

  final String label;
  final IconData? suffix;
  final bool? isPhone;
  final VoidCallback? onSuffixTap;
  final VoidCallback? onPrefixTap;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onSubmitted;
  final bool? enabled;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final IconData? prefixIcon;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  late Animation<double> alpha;
  final focusNode = FocusNode();

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    final Animation<double> curve = CurvedAnimation(
      parent: controller!,
      curve: Curves.easeInOut,
    );
    alpha = Tween(begin: 0.0, end: 1.0).animate(curve);

    // controller?.forward();
    controller?.addListener(() {
      setState(() {});
    });
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        controller?.forward();
      } else {
        controller?.reverse();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.secondary),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Theme(
        data: ThemeData(
          colorScheme: Theme.of(
            context,
          ).colorScheme.copyWith(primary: AppColor.primary),
        ),
        child: CustomPaint(
          painter: CustomAnimateBorder(alpha.value),
          child: TextField(
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            onSubmitted: widget.onSubmitted,
            focusNode: focusNode,
            enabled: widget.enabled,
            textInputAction: widget.textInputAction,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText!,
            style: context.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              label: Text(
                widget.label,
                style: context.textTheme.titleMedium!.copyWith(
                  color:
                      focusNode.hasFocus
                          ? AppColor.primary
                          : AppColor.secondary,
                ),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              prefixIcon:
                  widget.prefixIcon != null
                      ? Icon(
                        widget.prefixIcon,
                        color:
                            focusNode.hasFocus
                                ? AppColor.primary
                                : AppColor.secondary,
                      )
                      : null,
              prefixIconConstraints: const BoxConstraints(
                minWidth: 40,
                minHeight: 40,
              ),
              suffixIconConstraints: const BoxConstraints(
                minWidth: 24,
                minHeight: 24,
              ),
              suffixIconColor:
                  focusNode.hasFocus ? AppColor.primary : AppColor.secondary,
              suffixIcon: IconButton(
                onPressed: widget.onSuffixTap,
                icon: Icon(widget.suffix),
                color:
                    focusNode.hasFocus ? AppColor.primary : AppColor.secondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
