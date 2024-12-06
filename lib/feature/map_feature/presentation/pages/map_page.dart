import 'package:atch_proj/config/routes/navigation_helper.dart';
import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/services/snack_bar_services.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/manger/auth_cubit.dart';
import 'package:atch_proj/feature/map_feature/map_setting_model.dart';
import 'package:atch_proj/feature/map_feature/presentation/manager/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({
    super.key,
  });

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng? _selectedLocation;

  @override
  Widget build(BuildContext context) {
    MapSettingModel mapSettingModel =
        GoRouterState.of(context).extra! as MapSettingModel;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Select Your Location",
            style: AppStyle.style21Medium(context),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child: Text("save", style: AppStyle.style21Medium(context)),
              ),
            ),
          ],
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: FlutterMap(
                options: MapOptions(
                  onTap: (tapPosition, point) {
                    if (mapSettingModel.isFirstLocation) {
                      mapSettingModel.mapCubit.firstLocation = point;
                    } else {
                      mapSettingModel.mapCubit.secondLocation = point;
                    }

                    setState(() {
                      _selectedLocation = point;
                    });
                    // Store the selected location
                  },
                  initialCenter: const LatLng(30.0444, 31.2357),
                  maxZoom: 18.0,
                  minZoom: 2.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.mahmoud.greategale',
                    // Plenty of other options available!
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point:
                            _selectedLocation ?? const LatLng(30.0444, 31.2357),
                        width: 120,
                        height: 120,
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
