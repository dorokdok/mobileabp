import 'package:flutter/material.dart';
import '../../component/error.dart';
import '../../component/loading.dart';
import '../../models/item_view_model.dart';
import '../../models/profile_view_model.dart';
import '../../models/location_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Column(
          children: [
            Consumer<ProfileViewModel>(
              builder: (context, value, _) {
                if (value.is_loading) {
                  return const LoadingComponent();
                } else if (value.is_error) {
                  return const ErrorComponent();
                } else {
                  return Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Text.rich(TextSpan(
                          text: 'Selamat Bekerja,',
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text:
                                    '\n${value.user?.data?.firstName} ${value.user?.data?.lastName}.',
                                style: TextStyle(fontWeight: FontWeight.w900)),
                          ],
                        )),
                        const SizedBox(height: 32),
                        Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: const BorderSide(
                              color: Colors.black12,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Image.asset('assets/image/icn_warehouse.png',
                                    width: 60, height: 60),
                                SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Warehouse',
                                      style: TextStyle(color: Colors.black26),
                                    ),
                                    Text(
                                      value.user?.employees
                                              ?.elementAt(0)
                                              .warehouse
                                              ?.name ??
                                          '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            Consumer<ItemViewModel>(
              builder: (context, value, _) {
                if (value.is_loading) {
                  return const LoadingComponent();
                } else if (value.is_error) {
                  return const ErrorComponent();
                } else {
                  return Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: const BorderSide(
                              color: Colors.black12,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Image.asset('assets/image/icn_item.png',
                                    width: 60, height: 60),
                                SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Total Produk',
                                      style: TextStyle(color: Colors.black26),
                                    ),
                                    Text(
                                      '${value.items?.length} produk',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            Consumer<LocationViewModel>(
              builder: (context, value, _) {
                if (value.is_loading) {
                  return const LoadingComponent();
                } else if (value.is_error) {
                  return const ErrorComponent();
                } else {
                  return Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: const BorderSide(
                              color: Colors.black12,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Image.asset('assets/image/icn_storage.png',
                                    width: 60, height: 60),
                                SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Total Penyimpanan',
                                      style: TextStyle(color: Colors.black26),
                                    ),
                                    Text(
                                      '${value.storages?.length} penyimpanan',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ));
  }
}
