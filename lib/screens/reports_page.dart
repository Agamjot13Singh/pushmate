import 'package:flutter/material.dart';
import 'package:pushmate/components/header.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: Header(whenPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        }),
        drawer: const DrawerMenu(),
        body: const Center(
          child: Text("REports"),
        ));
  }
}

class SingleReport extends StatelessWidget {
  const SingleReport({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile();
  }
}
