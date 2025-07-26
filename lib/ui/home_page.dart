import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/bloc/current_bloc.dart';
import 'package:weather_app/service/location_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getCurrentPosition();
    super.initState();
  }

  getCurrentPosition() async {
    await LocationService().handleLocationPermission();
    Position? position = await LocationService().getCurrentPosition();
    if (position != null) {
      context.read<CurrentBloc>().add(
        GetCurrentWeather(lat: position.latitude, long: position.longitude),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<CurrentBloc, CurrentState>(
            builder: (context, state) {
              if (state is CurrentLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is CurrentFail) {
                return Center(child: Text(state.message));
              }
              if (state is CurrentSuccess) {
                return Column(
                  children: [
                    city(state),
                    SizedBox(height: 40),
                    weatherAndTemperature(state),
                    Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Logout',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  Widget city(CurrentSuccess state) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(state.model.name ?? '', style: TextStyle(fontSize: 20)),
          Icon(Icons.search),
        ],
      ),
    );
  }

  Widget weatherAndTemperature(CurrentSuccess state) {
    return Column(
      children: [
        Text(
          state.model.weather!.first.main ?? '',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          state.model.weather!.first.description ?? '',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          '${state.model.main!.temp ?? 0}° C',
          style: TextStyle(fontSize: 80),
        ),
      ],
    );
  }
}
