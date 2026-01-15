import 'package:bookly/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(AssetsData.logo, width: 230),
        const Gap(15),
        Text(
          'Enjoy Reading',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            textStyle: const TextStyle(fontSize: 17, fontWeight: .w500),
          ),
        ),
      ],
    );
  }
}
