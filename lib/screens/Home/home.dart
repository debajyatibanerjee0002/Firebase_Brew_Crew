import 'package:brew_crew/screens/Home/brew_list.dart';
import 'package:brew_crew/screens/Home/settings_form.dart';
import 'package:brew_crew/services/auth_services.dart';

import 'package:flutter/material.dart';
import 'package:brew_crew/services/database.dart';
import 'package:provider/provider.dart';

import 'package:brew_crew/models/brew.dart';

class Home extends StatelessWidget {
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.green[100],
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingForm(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            title: Text(
              'Brew Crew',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                highlightColor: Colors.green[800],
                icon: Icon(Icons.exit_to_app),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
              // FlatButton.icon(
              //   highlightColor: Colors.red[800],
              //   onPressed: () async {
              //     await _auth.signOut();
              //   },
              //   icon: Icon(
              //     Icons.person,
              //     color: Colors.white,
              //   ),
              //   label: Text(
              //     'Log Out',
              //     style: TextStyle(
              //       color: Colors.brown[100],
              //     ),
              //   ),
              // ),
              IconButton(
                highlightColor: Colors.green[800],
                icon: Icon(Icons.settings),
                onPressed: () => _showSettingsPanel(),
              ),
            ],
            backgroundColor: Colors.brown,
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/coffee_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: BrewList(),
          ),
        ),
      ),
    );
  }
}
