import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:day18_todo_app/amplifyconfiguration.dart';
import 'package:day18_todo_app/auth_cubit.dart';
import 'package:day18_todo_app/loading_view.dart';
import 'package:day18_todo_app/models/ModelProvider.dart';
import 'package:day18_todo_app/todo_cubit.dart';
import 'package:day18_todo_app/todos_view.dart';
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
  bool _amplifyConfigured = false;
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) =>AuthCubit(),
        child: _amplifyConfigured ? const TodosView() : const LoadingView(),
      ),
    );
  }

  void _configureAmplify() async {
    // Once Plugins are added, configure Amplify
    try {
      await Future.wait([
        Amplify.addPlugin(
            AmplifyDataStore(modelProvider: ModelProvider.instance)),
        Amplify.addPlugin(AmplifyAPI()),
        Amplify.addPlugin(AmplifyAuthCognito()),
      ]);
      await Amplify.configure(amplifyconfig);
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }
}
