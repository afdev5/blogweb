import 'package:blogweb/bloc/post_bloc.dart';
import 'package:blogweb/views/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataPost();
  }

  void _getDataPost({String? value}) {
    if(value == null || value.isEmpty) {
      context.read<PostBloc>().add(GetPosts());
    } else {
      context.read<PostBloc>().add(SearchPosts(value: value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Blog Post')),
      body: Container(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Search post',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                _getDataPost(value: value);
              },
            ),
            const SizedBox(height: 14),
            Expanded(
              child: BlocBuilder<PostBloc, PostState>(
                  builder: (context, state) {
                    if(state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if(state.datas?.isEmpty ?? true) {
                        return Center(child: Text(state.message ?? 'no available data'));
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.datas?.length,
                        itemBuilder: (context, index) {
                          final _data = state.datas![index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(data: _data)));
                            },
                            child: Card(
                              child: ListTile(
                                title: Text(_data.title)
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
