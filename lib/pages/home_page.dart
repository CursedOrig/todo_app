import 'package:check_list_app/res/app_res.dart';
import 'package:check_list_app/widgets/rich_subtitle.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const RichSubtitle(),
        backgroundColor: AppColors.background,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: 30,
          itemBuilder: (context, index) => Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: AppDeco.mainDeco,
                margin: const EdgeInsets.only(bottom: 8),
                height: 60,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Premier League${index + 1}',
                      style: AppTypo.headerM.copyWith(
                        decoration: (index == 2) ? TextDecoration.lineThrough : TextDecoration.none,
                        color: (index == 2) ? AppColors.layer4 : AppColors.primary,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary1,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: AppColors.layer1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
