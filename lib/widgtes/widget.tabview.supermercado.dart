import 'package:flutter/material.dart';
import 'package:mercado/enums/title.widget.dart';

class TabSupermercado extends StatelessWidget {
  const TabSupermercado({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    return Center(
      child: ListView.builder(
        itemCount: 25,
        itemBuilder: (BuildContext context, int index) {
      
          return ListTile(
            tileColor: index.isOdd ? oddItemColor : evenItemColor,
            title: Text('${titles[2]} $index'),
          );
        },
      ),
    );
  }
}
