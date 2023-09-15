


import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban_task_app/application/bloc/boards_bloc.dart';

import 'package:kanban_task_app/presenatation/ui/pages/boards/AddNewBoard_page.dart';

class AllBoardPage extends StatefulWidget {
  const AllBoardPage({super.key});

  @override
  State<AllBoardPage> createState() => _AllBoardPageState();
}

class _AllBoardPageState extends State<AllBoardPage> {
  bool _isDarkMode = false;

  @override
  void initState() {
    context.read<BoardsBloc>().add(BoardsListGetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _isDarkMode = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;

    return BlocBuilder<BoardsBloc, BoardsState>(
      builder: (context, state) {
        if (state is BoardsLoadingState) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: Colors.white,
            ),
          );
        } else if (state is BoardsErrorState) {
          return Center(
            child: Text(state.errorMessage.toString()),
          );
        } else if (state is BoardsCompleteState) {
          return Dialog(
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF2B2C37)
                : Colors.white,
            alignment: Alignment.topCenter,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            insetPadding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.07,
            ),
            child: (state.boardsListModel == null ||
                    state.boardsListModel!.isEmpty)
                ? SizedBox(
                    height: 350.h,
                    width: 265.w,
                    child: const Center(
                      child: Text("Hozircha Boards Mavjud emas"),
                    ),
                  )
                : SizedBox(
                    height: 328.h,
                    width: 264.w,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "ALL BOARDS (${state.boardsListModel!.length})",
                              style: TextStyle(
                                color: const Color(0xFF828FA3),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2.40,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 150,
                            width: 240,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 45.h,
                                        width: 240.w,
                                        decoration: BoxDecoration(
                                          color: index == 0
                                              ? const Color(0xff635FC7)
                                              : null,
                                          borderRadius:
                                              const BorderRadius.horizontal(
                                            right: Radius.circular(100),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 24),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/Shape.png",
                                                width: 16,
                                                color: index == 0
                                                    ? null
                                                    : const Color(0xFF828FA3),
                                              ),
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              Text(
                                                state.boardsListModel![index]
                                                    .title
                                                    .toString(),
                                                style: TextStyle(
                                                  color: index == 0
                                                      ? Colors.white
                                                      : const Color(0xFF828FA3),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                              itemCount: 3,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                showDialog(
                                  context: context,
                                  builder: (context) => AddNewBoardPage(),
                                );
                              });
                            },
                            child: SizedBox(
                              width: 235.w,
                              height: 41.h,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/Shape.png",
                                      width: 16,
                                      color: const Color(0xff635FC7),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Text(
                                      " +Create New Board",
                                      style: TextStyle(
                                        color: Color(0xff635FC7),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Center(
                            child: Container(
                              width: 235.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                color: Theme.of(context).brightness== Brightness.dark
                                    ? const Color(0xFF2B2C37)
                                    : const Color(0xFFF4F7FD),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.sunny,
                                    color: Colors.blueGrey,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Switch.adaptive(
                                    value: _isDarkMode,
                                    onChanged: (value) {
                                      setState(() {
                                        _isDarkMode = value;
                                      });
                                      final newAppTheme = value
                                          ? Brightness.dark
                                          : Brightness.light;
                                      AdaptiveTheme.of(context).setThemeMode(
                                        newAppTheme == Brightness.dark
                                            ? AdaptiveThemeMode.dark
                                            : AdaptiveThemeMode.light,
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Icon(
                                    Icons.nightlight_round_outlined,
                                    color: Colors.blueGrey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}