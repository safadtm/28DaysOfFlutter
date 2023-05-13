import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:day21_login_ui_bloc/amplifyconfiguration.dart';
import 'package:day21_login_ui_bloc/app_navigator.dart';
import 'package:day21_login_ui_bloc/auth/auth_repository.dart';
import 'package:day21_login_ui_bloc/data_repository.dart';
import 'package:day21_login_ui_bloc/loading_view.dart';
import 'package:day21_login_ui_bloc/models/ModelProvider.dart';
import 'package:day21_login_ui_bloc/session_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isAmplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Meida',
      theme: Theme.of(context).copyWith(
        primaryColor: Colors.greenAccent,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.greenAccent,
          secondary: Colors.greenAccent,
        ),
      ),
      home: _isAmplifyConfigured
          ? MultiRepositoryProvider(
              providers: [
                RepositoryProvider(
                  create: (context) => AuthRepository(),
                ),
                RepositoryProvider(
                  create: (context) => DataRepository(),
                ),
              ],
              child: BlocProvider(
                create: (context) => SessionCubit(
                  authRepo: context.read<AuthRepository>(),
                  dataRepo: context.read<DataRepository>(),
                ),
                child: const AppNavigator(),
              ),
            )
          : const LoadingView(),
    );
  }

  Future<void> _configureAmplify() async {
    try {
      await Amplify.addPlugins([
        AmplifyAuthCognito(),
        AmplifyDataStore(modelProvider: ModelProvider.instance),
        AmplifyAPI(),
      ]);

      await Amplify.configure(amplifyconfig);

      setState(() => _isAmplifyConfigured = true);
    } catch (e) {
      print(e);
    }
  }
}
