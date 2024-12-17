import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_list/Utils/app_colors.dart';
import 'package:to_do_list/Utils/app_str.dart';
import 'package:to_do_list/Views/home/component/fab.dart';
import 'package:to_do_list/Views/home/component/home_app_bar.dart';
import 'package:to_do_list/Views/home/component/slider_drawer.dart';
import 'package:to_do_list/extensions/space_exs.dart';

import 'widget/task_widget.dart'; // Ensure this path is correct

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

String lottieURL = 'assets/lottie/1.json';

class _HomeViewState extends State<HomeView> {
  GlobalKey<SliderDrawerState> drawerkey = GlobalKey<SliderDrawerState>();
  final List<int> testing = [1, 2];
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,

      // FloatingButton
      floatingActionButton: const Fab(),

      body: SliderDrawer(
          key: drawerkey,
          isDraggable: false,
          animationDuration: 1000,
          //Drawer
          slider: CustomDrawer(),
          appBar: HomeAppBar(
            drawerkey: drawerkey,
          ),
          //main body
          child: _buildHomeBody(textTheme)),
    );
  }

  Widget _buildHomeBody(TextTheme textTheme) {
    // body
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          ///custom App bar
          Container(
            margin: EdgeInsets.only(top: 25),
            width: double.infinity,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Progress Indicators
                const SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    value: 1 / 3,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(Appcolors.primaryColor),
                  ),
                ),
                25.w, // Using the width extension to add space between the progress indicator and text

                // top level Task info
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppString.mainTile, style: textTheme.displayLarge),
                    3.h,
                    Text(
                      " 1 of 10 task",
                      style: textTheme.titleMedium,
                    )
                  ],
                ),
              ],
            ),
          ),
          // Using the height extension to add vertical space
          //Divider
          const Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Divider(
              thickness: 2,
              indent: 100,
            ),
          ),
          //Task

          Expanded(
            child: SizedBox(
                width: double.infinity,
                height: 745,
                child: testing.isNotEmpty

                    //task is not empty
                    ? ListView.builder(
                        itemCount: testing.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Dismissible(
                              direction: DismissDirection.horizontal,
                              onDismissed: (_) {
                                setState(() {
                                  testing.removeAt(index);
                                });
                                //we will remove current task from db
                              },
                              background: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.delete_outline,
                                      color: Colors.grey),
                                  8.w,
                                  const Text(
                                    AppString.deletedTask,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              key: Key(
                                index.toString(),
                              ),
                              child: TaskWidget());
                        })
                    // task is empty
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //lottie animation
                          FadeIn(
                            child: SizedBox(
                                width: 200,
                                height: 200,
                                child: Lottie.asset(lottieURL,
                                    animate:
                                        testing.isNotEmpty ? false : true)),
                          ),
                          FadeInUp(
                            from: 30,
                            child: const Text(
                              AppString.doneAllTask,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                          )
                        ],
                      )),
          )
        ],
      ),
    );
  }
}
