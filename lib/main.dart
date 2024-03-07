import 'dart:developer';

import 'package:blocapi/data/models/post_model.dart';
import 'package:blocapi/data/repositories/post_repository.dart';
import 'package:blocapi/logic/cubits/post_cubit/post_cubit.dart';
import 'package:blocapi/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // PostRepository postRepository = PostRepository();
  // Iterable<PostModel> postModels = await postRepository.fetchPosts();
  // log(postModels.toString());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
