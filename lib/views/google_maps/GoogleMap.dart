
//@dart=2.9

import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';



class GMaps extends StatefulWidget {
  final String title;
  bool showItems;
  String storeAddress;
  GMaps(this.storeAddress, {Key key, this.title,this.showItems=true}) : super(key: key);

  @override
  _GMapsState createState() => _GMapsState();
}

class _GMapsState extends State<GMaps> {
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  Circle circle;
  GoogleMapController _controller;
  double lat,lng;

  static  CameraPosition initialLocation =  CameraPosition(target: LatLng(0, 0), zoom: 14.4746);

  Future<Uint8List> getMarker() async {
    ByteData byteData =await DefaultAssetBundle.of(context).load("assets/images/gps.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    setState(() {
      marker = Marker(
          markerId: const MarkerId("Location"),
          position: latlng,
          rotation: 0,
          draggable: true,
          // anchor: Offset(0.5, 0.5),
          // zIndex: 2,
          flat: true,
          icon: BitmapDescriptor.fromBytes(imageData));
          //     circle = Circle(
          //     circleId: CircleId("car"),
          //     radius: newLocalData.accuracy,
          //     zIndex: 1,
          //     strokeColor: Colors.blue,
          //     center: latlng,
          //     fillColor: Colors.blue.withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }
      print("LOCATION");
      final position = await _geolocatorPlatform.getCurrentPosition();

      _controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              bearing: 0,
              target: LatLng(position.latitude, position.longitude),
              tilt: 0,
              zoom: 18.00)));

      // _locationSubscription = _locationTracker.onLocationChanged.listen((newLocalData) {
      //   if (_controller != null) {
      //
      //     lat=newLocalData.latitude;
      //     lng=newLocalData.longitude;
      //
      //     _controller.animateCamera(CameraUpdate.newCameraPosition(
      //         new CameraPosition(
      //             bearing: 0,
      //             target: LatLng(newLocalData.latitude, newLocalData.longitude),
      //             tilt: 0,
      //             zoom: 18.00)));
      //
      //
      //     // updateMarkerAndCircle(newLocalData, imageData);
      //   }
      // });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }



  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  @override
  void initState() {
    addressToLatLng();
    super.initState();
  }

  addressToLatLng()async{
    print(widget.storeAddress);
    var addresses = await Geocoder.local.findAddressesFromQuery(widget.storeAddress);
    var first = addresses.first;
    print("${first.featureName} : ${first.coordinates}");

    initialLocation =  CameraPosition(target: LatLng(first.coordinates.latitude, first.coordinates.longitude), zoom: 10);
    setState(() {

    });
  }

  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  CameraPosition newCameraMoveTo;
  MapType maptype= MapType.normal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showItems ? AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context, []);
          },
        ),
        backgroundColor: Colors.yellowAccent,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),
      ) : null ,
      body: Stack(
        children: [
          GoogleMap(
            mapType: maptype,
            myLocationButtonEnabled: widget.showItems,
            myLocationEnabled: widget.showItems,
            initialCameraPosition: initialLocation,
            buildingsEnabled: true,
            indoorViewEnabled: true,
            markers: Set.of((marker != null) ? [marker] : []),
            // circles: Set.of((circle != null) ? [circle] : []),
            onMapCreated: (GoogleMapController controller) async {
              _controller = controller;
              // final position = await _geolocatorPlatform.getCurrentPosition();
              // print("Current Location: $position");
              // // _controller.moveCamera(CameraUpdate.newCameraPosition(
              // //     CameraPosition(zoom: 15,
              // //         target: LatLng(position.latitude, position.longitude))));
              //     _controller.animateCamera(CameraUpdate.newCameraPosition(
              //         CameraPosition(
              //             bearing: 0,
              //             target: LatLng(position.latitude, position.longitude),
              //             tilt: 0,
              //             zoom: 18.00)));
            },
            onCameraIdle: (){
              print('newCameraMoveTo.target.longitude');
                    if(!widget.showItems){
                      if(newCameraMoveTo==null)return;

                      _geoCoderLatLongToAddress(newCameraMoveTo.target.latitude,newCameraMoveTo.target.longitude);
                    }
          },
            onCameraMove: (CameraPosition value) {

              newCameraMoveTo=value;
              // bool isMoving=true;
              //
              // Future.delayed(Duration(seconds: 3), () {
              //   if (!widget.showItems && !isMoving) {
              //     isMoving=true;
              //     print("hhelll");
              //     // _geoCoder(value.target.latitude,value.target.longitude);
              //   }
              // });
              //
              // isMoving=false;
              //
            },

          ),
          const Center(child: Icon(Icons.location_on,color: Colors.blue,size: 40,),),
          widget.showItems ?   Align(alignment: Alignment.bottomCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(width: 50,),
                Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                  child: InkWell(
                    onTap: (){
                      if(newCameraMoveTo!=null){
                        Navigator.pop(context,[newCameraMoveTo.target.latitude,newCameraMoveTo.target.longitude]);
                      }
                    },
                    child: Container(
                      height: 55,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red,
                      ),
                      child: Center(child: Text("Confirm Address".tr,style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 20))),
                    ),
                  ),
                ),
              ),
              Container(width: 50,)
            ],),
          ) : Container(),
          widget.showItems ?  Align(
            alignment: const Alignment(0.93,-0.5),
            child: InkWell(
              onTap: (){
                if(maptype==MapType.normal){
                  maptype=MapType.satellite;
                }
                else{
                  maptype=MapType.normal;
                }
                setState(() {

                });
              },
              child: Container(
                // height: 25,
                // width: 25,
                decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(4)
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.map_rounded),
                )),
            ),
          ): Container(),
          widget.showItems ?  Align(
            alignment: const Alignment(0.93,-0.9),
            child: InkWell(
              onTap: (){
               if(_controller!=null){
                 getCurrentLocation();
               }
                setState(() {

                });
              },
              child: Container(
                // height: 25,
                // width: 25,
                decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(4)
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.gps_fixed_outlined),
                )),
            ),
          ): Container(),

          // Align(
          //   alignment: Alignment(0.95,GetPlatform.isIOS? 0.89: 0.7 ),
          //   child: FloatingActionButton(
          //       backgroundColor: Colors.grey,
          //       child: Icon(Icons.location_searching),
          //       onPressed: () {
          //         getCurrentLocation();
          //       }),
          // )
        ],
      ),

    );
  }

  void _geoCoderLatLongToAddress(double lat, double lng) async {
    print(lat);
    print(lng);
    // data.setLatLong(lat,lng);

   final coordinates = Coordinates(lat, lng);
    List<Address> addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    Address address = addresses.first;
    print(address.addressLine);
    // data.setAddress(address.addressLine);
  }



}
