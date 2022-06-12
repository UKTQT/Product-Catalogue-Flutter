import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../../core/extensions/color_extension/color_extension.dart';
import '../../../../core/extensions/padding_extension/padding_extension.dart';
import '../../../../core/constants/app/app_constant.dart';
import '../../product/viewModel/product_view_model.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('tr_TR', null);
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    return ChangeNotifierProvider<ProductViewModel>(
        lazy: false,
        create: (context) => ProductViewModel(),
        builder: (context, child) {
          return Scaffold(
              appBar: AppBar(
                  backgroundColor: context.themeMainColor1,
                  title: Hero(
                      tag: 'app_logo',
                      child: Image(
                          width: MediaQuery.of(context).size.width * 0.25,
                          image: AssetImage(
                              AppConstant.instance!.APP_LOGO_PATH)))),
              body: SizedBox(
                  height: double.maxFinite,
                  child: Stack(children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image(
                                image: NetworkImage(
                                    'https://assignment-api.piton.com.tr' +
                                        args['productImage'])))),
                    DraggableScrollableSheet(
                        initialChildSize: 0.1,
                        minChildSize: 0.1,
                        maxChildSize: 0.7,
                        snap: true,
                        snapSizes: [.7],
                        builder: (context, scrollController) {
                          return Container(
                              decoration: BoxDecoration(
                                  /* gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              context.themeWhiteColor,
                              context.themeMainColor1,
                            ]), */
                                  color: context.themeWhiteColor,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(25.0),
                                      topRight: Radius.circular(25.0))),
                              child: draggableItems(
                                  context, scrollController, args));
                        })
                  ])));
        });
  }

  Padding draggableItems(BuildContext context,
      ScrollController scrollController, Map<dynamic, dynamic> args) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: context.lowHeightPadding2),
        child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.highWidthPadding),
                child: Column(children: [
                  Container(
                      decoration: BoxDecoration(
                          color: context.themeMainColor2,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(25.0),
                              topRight: Radius.circular(25.0))),
                      child: Center(
                          child: Icon(Icons.horizontal_rule,
                              size: 40.0, color: context.themeWhiteColor))),
                  SizedBox(height: context.mediumHeightPadding2),
                  Row(children: [
                    Expanded(
                        flex: 9,
                        child: Text(args['productName'] ?? '',
                            overflow: TextOverflow.clip,
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(
                                    fontFamily: 'RaleWay',
                                    color: context.themeMainColor2,
                                    fontWeight: FontWeight.bold))),
                    const Expanded(flex: 1, child: SizedBox.shrink())
                  ]),
                  SizedBox(height: context.highHeightPadding),
                  Row(children: [
                    Expanded(
                        child: Text(
                            DateFormat('dd-MM-yyyy hh:mm').format(
                                DateTime.parse('2022-04-08T11:56:14.613Z')),
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(color: context.themeMainColor2))),
                    Expanded(
                        flex: 0,
                        child: Text('${args['productPrice']} tl',
                            style: Theme.of(context).textTheme.subtitle2))
                  ]),
                  SizedBox(height: context.mediumHeightPadding2),
                  Row(children: [
                    Expanded(
                        child: Text(args['productDesc'] ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: context.themeMainColor2)))
                  ]),
                  SizedBox(height: context.lowHeightPadding2),
                ]))));
  }
}
