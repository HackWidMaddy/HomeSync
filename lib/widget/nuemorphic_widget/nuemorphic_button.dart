import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NuemorphicButton extends StatefulWidget {
  const NuemorphicButton({
    super.key,
    this.label = '',
    this.height = 60,
    this.width = double.infinity,
    this.borderRadius = 15,
    this.surfaceColor = const Color.fromARGB(255, 238, 238, 238),
    this.shadowColor = const Color.fromARGB(255, 238, 238, 238),
    this.curveType = CurveType.concave,
    required this.function,
    required this.child,
  });

  final double width, height, borderRadius;
  final String? label;
  final Color? surfaceColor, shadowColor;
  final CurveType curveType;
  final VoidCallback function;
  final Widget child;

  @override
  State<NuemorphicButton> createState() => _NuemorphicButtonState();
}

class _NuemorphicButtonState extends State<NuemorphicButton> {
  double spreadValue = 1;
  bool isEmbossed = false;
  double childScale = 1.0;

  void _onButtonTap() {
    setState(() {
      isEmbossed = true;
      spreadValue = 0.1;
      childScale = 0.95;
    });

    HapticFeedback.selectionClick();
    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        isEmbossed = false;
        spreadValue = 1;
        childScale = 1.0;
      });

      widget.function();
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onLongPress: () {},
      onTap: _onButtonTap,
      child: ClayAnimatedContainer(
        emboss: isEmbossed,
        duration: const Duration(milliseconds: 150),
        height: widget.height,
        width: widget.width,
        borderRadius: widget.borderRadius,
        spread: spreadValue,
        curve: Curves.easeInOut,
        curveType: widget.curveType,
        depth: 30,
        color: widget.shadowColor,
        surfaceColor: widget.surfaceColor,
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 1.0, end: childScale),
          duration: const Duration(milliseconds: 150),
          builder: (context, scale, child) {
            return Transform.scale(scale: scale, child: widget.child);
          },
        ),
      ),
    );
  }
}
