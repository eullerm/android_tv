import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FocusInput extends StatefulWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final String label;
  const FocusInput({super.key, this.controller, this.obscureText = false, required this.label});

  @override
  State<FocusInput> createState() => _FocusInputState();
}

class _FocusInputState extends State<FocusInput> {
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
        } else if (event.logicalKey == LogicalKeyboardKey.goBack) {
          Navigator.pop(context);
        }
        return KeyEventResult.handled;
      },
      child: TextField(
        focusNode: focusNode,
        autofocus: true,
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(color: _isFocused ? Color(0xFF43A047) : Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
          ),
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2.0, color: Color(0xFF43A047)),
            borderRadius: BorderRadius.circular(16),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        obscureText: widget.obscureText,
      ),
    );
  }
}
