import 'package:code_brew/code_brew.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbloctutorial/AppColors.dart';
import 'package:flutterbloctutorial/ui/dashboard/models/ServiceCategoryModel.dart';

import 'DasboardBloc.dart';
import 'models/BillersModel.dart';

///
/// project: bloc_tutorial
/// @package:
/// @author dammyololade
/// created on 04/06/2020
class DashBoardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashBoardScreenState();
  }
}

class _DashBoardScreenState extends State<DashBoardScreen> with UiKits {
  DashboardBloc bloc = DashboardBloc();

  @override
  void initState() {
    bloc.getServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 50),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric( horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "DATA",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Height(10),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            sliver: StreamBuilder(
              stream: bloc.blocSubject,
              // ignore: missing_return
              builder: (BuildContext context,
                  AsyncSnapshot<ApiCallStates> snapshot) {
                if (snapshot.data == ApiCallStates.LOADING) {
                  return SliverToBoxAdapter(
                      child: Center(
                    child: CircularProgressIndicator(),
                  ));
                } else if (snapshot.data == ApiCallStates.SUCCESS) {
                  var serviceCategories = bloc.model.data.serviceCategories;
                  ServiceCategory dataCategory = serviceCategories.firstWhere(
                      (element) => element.name.toLowerCase() == "data",
                      orElse: null);
                  return SliverGrid(
                      delegate: SliverChildBuilderDelegate((ct, index) {
                        var biller = dataCategory.billers[index];
                        return Container(
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage(
                              biller.iconUrl,
                            ),
                            fit: BoxFit.cover,
                          )),
                        );
                      }, childCount: dataCategory.billers.length),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 5,
                        childAspectRatio: 2.0,
                      ));
                }
                return SliverToBoxAdapter(child: SizedBox());
              },
            ),
          ),

          StreamBuilder(
              stream: bloc.blocSubject,
              // ignore: missing_return
              builder: (BuildContext context,
                  AsyncSnapshot<ApiCallStates> snapshot) {
                if(snapshot.data == ApiCallStates.SUCCESS) {
                  var otherCats = bloc.model.data.serviceCategories
                      .where((element) => element.name.toLowerCase() != "data")
                      .toList();
                  return SliverToBoxAdapter(
                    child: Container(
                      color: AppColors.BG,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Height(20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text("SERVICES",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16
                              ),
                            ),
                          ),
                          Height(20),

                          Container(
                            height: 130,
                            margin: EdgeInsets.only(left: 20),
                            child: ListView.builder(
                                itemCount: otherCats.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  var category = otherCats[index];
                                  return Stack(
                                    children: [
                                      Card(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                        margin: EdgeInsets.only(top: 15, bottom: 15, right: 10),
                                        child: Container(
                                          padding: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 10),
                                          width: 100,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(category.name,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                maxLines: 2,
                                              ),
                                              Height(10),
                                              Text(category.description,
                                                style: TextStyle(
                                                    fontSize: 12
                                                ),
                                                maxLines: 1,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),

                                      Positioned(
                                        top: 5,
                                        left: 10,
                                        child: Container(
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              color: AppColors.PRIMARY_COLOR,
                                              borderRadius: BorderRadius.all(Radius.circular(10))
                                          ),
                                          child: Image.network(
                                            category.iconUrl,
                                            height: 15, width: 15,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  );
                }
                return SliverToBoxAdapter(child: SizedBox());
              }
          )
        ],
      ),
    );
  }

}
