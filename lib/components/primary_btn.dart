import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.fullWidth = false,
    this.onPressed,
    required this.label,
    this.color,
    this.textColor,
    this.icon = false,
    this.radius,
    this.width,
    this.loading = false,
    this.borderColor,
    this.contentPadding,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final String label;
  final bool icon;
  final bool fullWidth;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? radius;
  final double? width;
  final bool loading;
  final EdgeInsets? contentPadding;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Center(
      child: BaseBtn(
        width: fullWidth ? double.infinity : width ?? context.widthPct(.7),
        minWidth: fullWidth ? double.infinity : null,
        bgColor: color ?? theme.primary,
        borderColor: borderColor,
        contentPadding: contentPadding,
        borderRadius: radius ?? Corners.s16,
        onPressed: loading == true
            ? null
            : () {
                AppHelper.unFocus();
                onPressed!();
              },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyles.button
                  .txtColor(textColor ?? theme.accentTxt)
                  .semiBold,
            ),
            if (loading) ...[HSpace(Insets.m), const Spinner()],
          ],
        ),
      ),
    );
  }
}

class BaseBtn extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Function(bool)? onFocusChanged;
  final Function(bool)? onHighlightChanged;
  final Color? bgColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? downColor;
  final Color? borderColor;
  final EdgeInsets? contentPadding;
  final double? minWidth;
  final double? minHeight;
  final double? borderRadius;
  final bool useBtnText;
  final bool autoFocus;
  final double? width;

  final ShapeBorder? shape;

  final Color outlineColor;

  const BaseBtn({
    Key? key,
    required this.child,
    this.onPressed,
    this.onFocusChanged,
    this.onHighlightChanged,
    this.bgColor,
    this.focusColor,
    this.contentPadding,
    this.minWidth,
    this.minHeight,
    this.borderRadius,
    this.hoverColor,
    this.downColor,
    this.shape,
    this.useBtnText = true,
    this.autoFocus = false,
    this.outlineColor = Colors.transparent,
    this.width,
    this.borderColor,
  }) : super(key: key);

  @override
  State<BaseBtn> createState() => _BaseBtnState();
}

class _BaseBtnState extends State<BaseBtn> {
  FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode(debugLabel: "", canRequestFocus: true);
    _focusNode.addListener(() {
      if (_focusNode.hasFocus != _isFocused) {
        setState(() => _isFocused = _focusNode.hasFocus);
        widget.onFocusChanged?.call(_isFocused);
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.bgColor ?? theme.txt,
        border: Border.all(color: widget.borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(widget.borderRadius ?? Corners.s5),
        boxShadow: _isFocused
            ? [
                BoxShadow(
                    color: theme.surface.withOpacity(0.25),
                    offset: Offset.zero,
                    blurRadius: 8.0,
                    spreadRadius: 0.0),
                BoxShadow(
                    color: widget.bgColor ?? theme.surface,
                    offset: Offset.zero,
                    blurRadius: 8.0,
                    spreadRadius: -4.0),
              ]
            : [],
      ),
      foregroundDecoration: _isFocused
          ? ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.8, color: theme.txt),
                borderRadius: BorderRadius.circular(
                  widget.borderRadius ?? Corners.s5,
                ),
              ),
            )
          : null,
      child: RawMaterialButton(
        focusNode: _focusNode,
        autofocus: widget.autoFocus,
        textStyle: widget.useBtnText ? TextStyles.button : null,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        splashColor: Colors.transparent,
        mouseCursor: SystemMouseCursors.click,
        elevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        focusElevation: 0,
        fillColor: Colors.transparent,
        hoverColor: widget.hoverColor ?? theme.surface,
        highlightColor:
            widget.downColor ?? theme.primaryVariant.withOpacity(.1),
        focusColor: widget.focusColor ?? Colors.grey.withOpacity(0.35),
        constraints: BoxConstraints(
          minHeight: widget.minHeight ?? 0,
          minWidth: widget.minWidth ?? context.widthPct(.7),
        ),
        onPressed: widget.onPressed,
        shape: widget.shape ??
            RoundedRectangleBorder(
              side: BorderSide(color: widget.outlineColor, width: 1.5),
              borderRadius:
                  BorderRadius.circular(widget.borderRadius ?? Corners.s5),
            ),
        child: Opacity(
          opacity: widget.onPressed != null ? 1 : .7,
          child: Padding(
            padding: widget.contentPadding ?? const EdgeInsets.all(18),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
