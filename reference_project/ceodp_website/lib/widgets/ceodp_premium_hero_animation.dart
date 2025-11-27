import 'dart:math';
import 'package:flutter/material.dart';

class CeodpPremiumHeroAnimation extends StatefulWidget {
  final Widget logo; // pass your globe icon here
  final String title;
  final String subtitle;
  final bool skipIntro;

  const CeodpPremiumHeroAnimation({
    super.key,
    required this.logo,
    this.title = 'CEODP',
    this.subtitle = 'Control Every Operation of Digital Pay',
    this.skipIntro = false,
  });

  @override
  State<CeodpPremiumHeroAnimation> createState() =>
      _CeodpPremiumHeroAnimationState();
}

class _CeodpPremiumHeroAnimationState extends State<CeodpPremiumHeroAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeLogo;
  late final Animation<Offset> _slideLogo;
  late final Animation<double> _fadeText;
  late final Animation<Offset> _slideText;
  late final Animation<double> _shinePosition;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    _fadeLogo = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
    );

    _slideLogo = Tween<Offset>(begin: const Offset(0, 0.12), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
          ),
        );

    _fadeText = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.25, 0.7, curve: Curves.easeOut),
    );

    _slideText = Tween<Offset>(begin: const Offset(0, 0.18), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.25, 0.7, curve: Curves.decelerate),
          ),
        );

    _shinePosition = Tween<double>(begin: -1.2, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.55, 1.0, curve: Curves.easeInOut),
      ),
    );

    _updateAnimationState();
  }

  @override
  void didUpdateWidget(CeodpPremiumHeroAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.skipIntro != widget.skipIntro) {
      _updateAnimationState();
    }
  }

  void _updateAnimationState() {
    if (widget.skipIntro) {
      _controller.value = 1.0; // Jump to end
    } else {
      _controller.value = 0.0;
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.displaySmall?.copyWith(
      fontWeight: FontWeight.w700,
      letterSpacing: 1.5,
      color: const Color(0xFF003B73),
    );
    final subtitleStyle = theme.textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w500,
      color: const Color(0xFF00529C),
    );

    return Stack(
      alignment: Alignment.center,
      children: [
        // Subtle banking "network" background
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return CustomPaint(
                painter: _NetworkBackgroundPainter(progress: _controller.value),
              );
            },
          ),
        ),

        // Main hero content
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _slideLogo,
                child: FadeTransition(opacity: _fadeLogo, child: widget.logo),
              ),
              const SizedBox(height: 24),
              SlideTransition(
                position: _slideText,
                child: FadeTransition(
                  opacity: _fadeText,
                  child: _ShimmerTitle(
                    title: widget.title,
                    subtitle: widget.subtitle,
                    titleStyle: titleStyle,
                    subtitleStyle: subtitleStyle,
                    shinePosition: _shinePosition,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Title + subtitle with diagonal light "shine"
class _ShimmerTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Animation<double> shinePosition;

  const _ShimmerTitle({
    required this.title,
    required this.subtitle,
    required this.titleStyle,
    required this.subtitleStyle,
    required this.shinePosition,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: shinePosition,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (rect) {
            final width = rect.width;
            final dx = shinePosition.value * width;
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: const [Colors.white24, Colors.white, Colors.white24],
              stops: [
                (dx / width).clamp(0.0, 1.0),
                (dx / width + 0.15).clamp(0.0, 1.0),
                (dx / width + 0.3).clamp(0.0, 1.0),
              ],
            ).createShader(rect);
          },
          blendMode: BlendMode.srcATop,
          child: child,
        );
      },
      child: Column(
        children: [
          Text(title, style: titleStyle),
          const SizedBox(height: 8),
          Text(subtitle, style: subtitleStyle, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

/// Very subtle animated "network" / constellation background
class _NetworkBackgroundPainter extends CustomPainter {
  final double progress;
  final List<Offset> _nodes;
  final Random _rng = Random(2025);

  _NetworkBackgroundPainter({required this.progress}) : _nodes = [] {
    // generate fixed nodes
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paintNode = Paint()
      ..color = const Color(0x2200529C)
      ..style = PaintingStyle.fill;

    final paintLine = Paint()
      ..color = const Color(0x3300529C)
      ..strokeWidth = 1.0;

    // lazily generate nodes if empty
    if (_nodes.isEmpty) {
      for (int i = 0; i < 14; i++) {
        final dx = _rng.nextDouble() * size.width;
        final dy = _rng.nextDouble() * size.height * 0.5 + size.height * 0.15;
        _nodes.add(Offset(dx, dy));
      }
    }

    final t = Curves.easeInOut.transform(progress);

    // Slight vertical float + parallax
    for (var i = 0; i < _nodes.length; i++) {
      final node = _nodes[i];
      final phase = (i / _nodes.length) * 2 * pi;
      final dy = sin(phase + t * 2 * pi) * 6.0;
      final animated = node.translate(0, dy);

      canvas.drawCircle(animated, 3.0, paintNode);

      // connect to a couple of neighbours
      if (i % 3 == 0 && i + 2 < _nodes.length) {
        final neighbor1 = _nodes[i + 1].translate(
          0,
          sin((i + 1) / _nodes.length * 2 * pi + t * 2 * pi) * 6.0,
        );
        final neighbor2 = _nodes[i + 2].translate(
          0,
          sin((i + 2) / _nodes.length * 2 * pi + t * 2 * pi) * 6.0,
        );
        canvas.drawLine(animated, neighbor1, paintLine);
        canvas.drawLine(animated, neighbor2, paintLine);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _NetworkBackgroundPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
