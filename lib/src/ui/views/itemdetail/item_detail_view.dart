import 'package:drohealth/src/constants/colors.dart';
import 'package:drohealth/src/ui/views/itemdetail/item_detail_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class ItemDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ItemDetailViewModel>.reactive(
        viewModelBuilder: () => ItemDetailViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                actions: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: 89,
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {},
                      color: AppColors.droPurple,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(CupertinoIcons.bag, color: Colors.white),
                          Text(
                            '13',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
                leading: BackButton(
                  color: AppColors.kBlack,
                ),
              ),
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: SizedBox(
                        height: 150,
                        width: 100,
                        child: Image(
                          image:
                              NetworkImage("${model.selectedItem.imageLink}"),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Text(
                      '${model.selectedItem.drugName}',
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.w800),
                    ),
                    Text(
                      '${model.selectedItem.description}',
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: AppColors.kBlack),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.lightGrey,
                      ),
                      title: Text(
                        'SOLD BY',
                        style: TextStyle(color: AppColors.darkGrey),
                      ),
                      subtitle: Text(
                        '${model.selectedItem.phamarcy}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: AppColors.grey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '-',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '1',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '+',
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Pack(s)',
                              style: TextStyle(color: AppColors.grey),
                            ),
                          ],
                        ),
                        RichText(
                          text: TextSpan(children: [
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(2, -4),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 2.0),
                                  child: Text(
                                    '₦',
                                    //superscript is usually smaller in size
                                    textScaleFactor: 0.7,
                                  ),
                                ),
                              ),
                            ),
                            TextSpan(
                                text: '${model.selectedItem.amount}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800)),
                          ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'PRODUCT DETAILS',
                      style: TextStyle(
                          color: AppColors.darkGrey,
                          fontWeight: FontWeight.bold),
                    ),
                    ListTile(
                      visualDensity: VisualDensity(vertical: -4),
                      leading: SvgPicture.asset(
                        'assets/drugs.svg',
                        color: AppColors.darkPurple,
                        width: 30,
                      ),
                      title: Text(
                        'PACK SIZE',
                        style: TextStyle(color: AppColors.darkGrey),
                      ),
                      subtitle: Text('${model.selectedItem.packSize}'),
                      trailing: SizedBox(
                        width: 150,
                        child: ListTile(
                          visualDensity: VisualDensity(vertical: -4),
                          contentPadding: EdgeInsets.zero,
                          leading: SvgPicture.asset(
                            'assets/qr-code.svg',
                            color: AppColors.darkPurple,
                            width: 20,
                          ),
                          title: Text(
                            'PRODUCT ID',
                            style: TextStyle(color: AppColors.darkGrey),
                          ),
                          subtitle: Text('${model.selectedItem.id}'),
                        ),
                      ),
                    ),
                    ListTile(
                      visualDensity: VisualDensity(vertical: -4),
                      leading: SvgPicture.asset(
                        'assets/meds.svg',
                        color: AppColors.darkPurple,
                        width: 30,
                      ),
                      title: Text(
                        'CONSTITUENTS',
                        style: TextStyle(color: AppColors.darkGrey),
                      ),
                      subtitle: Text('${model.selectedItem.chemicalName}'),
                    ),
                    ListTile(
                      visualDensity: VisualDensity(vertical: -4),
                      leading: SvgPicture.asset(
                        'assets/soap-dispenser.svg',
                        color: AppColors.darkPurple,
                        width: 30,
                      ),
                      title: Text('DISPENSED IN'),
                      subtitle: Text('${model.selectedItem.dispensedIn}'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "1 pack of galic oil container 3 units of 10 Tablet(s)",
                        style: TextStyle(color: AppColors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: FlatButton.icon(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: AppColors.droPurple,
                                textColor: Colors.white,
                                icon: Icon(CupertinoIcons.bag_badge_plus),
                                onPressed: () {
                                  model.addToCart();
                                },
                                label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: Text('Add to bag'),
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ));
        });
  }
}
