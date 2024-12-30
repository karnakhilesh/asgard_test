// import 'package:asgard/app/core/global-widgets/typography/typography.dart';
// import 'package:asgard/app/core/theme/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter/cupertino.dart';
// import 'dart:io' show Platform;

// class ZipAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String? title;
//   final Widget? titleWidget;
//   final List<Widget>? actions;
//   final Widget? leading;
//   final bool hasBackButton;
//   final Color? backgroundColor;
//   final double? height;
//   final double leadingWidth;
//   final bool centerTitle;
//   final bool hasCupertinoStyle;

//   const ZipAppBar({
//     super.key,
//     this.title,
//     this.titleWidget,
//     this.actions,
//     this.leading,
//     this.hasBackButton = true,
//     this.backgroundColor,
//     this.height,
//     this.leadingWidth = 56,
//     this.centerTitle = true,
//     this.hasCupertinoStyle = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final appBarColor = backgroundColor ?? Colors.transparent;

//     return Platform.isIOS && hasCupertinoStyle
//         ? _buildCupertinoAppBar(appBarColor, context)
//         : _buildMaterialAppBar(appBarColor, context);
//   }

//   /// Builds a Cupertino-style AppBar (iOS)
//   Widget _buildCupertinoAppBar(Color appBarColor, BuildContext context) {
//     return CupertinoNavigationBar(
//       middle: titleWidget ?? _buildTitle(),
//       backgroundColor: appBarColor,
//       leading: _buildCupertinoBackButton(context),
//       trailing: _buildActions(),
//       border: null,
//     );
//   }

//   /// Builds a Material-style AppBar (Android)
//   Widget _buildMaterialAppBar(Color appBarColor, BuildContext context) {
//     return AppBar(
//       systemOverlayStyle: StatusBarUtils.setStatusBarStyle(appBarColor),
//       title: titleWidget ?? _buildTitle(),
//       centerTitle: centerTitle,
//       backgroundColor: appBarColor,
//       leading: _buildMaterialBackButton(context),
//       actions: actions,
//       elevation: 0.0,
//       toolbarHeight: height ?? 44.h,
//       leadingWidth: leadingWidth,
//     );
//   }

//   /// Builds the AppBar title text
//   Widget _buildTitle() {
//     return title != null
//         ? AsgardTypography(
//             text: title!,
//             variant: AsgardTypographyVariant.bodyLarge,
//             fontWeight: FontWeight.bold,
//             color: AppColors.dark500,
//           )
//         : const SizedBox.shrink();
//   }

//   /// Builds the back button for Cupertino AppBar
//   Widget _buildCupertinoBackButton(BuildContext context) {
//     if (!hasBackButton) return const SizedBox.shrink();
//     return leading ??
//         CupertinoNavigationBarBackButton(
//           color: AppColors.dark500,
//           onPressed: () => BackButtonHandler.handleBackButtonPress(context),
//         );
//   }

//   /// Builds the back button for Material AppBar
//   Widget _buildMaterialBackButton(BuildContext context) {
//     if (!hasBackButton) return const SizedBox.shrink();
//     return leading ??
//         IconButton(
//           onPressed: () => BackButtonHandler.handleBackButtonPress(context),
//           icon: Image.asset(
//             ZipIcons.backButtonIcon,
//             width: 24.w,
//             height: 24.h,
//             fit: BoxFit.contain,
//             errorBuilder: (context, error, stackTrace) {
//               return const Icon(Icons.arrow_back);
//             },
//           ),
//         );
//   }

//   /// Builds the action widgets for the AppBar
//   Widget _buildActions() {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: actions ?? [],
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(height ?? 44.h);
// }
