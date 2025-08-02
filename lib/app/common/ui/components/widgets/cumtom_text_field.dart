// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/style/styte.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final EdgeInsets? contentPadding;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? disabledBorder;
  final bool filled;
  final Color? fillColor;
  final Color? cursorColor;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final bool enableInteractiveSelection;
  final bool readOnly;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final bool expands;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final Brightness? keyboardAppearance;
  final String? counterText;
  final bool showCursor;
  final double cursorWidth;
  final Radius? cursorRadius;
  final bool autocorrect;
  final String? obscuringCharacter;
  final EdgeInsets scrollPadding;
  final bool enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final Iterable<String>? autofillHints;
  final bool? showPasswordToggle;
  final VoidCallback? onTap;
  final BoxConstraints? constraints;

  const CustomTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.style,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.contentPadding,
    this.autofocus = false,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.disabledBorder,
    this.filled = false,
    this.fillColor,
    this.cursorColor,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.enableInteractiveSelection = true,
    this.readOnly = false,
    this.validator,
    this.autoValidateMode,
    this.expands = false,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.keyboardAppearance,
    this.counterText,
    this.showCursor = true,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.autocorrect = true,
    this.obscuringCharacter = '•',
    this.scrollPadding = const EdgeInsets.all(Spacing.x5),
    this.enableSuggestions = true,
    this.maxLengthEnforcement,
    this.autofillHints,
    this.showPasswordToggle,
    this.onTap,
    this.constraints,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _showPassword = false;
  late FocusNode _focusNode;
  bool _isFocused = false;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
    if (widget.validator != null && widget.autoValidateMode != null) {
      widget.controller.addListener(_validate);
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    if (widget.validator != null && widget.autoValidateMode != null) {
      widget.controller.removeListener(_validate);
    }
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });

    if (!_focusNode.hasFocus &&
        widget.autoValidateMode == AutovalidateMode.onUserInteraction) {
      _validate();
    }
  }

  void _validate() {
    if (widget.validator != null) {
      setState(() {
        _errorText = widget.validator!(widget.controller.text);
      });
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final effectiveStyle = widget.style ?? textTheme.bodyMedium;
    final effectiveHintStyle =
        widget.hintStyle ??
        textTheme.bodyMedium?.copyWith(
          color: theme.hintColor,
          fontWeight: FontWeight.w400,
        );
    final effectiveLabelStyle =
        widget.labelStyle ??
        textTheme.bodySmall?.copyWith(
          color: AppColor.textContrast,
          fontWeight: FontWeight.w600,
        );
    final effectiveErrorStyle =
        widget.errorStyle ??
        textTheme.bodySmall?.copyWith(color: theme.colorScheme.error);

    // Toggle de senha
    final showPasswordToggle = widget.showPasswordToggle ?? widget.obscureText;

    // Suffix icon com toggle de senha se necessário
    Widget? suffixIcon = widget.suffixIcon;
    if (showPasswordToggle) {
      suffixIcon = IconButton(
        icon: Icon(
          _showPassword ? Icons.visibility : Icons.visibility_off,
          color: theme.hintColor,
          size: Spacing.x2,
        ),
        onPressed: _togglePasswordVisibility,
        padding: const EdgeInsets.all(Spacing.x1),
        constraints: const BoxConstraints(
          minWidth: Spacing.x4,
          minHeight: Spacing.x4,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.labelText != null && widget.labelText!.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.only(bottom: Spacing.half),
            child: Text(widget.labelText!, style: effectiveLabelStyle),
          ),
        ],
        ConstrainedBox(
          constraints:
              widget.constraints ??
              const BoxConstraints(minWidth: double.infinity),
          child: TextFormField(
            controller: widget.controller,
            focusNode: _focusNode,
            style: effectiveStyle,
            cursorColor: widget.cursorColor ?? theme.colorScheme.primary,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: effectiveHintStyle,
              helperText: widget.helperText,
              errorText: _errorText ?? widget.errorText,
              errorStyle: effectiveErrorStyle,
              contentPadding:
                  widget.contentPadding ??
                  const EdgeInsets.symmetric(
                    horizontal: Spacing.x2,
                    vertical: Spacing.x1Half,
                  ),
              enabled: widget.enabled,
              prefixIcon: widget.prefixIcon,
              suffixIcon: suffixIcon,
              prefix: widget.prefix,
              suffix: widget.suffix,
              fillColor: widget.fillColor,
              filled: widget.filled,
              border:
                  widget.border ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.medium),
                    borderSide: BorderSide(color: theme.dividerColor, width: 1),
                  ),
              enabledBorder:
                  widget.enabledBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.medium),
                    borderSide: BorderSide(color: theme.dividerColor, width: 1),
                  ),
              focusedBorder:
                  widget.focusedBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.medium),
                    borderSide: BorderSide(
                      color: theme.colorScheme.primary,
                      width: 2,
                    ),
                  ),
              errorBorder:
                  widget.errorBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.medium),
                    borderSide: BorderSide(
                      color: theme.colorScheme.error,
                      width: 1,
                    ),
                  ),
              disabledBorder:
                  widget.disabledBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.medium),
                    borderSide: BorderSide(
                      color: theme.disabledColor,
                      width: 1,
                    ),
                  ),
              counterText: widget.counterText,
            ),
            onChanged: (value) {
              widget.onChanged?.call(value);
              if (widget.autoValidateMode ==
                  AutovalidateMode.onUserInteraction) {
                _validate();
              }
            },
            onFieldSubmitted: widget.onSubmitted,
            onEditingComplete: widget.onEditingComplete,
            obscureText: widget.obscureText && !_showPassword,
            obscuringCharacter: widget.obscuringCharacter!,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            maxLength: widget.maxLength,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            textCapitalization: widget.textCapitalization,
            inputFormatters: widget.inputFormatters,
            enableInteractiveSelection: widget.enableInteractiveSelection,
            readOnly: widget.readOnly,
            autovalidateMode: widget.autoValidateMode,
            expands: widget.expands,
            textAlign: widget.textAlign,
            textAlignVertical:
                widget.textAlignVertical ?? const TextAlignVertical(y: 0.5),
            keyboardAppearance: widget.keyboardAppearance,
            showCursor: widget.showCursor,
            cursorWidth: widget.cursorWidth,
            cursorRadius: widget.cursorRadius,
            autocorrect: widget.autocorrect,
            scrollPadding: widget.scrollPadding,
            enableSuggestions: widget.enableSuggestions,
            maxLengthEnforcement: widget.maxLengthEnforcement,
            autofillHints: widget.autofillHints,
            onTap: widget.onTap,
            autofocus: widget.autofocus,
          ),
        ),
      ],
    );
  }
}
