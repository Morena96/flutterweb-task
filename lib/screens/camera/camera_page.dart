// ignore_for_file: avoid_print

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supono/app/routes/app_route_constants.dart';
import 'package:supono/app/theme/app_colors.dart';
import 'package:supono/app/widgets/app_back_button.dart';
import 'package:supono/screens/camera/cubit/user_form_cubit.dart';

class CameraPage extends StatefulWidget {
  const CameraPage(this.cameras, {super.key});

  final List<CameraDescription> cameras;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  int activeCamera = 1;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.cameras[activeCamera],
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    child: CameraPreview(_controller),
                  ),
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
                    icon: 'assets/icons/refresh.svg',
                    onPressed: () {
                      setState(() {
                        _controller = CameraController(
                          widget.cameras[1 - activeCamera],
                          ResolutionPreset.medium,
                        );

                        _initializeControllerFuture = _controller.initialize();
                      });
                    },
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: GestureDetector(
                    onTap: () async {
                      try {
                        await _initializeControllerFuture;

                        final image = await _controller.takePicture();

                        if (!context.mounted) return;

                        context.read<UserFormCubit>().changeUserAvatar(image);

                        await context.push(AppRouteConstants.home);
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Container(
                      height: 84,
                      width: 84,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.4),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
