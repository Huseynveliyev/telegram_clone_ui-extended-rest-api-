import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telegram_clone_ui/view/constants/constants.dart';

MyDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
            decoration: BoxDecoration(
              color: appbarLightModeColor,
            ),
            child: SizedBox(
              width: 100,
              height: 100,
              child: CircleAvatar(backgroundImage: networkImage),
            )),
        PersonalListile(
            context: context,
            text: "Find Group",
            icon: CupertinoIcons.group,
            SecilenIndex: 0),
        PersonalListile(
            context: context,
            text: "Settings",
            icon: CupertinoIcons.settings,
            SecilenIndex: 1),
        PersonalListile(
            context: context,
            text: "Phone",
            icon: CupertinoIcons.phone,
            SecilenIndex: 2),
        PersonalListile(
            context: context,
            text: "Basket",
            icon: CupertinoIcons.cart_fill,
            SecilenIndex: 2),
        PersonalListile(
            context: context,
            text: "Home",
            icon: CupertinoIcons.home,
            SecilenIndex: 1),
      ],
    ),
  );
}

PersonalListile({
  required BuildContext context,
  required String text,
  required IconData icon,
  required int SecilenIndex,
}) {
  return ListTile(
    title: Text(text),
    leading: Icon(icon),
    onTap: () {
      setState() {
        SecilenIndex;
      }

      Navigator.pop(context);
    },
  );
}
