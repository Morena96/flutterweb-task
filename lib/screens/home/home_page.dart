import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supono/app/routes/app_route_constants.dart';
import 'package:supono/app/widgets/app_back_button.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.image, {super.key});

  final XFile image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.file(
            File(image.path),
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
        ],
      ),
    );
  }
}
