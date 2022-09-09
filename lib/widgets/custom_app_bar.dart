import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/style/color_constants.dart';
import 'package:flutter_home_assignment/style/dimensions.dart';
import 'package:flutter_home_assignment/views/home/bloc/home_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, this.title, this.score}) : super(key: key);

  final String? title;
  final int? score;

  @override
  Widget build(
    BuildContext context,
  ) {
    return SafeArea(
        child: Container(
      color: ColorConstants.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 25, left: 10, top: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: CupertinoColors.black,
                  ),
                  color: ColorConstants.brown,
                  iconSize: Dimensions.screenHeight / 24,
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: Dimensions.screenWidth / 2.0,
                    height: 40,
                    child: const Text(
                      "",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: ColorConstants.black),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  // color: ColorConstants.green,
                  height: 50,
                  width: 100,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: ColorConstants.grayF1,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  BlocBuilder<HomeBloc, HomeState>(
                                      builder: (context, state) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
                                      child: Text(
                                        BlocProvider.of<HomeBloc>(context)
                                            .score
                                            .toString(),
                                        style: const TextStyle(
                                            color: ColorConstants.gray71,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.hexagon_sharp,
                            size: 50,
                            color: ColorConstants.yellow0F,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
