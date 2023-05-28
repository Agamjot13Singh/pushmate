import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isTimerRunning = false;
  int pushUpCount = 0;
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

  void startTimer() {
    if (isTimerRunning) return; // Return if timer is already running
    isTimerRunning = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        secondsElapsed++;
      });
    });
  }

  void incrementPushUpCount() {
    if (isTimerRunning) {
      setState(() {
        pushUpCount++;
      });
    }
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String formattedMinutes = minutes.toString().padLeft(2, '0');
    String formattedSeconds = remainingSeconds.toString().padLeft(2, '0');
    return '$formattedMinutes:$formattedSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          incrementPushUpCount();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xfff313131),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 200,
                    ),
                    Text(
                      formatTime(secondsElapsed),
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '$pushUpCount',
                      style: GoogleFonts.poppins(
                        fontSize: 78,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 200,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        startTimer();
                      },
                      child: const Text('START'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 97, 148, 53)),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        stopTimer();
                      },
                      child: const Text('STOP'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        pushUpCount = 0;
                        secondsElapsed = 0;
                      });
                    },
                    child: Text("RESET"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.amber[200])),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
