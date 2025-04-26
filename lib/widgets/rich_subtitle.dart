import 'package:flutter/material.dart';
import '../res/app_res.dart';

class RichSubtitle extends StatelessWidget {
  const RichSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: AppTexts.todo,
            style: AppTypo.headerL.copyWith(fontWeight: FontWeight.w900),
          ),
          TextSpan(
            text: AppTexts.app,
            style: AppTypo.headerL.copyWith(
                fontWeight: FontWeight.w900, color: AppColors.primary1),
          ),
        ],
      ),
    );
  }
}
