import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [SvgPicture.asset('assets/bag.svg'), Text('3')],
              ),
            )
          ],
          automaticallyImplyLeading: true,
        ),
        body: Container(
          child: Column(
            children: [
              
            ],
          ),
        ));
  }
}
