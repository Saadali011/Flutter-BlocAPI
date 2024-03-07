import 'package:blocapi/logic/cubits/post_cubit/post_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/post_model.dart';
import '../../logic/cubits/post_cubit/post_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Api Handing"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child:BlocConsumer<PostCubit,PostState>(
            builder:(context,state){
              if(state is PostLoadingState){
                return Center(
                    child: CircularProgressIndicator(),
                );
              }
              if(state is PostLoadedState){
                return builPostListView(state.posts);
              }
              return Center(
                child: Text(
                  "An error occured!"
                ),
              );
            },
          listener: (context,state){
              if(state is PostErrorState){
                SnackBar snackBar = SnackBar(content: Text(state.error),backgroundColor: Colors.red,);
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
          },
        )
      ),
    );
  }

  Widget builPostListView(List<PostModel>posts){
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context , index){
        PostModel post = posts[index];
        return ListTile(
          title: Text(post.title.toString()),
          subtitle: Text(post.body.toString()),
        );
      },
    );
  }
}
