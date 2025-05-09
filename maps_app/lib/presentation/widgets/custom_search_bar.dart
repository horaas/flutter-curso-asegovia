import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app/blocs/blocs.dart';
import 'package:maps_app/models/search_result.dart';
import 'package:maps_app/presentation/delegates/search_delegate_map.dart';


class CustomSearchBar extends StatelessWidget {

  const CustomSearchBar({ super.key });

   @override
   Widget build(BuildContext context) {
       return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
         return state.displaySearchMarker ? const SizedBox() : FadeInDown(
          duration: const Duration(milliseconds: 300),
          child: const _CustomSearchBarBody()); 
       },);
  }
}
class _CustomSearchBarBody extends StatelessWidget {
  const _CustomSearchBarBody({super.key});


  onSearchResult(BuildContext context, SearchResult result) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);

    if (result.manual != null && result.manual!) {
      searchBloc.add(OnActivatedManualMarkerEvent());
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * 0.06,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
        ),
        child: GestureDetector(
          onTap: () async {
            final result = await showSearch(context: context, delegate: SearchDelegateMap());
            if(result == null) return;
            if (context.mounted) {
              onSearchResult(context, result);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: const Text('¿buscar?'),
          ),
        ),
      ),
    );
  }
}
