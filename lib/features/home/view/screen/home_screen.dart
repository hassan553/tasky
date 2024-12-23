import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tt/core/extension/navigation_extension.dart';
import 'package:tt/core/extension/text_extension.dart';
import 'package:tt/core/routes/app_pages.dart';
import 'package:tt/core/services/cache/cash_helper.dart';
import 'package:tt/core/services/setup/getIt.dart';
import 'package:tt/core/utils/app_colors.dart';
import 'package:tt/features/home/data/repo/home_repo.dart';
import 'package:tt/features/home/logic/home_cubit.dart';

import '../widget/task_home_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('Tasky', style: context.f24700),
        actions: [
          IconButton(
              onPressed: () => context.navigateToPage(AppPages.profile),
              icon: Icon(
                Icons.person,
                size: 30.sp,
              )),
          const SizedBox(width: 10),
          IconButton(
              onPressed: () {
                CashHelper.sharedPreferences?.clear();
                context.navigateToAndReplacement(AppPages.login);
              },
              icon: Icon(
                Icons.logout,
                size: 30.sp,
              )),
        ],
      ),
      floatingActionButton: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              context.navigateToPage(AppPages.addTask);
            },
            backgroundColor: AppColors.primaryColor,
            child: Icon(
              Icons.add,
              color: AppColors.whiteColor,
              size: 30.sp,
            ),
          );
        },
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        //buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          var cubit = context.read<HomeCubit>();
          if (cubit.allTasks.isNotEmpty) {
            return RefreshIndicator(
              onRefresh: () async {
                await cubit.getAllTask(true, 1);
              },
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    if (state is GetAllPaginationTaskLoading)
                      const Center(child: CircularProgressIndicator()),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Tasks',
                          style: context.f16700!.copyWith(
                            color: const Color(0xff24252C).withOpacity(.6),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const HomeTabBarWidget(),
                        const SizedBox(height: 12),
                        Expanded(
                          child: cubit
                                  .getSelectedTasks(cubit.currentIndex)
                                  .isEmpty
                              ? const Center(child: Text('No Tasks'))
                              : ListView.builder(
                                  controller: cubit.scrollController,
                                  itemCount: cubit
                                      .getSelectedTasks(cubit.currentIndex)
                                      .length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        context.navigateToPage(
                                            AppPages.taskDetails,
                                            arguments: cubit.getSelectedTasks(
                                                cubit.currentIndex)[index]);
                                      },
                                      child: TaskItemCard(
                                          task: cubit.getSelectedTasks(
                                              cubit.currentIndex)[index]),
                                    );
                                  },
                                ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (state is GetAllTaskFailed) {
            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text(
                    state.message,
                    style: context.f14400,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      child: const Text('Retry'),
                      onPressed: () async {
                        cubit.currentPage = 1;
                        await context.read<HomeCubit>().getAllTask();
                      })
                ]));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class HomeTabBarWidget extends StatelessWidget {
  const HomeTabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.read<HomeCubit>().changeIndex(index);
                },
                child: Container(
                  margin: const EdgeInsetsDirectional.only(end: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: context.read<HomeCubit>().currentIndex == index
                          ? AppColors.primaryColor
                          : const Color(0xffF0ECFF),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      context.read<HomeCubit>().titles[index],
                      style: context.f15600!.copyWith(
                          color: context.read<HomeCubit>().currentIndex == index
                              ? AppColors.whiteColor
                              : AppColors.bgGrey),
                    ),
                  ),
                ),
              );
            },
            itemCount: context.read<HomeCubit>().titles.length,
            scrollDirection: Axis.horizontal,
          );
        },
      ),
    );
  }
}
