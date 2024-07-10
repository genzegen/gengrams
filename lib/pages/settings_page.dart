import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("S E T T I N G S", style: TextStyle(fontWeight: FontWeight.w600),),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(14)
        ),
        padding: const EdgeInsets.all(21),
        margin: const EdgeInsets.all(26),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Dark Mode   ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ), //text dark mode
            //switch
            CupertinoSwitch(
              value:
                  Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
              onChanged: (value) =>
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme(),
            ),
          ],
        ),
      ),
    );
  }
}
