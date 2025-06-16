import 'package:flutter/material.dart';
import 'package:perfume_app/contants/styles.dart';
import 'package:perfume_app/controllers/home_data_controller.dart';
import 'package:perfume_app/models/login_token_model/login_token_model.dart';
import 'package:perfume_app/views/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<LoginTokenModel> getLoginToken() async {
    final api = HomeDataController();
    return await api.getLoginToken();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LoginTokenModel>(
      future: getLoginToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text(
                snapshot.error.toString(),
                style: AppStyles.fs13fw600(),
              ),
            ),
          );
        } else if (snapshot.hasData) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    HomePage(token: snapshot.data!.data!.accessToken!),
              ),
            );
          });
          return Scaffold(
            body: Center(
              child: Text('Logging in...', style: AppStyles.fs13fw600()),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Text(
                'Unexpected error occured',
                style: AppStyles.fs13fw600(),
              ),
            ),
          );
        }
      },
    );
  }
}
