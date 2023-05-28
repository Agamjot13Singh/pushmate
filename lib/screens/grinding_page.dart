import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pushmate/components/header.dart';

class GrindingPage extends StatefulWidget {
  const GrindingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GrindingPageState createState() => _GrindingPageState();
}

class _GrindingPageState extends State<GrindingPage> {
  bool _showGif = true;
  bool isTimerRunning = false;
  int sensePushes = 0;
  int secondsElapsed = 0;
  Timer? timer;
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void stopTimer() {
    timer?.cancel();
    isTimerRunning = false;
  }

  @override
  void initState() {
    super.initState();
    // Delay hiding the GIF after 2 seconds (adjust the duration as needed)
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showGif = false;
      });
      // startTmer();
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        secondsElapsed++;
      });
    });
  }

  String formatTime(int seconds) {
    if (seconds < 60) {
      return '$seconds seconds';
    } else {
      int minutes = seconds ~/ 60;
      int remainingSeconds = seconds % 60;
      return '$minutes:$remainingSeconds';
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: _scaffoldKey,
        appBar: Header(
          whenPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        drawer: const DrawerMenu(),
        body: Center(
          child: _showGif
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/russia.gif',
                      width: 500,
                      height: 500,
                    ),
                  ],
                )
              : GestureDetector(
                  onTap: () {
                    if (!isTimerRunning) {
                      setState(() {
                        sensePushes++;
                      });
                    }
                  },
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: const Color(0xFFF3313131),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 200,
                          ),
                          Text(
                            "TIME - ${formatTime(secondsElapsed)}",
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "PUSHUPS DONE - $sensePushes",
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 200,
                          ),
                          Text(
                            'You can tap anywhere on the screen or come near the screen to add your pushups.',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color.fromARGB(255, 109, 107, 107),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromARGB(255, 94, 135, 145))),
                              onPressed: () {
                                setState(() {
                                  stopTimer();
                                });
                              },
                              child: Text(isTimerRunning ? "START" : "STOP"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        ));
  }
}
