import 'package:flower_shop/features/dashboard/follow%20order/controller/timecubit.dart';
import 'package:flower_shop/features/dashboard/follow%20order/controller/timestate.dart';
import 'package:flower_shop/ApiService/apiser.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DistanceCubit(DistanceService(Dio())),
      child: DistDuration(),
    );
  }
}

class DistDuration extends StatelessWidget {
  // const MyWidget({super.key});
  @override
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(scrollDirection: Axis.vertical, children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFBD8F97),
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  const Text(
                    'My order',
                    style: TextStyle(
                      fontSize: 33,
                      color: Color(0xFFBD8F97),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Form(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 180),
                          child: Text(' Enter Address :( GOVERNMENT first)',
                              style: TextStyle(
                                  color: Color(0xFFBD8F97),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: destinationController,
                          decoration: InputDecoration(
                            labelText: ' Address',
                            labelStyle:
                                const TextStyle(color: Color(0xFFBD8F97)),
                            hintText: 'Government-city',
                            hintStyle:
                                const TextStyle(color: Color(0xFFB1B1B1)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide:
                                  const BorderSide(color: Color(0xFFBD8F97)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide:
                                  const BorderSide(color: Color(0xFFBD8F97)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB1B1B1), width: 3.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 170),
                          child: Text(' Enter Phone Number :',
                              style: TextStyle(
                                  color: Color(0xFFBD8F97),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: numberController,
                          decoration: InputDecoration(
                            labelText: ' Phone Number',
                            labelStyle:
                                const TextStyle(color: Color(0xFFBD8F97)),
                            hintText: '01023453434',
                            hintStyle:
                                const TextStyle(color: Color(0xFFB1B1B1)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide:
                                  const BorderSide(color: Color(0xFFBD8F97)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide:
                                  const BorderSide(color: Color(0xFFBD8F97)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB1B1B1), width: 3.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 60),
                        SizedBox(
                          width: 200,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFBD8F97)),
                            onPressed: () {
                              if ((numberController.text.isEmpty) &&
                                  (destinationController.text.isEmpty)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Color(0xFFB1B1B1),
                                      content: Text('Filleds are Empty',
                                          style: TextStyle(
                                              color: Color(0xFF3A3A3A)))),
                                );
                              } else if (numberController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Color(0xFFB1B1B1),
                                      content: Text(
                                          'Phone Number can not be Empty',
                                          style: TextStyle(
                                              color: Color(0xFF3A3A3A)))),
                                );
                              } else if (destinationController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Color(0xFFB1B1B1),
                                      content: Text('Address can not be Empty',
                                          style: TextStyle(
                                              color: Color(0xFF3A3A3A)))),
                                );
                              } else {
                                context
                                    .read<DistanceCubit>()
                                    .fetchDistanceAndDuration(
                                        destinationController.text);
                              }
                              ;
                            },
                            child: const Text(
                              'Submit',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(height: 50),
                  const Text(
                    'Your order will arrive within',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFBD8F97),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: 210,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: BlocBuilder<DistanceCubit, DistanceState>(
                      builder: (context, state) {
                        if (state is DistanceLoading) {
                          return const Center(
                              child: LinearProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFFB1B1B1)),
                          ));
                        } else if (state is DistanceLoaded) {
                          return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  ' ${state.duration}',
                                  style: const TextStyle(
                                      fontSize: 20, color: Color(0xFF3A3A3A)),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  ' About : ${state.distance}',
                                  style: const TextStyle(
                                      fontSize: 16, color: Color(0xFF3A3A3A)),
                                ),
                              ]);
                        } else if (state is DistanceError) {
                          return const Padding(
                            padding: EdgeInsets.all(50),
                            child: Text('Error Address name',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 18)),
                          );
                        }

                        return Container();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
