import 'package:flutter/material.dart';

class FillTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? prefixText;
  final bool isObscure;
  final bool isReadOnly;
  final TextInputType? keyboardType;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final VoidCallback? onFieldSubmitted;
  final int? maxLength;
  final int? maxLines;
  final VoidCallback? onTap;
  

  const FillTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixText,
    this.isObscure = false,
    this.isReadOnly = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChange,
    this.onFieldSubmitted,
    this.maxLength,
    this.maxLines,
    this.onTap,
   
  });

  @override
  State<FillTextFormField> createState() => _FillTextFormFieldState();
}

class _FillTextFormFieldState extends State<FillTextFormField> {
  late bool _isObscure;
  late bool _isReadOnly;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isObscure;
    _isReadOnly = widget.isReadOnly;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _isObscure,
      readOnly: _isReadOnly,
      onTap: widget.onTap,
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Color(0xFF5D5D5D),
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
        prefixText: widget.prefixText,
        prefixStyle: const TextStyle(color: Colors.black, fontSize: 12),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isObscure
            ? IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )
            : widget.suffixIcon,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        counterText: "",
      ),
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      // Add maxLength property
      validator: widget.validator,
      onChanged: widget.onChange,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: widget.onFieldSubmitted != null
          ? (value) => widget.onFieldSubmitted!()
          : null,
    );
  }
}
