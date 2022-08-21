import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telegram_clone_ui/model/usersModel.dart';
import 'package:telegram_clone_ui/service/user_services.dart';
import 'package:telegram_clone_ui/view/constants/constants.dart';
import 'package:telegram_clone_ui/view/drawer.dart';
import 'package:telegram_clone_ui/view/settings%20page/Page%201.dart';
import 'package:telegram_clone_ui/view/settings%20page/Page%202.dart';
import 'settings page/Page 3.dart';
import 'package:ionicons/ionicons.dart';

class TelegramUi extends StatefulWidget {
  @override
  State<TelegramUi> createState() => _TelegramUiState();
}

class _TelegramUiState extends State<TelegramUi> {
  var SayfaListesi = [
    SettingsPage1(),
    SettingsPage2(),
    SettingsPage3(),
  ];
  late int SecilenIndex = 0;
  late bool SecilenSayfa;
  bool isSearching = false;
  //servisi cagirdik
  UserServices _services = UserServices();
  // UsermodelData turunden liste olusturduk
  List<UsersModelData?> users = [];
  bool? isLoading;
  @override
  void initState() {
    super.initState();
    _services.fetchUsers().then((value) {
      if (value != null && value.data != null) {
        setState(() {
          users = value.data!;
          isLoading = true;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(),
      body: isLoading == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : isLoading == true
              ? ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsPage1()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Card(
                          child: ListTile(
                            title: Text(
                                "${users[index]!.firstName! + users[index]!.lastName!}"),
                            subtitle: Text(users[index]!.email!),
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(users[index]!.avatar!),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text("Has not data"),
                ),
      drawer: MyDrawer(context),
      floatingActionButton: floatingActionButton,
    );
  }

  AppBar myAppbar() {
    return AppBar(
      backgroundColor: appbarLightModeColor.withOpacity(0.6),
      title: isSearching
          ? TextField(
              decoration: InputDecoration(
                hintText: "Search",
              ),
              onChanged: (value) {
                print("Arama Sonucu :$value");
              })
          : Text("Telegram"),
      actions: [
        isSearching
            ? myIconButton(icon: (Icons.cancel))
            : myIconButton(icon: (Ionicons.search))
      ],
    );
  }

  IconButton myIconButton({required IconData icon}) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () {
        setState(() {
          isSearching = !isSearching;
        });
      },
    );
  }
}
