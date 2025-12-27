import 'package:flutter/material.dart';
import 'package:coreafrique/core/constants/app_dimensions.dart';
import 'package:coreafrique/core/utils/responsive_extensions.dart';

/// Reusable container for page sections with consistent spacing and max width
class SectionContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final double? maxWidth;

  const SectionContainer({
    super.key,
    required this.child,
    this.padding,
    this.backgroundColor,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? context.responsivePadding,
      color: backgroundColor,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: maxWidth ?? AppDimensions.maxContentWidth,
          ),
          child: child,
        ),
      ),
    );
  }
}

