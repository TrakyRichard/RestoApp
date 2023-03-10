import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/dishes/dishes.dart';
import 'package:restaurant/locator.dart';
import 'package:restaurant/welcome/constants/constants.dart';
import 'package:restaurant/welcome/cubit/welcome_cubit.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  static const String routeName = "on_boarding";
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    pageController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var themeData = Theme.of(context);
    return BlocBuilder<WelcomeCubit, WelcomeState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(color: themeData.colorScheme.background),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: size.height * 0.8,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) {
                    context.read<WelcomeCubit>().pageChanged(value);
                  },
                  itemCount: onBoardingSteps.length,
                  itemBuilder: (context, index) {
                    final transform =
                        Matrix4.diagonal3Values(1.0.w, 1.0.w, 1.0.w);
                    return SafeArea(
                      child: Scaffold(
                        body: Transform(
                          transform: transform,
                          child: Container(
                            decoration: BoxDecoration(
                                color: themeData.colorScheme.background),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0.w, vertical: 10.0.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Container(
                                        height: 300.0.h,
                                        width: double.infinity,
                                        child: SvgPicture.asset(
                                            onBoardingSteps[index].svg)),
                                  ),
                                  SizedBox(
                                    height: 100.h,
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 40.h, vertical: 4.0),
                                    child: Text(
                                      onBoardingSteps[index].title,
                                      style: themeData.textTheme.headlineLarge
                                          ?.copyWith(
                                              color: themeData.primaryColor,
                                              fontSize: 24.0.sp,
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 40.0.h, vertical: 4.0.h),
                                    child: Text(
                                      onBoardingSteps[index].description,
                                      style: themeData.textTheme.titleMedium
                                          ?.copyWith(
                                              color:
                                                  themeData.colorScheme.scrim,
                                              fontSize: 18.0.h,
                                              wordSpacing: 1.2.h,
                                              letterSpacing: 1.5.h,
                                              fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
              const SizedBox(
                height: 20.0,
              ),
              context.watch<WelcomeCubit>().state.page == 2
                  ? Container(
                      margin: EdgeInsets.only(bottom: 16.0.h),
                      width: size.width * 0.8,
                      child: elevatedButton(
                          theme: themeData,
                          onPressed: () {
                            locator<NavigationService>()
                                .navigateTo(DishesPage.routeName);
                          },
                          label: 'Commencer'))
                  : Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      width: size.width * 0.8,
                      child: elevatedButton(
                          theme: themeData,
                          onPressed: () => pageController.nextPage(
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.easeOutExpo),
                          label: 'Next')),
            ],
          ),
        );
      },
    );
  }

  _buildIndicator(bool isActive) {
    var themeData = Theme.of(context);
    return Container(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 10),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: 4.0.h,
        width: isActive ? 18.0.w : 8,
        decoration: BoxDecoration(
            boxShadow: [
              isActive
                  ? BoxShadow(
                      color: themeData.primaryColor,
                      blurRadius: 4.0.h,
                      spreadRadius: 1.0.h,
                      offset: const Offset(0.0, 0.0))
                  : BoxShadow(color: themeData.colorScheme.background)
            ],
            shape: BoxShape.circle,
            color: isActive
                ? themeData.primaryColor
                : themeData.colorScheme.tertiary),
        child: const SizedBox.shrink(),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];

    for (var i = 0; i < onBoardingSteps.length; i++) {
      list.add(i == context.read<WelcomeCubit>().state.page
          ? _buildIndicator(true)
          : _buildIndicator(false));
    }
    return list;
  }
}
