import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app/blocs/blocs.dart';


class ManualMarker extends StatelessWidget {

  const ManualMarker({ super.key });

   @override
   Widget build(BuildContext context) {
       return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
         if (state.displaySearchMarker) {
          return const _ManualMarkerBody();
         }
         return const SizedBox();
       },);
  }
}
class _ManualMarkerBody extends StatelessWidget {
  const _ManualMarkerBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          const Positioned(top: 70, left: 20, child: _BtnBack()),
          Center(
            child: Transform.translate(
              offset: const Offset(0, -25),
              child: BounceInDown(
                from: 100,
                child: const Icon(Icons.location_on_rounded, size: 45),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 40,
            child: FadeInUp(
              duration: const Duration(milliseconds: 300),
              child: MaterialButton(
                minWidth: size.width - 120,
                color: Colors.black,
                height: 50,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                onPressed: () {},
                child: const Text(
                  'Confirmar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BtnBack extends StatelessWidget {
  const _BtnBack();

  @override
  Widget build(BuildContext context) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);

    return FadeInLeft(
      duration: const Duration(milliseconds: 300),
      child: CircleAvatar(
        maxRadius: 20,
        backgroundColor: Colors.white,
        child: IconButton(
          onPressed: () {
            searchBloc.add(OnActivatedManualMarkerEvent());
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
    );
  }
}
