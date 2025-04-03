import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final permissionsProvider =
    StateNotifierProvider<PermissionsNotifier, PermissionsState>((ref) {
      return PermissionsNotifier();
    });

class PermissionsNotifier extends StateNotifier<PermissionsState> {
  PermissionsNotifier() : super(PermissionsState()) {
    checkPermissions();
  }

  Future<void> checkPermissions() async {
    final permissions = await Future.wait([
      Permission.camera.status,
      Permission.mediaLibrary.status,
      Permission.sensors.status,
      Permission.location.status,
      Permission.locationAlways.status,
      Permission.locationWhenInUse.status,
    ]);

    state = state.copyWith(
      camera: permissions[0],
      photoLibrary: permissions[1],
      sensors: permissions[2],
      location: permissions[3],
      locationalways: permissions[4],
      locationWhen: permissions[5],
    );
  }

  Future<void> checkCamera() async {
    final status = await Permission.camera.request();
    state = state.copyWith(camera: status);

    if (status == PermissionStatus.permanentlyDenied) openAppSettings();
  }

    Future<void> checkPhotoGalery() async {
    final status = await Permission.mediaLibrary.request();
    state = state.copyWith(photoLibrary: status);

    if (status == PermissionStatus.permanentlyDenied) openAppSettings();
  }

    Future<void> checkLocations() async {
    final status = await Permission.location.request();
    state = state.copyWith(location: status);

    if (status == PermissionStatus.permanentlyDenied) openAppSettings();
  }

    Future<void> checkSensor() async {
    final status = await Permission.sensors.request();
    state = state.copyWith(sensors: status);

    if (status == PermissionStatus.permanentlyDenied) openAppSettings();
  }
}

class PermissionsState {
  final PermissionStatus camera;
  final PermissionStatus photoLibrary;
  final PermissionStatus sensors;
  final PermissionStatus location;
  final PermissionStatus locationalways;
  final PermissionStatus locationWhen;

  PermissionsState({
    this.camera = PermissionStatus.denied,
    this.photoLibrary = PermissionStatus.denied,
    this.sensors = PermissionStatus.denied,
    this.location = PermissionStatus.denied,
    this.locationalways = PermissionStatus.denied,
    this.locationWhen = PermissionStatus.denied,
  });

  PermissionsState copyWith({
    PermissionStatus? camera,
    PermissionStatus? photoLibrary,
    PermissionStatus? sensors,
    PermissionStatus? location,
    PermissionStatus? locationalways,
    PermissionStatus? locationWhen,
  }) => PermissionsState(
    camera: camera ?? this.camera,
    photoLibrary: photoLibrary ?? this.photoLibrary,
    sensors: sensors ?? this.sensors,
    location: location ?? this.location,
    locationalways: locationalways ?? this.locationalways,
    locationWhen: locationWhen ?? this.locationWhen,
  );

  get cameraGranted {
    return camera == PermissionStatus.granted;
  }

  get photoLibraryGranted {
    return photoLibrary == PermissionStatus.granted;
  }

  get sensorsGranted {
    return sensors == PermissionStatus.granted;
  }

  get locationGranted {
    return location == PermissionStatus.granted;
  }

  get locationalwaysGranted {
    return locationalways == PermissionStatus.granted;
  }

  get locationWhenGranted {
    return locationWhen == PermissionStatus.granted;
  }
}
