import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CuentaField extends StatelessWidget {
  final TextEditingController controller;
  CuentaField({super.key, required this.controller});

  final cuentaMonto = TextInputMask(
    mask: '9+.99',
    placeholder: '0',
    maxPlaceHolders: -1,
    maxLength: -1,
    reverse: true,
  );
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.white,
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.number,
      inputFormatters: [
        cuentaMonto,
        LengthLimitingTextInputFormatter(8),
      ],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: Colors.white.withOpacity(0.35),
          ),
        ),
      ),
    );
  }
}
