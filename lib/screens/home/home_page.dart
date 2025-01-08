import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:supono/app/routes/app_route_constants.dart';
import 'package:supono/app/theme/app_colors.dart';
import 'package:supono/app/theme/app_text_style.dart';
import 'package:supono/app/widgets/app_back_button.dart';
import 'package:supono/screens/camera/cubit/user_form_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFormCubit, UserFormState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              if (state.user.avatar != null)
                Image.file(
                  File(state.user.avatar!),
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  fit: BoxFit.cover,
                ),
              Positioned(
                top: 60,
                left: 25,
                child: AppBackButton(onPressed: context.pop),
              ),
              Positioned(
                top: 60,
                right: 25,
                child: AppBackButton(
                  icon: 'assets/icons/settings.svg',
                  onPressed: () => context.push(AppRouteConstants.settings),
                ),
              ),
              if (!state.user.isAppUnlocked) ...[
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 92,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColors.black,
                      border: Border(
                        top: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Banner Ad here',
                      style: AppTextStyle.white25w800,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 94,
                  right: 40,
                  child: SvgPicture.asset('assets/icons/remove.svg'),
                ),
              ]
            ],
          ),
        );
      },
    );
  }
}
