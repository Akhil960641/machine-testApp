import 'package:flutter/material.dart';
import 'package:machine_test/domain/colors.dart';
import 'package:machine_test/domain/extensions/margin_ext.dart';
import 'package:machine_test/domain/shared/page_navigator.dart';
import 'package:machine_test/domain/strings.dart';
import 'package:machine_test/presentation/components/app_svg.dart';
import 'package:machine_test/presentation/components/app_text.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppbar(
      {super.key, this.isHomePage = false, this.title, this.isBackBtn = false});

  final bool isHomePage, isBackBtn;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: background,
      titleSpacing: isBackBtn ? 0 : 20,
      leading: isHomePage
          ? const Padding(
              padding: EdgeInsets.only(left: 14, bottom: 14, top: 14),
              child: AppSvg(
                assetName: "Mask group",
              ),
            )
          : isBackBtn
              ? Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(0, 221, 143, 143),
                      enableFeedback: false,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.padded,
                    ),
                    onPressed: () {
                      Screen.close(context);
                    },
                    icon: const AppSvg(
                      assetName: "arrow-left",
                    ),
                    label: const AppText(""),
                  ),
                )
              : null,
      title: AppText(
        title,
        family: inter500,
        size: 16,
      ),
      centerTitle: isBackBtn,
      actions: [
        const Icon(Icons.menu),
        25.wBox,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
