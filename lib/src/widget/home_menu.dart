import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  final int page;
  const HomeMenu({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HomeMenuItem(
          child: Text(
            'Catálogo',
            style: TextStyle(fontSize: 12.0, color: page == 0 ? Colors.black : Colors.white),
          ),
          selected: page == 0,
        ),
        HomeMenuItem(
          child: Text(
            'Favoritos',
            style: TextStyle(fontSize: 12.0, color: page == 1 ? Colors.black : Colors.white),
          ),
          selected: page == 1,
        ),
        HomeMenuItem(
          child: Icon(
            Icons.search,
            color: page == 2 ? Colors.black : Colors.white,
            size: 15,
          ),
          selected: page == 2,
        ),
        HomeMenuItem(
          child: Icon(
            Icons.person,
            color: page == 3 ? Colors.black : Colors.white,
            size: 15,
          ),
          selected: page == 3,
        ),
      ],
    );
  }
}

class HomeMenuItem extends StatefulWidget {
  final Widget child;
  final bool selected;
  const HomeMenuItem({super.key, required this.child, required this.selected});

  @override
  State<HomeMenuItem> createState() => _HomeMenuItemState();
}

class _HomeMenuItemState extends State<HomeMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: widget.selected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(widget.selected ? 15 : 0)),
      ),
      child: widget.child,
    );
  }
}
