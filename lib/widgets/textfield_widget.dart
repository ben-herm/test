import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData icon;
  final String hint;
  final String errorText;
  final bool isObscure;
  final bool isIcon;
  final bool underlineBorder;
  final double fontSize;
  final TextInputType inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final TextAlign textAlign;
  final Color iconColor;
  final FocusNode focusNode;
  final ValueChanged onFieldSubmitted;
  final ValueChanged onChanged;
  final List<TextInputFormatter> inputFormatters;
  final bool autoFocus;
  final TextInputAction inputAction;

  const TextFieldWidget({
    Key key,
    this.icon,
    this.hint,
    this.textAlign,
    this.errorText,
    this.underlineBorder,
    this.isObscure = false,
    this.inputType,
    this.fontSize = 20,
    this.inputFormatters,
    this.textController,
    this.isIcon = true,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
          controller: textController,
          focusNode: focusNode,
          textAlign: this.textAlign != null ? this.textAlign : TextAlign.start,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          autofocus: autoFocus,
          textInputAction: inputAction,
          obscureText: this.isObscure,
          maxLength: 25,
          keyboardType: this.inputType,
          style: TextStyle(fontSize: this.fontSize),
          decoration: InputDecoration(
            hintText: this.hint,
            hintStyle:
                Theme.of(context).textTheme.body1.copyWith(color: hintColor),
            errorText: errorText,
            counterText: '',
            border:
                underlineBorder ? UnderlineInputBorder() : OutlineInputBorder(),
          ),
          inputFormatters: this.inputFormatters),
    );
  }
}
