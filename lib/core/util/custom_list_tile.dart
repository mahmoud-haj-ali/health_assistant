import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onTap;
  final Function onIconTap;

  const CustomListTile({Key key, this.title, this.subtitle, this.onTap, this.onIconTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        onTap: onTap,
        dense: true,
        title: Text(title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
        subtitle: subtitle != null ? Text(subtitle,style: TextStyle(fontSize: 13),maxLines: 1,overflow: TextOverflow.ellipsis,) : null,
        leading: Icon(Icons.person,size: 25,color: Theme.of(context).primaryColor,),
        trailing: IconButton(
          icon: Icon(Icons.delete_forever,color: Colors.red.shade700,),
          onPressed: onIconTap,
        ),
      ),
    );
  }
}
