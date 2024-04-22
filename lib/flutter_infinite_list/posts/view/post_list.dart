import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/flutter_infinite_list/posts/posts.dart';

class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(builder: (context, state) {
      switch (state.status) {
        case PostStatus.failure:
          return Center(
            child: Text("Failed to fetch posts"),
          );
        case PostStatus.success:
          if (state.posts.isEmpty) {
            return Center(
              child: Text("No Posts"),
            );
          }
          return ListView.builder(
              controller: _scrollController,
              itemCount: state.hasReachedMax
                  ? state.posts.length
                  : state.posts.length + 1,
              itemBuilder: (BuildContext context, int index) {
                return index >= state.posts.length
                    ? const BottomLoader()
                    : PostListItem(post: state.posts[index]);
              });
        case PostStatus.initial:
          return Center(
            child: CircularProgressIndicator(),
          );
        default:
          return SizedBox();
      }
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(PostFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
