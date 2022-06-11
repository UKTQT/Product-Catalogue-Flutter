import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app/app_constant.dart';
import '../../../../core/extensions/color_extension/color_extension.dart';
import '../../../../core/extensions/padding_extension/padding_extension.dart';
import '../viewModel/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      lazy: false,
      create: (context) => HomeViewModel(),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.white,
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
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.mediumWidthPadding2,
                vertical: context.mediumHeightPadding),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: context.mediumHeightPadding,
                        horizontal: context.lowWidthPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'All Products',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${context.watch<HomeViewModel>().productItems!.length} units',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount:
                          context.watch<HomeViewModel>().productItems!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: context.lowHeightPadding),
                          child: GestureDetector(
                            onTap: () {},
                            child: Card(
                              elevation: 5,
                              child: ListTile(
                                minVerticalPadding: context.lowHeightPadding2,
                                tileColor: const Color(0xfff5f5f5),
                                title: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: context.lowHeightPadding),
                                  child: Text(context
                                      .watch<HomeViewModel>()
                                      .productItems!
                                      .elementAt(index)
                                      .name
                                      .toString()),
                                ),
                                subtitle: Text(
                                    context
                                        .watch<HomeViewModel>()
                                        .productItems!
                                        .elementAt(index)
                                        .description
                                        .toString(),
                                    maxLines: 9),
                                trailing: IconButton(
                                  onPressed: () {
                                    context
                                        .watch<HomeViewModel>()
                                        .fetchAllProducts();
                                    //_homeservice.fetchAllProducts();
                                  },
                                  icon: const Icon(Icons.favorite),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
