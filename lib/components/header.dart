import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pushmate/screens/home_page.dart';
import 'package:pushmate/screens/reports_page.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  Header({required this.whenPressed});
  final void Function() whenPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: Color(0xfffE0E0E0),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.menu_rounded,
          color: Color(0xfffccccc),
        ),
        onPressed: whenPressed,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Push Mate",
            style: GoogleFonts.bebasNeue(),
          )
        ],
      ),
    );
  }
}

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerState();
}

class _DrawerState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: null,
            accountEmail: null,
            currentAccountPicture: null,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/logo.png")),
              color: Color.fromARGB(255, 94, 135, 145),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.house),
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.clipboardList),
            title: Text('Reports'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ReportPage()));
            },
          ),
          Divider(), // Add a horizontal line separator
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Suggestions?'),
            onTap: () {
              // Handle Help button tap
            },
          ),
        ],
      ),
    );
  }
}
