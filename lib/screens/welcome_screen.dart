import 'package:flutter/material.dart';
import 'package:p5/screens/tabs.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _positionController;
  late Animation<RelativeRect> _positionAnimation;

  @override
  void initState() {
    super.initState();
    _positionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _positionAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(0, 0, 0, 0),
      end: RelativeRect.fromLTRB(0, 0, 0, 550),
    ).animate(
      CurvedAnimation(
        parent: _positionController,
        curve: Curves.easeInOut,
      ),
    );

    _positionController.forward();
  }

  @override
  void dispose() {
    _positionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(217, 36, 21, 7), // Custom background color
      ),
      child: Scaffold(
        body: Stack(
          children: [
            PositionedTransition(
              rect: _positionAnimation,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(38),
                child: Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  height: 0,
                  child: Image.asset('assets/images/Logo.png'),
                ),
              ),
            ),
            Positioned(
              top: 520,
              left: 20,
              child: Text(
                'Welcome to our cafe , Enjoy\nevery sip!',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 252, 251, 251),
                ),
              ),
            ),
            Positioned(
              top: 620,
              left: 20,
              child: Text(
                'Grab a cup of our smooth coffee and a warm \n pastry ,we’re here to make your day brighter!',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 255, 254, 254),
                ),
              ),
            ),
            Positioned(
              bottom: 70,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const TabsScreen();
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      transitionDuration: const Duration(milliseconds: 800),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(24),
                  backgroundColor: Color.fromARGB(95, 245, 164, 144),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
