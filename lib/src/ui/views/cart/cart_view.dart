import 'package:drohealth/src/constants/colors.dart';
import 'package:drohealth/src/ui/views/cart/cart_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class CartView extends StatelessWidget {
  final bool visibleTop;
  CartView({@required this.visibleTop});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
        viewModelBuilder: () => CartViewModel(),
        builder: (context, model, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.white, width: 2))),
                ),
              ),
              Visibility(
                visible: visibleTop,
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.only(right: 8, left: 70),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 70,
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/bag.svg',
                                width: 25, color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Bag',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  trailing: CircleAvatar(
                    maxRadius: 15,
                    backgroundColor: Colors.white,
                    child: Text(
                      '${model.cartCount}',
                      style: TextStyle(color: AppColors.darkGrey),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: visibleTop ? 20 : 40,
              ),
              Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Text(
                  'Tap on an Item for add, remove, delete options',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      children: model.cartItem
                          .map((e) => Theme(
                                data: ThemeData()
                                    .copyWith(dividerColor: Colors.transparent),
                                child: ListTileTheme(
                                  dense: true,
                                  child: ExpansionTile(
                                    trailing: Column(
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${e.amount}',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage("${e.imageLink}"),
                                    ),
                                    title: ListTile(
                                      leading: Column(
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'x${e.quantity}',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      isThreeLine: true,
                                      subtitle: Text(
                                        '${e.description}',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      title: Text(
                                        '${e.drugName}',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                                onTap: () => model.delete(e.id),
                                                child: Icon(
                                                    CupertinoIcons.trash,
                                                    color: Colors.white)),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                InkWell(
                                                  onTap: () =>
                                                      model.decrease(e.id),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    child: Text(
                                                      '-',
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .darkPurple),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  '${e.quantity}',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                InkWell(
                                                  onTap: () =>
                                                      model.increase(e.id),
                                                  child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      child: Text(
                                                        '+',
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .darkPurple),
                                                      )),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                          .toList())),
              ListTile(
                  title: Text(
                    'Total',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    '₦ ${model.total}',
                    style: TextStyle(color: Colors.white),
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Checkout',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          );
        });
  }
}
