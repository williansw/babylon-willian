import 'package:flutter/material.dart';

/// Extension that adds animated effects to any Widget
///
/// Usage example:
/// ```dart
/// Container(
///   width: 100,
///   height: 100,
///   color: Colors.blue,
/// )
/// .bounce(intensity: 20)
/// .shake()
/// .fade(duration: Duration(seconds: 2))
/// ```
extension WidgetEffectsExtension on Widget {
  /// Bounce effect that makes the widget jump vertically
  ///
  /// Parameters:
  /// - [intensity]: Jump height in pixels (default: 15.0)
  /// - [jumps]: Number of jumps (default: 1)
  /// - [duration]: Animation duration (default: 800ms)
  /// - [delay]: Delay before starting animation (default: 0)
  /// - [curve]: Animation curve (default: Curves.elasticOut)
  /// - [repeat]: Whether to repeat infinitely (default: false)
  /// - [reverse]: Whether to reverse the animation (default: true)
  /// - [onComplete]: Callback when animation completes
  Widget bounce({
    double intensity = 15.0,
    int jumps = 1,
    Duration duration = const Duration(milliseconds: 800),
    Duration delay = Duration.zero,
    Curve curve = Curves.elasticOut,
    bool repeat = false,
    bool reverse = true,
    VoidCallback? onComplete,
  }) {
    return _BounceEffect(
      intensity: intensity,
      jumps: jumps,
      duration: duration,
      delay: delay,
      curve: curve,
      repeat: repeat,
      reverse: reverse,
      onComplete: onComplete,
      child: this,
    );
  }

  /// Shake effect that wobbles the widget horizontally/vertically
  ///
  /// Parameters:
  /// - [intensity]: Horizontal shake strength (default: 10.0)
  /// - [verticalIntensity]: Vertical shake strength (default: 0)
  /// - [duration]: Duration of each cycle (default: 500ms)
  /// - [delay]: Delay before starting (default: 0)
  /// - [repeatCount]: Number of repetitions (default: 3)
  /// - [curve]: Animation curve (default: Curves.easeInOutSine)
  /// - [infinite]: Whether to repeat infinitely (default: false)
  /// - [onComplete]: Callback when animation completes
  Widget shake({
    double intensity = 10.0,
    double verticalIntensity = 0,
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = Duration.zero,
    int repeatCount = 3,
    Curve curve = Curves.easeInOutSine,
    bool infinite = false,
    VoidCallback? onComplete,
  }) {
    return _ShakeEffect(
      intensity: intensity,
      verticalIntensity: verticalIntensity,
      duration: duration,
      delay: delay,
      repeatCount: repeatCount,
      curve: curve,
      infinite: infinite,
      onComplete: onComplete,
      child: this,
    );
  }

  /// Fade effect that controls the widget's opacity
  ///
  /// Parameters:
  /// - [beginOpacity]: Initial opacity (0.0 to 1.0) (default: 0.0)
  /// - [endOpacity]: Final opacity (0.0 to 1.0) (default: 1.0)
  /// - [duration]: Animation duration (default: 300ms)
  /// - [delay]: Delay before starting (default: 0)
  /// - [curve]: Animation curve (default: Curves.easeIn)
  /// - [repeat]: Whether to repeat infinitely (default: false)
  /// - [reverse]: Whether to reverse the animation (default: false)
  /// - [onComplete]: Callback when animation completes
  Widget fade({
    double beginOpacity = 0.0,
    double endOpacity = 1.0,
    Duration duration = const Duration(milliseconds: 300),
    Duration delay = Duration.zero,
    Curve curve = Curves.easeIn,
    bool repeat = false,
    bool reverse = false,
    VoidCallback? onComplete,
  }) {
    return _FadeEffect(
      beginOpacity: beginOpacity,
      endOpacity: endOpacity,
      duration: duration,
      delay: delay,
      curve: curve,
      repeat: repeat,
      reverse: reverse,
      onComplete: onComplete,
      child: this,
    );
  }

  /// Zoom effect that scales the widget
  ///
  /// Parameters:
  /// - [beginScale]: Initial scale (default: 0.0)
  /// - [endScale]: Final scale (default: 1.0)
  /// - [duration]: Animation duration (default: 300ms)
  /// - [delay]: Delay before starting (default: 0)
  /// - [curve]: Animation curve (default: Curves.easeOutBack)
  /// - [alignment]: Origin point for zoom (default: Alignment.center)
  /// - [repeat]: Whether to repeat infinitely (default: false)
  /// - [onComplete]: Callback when animation completes
  Widget zoom({
    double beginScale = 0.0,
    double endScale = 1.0,
    Duration duration = const Duration(milliseconds: 300),
    Duration delay = Duration.zero,
    Curve curve = Curves.easeOutBack,
    Alignment alignment = Alignment.center,
    bool repeat = false,
    VoidCallback? onComplete,
  }) {
    return _ScaleEffect(
      beginScale: beginScale,
      endScale: endScale,
      duration: duration,
      delay: delay,
      curve: curve,
      alignment: alignment,
      repeat: repeat,
      onComplete: onComplete,
      child: this,
    );
  }

  /// Spin effect that rotates the widget
  ///
  /// Parameters:
  /// - [beginAngle]: Initial angle in radians (default: 0.0)
  /// - [endAngle]: Final angle in radians (2*PI = 360°) (default: 6.2832)
  /// - [duration]: Animation duration (default: 1000ms)
  /// - [delay]: Delay before starting (default: 0)
  /// - [curve]: Animation curve (default: Curves.linear)
  /// - [clockwise]: Clockwise direction (default: true)
  /// - [repeat]: Whether to repeat infinitely (default: false)
  /// - [onComplete]: Callback when animation completes
  Widget spin({
    double beginAngle = 0.0,
    double endAngle = 6.2832,
    Duration duration = const Duration(milliseconds: 1000),
    Duration delay = Duration.zero,
    Curve curve = Curves.linear,
    bool clockwise = true,
    bool repeat = false,
    VoidCallback? onComplete,
  }) {
    return _SpinEffect(
      beginAngle: beginAngle,
      endAngle: endAngle,
      duration: duration,
      delay: delay,
      curve: curve,
      clockwise: clockwise,
      repeat: repeat,
      onComplete: onComplete,
      child: this,
    );
  }

  /// Float effect that moves the widget up and down
  ///
  /// Parameters:
  /// - [distance]: Floating distance in pixels (default: 10.0)
  /// - [duration]: Duration of each cycle (default: 2 seconds)
  /// - [delay]: Delay before starting (default: 0)
  /// - [curve]: Animation curve (default: Curves.easeInOut)
  /// - [infinite]: Whether to repeat infinitely (default: true)
  /// - [onComplete]: Callback when animation completes (not called if infinite=true)
  Widget float({
    double distance = 10.0,
    Duration duration = const Duration(seconds: 2),
    Duration delay = Duration.zero,
    Curve curve = Curves.easeInOut,
    bool infinite = true,
    VoidCallback? onComplete,
  }) {
    return _FloatEffect(
      distance: distance,
      duration: duration,
      delay: delay,
      curve: curve,
      infinite: infinite,
      onComplete: onComplete,
      child: this,
    );
  }

  /// Pulse effect that alternates between scales
  ///
  /// Parameters:
  /// - [minScale]: Minimum scale (default: 0.9)
  /// - [maxScale]: Maximum scale (default: 1.1)
  /// - [duration]: Duration of each cycle (default: 800ms)
  /// - [delay]: Delay before starting (default: 0)
  /// - [curve]: Animation curve (default: Curves.easeInOut)
  /// - [repeatCount]: Number of repetitions (null for infinite) (default: null)
  /// - [onComplete]: Callback when animation completes
  Widget pulse({
    double minScale = 0.9,
    double maxScale = 1.1,
    Duration duration = const Duration(milliseconds: 800),
    Duration delay = Duration.zero,
    Curve curve = Curves.easeInOut,
    int? repeatCount,
    VoidCallback? onComplete,
  }) {
    return _PulseEffect(
      minScale: minScale,
      maxScale: maxScale,
      duration: duration,
      delay: delay,
      curve: curve,
      repeatCount: repeatCount,
      onComplete: onComplete,
      child: this,
    );
  }
}

// ==========================================
// Effect Implementations
// ==========================================

class _BounceEffect extends StatefulWidget {
  final Widget child;
  final double intensity;
  final int jumps;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final bool repeat;
  final bool reverse;
  final VoidCallback? onComplete;

  const _BounceEffect({
    required this.child,
    required this.intensity,
    required this.jumps,
    required this.duration,
    required this.delay,
    required this.curve,
    required this.repeat,
    required this.reverse,
    this.onComplete,
  });

  @override
  _BounceEffectState createState() => _BounceEffectState();
}

class _BounceEffectState extends State<_BounceEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = Tween<double>(
      begin: 0,
      end: widget.intensity,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    Future.delayed(widget.delay, () {
      if (widget.repeat) {
        _controller.repeat(reverse: widget.reverse);
      } else {
        _controller.forward().then((_) {
          widget.onComplete?.call();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -_animation.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class _ShakeEffect extends StatefulWidget {
  final Widget child;
  final double intensity;
  final double verticalIntensity;
  final Duration duration;
  final Duration delay;
  final int repeatCount;
  final Curve curve;
  final bool infinite;
  final VoidCallback? onComplete;

  const _ShakeEffect({
    required this.child,
    required this.intensity,
    required this.verticalIntensity,
    required this.duration,
    required this.delay,
    required this.repeatCount,
    required this.curve,
    required this.infinite,
    this.onComplete,
  });

  @override
  _ShakeEffectState createState() => _ShakeEffectState();
}

class _ShakeEffectState extends State<_ShakeEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _xAnimation;
  late Animation<double> _yAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _xAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: widget.intensity),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: widget.intensity, end: -widget.intensity),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween(begin: -widget.intensity, end: 0.0),
        weight: 1,
      ),
    ]).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    _yAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: widget.verticalIntensity),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: widget.verticalIntensity,
          end: -widget.verticalIntensity,
        ),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween(begin: -widget.verticalIntensity, end: 0.0),
        weight: 1,
      ),
    ]).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    Future.delayed(widget.delay, () {
      if (widget.infinite) {
        _controller.repeat();
      } else {
        _controller.repeat(count: widget.repeatCount).then((_) {
          widget.onComplete?.call();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_xAnimation.value, _yAnimation.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class _FadeEffect extends StatefulWidget {
  final Widget child;
  final double beginOpacity;
  final double endOpacity;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final bool repeat;
  final bool reverse;
  final VoidCallback? onComplete;

  const _FadeEffect({
    required this.child,
    required this.beginOpacity,
    required this.endOpacity,
    required this.duration,
    required this.delay,
    required this.curve,
    required this.repeat,
    required this.reverse,
    this.onComplete,
  });

  @override
  _FadeEffectState createState() => _FadeEffectState();
}

class _FadeEffectState extends State<_FadeEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = Tween<double>(
      begin: widget.beginOpacity,
      end: widget.endOpacity,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    Future.delayed(widget.delay, () {
      if (widget.repeat) {
        _controller.repeat(reverse: widget.reverse);
      } else {
        _controller.forward().then((_) {
          widget.onComplete?.call();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(opacity: _animation.value, child: child);
      },
      child: widget.child,
    );
  }
}

class _ScaleEffect extends StatefulWidget {
  final Widget child;
  final double beginScale;
  final double endScale;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final Alignment alignment;
  final bool repeat;
  final VoidCallback? onComplete;

  const _ScaleEffect({
    required this.child,
    required this.beginScale,
    required this.endScale,
    required this.duration,
    required this.delay,
    required this.curve,
    required this.alignment,
    required this.repeat,
    this.onComplete,
  });

  @override
  _ScaleEffectState createState() => _ScaleEffectState();
}

class _ScaleEffectState extends State<_ScaleEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = Tween<double>(
      begin: widget.beginScale,
      end: widget.endScale,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    Future.delayed(widget.delay, () {
      if (widget.repeat) {
        _controller.repeat(reverse: true);
      } else {
        _controller.forward().then((_) {
          widget.onComplete?.call();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          alignment: widget.alignment,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class _SpinEffect extends StatefulWidget {
  final Widget child;
  final double beginAngle;
  final double endAngle;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final bool clockwise;
  final bool repeat;
  final VoidCallback? onComplete;

  const _SpinEffect({
    required this.child,
    required this.beginAngle,
    required this.endAngle,
    required this.duration,
    required this.delay,
    required this.curve,
    required this.clockwise,
    required this.repeat,
    this.onComplete,
  });

  @override
  _SpinEffectState createState() => _SpinEffectState();
}

class _SpinEffectState extends State<_SpinEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = Tween<double>(
      begin: widget.beginAngle,
      end: widget.clockwise ? widget.endAngle : -widget.endAngle,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    Future.delayed(widget.delay, () {
      if (widget.repeat) {
        _controller.repeat();
      } else {
        _controller.forward().then((_) {
          widget.onComplete?.call();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.rotate(angle: _animation.value, child: child);
      },
      child: widget.child,
    );
  }
}

class _FloatEffect extends StatefulWidget {
  final Widget child;
  final double distance;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final bool infinite;
  final VoidCallback? onComplete;

  const _FloatEffect({
    required this.child,
    required this.distance,
    required this.duration,
    required this.delay,
    required this.curve,
    required this.infinite,
    this.onComplete,
  });

  @override
  _FloatEffectState createState() => _FloatEffectState();
}

class _FloatEffectState extends State<_FloatEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = Tween<double>(
      begin: 0,
      end: widget.distance,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    Future.delayed(widget.delay, () {
      if (widget.infinite) {
        _controller.repeat(reverse: true);
      } else {
        _controller.forward().then((_) {
          widget.onComplete?.call();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -_animation.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class _PulseEffect extends StatefulWidget {
  final Widget child;
  final double minScale;
  final double maxScale;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final int? repeatCount;
  final VoidCallback? onComplete;

  const _PulseEffect({
    required this.child,
    required this.minScale,
    required this.maxScale,
    required this.duration,
    required this.delay,
    required this.curve,
    required this.repeatCount,
    this.onComplete,
  });

  @override
  _PulseEffectState createState() => _PulseEffectState();
}

class _PulseEffectState extends State<_PulseEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = Tween<double>(
      begin: widget.minScale,
      end: widget.maxScale,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    Future.delayed(widget.delay, () {
      if (widget.repeatCount == null) {
        _controller.repeat(reverse: true);
      } else {
        _controller.repeat(reverse: true, count: widget.repeatCount).then((_) {
          widget.onComplete?.call();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(scale: _animation.value, child: child);
      },
      child: widget.child,
    );
  }
}
