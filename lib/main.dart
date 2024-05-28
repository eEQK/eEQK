import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:js' as js;

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Tile(
              FontAwesomeIcons.github,
              Colors.black,
              () => js.context.callMethod(
                'open',
                ['https://github.com/eEQK', '_self'],
              ),
            ),
            const SizedBox(width: 12),
            _Tile(
              FontAwesomeIcons.linkedin,
              const Color(0xFF0077B5),
              () => js.context.callMethod(
                'open',
                ['https://www.linkedin.com/in/karol-czeryna/', '_self'],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile(this.icon, this.color, this.onPressed);

  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: IconButton.styleFrom(
          minimumSize: const Size(80, 80),
        ),
        color: color,
        iconSize: 48,
        onPressed: onPressed,
        icon: FaIcon(icon));
  }
}
