import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedWaveContainer extends StatefulWidget {
  const AnimatedWaveContainer({Key? key}) : super(key: key);
  @override
  AnimatedWaveContainerState createState() => AnimatedWaveContainerState();
}

class AnimatedWaveContainerState extends State<AnimatedWaveContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return WaveContainer(
            waveProgress: _animation.value,
            amplitude: 20.0,
            frequency: 2.0,
            child: const SizedBox(
              width: 200.0,
              height: 200.0,
              // Your logo widget here
              child: FlutterLogo(),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class WaveContainer extends StatelessWidget {
  final double waveProgress;
  final double amplitude;
  final double frequency;
  final Widget child;

  const WaveContainer({
    Key? key,
    required this.waveProgress,
    required this.amplitude,
    required this.frequency,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipper(waveProgress, amplitude, frequency),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blue, // Color of the wave
          ),
        ),
        Positioned.fill(
          child: child,
        ),
      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double waveProgress;
  final double amplitude;
  final double frequency;

  WaveClipper(this.waveProgress, this.amplitude, this.frequency);

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height);
    path.lineTo(0, size.height * (1 - waveProgress));

    for (double i = 0; i <= size.width; i++) {
      double y =
          sin((i / size.width * 2 * pi * frequency) + (waveProgress * 2 * pi)) *
                  amplitude +
              size.height * (1 - waveProgress);
      path.lineTo(i, y);
    }

    path.lineTo(size.width, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
