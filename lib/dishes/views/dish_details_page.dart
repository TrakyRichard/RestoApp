import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/dishes/dishes.dart';
import 'package:restaurant/locator.dart';

class DishDetailsPageArguments {
  final String id;
  DishDetailsPageArguments(this.id);
}

class DishDetailsPage extends StatefulWidget {
  static const String routeName = '/dish_details';
  final DishDetailsPageArguments args;
  const DishDetailsPage({super.key, required this.args});

  @override
  State<DishDetailsPage> createState() => _DishDetailsPageState();
}

class _DishDetailsPageState extends State<DishDetailsPage> {
  @override
  void initState() {
    context.read<DishBloc>().add(LoadDishByIdEvent(id: widget.args.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = getTheme(context);
    final size = getSize(context);
    return BlocBuilder<DishBloc, DishState>(
      builder: (context, state) {
        if (state.dish.name.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        // if (state.dish == null) {
        //   return const Center(child: Text("No dish found"));
        // }
        return SingleChildScrollView(
            child: Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                ),
                child: SafeArea(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 300.h,
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                image: DecorationImage(
                                  image: NetworkImage(state.dish.images[0]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 0,
                              child: Container(
                                margin: EdgeInsets.only(left: 10.w),
                                width: 40.w,
                                height: 40.h,
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: theme.colorScheme.background,
                                ),
                                child: iconButton(
                                    onPressed: () {
                                      locator<NavigationService>().pop();
                                    },
                                    icon: Icons.arrow_back_ios,
                                    activeColor: theme.primaryColor,
                                    inactiveColor:
                                        theme.colorScheme.onBackground),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 0,
                              child: Container(
                                  margin: EdgeInsets.only(right: 10.w),
                                  width: 40.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: theme.colorScheme.background,
                                  ),
                                  alignment: Alignment.bottomCenter,
                                  child: PopupMenuButton<String>(
                                    color: theme.primaryColor,
                                    onSelected: (value) {
                                      if (value == 'edit') {
                                        locator<NavigationService>().navigateTo(
                                            EditDishPage.routeName,
                                            arguments: EditDishPageArguments(
                                                isEdit: true,
                                                dish: state.dish));
                                      } else if (value == 'delete') {
                                        isConfirmDialog(
                                            context: context,
                                            title: "Delete",
                                            confirmText: "Yes",
                                            isConfirmAction: () {
                                              context.read<DishBloc>().add(
                                                  DeleteDishEvent(
                                                      id: state.dish.id));
                                              locator<NavigationService>()
                                                  .navigateTo(
                                                      DishesPage.routeName);
                                            },
                                            message:
                                                "Are you sure you want to delete the dish",
                                            isBarrierDismiss: true);
                                      }
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return {'edit', 'delete'}
                                          .map((String choice) {
                                        return PopupMenuItem<String>(
                                          value: choice,
                                          child: Text(
                                              '${mapValueAndChoise[choice]}',
                                              style: theme.textTheme.bodySmall
                                                  ?.copyWith(
                                                      color: Colors.white,
                                                      fontSize: 16.sp)),
                                        );
                                      }).toList();
                                    },
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.dish.name,
                                    style:
                                        theme.textTheme.headlineSmall?.copyWith(
                                      fontSize: 20.sp,
                                    )),
                                Text("\$${state.dish.price}",
                                    style:
                                        theme.textTheme.headlineSmall?.copyWith(
                                      fontSize: 16.sp,
                                      color: theme.primaryColor,
                                    )),
                                SizedBox(height: 10.h),
                                Text("Ingredients: ",
                                    style:
                                        theme.textTheme.headlineSmall?.copyWith(
                                      fontSize: 16.sp,
                                    )),
                                Text(state.dish.ingredients.join(", "),
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontSize: 16.sp,
                                    )),
                                SizedBox(height: 10.h),
                                Text("Descriptions: ",
                                    style:
                                        theme.textTheme.headlineSmall?.copyWith(
                                      fontSize: 16.sp,
                                    )),
                                Text(state.dish.description,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontSize: 16.sp,
                                    )),
                                SizedBox(height: 10.h),
                                Text("Hour of availability: ",
                                    style:
                                        theme.textTheme.headlineSmall?.copyWith(
                                      fontSize: 16.sp,
                                    )),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: "From: ",
                                      style:
                                          theme.textTheme.bodySmall?.copyWith(
                                        fontSize: 16.sp,
                                      )),
                                  TextSpan(
                                      text: state.dish.startTimeOfAvailability
                                              .isEmpty
                                          ? "00:00"
                                          : state.dish.startTimeOfAvailability,
                                      style:
                                          theme.textTheme.bodySmall?.copyWith(
                                        fontSize: 16.sp,
                                        color: theme.primaryColor,
                                      )),
                                  TextSpan(
                                      text: " To: ",
                                      style:
                                          theme.textTheme.bodySmall?.copyWith(
                                        fontSize: 16.sp,
                                      )),
                                  TextSpan(
                                      text: state.dish.endTimeOfAvailability
                                              .isEmpty
                                          ? "00:00"
                                          : state.dish.endTimeOfAvailability,
                                      style:
                                          theme.textTheme.bodySmall?.copyWith(
                                        fontSize: 16.sp,
                                        color: theme.primaryColor,
                                      )),
                                ])),
                                SizedBox(height: 10.h),
                                Text("Waiting Time: ",
                                    style:
                                        theme.textTheme.headlineSmall?.copyWith(
                                      fontSize: 16.sp,
                                    )),
                                Text(
                                    "${state.dish.timeToWait.isEmpty ? 0 : state.dish.timeToWait} minutes",
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontSize: 16.sp,
                                    )),
                                SizedBox(height: 10.h),
                                Text("Status: ",
                                    style:
                                        theme.textTheme.headlineSmall?.copyWith(
                                      fontSize: 16.sp,
                                    )),
                                Text(
                                    state.dish.isAvailable
                                        ? "Available"
                                        : "Unavailable",
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontSize: 16.sp,
                                    )),
                                SizedBox(height: 10.h),
                                Text("Featured: ",
                                    style:
                                        theme.textTheme.headlineSmall?.copyWith(
                                      fontSize: 16.sp,
                                    )),
                                Text(
                                    state.dish.featured
                                        ? "Is Featured"
                                        : "Not Featured",
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontSize: 16.sp,
                                    )),
                              ]),
                        ),
                      ]),
                )));
      },
    );
  }

  Map<String, String> mapValueAndChoise = {
    'edit': 'Edit',
    'delete': 'Delete',
  };
}
