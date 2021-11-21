import 'package:flutter/material.dart';
import 'package:project_pcbuildhelper/userScreens/item.dart';

import 'package:provider/provider.dart';

class ExpandedItem extends StatefulWidget {
  const ExpandedItem({Key key}) : super(key: key);

  @override
  _ExpandedItemState createState() => _ExpandedItemState();
}

class _ExpandedItemState extends State<ExpandedItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Item>(context);

    return Material(
      child: Center(
        child: Checkbox(
          value: item.isSelected, //isChecked,
          onChanged: (bool value) {
            setState(() {
              isChecked = value;
              item.setIsItemSelected();
            });
            print(isChecked);
          },
        ),
      ),
    );
  }
}
