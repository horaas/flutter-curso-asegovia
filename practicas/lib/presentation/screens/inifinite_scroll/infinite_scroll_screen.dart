import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesSliedes = [1, 2, 3, 4, 5];
  bool isLoading = false;
  bool isMounted = true;

  final ScrollController scrollController = ScrollController();

  void addImagesLaod() {
    final lastId = imagesSliedes.last;

    imagesSliedes.addAll(
      [1, 2, 3, 4, 5].map((e) => lastId + e)
    );
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addImagesLaod();
    isLoading = false;

    if (!isMounted) return;

    setState(() {});
    loadToRefreshScroll();
  }

  Future loadToRefresh() async {

    isLoading = true;
    setState(() {});

    if (!isMounted) return;

    await Future.delayed(const Duration(seconds: 3));

    isLoading = false;
    final lastId = imagesSliedes.last;
    imagesSliedes.clear();
    imagesSliedes.add(lastId +1);
    addImagesLaod();

    setState(() {});

  }

   void loadToRefreshScroll() {
    if (scrollController.position.pixels +12 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels +120,
      duration: const Duration(microseconds: 300),
      curve: Curves.fastOutSlowIn
    );
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    },);
  }
  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      //  appBar: AppBar(title: const Text('Infinit scroll and pull'),),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: loadToRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesSliedes.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                  placeholder: const AssetImage('assets/images/load.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${imagesSliedes[index]}/500/300'));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: 
        !isLoading ?
        const Icon(Icons.arrow_back_ios_new_outlined) : 
        SpinPerfect(
          infinite: true,
          child: FadeIn(child: const Icon(Icons.refresh))
        ),
      ),
    );
  }
}
