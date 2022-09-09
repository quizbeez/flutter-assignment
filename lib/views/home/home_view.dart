import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/model/product.dart';
import 'package:flutter_home_assignment/style/color_constants.dart';
import 'package:flutter_home_assignment/style/dimensions.dart';
import 'package:flutter_home_assignment/utils/image_paths.dart';
import 'package:flutter_home_assignment/views/home/bloc/home_bloc.dart';
import 'package:flutter_home_assignment/widgets/custom_app_bar.dart';
import 'package:flutter_home_assignment/widgets/quiz_card.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _key = GlobalKey(); // add this

  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => HomeView());
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.screenWidth = MediaQuery.of(context).size.width;
    Dimensions.screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
        create: (context) => HomeBloc(),
        child: Scaffold(
          backgroundColor: ColorConstants.white,
          appBar: const CustomAppBar(
            title: "Quiz",
            score: 0,
          ),
          key: _key,
          body: BlocConsumer<HomeBloc, HomeState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Container(
                  color: ColorConstants.white,
                  height: Dimensions.screenHeight,
                  width: Dimensions.screenWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        ///  Image  ///

                        SizedBox(
                          height: Dimensions.screenHeight * 0.3,
                          width: Dimensions.screenWidth,
                          child: Image.asset(
                            ImagePath.splashLogo,
                          ),
                        ),

                        ///  Questions and its options widget  ///

                        _buildWidget(state, context)
                      ],
                    ),
                  ),
                ),
              );
            },
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('This is a snack bar!!!!'),
              ));
            },
            buildWhen: (previous, current) => _shouldBuildFor(current),
            listenWhen: (previous, current) => _shouldListenFor(current),
          ),
        ));
  }

  bool _shouldListenFor(HomeState currentState) {
    return currentState is ShowSnackbarState;
  }

  bool _shouldBuildFor(HomeState currentState) {
    return currentState is HomeLoadingState || currentState is UpdateTextState;
  }

  Widget _buildWidget(HomeState state, BuildContext context) {
    if (state is UpdateTextState) {
      return QuizCard(
        product: state.product,
      );
    } else {
      return ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext buildContext, int index) {
            return QuizCard(
              product: Product.products[0],
              ontap: () {
                context.read<HomeBloc>().add(ButtonTappedEvent());
                if (Product.products[0].correct.toString() ==
                    Product.products[0].options[3].toString()) {
                  context.read<HomeBloc>().add(IncreaseScoreEvent());
                }
              },
            );
          });
    }
  }
}
