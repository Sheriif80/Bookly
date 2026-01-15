import 'package:bookly/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 25, top: 60, bottom: 30),
      child: Row(
        children: [
          SvgPicture.asset(AssetsData.logo, width: 75, height: 19),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 25),
          ),
        ],
      ),
    );
  }
}
