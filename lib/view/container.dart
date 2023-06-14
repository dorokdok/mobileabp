import 'package:flutter/material.dart';
import 'screen/account/account-screen.dart';
import 'screen/home/home-screen.dart';
import 'screen/item/screen.dart';
import 'models/item_view_model.dart';
import 'models/profile_view_model.dart';
import 'models/location_view_model.dart';
import 'package:provider/provider.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    HomeScreen(),
    ItemScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final profile_view_model =
          Provider.of<ProfileViewModel>(context, listen: false);
      final item_view_model =
          Provider.of<ItemViewModel>(context, listen: false);
      final location_view_model =
          Provider.of<LocationViewModel>(context, listen: false);

      if (profile_view_model.user == null) {
        profile_view_model.get_profile(context);
      }

      if (item_view_model.items?.isEmpty ?? true) {
        item_view_model.get_item();
      }

      if (location_view_model.storages?.isEmpty ?? true) {
        location_view_model.get_storage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Menu'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(204, 128, 53, 0.965)),
                child: Text(
                  'Menu Keeper',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                selected: _selectedIndex == 0,
                onTap: () {
                  _onItemTapped(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.storage),
                title: Text('Item'),
                selected: _selectedIndex == 1,
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Account'),
                selected: _selectedIndex == 2,
                onTap: () {
                  _onItemTapped(2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
