import 'package:flutter/material.dart';
import 'package:product_catalogue_flutter/feature/home/home/service/home_service.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app/app_constant.dart';
import '../../../../core/extensions/color_extension/color_extension.dart';
import '../../../../core/extensions/padding_extension/padding_extension.dart';
import '../viewModel/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeService _homeservice = HomeService();
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
                      children: const [
                        Text(
                          'All Products',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount:
                          context.read<HomeViewModel>().productItems!.length ??
                              1,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: context.lowHeightPadding),
                          child: GestureDetector(
                            onTap: () {},
                            child: Card(
                              elevation: 5,
                              child: ListTile(
                                tileColor: const Color(0xfff5f5f5),
                                title: const Text('Product Name'),
                                subtitle: const Text(
                                    'DescriptionDescriptionDescription'),
                                trailing: IconButton(
                                  onPressed: () {
                                    context
                                        .read<HomeViewModel>()
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
