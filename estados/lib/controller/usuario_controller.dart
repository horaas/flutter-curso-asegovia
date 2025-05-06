import 'package:estados/models/user.dart';
import 'package:get/get.dart';

class UsuarioController extends GetxController {
  
  var existeUsuario = false.obs;

  var user = User(nombre: 'nombre', edad: 10, profesiones: ['profesiones']).obs;


  void loadUser(User pUser) {
    user.value = pUser;
    existeUsuario.value = true;
  }
  void changeAgeUser(int edad) {

   user.update((val) {
    val = val!.copyWith(
      edad: edad
    );
  });

  }
  void addProfesionUser() {
    user.update((val) {
      val = val!.copyWith(
        profesiones: [...val.profesiones, 'prefesion: ${val.profesiones.length}']
      );
    },);
  }
  // void changeAgeUser(int edad) {

  //   final newUser = user.value.copyWith(
  //     edad: edad
  //   );

  //   user.value = newUser;
  // }
  // void addProfesionUser() {

  //   final newUser = user.value.copyWith(
  //     profesiones: [...user.value.profesiones, 'prefesion: ${user.value.profesiones.length}']
  //   );

  //   user.value = newUser;
  // }






}