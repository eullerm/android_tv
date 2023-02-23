import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DateInput extends StatefulWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final String label;
  final int lengthLimit;
  const DateInput({super.key, this.controller, this.obscureText = false, required this.label, required this.lengthLimit});

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  bool _isFocused = false;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    focusNode.removeListener(_onFocusChange);
    focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      canRequestFocus: false,
      onKey: (FocusNode node, RawKeyEvent event) {
        if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          FocusManager.instance.primaryFocus!.focusInDirection(TraversalDirection.left);
        } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          FocusManager.instance.primaryFocus!.focusInDirection(TraversalDirection.right);
        } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          FocusManager.instance.primaryFocus!.focusInDirection(TraversalDirection.up);
        } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          FocusManager.instance.primaryFocus!.focusInDirection(TraversalDirection.down);
        }
        return KeyEventResult.handled;
      },
      child: TextField(
        focusNode: focusNode,
        autofocus: true,
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(color: _isFocused ? Colors.greenAccent : Colors.black),
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0, color: Colors.greenAccent),
            borderRadius: BorderRadius.circular(16),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(widget.lengthLimit),
          DateInputFormatter(),
        ],
        obscureText: widget.obscureText,
      ),
    );
  }
}

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex == 2) {
        buffer.write('/');
      } else if (nonZeroIndex == 4) {
        buffer.write('');
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(text: string, selection: TextSelection.collapsed(offset: string.length));
  }
}
