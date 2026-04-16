import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:self_bet/core/constants/colors.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title = 'Mindful Sanctuary';
  const PrimaryAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Mindful Sanctuary',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      iconTheme: IconThemeData(color: AppColors.onSurface),
      backgroundColor: AppColors.surfaceWhite,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          'assets/icons/icon_user.svg',
          width: 32,
          height: 32,
          fit: BoxFit.cover,
          // No colorFilter: asset is a photo inside SVG.
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/icon_setting.svg',
            width: 19,
            height: 19,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
