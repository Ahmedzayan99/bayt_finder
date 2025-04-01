import 'dart:async';

import 'package:bayt_finder/appcontext.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../models/photos_google_map.dart';
import '../../../models/place_address_model.dart';
import '../../../network/dio_maneger.dart';
import '../../my_property/cubit/my_property_cubit.dart';

part 'google_map_state.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  GoogleMapCubit() : super(GoogleMapInitial());
  static GoogleMapCubit  get(context)=>BlocProvider.of(context);
  DioManager dioManager = DioManager();
  GoogleMapController? googleMapController;
  LatLng? currentLatLong;
  LatLng? selectLatLong;
  String currentPickLocation = '';
  BitmapDescriptor? currentMarker;
  Map<MarkerId, Marker> markers = {};
  List<Placemark> placeMarksEn=[];
  List<Placemark> placeMarksAR=[];
  Future<bool> convertMarkerImage() async {
    currentMarker = await BitmapDescriptor.asset(
        const ImageConfiguration(size: Size(30.0, 50.0)), "assets/image/icon_hoase_map.png");
    if (currentMarker != null) {
      return true;
    } else {
      return false;
    }
  }
  void onMapCreatedSelect(GoogleMapController controller) async {
    googleMapController = controller;
    convertMarkerImage();
    await goToCurrentLocation();
    addMyMarker();
    selectLatLong=currentLatLong;
    await setLocaleIdentifier('en_US'); //'ar_EG'
    placeMarksEn = await placemarkFromCoordinates(
      selectLatLong!.latitude,
      selectLatLong!.longitude,
    );
    print(placeMarksEn.first);
    currentPickLocation='${placeMarksEn.first.street},${placeMarksEn.first.name},${placeMarksEn.first.locality},${placeMarksEn.first.subAdministrativeArea}${placeMarksEn.first.administrativeArea},${placeMarksEn.first.country}';
    emit(OnMapCreatedSelect());
  }
  Future<void> goToCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition();
    currentLatLong = LatLng(position.latitude, position.longitude);
    googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 19,
      ),
    ));
  }
  Future<void> currentLocation() async {
    var position = await Geolocator.getCurrentPosition();
    currentLatLong = LatLng(position.latitude, position.longitude);
    selectLatLong=currentLatLong;
    emit(CurrentLocation());

  }
  Future<void> addMyMarker() async {
    addMarker(currentLatLong!, 'pin', currentMarker!);
  }
  Future<void> zoomOut() async {
    googleMapController!.animateCamera(CameraUpdate.zoomOut());
  }
  Future<void> zoomIn() async {
    googleMapController!.animateCamera(CameraUpdate.zoomIn());
  }
  Future<void> addMarker(
      LatLng latLng, String id, BitmapDescriptor icon) async {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
      markerId: MarkerId(id),
      position: latLng,
      draggable: false,
      icon: icon,
    );
    markers[markerId] = marker;
  //  emit(AddMarker());
  }
  Timer? debounce;
  Future<void> onMapMove(CameraPosition position) async {
     if (debounce?.isActive ?? false) debounce?.cancel();
  debounce = Timer(Duration(milliseconds: 300), () async {
  selectLatLong=position.target;
  addMarker(position.target, 'pin', currentMarker!);
  if(selectLatLong !=null){
    await setLocaleIdentifier('en_US'); //'ar_EG'
    placeMarksEn = await placemarkFromCoordinates(
      selectLatLong!.latitude,
      selectLatLong!.longitude,
    );
    currentPickLocation='${placeMarksEn.first.name},${placeMarksEn.first.street},${placeMarksEn.first.name},${placeMarksEn.first.locality},${placeMarksEn.first.subAdministrativeArea}${placeMarksEn.first.administrativeArea},${placeMarksEn.first.country}';
    emit(OnCameraIdle());
  }
  });

  }
/*  if (_debounce?.isActive ?? false) _debounce?.cancel();
  _debounce = Timer(Duration(milliseconds: 300), () {
  selectLatLong=position.target;
  addMarker(position.target, 'pin', currentMarker!);
  });*/
 /* Future<void> onCameraIdle() async {
    if(selectLatLong !=null){
      await setLocaleIdentifier('en_US'); //'ar_EG'
      placeMarksEn = await placemarkFromCoordinates(
        selectLatLong!.latitude,
        selectLatLong!.longitude,
      );
      currentPickLocation='${placeMarksEn.first.name},${placeMarksEn.first.street},${placeMarksEn.first.name},${placeMarksEn.first.locality},${placeMarksEn.first.subAdministrativeArea}${placeMarksEn.first.administrativeArea},${placeMarksEn.first.country}';
      emit(OnCameraIdle());
    }

  }*/

  PhotosGoogleMap photosGoogleMap=PhotosGoogleMap();
  String? photoReference;
  Future<void> getPhotoGoogle(
  ) async {
    emit(PropertyDetailLoadingState());
   String? placeId;
    Either<String, String> responsePlaceId =
    await dioManager.googlePlaceId(
  input:placeMarksEn.first.locality !=null &&placeMarksEn.first.locality!.isNotEmpty?'${placeMarksEn.first.locality},${placeMarksEn.first.country }':'${placeMarksEn.first.subAdministrativeArea},${placeMarksEn.first.country}',
    );
    responsePlaceId.fold((l) {
      emit(PropertyDetailErrorState());
    }, (r) {
      placeId=r;
      print(placeId);
    },);
    if(placeId !=null){
      Either<String, PhotosGoogleMap> response =
      await dioManager.getPhotoGoogle(
        placeId: placeId!,
      );

      response.fold(
            (left) {
          emit(PropertyDetailErrorState());
        },
            (right) {
          photosGoogleMap=right;
         print(photosGoogleMap.result!.photos);
          if(photosGoogleMap.result!.photos !=null&&photosGoogleMap.result!.photos!.isNotEmpty){
            photoReference=photosGoogleMap.result!.photos![0].photoReference;
          }
          emit(PropertyDetailSuccessState());
        },
      );
    }

  }
  PlaceAddressModel? selectedModel;
  bool loading=false;
  Future<void> addData() async {
    loading=true;
    emit(AddDataLoading());
    await setLocaleIdentifier('ar_EG');
    placeMarksAR =
        await placemarkFromCoordinates(
      selectLatLong!.latitude,
      selectLatLong!.longitude,
    );
    await getPhotoGoogle();
 selectedModel =PlaceAddressModel(
      placeId: placeMarksEn.first.name
          .toString(),
      latitude:
      selectLatLong!.latitude,
      longitude:
      selectLatLong!.longitude,
      placeAddress: currentPickLocation
          .toString(),
      name: placeMarksEn.first.name
          .toString(),
      state:placeMarksEn.first.administrativeArea
          .toString(),
      country:placeMarksEn.first.country
          .toString(),
      city: placeMarksEn.first.locality !=null &&placeMarksEn.first.locality!.isNotEmpty
          ? placeMarksEn.first.locality
          .toString()
          .replaceAll("Madinet ", "")
          : placeMarksEn.first
          .subAdministrativeArea
          .toString()
          .replaceAll("Madinet ", ""),
      cityAR: placeMarksEn.first.locality !=null &&placeMarksEn.first.locality!.isNotEmpty
          ? placeMarksAR.first.locality
          .toString()
          .replaceAll("مدينة ", "")
          : placeMarksAR.first
          .subAdministrativeArea
          .toString()
          .replaceAll("مدينة ", ""),
      photoReference: photoReference);
    loading=false;
    emit(AddData());
    if(selectedModel !=null){
      MyPropertyCubit.get(AppContext.context).addData(selectedModel!);
    }
}
}
