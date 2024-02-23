import 'package:finder/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final String title;
  final void Function(String) onChanged;

  const ListItemWidget(
      {super.key, required this.title, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.only(left:16.0,right: 8.0),
        title: Text(title,style: TextStyle(fontSize: 15)),
        trailing: IconButton(
            onPressed: () => onChanged(title), icon: Icon(Icons.delete,color: AppColors.primaryColorDark,)));
  }
}
