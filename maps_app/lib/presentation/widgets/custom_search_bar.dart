import 'package:flutter/material.dart';
import 'package:maps_app/presentation/delegates/search_delegate_map.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

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

            print(result.toString());
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
