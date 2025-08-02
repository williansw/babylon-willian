import 'package:flutter/material.dart';

enum SnackBarType { error, success, info, warning }

class CustomScaffoldMessenger {
  static void show(
    BuildContext context, {
    required String message,
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
    bool showProgress = true,
    IconData? customIcon,
    Color? customBackgroundColor,
    VoidCallback? onClose,
    VoidCallback? onTap,
  }) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.clearSnackBars();
    messenger.showSnackBar(
      SnackBar(
        content: CustomSnackBar(
          message: message,
          type: type,
          duration: duration,
          showProgress: showProgress,
          customIcon: customIcon,
          customBackgroundColor: customBackgroundColor,
          onClose: onClose,
          onTap: onTap,
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: duration,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
      ),
    );
  }
}

class CustomSnackBar extends StatefulWidget {
  final String message;
  final SnackBarType type;
  final VoidCallback? onClose;
  final VoidCallback? onTap;
  final Duration duration;
  final bool showProgress;
  final IconData? customIcon;
  final Color? customBackgroundColor;

  const CustomSnackBar({
    super.key,
    required this.message,
    this.type = SnackBarType.info,
    this.onClose,
    this.onTap,
    this.duration = const Duration(seconds: 2),
    this.showProgress = true,
    this.customIcon,
    this.customBackgroundColor,
  });

  @override
  State<CustomSnackBar> createState() => _CustomSnackBarState();
}

class _CustomSnackBarState extends State<CustomSnackBar>
    with TickerProviderStateMixin {
  late AnimationController _entryController;
  late AnimationController _progressController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  bool _isDismissing = false;

  @override
  void initState() {
    super.initState();

    _entryController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _progressController = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..forward();

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _entryController,
      curve: Curves.easeOutBack,
    ));

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _entryController,
        curve: Curves.easeIn,
      ),
    );

    _entryController.forward();

    _progressController.addStatusListener((status) {
      if (status == AnimationStatus.completed && !_isDismissing) {
        _dismissSnackBar();
      }
    });
  }

  Future<void> _dismissSnackBar() async {
    if (_isDismissing) return;
    _isDismissing = true;

    // Para a animação do progresso
    _progressController.stop();

    // Inicia a animação de saída
    await _entryController.reverse();

    if (widget.onClose != null) {
      widget.onClose!();
    }
    setState(() {});
  }

  @override
  void dispose() {
    _entryController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  Color _getBackgroundColor(BuildContext context) {
    if (widget.customBackgroundColor != null) {
      return widget.customBackgroundColor!;
    }

    switch (widget.type) {
      case SnackBarType.error:
        return Theme.of(context).colorScheme.error;
      case SnackBarType.success:
        return Colors.green.shade700;
      case SnackBarType.info:
        return Theme.of(context).colorScheme.primary;
      case SnackBarType.warning:
        return Colors.orange.shade700;
    }
  }

  IconData _getIcon() {
    if (widget.customIcon != null) {
      return widget.customIcon!;
    }

    switch (widget.type) {
      case SnackBarType.error:
        return Icons.error_outline;
      case SnackBarType.success:
        return Icons.check_circle_outline;
      case SnackBarType.info:
        return Icons.info_outline;
      case SnackBarType.warning:
        return Icons.warning_amber_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _getBackgroundColor(context);
    final icon = _getIcon();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: GestureDetector(
                  onTap: widget.onTap,
                  child: Material(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                    elevation: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      child: Row(
                        children: [
                          Icon(icon,
                              color: Colors.white.withValues(alpha: 0.9),
                              size: 24),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              widget.message,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          //if (widget.onClose != null)
                          GestureDetector(
                            onTap: _dismissSnackBar,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Icon(
                                Icons.close,
                                color: Colors.white.withValues(alpha: 0.7),
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (widget.showProgress && !_isDismissing)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: AnimatedBuilder(
                  animation: _progressController,
                  builder: (context, child) {
                    return Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: _progressController.value,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              backgroundColor.withValues(alpha: 0.8),
                            ),
                            backgroundColor: Colors.transparent,
                            minHeight: 2,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
