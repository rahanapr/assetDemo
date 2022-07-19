import 'package:asset_project_demo/core/constants.dart';
import 'package:asset_project_demo/core/extracted.dart';
import 'package:asset_project_demo/model/asset_model.dart';
import 'package:asset_project_demo/provider/asset_provider.dart';
import 'package:asset_project_demo/screens/home/widget/search_widget.dart';
import 'package:asset_project_demo/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _ScreenAssetsViewState createState() => _ScreenAssetsViewState();
}

class _ScreenAssetsViewState extends State<HomeScreen> {
  @override
  void initState() {
    // print("${sharedp.getString("email")}");
    super.initState();
    context.read<AssetProvider>().getAllAssets();
  }

  @override
  Widget build(BuildContext context) {
    // final assetModel = Provider.of<AssetProvider>(context);
    return Consumer<AssetProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () async {
              List<AssetModel> asset = await ApiService().getAllAssets();
              value.updateAssetModel(asset);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 35.0, left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'REGISTERED DETAILS',
                      style: textStyle,
                    ),
                    kHeight20,
                    SizedBox(
                      width: 300, // MediaQuery.of(context).size.width * .5,
                      child: Row(
                        children: [
                          Expanded(
                              child: TextField(
                            onTap: (() {
                              showSearch(
                                  context: context, delegate: SearchWidget());
                            }),
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search),
                                hintText: 'Search',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          )),
                          kWidth10,
                          IconButton(
                              onPressed: () async {
                                Navigator.popAndPushNamed(context, 'register');
                              },
                              icon: const Icon(
                                Icons.person_add,
                                size: 30,
                              )),
                        ],
                      ),
                    ),
                    kHeight10,
                    value.assetList.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: value.assetList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 50),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              onPressed: (() {
                                                Navigator.popAndPushNamed(
                                                  context,
                                                  'update',
                                                );
                                              }),
                                              icon: const Icon(Icons.edit)),
                                          kWidth10,
                                          IconButton(
                                              onPressed: () async {
                                                // final asset = await ApiService()
                                                //     .delete(value
                                                //         .assetList[index]
                                                //         .id as String);
                                                // if (asset != null) {
                                                //   Navigator.popAndPushNamed(
                                                //       context, 'home');
                                                // } else {
                                                //   throw Exception(
                                                //       'Failedto delete asset');
                                                // }
                                              },
                                              icon: const Icon(Icons.delete)),
                                        ],
                                      ),
                                    ),
                                    ExpansionTile(
                                      title: Row(
                                        children: [
                                          textData(
                                              'Name :${value.assetList[index].assetName}'),
                                        ],
                                      ),
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 15.0,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                //assetId
                                                textData(
                                                    'ID :${value.assetList[index].assetId}'),
                                                kHeight10,
                                                //assettype
                                                textData(
                                                    'Type : ${value.assetList[index].assetType}'),
                                                kHeight10,
                                                //assetValue
                                                textData(
                                                    'Value : ${value.assetList[index].assetValue}'),
                                                kHeight10,
                                                //purchaseDate
                                                textData(
                                                    'Puchase Date : ${value.assetList[index].purchaseDate}'),
                                                kHeight10,
                                                //assetExpiry
                                                textData(
                                                    'Expairy Date : ${value.assetList[index].assetExpiry} '),
                                                kHeight10,
                                                //department
                                                textData(
                                                    'Deparment : ${value.assetList[index].department} '),
                                                kHeight10,
                                                //assetGeolocation
                                                textData(
                                                    'Geo Location : ${value.assetList[index].assetGeoLocation}'),
                                                kHeight10,
                                                //assetBarcode
                                                textData(
                                                    'Barcode : ${value.assetList[index].assetBarcode} '),
                                                kHeight10,
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
