import 'package:flutter/material.dart';
import '../../../../../../base/base_model.dart';
import '../../../../../../features/home/drawer/view/drawer_view.dart';
import '../../../../../style/app_color.dart';
import 'custom_circular_indicator.dart';
import 'custom_scafold_message.dart';

typedef NotificationBuilder =
    Widget Function(BuildContext context, String message);

class CustomScaffold extends StatefulWidget {
  final bool showDrawer;
  final BaseModel viewModel;
  final VoidCallback? onErrorClose;
  final VoidCallback? onInfoClose;
  final NotificationBuilder? errorBuilder;
  final NotificationBuilder? infoBuilder;
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const CustomScaffold({
    super.key,
    this.showDrawer = false,
    this.onInfoClose,
    this.errorBuilder,
    this.onErrorClose,
    this.infoBuilder,
    required this.viewModel,
    this.appBar,
    this.body,
    this.backgroundColor = AppColor.background,
    this.padding,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.scaffoldKey,
  });

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  void didUpdateWidget(covariant CustomScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.viewModel.errorMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        CustomScaffoldMessenger.show(
          context,
          showProgress: true,
          type: SnackBarType.error,
          message: widget.viewModel.errorMessage!,
          duration: const Duration(seconds: 5),
          onTap: () => widget.viewModel.cleanErrorMessage(),
          onClose: () => widget.viewModel.cleanErrorMessage(),
        );
      });
    }

    if (widget.viewModel.infoMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        CustomScaffoldMessenger.show(
          context,
          showProgress: true,
          type: SnackBarType.success,
          message: widget.viewModel.infoMessage!,
          duration: const Duration(seconds: 5),
          onTap: () => widget.viewModel.cleanInfoMessage(),
          onClose: () => widget.viewModel.cleanInfoMessage(),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      backgroundColor: widget.backgroundColor,
      drawer: widget.showDrawer ? AppSidebarDrawer() : null,
      appBar: widget.appBar,
      body: Stack(
        children: [
          Container(
            padding:
                widget.padding ?? const EdgeInsets.symmetric(horizontal: 20),
            child: widget.body ?? const SizedBox.shrink(),
          ),
          if (widget.viewModel.isLoading)
            Container(
              color: AppColor.text.withValues(alpha: 0.2),
              child: CustomLoadingIndicator(
                message: widget.viewModel.loadingMessage,
                withBackground: true,
              ),
            ),
        ],
      ),
      floatingActionButton: widget.floatingActionButton,
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
    );
  }
}

class CustomSnackBar extends StatefulWidget {
  final String message;
  final Color backgroundColor;
  final IconData? icon;
  final VoidCallback? onClose;
  final bool isError;

  const CustomSnackBar({
    super.key,
    required this.message,
    required this.backgroundColor,
    this.icon,
    this.onClose,
    this.isError = false,
  });

  @override
  State<CustomSnackBar> createState() => _CustomSnackBarState();
}

class _CustomSnackBarState extends State<CustomSnackBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              if (widget.icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Icon(widget.icon, color: Colors.white),
                ),
              Expanded(
                child: Text(
                  widget.message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (widget.onClose != null)
                GestureDetector(
                  onTap: widget.onClose,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(Icons.close, color: Colors.white, size: 20),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
