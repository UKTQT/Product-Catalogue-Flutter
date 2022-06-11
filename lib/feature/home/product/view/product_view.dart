import 'package:flutter/material.dart';
import 'package:product_catalogue_flutter/core/extensions/color_extension/color_extension.dart';
import 'package:product_catalogue_flutter/feature/home/product/viewModel/product_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/color_extension/color_extension.dart';
import '../../../../core/extensions/padding_extension/padding_extension.dart';
import '../../../../core/constants/app/app_constant.dart';
import '../../home/viewModel/home_view_model.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  AppConstant.instance!.APP_LOGO_PATH,
                ),
              ),
            ),
          ),
          body: SizedBox(
            height: double.maxFinite,
            child: Stack(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image(
                          image: NetworkImage(
                              'https://assignment-api.piton.com.tr' +
                                  args['productImage']),
                        ),
                      ),
                    ),
                    Row(
                      children: const [
                        Text(
                          'ewqe',
                          style: TextStyle(color: Colors.amber),
                        )
                      ],
                    )
                  ],
                ),
                DraggableScrollableSheet(
                  initialChildSize: 0.1,
                  minChildSize: 0.1,
                  maxChildSize: 0.7,
                  snap: true,
                  snapSizes: [.7],
                  builder: (context, scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        color: context.themeWhiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: context.lowHeightPadding2),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: context.highWidthPadding),
                            child: Column(
                              children: [
                                Center(
                                  child: Icon(
                                    Icons.horizontal_rule,
                                    size: 40.0,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: context.mediumHeightPadding2,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 9,
                                      child: Text(args['productName'] ?? '',
                                          overflow: TextOverflow.clip,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              ?.copyWith(
                                                  fontFamily: 'RaleWay',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                    ),
                                    Expanded(flex: 1, child: SizedBox.shrink()),
                                    Expanded(
                                      flex: 0,
                                      child: IconButton(
                                        onPressed: () {
                                          context
                                              .read<ProductViewModel>()
                                              .postProductLike(
                                                  productId: args['productId']);
                                        },
                                        icon: context
                                                    .watch<ProductViewModel>()
                                                    .cache
                                                    .preferences!
                                                    .getBool(args['productId']
                                                        .toString()) ==
                                                true
                                            ? Icon(Icons.favorite,
                                                color: context.themeMainColor1)
                                            : const Icon(Icons.favorite),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: context.highHeightPadding),
                                Row(children: [
                                  Expanded(
                                      child: Text(args['productTime'] ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(color: Colors.black))),
                                  Expanded(
                                    flex: 0,
                                    child: Text('${args['productPrice']} tl',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2),
                                  )
                                ]),
                                SizedBox(height: context.mediumHeightPadding),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(args['productDesc'] ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.copyWith(color: Colors.black)),
                                    ),
                                  ],
                                ),
                                SizedBox(height: context.lowHeightPadding2),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
