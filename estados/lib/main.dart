import 'package:flutter/material.dart';

import 'package:estados/pages/pagina2_page.dart';
import 'package:estados/pages/pagina1_page.dart';
import 'package:get/get.dart';
 
void main() => runApp( const MyApp());
 
class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'pagina1',
      // routes: {
      //   'pagina1': ( _ ) => const Pagina1Page(),
      //   'pagina2': ( _ ) => const Pagina2Page(),
      // },
      getPages: [
        GetPage(name: '/pagina1', page: () => const Pagina1Page(),),
        GetPage(name: '/pagina2', page: () => const Pagina2Page(),)
      ],
    );
  }
}

// class MyApp extends StatelessWidget {
  
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (_) => UserBloc(),)
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Material App',
//         initialRoute: 'pagina1',
//         routes: {
//           'pagina1': ( _ ) => const Pagina1Page(),
//           'pagina2': ( _ ) => const Pagina2Page(),
//         },
//       ),
//     );
//   }
// }