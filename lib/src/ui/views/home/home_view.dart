import 'package:drohealth/src/constants/colors.dart';
import 'package:drohealth/src/ui/views/cart/cart_view.dart';
import 'package:drohealth/src/ui/views/home/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool hideTop = true;
  bool _showSearch = false;
  void openSearch() {
    setState(() {
      _showSearch = !_showSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Text(
                '${model.drugs.length} item(s)',
                style: TextStyle(color: AppColors.kBlack),
              ),
              leading: Icon(
                Icons.dehaze,
                color: AppColors.kBlack,
              ),
            ),
            body: SlidingUpPanel(
              minHeight: 50,
              maxHeight: MediaQuery.of(context).size.height * 0.9,
              color: AppColors.darkPurple,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              collapsed: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 50,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.white, width: 2))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/bag.svg',
                                width: 25,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Bag',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        CircleAvatar(
                          maxRadius: 15,
                          backgroundColor: Colors.white,
                          child: Text(
                            '${model.cartItem.length}',
                            style: TextStyle(color: AppColors.darkGrey),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              onPanelClosed: () {
                setState(() {
                  hideTop = true;
                });
              },
              onPanelOpened: () {
                setState(() {
                  hideTop = false;
                });
              },
              onPanelSlide: (position) {
                setState(() {
                  hideTop = true;
                });
              },
              panel: CartView(
                visibleTop: !hideTop,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.lightGrey,
                            child: Icon(
                              Icons.swap_vert,
                              color: AppColors.darkGrey,
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: AppColors.lightGrey,
                            child: Icon(
                              Icons.filter_alt_outlined,
                              color: AppColors.darkGrey,
                            ),
                          ),
                          InkWell(
                            onTap: () => openSearch(),
                            child: CircleAvatar(
                              backgroundColor: AppColors.lightGrey,
                              child: Icon(
                                Icons.search_outlined,
                                color: AppColors.darkGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: _showSearch,
                      child: SizedBox(
                        height: 60,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 6),
                          child: TextField(
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(bottom: 30, right: 10),
                                prefixIcon: Icon(Icons.search),
                                alignLabelWithHint: true,
                                suffix: Icon(Icons.close),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          padding: EdgeInsets.all(10),
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 15,
                          children: model.drugs
                              .map((e) => InkWell(
                                    onTap: () => model.openDetail(),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(1, 1),
                                              color: AppColors.grey
                                                  .withOpacity(0.7),
                                              blurRadius: 5)
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: SizedBox(
                                              height: 120,
                                              width: 200,
                                              child: Image(
                                                image: NetworkImage(
                                                    "${e.imageLink}"),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${e.drugName}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5,
                                                ),
                                                Text(
                                                  '${e.chemicalName}',
                                                  style: TextStyle(
                                                      color: AppColors.grey),
                                                ),
                                                Text(
                                                  '${e.description}',
                                                  style: TextStyle(
                                                      color: AppColors.grey),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 8.0,
                                                ),
                                                child: FlatButton(
                                                    color: AppColors.buttonGrey,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                    onPressed: () {},
                                                    child: Text('${e.amount}',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white))),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList()),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
