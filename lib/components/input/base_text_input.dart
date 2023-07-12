import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chekinapp/export.dart';

class BaseTextInput extends StatelessWidget {
  final String? label;
  final TextStyle? style;
  final EdgeInsets? contentPadding;
  final bool? autoFocus;
  final bool? obscureText;
  final IconData? icon;
  final String? initialValue;
  final int? maxLines;
  final TextEditingController? controller;
  final TextCapitalization? capitalization;
  final TextInputType? type;
  final bool? enabled;
  final bool readOnly;
  final bool? autoValidate;
  final bool? enableSuggestions;
  final bool? autoCorrect;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputDecoration? inputDecoration;
  final int? maxLength;
  final TextInputAction? inputAction;

  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function()? onEditingCancel;
  final Function(bool)? onFocusChanged;
  final Function(FocusNode)? onFocusCreated;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? formatter;

  const BaseTextInput({
    Key? key,
    this.label,
    this.autoFocus = false,
    this.obscureText = false,
    this.type = TextInputType.text,
    this.icon,
    this.initialValue = "",
    this.controller,
    this.enabled,
    this.autoValidate = false,
    this.enableSuggestions = true,
    this.autoCorrect = true,
    this.style,
    this.contentPadding,
    this.prefixIcon,
    this.suffixIcon,
    this.inputDecoration,
    this.onChanged,
    this.onEditingComplete,
    this.onEditingCancel,
    this.onFocusChanged,
    this.onFocusCreated,
    this.onFieldSubmitted,
    this.onSaved,
    this.onTap,
    this.hintText,
    this.capitalization,
    this.maxLines,
    this.maxLength,
    this.inputAction,
    this.validator,
    this.formatter,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return TextFormField(
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      onTap: onTap,
      autofocus: autoFocus ?? false,
      keyboardType: type,
      obscureText: obscureText ?? false,
      autocorrect: autoCorrect ?? true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enableSuggestions: enableSuggestions ?? false,
      style: style ?? TextStyles.body1,
      cursorColor: theme.grey,
      controller: initialValue != null ? null : controller,
      initialValue: controller != null ? null : initialValue,
      showCursor: true,
      enabled: enabled,
      readOnly: readOnly,
      maxLines: maxLines,
      textCapitalization: capitalization ?? TextCapitalization.none,
      decoration: inputDecoration ??
          InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: contentPadding ?? EdgeInsets.all(Insets.m),
            border: OutlineInputBorder(
              borderRadius: Corners.s20Border,
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: Corners.s20Border,
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: Corners.s20Border,
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: Corners.s20Border,
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: Corners.s20Border,
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: Corners.s20Border,
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            icon: icon == null ? null : Icon(icon),
            hintText: hintText,
            hintStyle: TextStyles.body2.txtColor(theme.grey),
            labelText: label,
            counterText: '',
            filled: true,
            fillColor: Colors.white,
            isDense: true,
            errorStyle: const TextStyle(height: 0, fontSize: 0.0009),
          ),
      maxLength: maxLength,
      textInputAction: inputAction,
      validator: validator,
      inputFormatters: formatter,
    );
  }
}

class CustomFormTextInput extends StatefulWidget {
  final String? label;
  final bool? autoFocus;
  final String? initialValue;
  final String? hintText;
  final EdgeInsets? contentPadding;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextEditingController? controller;
  final TextCapitalization? capitalization;
  final Function(String)? onChange;
  final Function(String?)? onSaved;
  final Function(bool)? onFocusChanged;
  final Function(FocusNode)? onFocusCreated;
  final Widget? icon;
  final bool obscure;
  final bool readOnly;
  final bool enabled;
  final InputType type;
  final String? errorText;
  final int? maxLength;
  final bool isRequired;
  final Widget? prefix;
  final Widget? suffix;
  final List<TextInputFormatter>? formatter;
  final String? Function(String?)? validator;

  const CustomFormTextInput({
    Key? key,
    this.label,
    this.autoFocus,
    this.initialValue,
    this.onChange,
    this.onSaved,
    this.hintText,
    this.readOnly = false,
    this.onFocusChanged,
    this.onFocusCreated,
    this.controller,
    this.contentPadding,
    this.capitalization,
    this.textStyle,
    this.icon,
    this.obscure = false,
    this.maxLines = 1,
    this.enabled = true,
    this.type = InputType.txt,
    this.errorText,
    this.maxLength,
    this.isRequired = true,
    this.prefix,
    this.suffix,
    this.formatter,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomFormTextInput> createState() => _CustomFormTextInputState();
}

class _CustomFormTextInputState extends State<CustomFormTextInput> {
  String? _error;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: Corners.s20Border,
          border: Border.all(
              color: _error == null
                  ? theme.primary.withOpacity(0.1)
                  : theme.redButton)),
      height: 48,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: BaseTextInput(
              readOnly: widget.readOnly,
              capitalization:
                  widget.capitalization ?? TextCapitalization.sentences,
              label: widget.label,
              autoFocus: widget.autoFocus,
              initialValue: widget.initialValue,
              onChanged: widget.onChange,
              onFocusCreated: widget.onFocusCreated,
              style: widget.textStyle ?? TextStyles.body1.semiBold,
              onSaved: widget.onSaved,
              onFocusChanged: widget.onFocusChanged,
              controller: widget.controller,
              obscureText: widget.obscure,
              maxLines: widget.maxLines,
              hintText: widget.hintText,
              enabled: widget.enabled,
              type: _setKeyboardType(),
              validator: (value) {
                if (widget.isRequired && value!.isEmpty) {
                  Future.microtask(() => setState(() {}));
                  return _error = 'Required';
                }
                if (widget.validator != null) {
                  Future.microtask(() => setState(() {}));
                  return _error = widget.validator!(value);
                }
                Future.microtask(() => setState(() {}));
                return null;
              },
              contentPadding: widget.contentPadding ??
                  const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
              maxLength: widget.maxLength,
              prefixIcon: widget.prefix,
              suffixIcon: widget.suffix,
              formatter: widget.formatter,
              autoValidate: true,
            ),
          ),
          Positioned(
            top: 2,
            right: 15,
            child: Text(
              _error ?? '',
              style: TextStyles.caption.txtColor(theme.error),
            ),
          ),
        ],
      ),
    );
  }

  TextInputType _setKeyboardType() {
    TextInputType type;
    switch (widget.type) {
      case InputType.email:
        type = TextInputType.emailAddress;
        break;
      case InputType.money:
        type = TextInputType.number;
        break;
      case InputType.tel:
        type = TextInputType.phone;
        break;
      case InputType.num:
        type = const TextInputType.numberWithOptions(decimal: true);
        break;
      case InputType.txt:
        type = TextInputType.text;
        break;
      default:
        type = TextInputType.text;
    }
    return type;
  }
}

///for checkin  app

class CustomFormTextField extends StatefulWidget {
  final String? label;
  final bool? autoFocus;
  final String? initialValue;
  final String? hintText;
  final EdgeInsets? contentPadding;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextEditingController? controller;
  final TextCapitalization? capitalization;
  final Function(String)? onChange;
  final Function(String?)? onSaved;
  final Function(bool)? onFocusChanged;
  final Function(FocusNode)? onFocusCreated;
  final IconData? icon;
  final bool obscure;
  final bool readOnly;
  final bool enabled;
  final InputType type;
  final String? errorText;
  final int? maxLength;
  final bool isRequired;
  final Widget? prefix;
  final Widget? suffix;
  final List<TextInputFormatter>? formatter;
  final String? Function(String?)? validator;

  const CustomFormTextField({
    Key? key,
    this.label,
    this.autoFocus,
    this.initialValue,
    this.onChange,
    this.onSaved,
    this.hintText,
    this.readOnly = false,
    this.onFocusChanged,
    this.onFocusCreated,
    this.controller,
    this.contentPadding,
    this.capitalization,
    this.textStyle,
    this.icon,
    this.obscure = false,
    this.maxLines = 1,
    this.enabled = true,
    this.type = InputType.txt,
    this.errorText,
    this.maxLength,
    this.isRequired = true,
    this.prefix,
    this.suffix,
    this.formatter,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomFormTextField> createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  String? _error;
  bool showStatusIcon = false;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return SizedBox(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: BaseTextInput(
              readOnly: widget.readOnly,
              capitalization:
                  widget.capitalization ?? TextCapitalization.sentences,
              label: widget.label,
              autoFocus: widget.autoFocus,
              initialValue: widget.initialValue,
              onChanged: widget.onChange,
              onFocusCreated: widget.onFocusCreated,
              style: widget.textStyle ?? TextStyles.h6.bold,
              onSaved: widget.onSaved,
              onFocusChanged: widget.onFocusChanged,
              controller: widget.controller,
              obscureText: widget.obscure,
              maxLines: widget.maxLines,
              hintText: widget.hintText,
              enabled: widget.enabled,
              type: _setKeyboardType(),
              validator: (value) {
                showStatusIcon = true; //shows the showStatusIcon
                if (widget.isRequired && value!.isEmpty) {
                  Future.microtask(() => setState(() {}));
                  return _error = 'Required';
                }
                if (widget.validator != null) {
                  Future.microtask(() => setState(() {}));
                  return _error = widget.validator!(value);
                }
                Future.microtask(() => setState(() {}));
                return _error = null;
              },
              maxLength: widget.maxLength,
              formatter: widget.formatter,
              autoValidate: true,
              inputDecoration: InputDecoration(
                prefixIcon: widget.prefix,
                suffixIcon: widget.suffix ??
                    (widget.controller != null
                        ? widget.controller!.text.isNotEmpty
                            ? Icon(
                                Icons.cancel,
                                color: theme.black,
                              ).clickable(() {
                                widget.controller?.clear();
                              })
                            : const SizedBox.shrink()
                        : null),
                contentPadding: widget.contentPadding ??
                    const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                border: UnderlineInputBorder(
                  borderRadius: Corners.s12Border,
                  borderSide: BorderSide(color: theme.greenButton, width: 1.5),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderRadius: Corners.s12Border,
                  borderSide: BorderSide(color: theme.redButton, width: 1.5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderRadius: Corners.s12Border,
                  borderSide: BorderSide(color: theme.greenButton, width: 1.5),
                ),
                errorBorder: UnderlineInputBorder(
                  borderRadius: Corners.s12Border,
                  borderSide: BorderSide(color: theme.redButton, width: 1.5),
                ),
                disabledBorder: UnderlineInputBorder(
                  borderRadius: Corners.s12Border,
                  borderSide:
                      BorderSide(color: theme.greyTextFieldFill, width: 1.5),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: Corners.s12Border,
                  borderSide: BorderSide(color: theme.greyWeak, width: 1.5),
                ),
                icon: widget.icon == null ? null : Icon(widget.icon),
                hintText: widget.hintText,
                hintStyle: TextStyles.body2.txtColor(theme.grey),
                labelText: widget.label,
                counterText: '',
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                errorStyle: const TextStyle(height: 0, fontSize: 0.0009),
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            left: 15,
            child: showStatusIcon == true
                ? Row(
                    children: [
                      Icon(
                        _error == null ? Icons.check_circle : Icons.cancel,
                        color: _error == null ? theme.greenButton : theme.error,
                        size: 16,
                      ),
                      const HSpace(5),
                      Text(
                        _error ?? context.loc.perfect,
                        style: TextStyles.caption.txtColor(
                            _error == null ? theme.greenButton : theme.error),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  TextInputType _setKeyboardType() {
    TextInputType type;
    switch (widget.type) {
      case InputType.email:
        type = TextInputType.emailAddress;
        break;
      case InputType.money:
        type = TextInputType.number;
        break;
      case InputType.tel:
        type = TextInputType.phone;
        break;
      case InputType.num:
        type = const TextInputType.numberWithOptions(decimal: true);
        break;
      case InputType.txt:
        type = TextInputType.text;
        break;
      default:
        type = TextInputType.text;
    }
    return type;
  }
}

class CustomFormTextFieldWithBorder extends StatefulWidget {
  final String? label;
  final bool? autoFocus;
  final String? initialValue;
  final String? hintText;
  final EdgeInsets? contentPadding;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextEditingController? controller;
  final TextCapitalization? capitalization;
  final Function(String)? onChange;
  final Function(String?)? onSaved;
  final Function(bool)? onFocusChanged;
  final Function(FocusNode)? onFocusCreated;
  final IconData? icon;
  final bool obscure;
  final bool readOnly;
  final bool enabled;
  final InputType type;
  final String? errorText;
  final int? maxLength;
  final bool isRequired;
  final Widget? prefix;
  final Widget? suffix;
  final List<TextInputFormatter>? formatter;
  final String? Function(String?)? validator;

  const CustomFormTextFieldWithBorder({
    Key? key,
    this.label,
    this.autoFocus,
    this.initialValue,
    this.onChange,
    this.onSaved,
    this.hintText,
    this.readOnly = false,
    this.onFocusChanged,
    this.onFocusCreated,
    this.controller,
    this.contentPadding,
    this.capitalization,
    this.textStyle,
    this.icon,
    this.obscure = false,
    this.maxLines = 1,
    this.enabled = true,
    this.type = InputType.txt,
    this.errorText,
    this.maxLength,
    this.isRequired = true,
    this.prefix,
    this.suffix,
    this.formatter,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomFormTextFieldWithBorder> createState() =>
      _CustomFormTextFieldWithBorderState();
}

class _CustomFormTextFieldWithBorderState
    extends State<CustomFormTextFieldWithBorder> {
  String? _error;
  bool showStatusIcon = false;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return SizedBox(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: BaseTextInput(
              readOnly: widget.readOnly,
              capitalization:
                  widget.capitalization ?? TextCapitalization.sentences,
              label: widget.label,
              autoFocus: widget.autoFocus,
              initialValue: widget.initialValue,
              onChanged: widget.onChange,
              onFocusCreated: widget.onFocusCreated,
              style: widget.textStyle ?? TextStyles.h6.bold,
              onSaved: widget.onSaved,
              onFocusChanged: widget.onFocusChanged,
              controller: widget.controller,
              obscureText: widget.obscure,
              maxLines: widget.maxLines,
              hintText: widget.hintText,
              enabled: widget.enabled,
              type: _setKeyboardType(),
              validator: (value) {
                showStatusIcon = true; //shows the showStatusIcon
                if (widget.isRequired && value!.isEmpty) {
                  Future.microtask(() => setState(() {}));
                  return _error = 'Required';
                }
                if (widget.validator != null) {
                  Future.microtask(() => setState(() {}));
                  return _error = widget.validator!(value);
                }
                Future.microtask(() => setState(() {}));
                return _error = null;
              },
              maxLength: widget.maxLength,
              formatter: widget.formatter,
              autoValidate: true,
              inputDecoration: InputDecoration(
                prefixIcon: widget.prefix,
                suffixIcon: widget.suffix ??
                    (widget.controller != null
                        ? widget.controller!.text.isNotEmpty
                            ? Icon(
                                Icons.cancel,
                                color: theme.black,
                              ).clickable(() {
                                widget.controller?.clear();
                              })
                            : const SizedBox.shrink()
                        : null),
                contentPadding: widget.contentPadding ??
                    const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                border: OutlineInputBorder(
                  borderRadius: Corners.s20Border,
                  borderSide: BorderSide(color: theme.greenButton, width: 1),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: Corners.s20Border,
                  borderSide: BorderSide(color: theme.redButton, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: Corners.s12Border,
                  borderSide: BorderSide(color: theme.greenButton, width: 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: Corners.s20Border,
                  borderSide: BorderSide(color: theme.redButton, width: 1),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: Corners.s20Border,
                  borderSide:
                      BorderSide(color: theme.greyTextFieldFill, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: Corners.s20Border,
                  borderSide: BorderSide(color: theme.greyWeak, width: 1),
                ),
                icon: widget.icon == null ? null : Icon(widget.icon),
                hintText: widget.hintText,
                hintStyle: TextStyles.body2.txtColor(theme.grey),
                labelText: widget.label,
                counterText: '',
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                errorStyle: const TextStyle(height: 0, fontSize: 0.0009),
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            left: 15,
            child: _error != null
                ? Text(
                    _error!,
                    style: TextStyles.caption.txtColor(theme.error),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  TextInputType _setKeyboardType() {
    TextInputType type;
    switch (widget.type) {
      case InputType.email:
        type = TextInputType.emailAddress;
        break;
      case InputType.money:
        type = TextInputType.number;
        break;
      case InputType.tel:
        type = TextInputType.phone;
        break;
      case InputType.num:
        type = const TextInputType.numberWithOptions(decimal: true);
        break;
      case InputType.txt:
        type = TextInputType.text;
        break;
      default:
        type = TextInputType.text;
    }
    return type;
  }
}

class CustomReviewTextField extends StatefulWidget {
  final String? label;
  final bool? autoFocus;
  final String? initialValue;
  final String? hintText;
  final EdgeInsets? contentPadding;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextEditingController? controller;
  final TextCapitalization? capitalization;
  final Function(String)? onChange;
  final Function(String?)? onSaved;
  final Function(bool)? onFocusChanged;
  final Function(FocusNode)? onFocusCreated;
  final IconData? icon;
  final bool obscure;
  final bool readOnly;
  final bool enabled;
  final InputType type;
  final String? errorText;
  final int? maxLength;
  final bool isRequired;
  final Widget? prefix;
  final Widget? suffix;
  final List<TextInputFormatter>? formatter;
  final String? Function(String?)? validator;

  const CustomReviewTextField({
    Key? key,
    this.label,
    this.autoFocus,
    this.initialValue,
    this.onChange,
    this.onSaved,
    this.hintText,
    this.readOnly = false,
    this.onFocusChanged,
    this.onFocusCreated,
    this.controller,
    this.contentPadding,
    this.capitalization,
    this.textStyle,
    this.icon,
    this.obscure = false,
    this.maxLines = 1,
    this.enabled = true,
    this.type = InputType.txt,
    this.errorText,
    this.maxLength,
    this.isRequired = true,
    this.prefix,
    this.suffix,
    this.formatter,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomReviewTextField> createState() => _CustomReviewTextFieldState();
}

class _CustomReviewTextFieldState extends State<CustomReviewTextField> {
  String? _error;
  bool showStatusIcon = false;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return SizedBox(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: BaseTextInput(
              readOnly: widget.readOnly,
              capitalization:
                  widget.capitalization ?? TextCapitalization.sentences,
              label: widget.label,
              autoFocus: widget.autoFocus,
              initialValue: widget.initialValue,
              onChanged: widget.onChange,
              onFocusCreated: widget.onFocusCreated,
              style: widget.textStyle ?? TextStyles.h6.bold,
              onSaved: widget.onSaved,
              onFocusChanged: widget.onFocusChanged,
              controller: widget.controller,
              obscureText: widget.obscure,
              maxLines: widget.maxLines,
              hintText: widget.hintText,
              enabled: widget.enabled,
              type: _setKeyboardType(),
              validator: (value) {
                showStatusIcon = true; //shows the showStatusIcon
                if (widget.isRequired && value!.isEmpty) {
                  Future.microtask(() => setState(() {}));
                  return _error = 'Required';
                }
                if (widget.validator != null) {
                  Future.microtask(() => setState(() {}));
                  return _error = widget.validator!(value);
                }
                Future.microtask(() => setState(() {}));
                return _error = null;
              },
              maxLength: widget.maxLength,
              formatter: widget.formatter,
              autoValidate: true,
              inputDecoration: InputDecoration(
                prefixIcon: widget.prefix,
                suffixIcon: widget.suffix ??
                    (widget.controller != null
                        ? widget.controller!.text.isNotEmpty
                            ? Icon(
                                Icons.cancel,
                                color: theme.black,
                              ).clickable(() {
                                widget.controller?.clear();
                              })
                            : const SizedBox.shrink()
                        : null),
                contentPadding: widget.contentPadding ??
                    const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                border: OutlineInputBorder(
                  borderRadius: Corners.s20Border,
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.02),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: Corners.s20Border,
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.02),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: Corners.s12Border,
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.02),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: Corners.s20Border,
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.02),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: Corners.s20Border,
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.02),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: Corners.s20Border,
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.02),
                ),
                icon: widget.icon == null ? null : Icon(widget.icon),
                hintText: widget.hintText,
                hintStyle: TextStyles.body2.txtColor(theme.grey),
                labelText: widget.label,
                counterText: '',
                filled: true,
                fillColor: const Color(0xffF5F5F5),
                isDense: true,
                errorStyle: const TextStyle(height: 0, fontSize: 0.0009),
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            left: 15,
            child: _error != null
                ? Text(
                    _error!,
                    style: TextStyles.caption.txtColor(theme.error),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  TextInputType _setKeyboardType() {
    TextInputType type;
    switch (widget.type) {
      case InputType.email:
        type = TextInputType.emailAddress;
        break;
      case InputType.money:
        type = TextInputType.number;
        break;
      case InputType.tel:
        type = TextInputType.phone;
        break;
      case InputType.num:
        type = const TextInputType.numberWithOptions(decimal: true);
        break;
      case InputType.txt:
        type = TextInputType.text;
        break;
      default:
        type = TextInputType.text;
    }
    return type;
  }
}
