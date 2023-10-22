// ignore_for_file: file_names

import 'dart:async';
import 'dart:math';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kanban_task_managemant/application/bloc/BoardBloc/boards_bloc.dart';
import 'package:kanban_task_managemant/domain/core/constant/extensions/size.dart';
import 'package:kanban_task_managemant/domain/source/services/auth/token/updateAccessToken.dart';
import 'package:kanban_task_managemant/presentition/ui/dialogs/boards/addNewBoardDialog.dart';
import 'package:kanban_task_managemant/presentition/ui/dialogs/boards/addNewColumnDialog.dart';
import 'package:kanban_task_managemant/presentition/ui/dialogs/boards/deleteBoardDialog.dart';
import 'package:kanban_task_managemant/presentition/ui/dialogs/boards/editBoardDialog.dart';
import 'package:kanban_task_managemant/presentition/ui/dialogs/ontapTaskDialog.dart';
import 'package:kanban_task_managemant/presentition/ui/dialogs/tasks/addNewTaskDialog.dart';
import 'package:kanban_task_managemant/presentition/ui/widgets/addSpace.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isTap = false;

  @override
  void didChangeDependencies() {
    context.read<BoardsBloc>().add(const BoardsListGetEvent());
    super.didChangeDependencies();
  }

  @override
  void initState() {
    context.read<BoardsBloc>().add(const BoardsListGetEvent());
    Timer.periodic(const Duration(minutes: 4), (timer) {
      UpdateAccessTokenService().updateAccessToken();
    });

    final boardsBloc = BlocProvider.of<BoardsBloc>(context);
    boardsBloc.stream.listen((state) {
      if (state is BoardsCompleteState) {
        setState(() {
          // Use safe navigation to access boardList
          final boardList = state.boardList;
          if (boardList != null) {
            // Check if _currentIndex is out of bounds
            // _currentIndex = _currentIndex >= boardList.length
            //     ? boardList.length - 1
            //     : _currentIndex;
            if (_currentIndex >= boardList.length) {
              _currentIndex = boardList.isEmpty ? -1 : boardList.length - 1;
            }
          }
        });
      }
    });
    isTap = false;

    super.initState();
  }

  bool _isCliked = false;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    _isCliked = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    final randomColor = Random().nextInt(0xFFFFFF) + 0xFF000000;

    return Scaffold(
      body: BlocBuilder<BoardsBloc, BoardsState>(builder: (context, state) {
        if (state is BoardsLoadingState) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white),
          );
        } else if (state is BoardsErrorState) {
          return Center(
            child: Text(state.errorMessage.toString()),
          );
        } else if (state is BoardsCompleteState) {
          return Scaffold(
              appBar: AppBar(
                leading: Image.asset(
                  "assets/group.png",
                  width: 100,
                ),
                title: TextButton(
                    onPressed: () {
                      isTap = !isTap;
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          alignment: Alignment.topCenter,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          insetPadding:
                              EdgeInsets.only(top: context.height * 0.08.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: context.height * 0.37.h,
                                width: context.width * 0.65.w, //264.w,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height: 205.h,
                                          width: 240.w,
                                          child:
                                              //  BlocBuilder<BoardsBloc, BoardsState>(
                                              //     builder: (context, state) {
                                              //   if (state is BoardsLoadingState) {
                                              //     return const Center(
                                              //       child: CircularProgressIndicator.adaptive(
                                              //           backgroundColor: Colors.white),
                                              //     );
                                              //   } else if (state is BoardsErrorState) {
                                              //     return Center(
                                              //       child:
                                              //           Text(state.errorMessage.toString()),
                                              //     );
                                              //   } else if (state is BoardsCompleteState) {
                                              //     return
                                              Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Text(
                                                  "ALL BOARDS (${state.boardList!.length})",
                                                  style: const TextStyle(
                                                    color: Color(0xFF828FA3),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: 2.40,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: SizedBox(
                                                  height: 144,
                                                  width: 240,
                                                  child:
                                                      (state.boardList ==
                                                                  null ||
                                                              state.boardList!
                                                                  .isEmpty)
                                                          ? SizedBox(
                                                              height: 322.h,
                                                              width: 264.w,
                                                              child: const Center(
                                                                  child: Text(
                                                                      "Hozircha Boardlar Mavjud Emas")),
                                                            )
                                                          : StatefulBuilder(
                                                              builder: (context,
                                                                  setStateInside) {
                                                                return ListView
                                                                    .builder(
                                                                  physics:
                                                                      const BouncingScrollPhysics(),
                                                                  shrinkWrap:
                                                                      true,
                                                                  // addRepaintBoundaries:
                                                                  //     true,
                                                                  // addAutomaticKeepAlives:
                                                                  //     true,
                                                                  // addSemanticIndexes:
                                                                  //     true,
                                                                  itemBuilder:
                                                                      (context,
                                                                          indexxx) {
                                                                    return Column(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _currentIndex =
                                                                                indexxx;
                                                                            setStateInside(() {});
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                48.h,
                                                                            width:
                                                                                240.w,
                                                                            decoration:
                                                                                BoxDecoration(color: _currentIndex == indexxx ? const Color(0xff635FC7) : null, borderRadius: const BorderRadius.horizontal(right: Radius.circular(100))),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(left: 24),
                                                                              child: Row(
                                                                                children: [
                                                                                  Image.asset(
                                                                                    "assets/1.png",
                                                                                    width: 16,
                                                                                    color: _currentIndex == indexxx ? null : const Color(0xFF828FA3),
                                                                                  ),
                                                                                  addWidth(12),
                                                                                  Text(
                                                                                    state.boardList![indexxx].title.toString(),
                                                                                    style: TextStyle(
                                                                                      color: _currentIndex == indexxx ? Colors.white : const Color(0xFF828FA3),
                                                                                      fontSize: 15,
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
                                                                  itemCount: state
                                                                      .boardList!
                                                                      .length,
                                                                );
                                                              },
                                                            ),
                                                ),
                                              ),
                                            ],
                                          )),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                              showDialog(
                                                  context: context,
                                                  builder: (c) =>
                                                      AddNewBoardDialog(
                                                          currentIndex:
                                                              _currentIndex));
                                            },
                                            child: SizedBox(
                                              width: 235.w,
                                              height: 48.h,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 24),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      "assets/1.png",
                                                      width: 16,
                                                      color: const Color(
                                                          0xff635FC7),
                                                    ),
                                                    addWidth(12),
                                                    const Text(
                                                      "+ Create New Board",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff635FC7),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                              width: 235.w,
                                              height: 48.h,
                                              color: Colors.grey.shade300,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.sunny,
                                                    color: Colors.blueGrey,
                                                  ),
                                                  addWidth(10),
                                                  Switch.adaptive(
                                                      value: _isCliked,
                                                      onChanged: (value) {
                                                        _isCliked = value;
                                                        final newBrightness =
                                                            value
                                                                ? Brightness
                                                                    .dark
                                                                : Brightness
                                                                    .light;
                                                        AdaptiveTheme.of(
                                                                context)
                                                            .setThemeMode(newBrightness ==
                                                                    Brightness
                                                                        .dark
                                                                ? AdaptiveThemeMode
                                                                    .dark
                                                                : AdaptiveThemeMode
                                                                    .light);
                                                      }),
                                                  addWidth(10),
                                                  const Icon(
                                                    Icons
                                                        .nightlight_round_outlined,
                                                    color: Colors.blueGrey,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                      setState(() {});
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          state.boardList![_currentIndex].title.toString(),
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        isTap
                            ? const Icon(Icons.arrow_drop_up_rounded)
                            : const Icon(Icons.arrow_drop_down)
                      ],
                    )),
                actions: [
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AddNewTaskDialog(
                                taskConditionid: 0,
                                taskId: 0,
                                state: state,
                                currenIndex: _currentIndex,
                              ));
                    },
                    child: Container(
                      height: 32,
                      width: 48,
                      decoration: BoxDecoration(
                          color: const Color(0xff635FC7),
                          borderRadius: BorderRadius.circular(24)),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                  addWidth(10),
                  PopupMenuButton<String>(
                    onSelected: (String value) {
                      if (value == 'edit') {
                        //edit board
                        showDialog(
                            context: context,
                            builder: (context) =>
                                EditBoardDialog(currenIndex: _currentIndex));
                      } else if (value == 'delete') {
                        // delete board
                        showDialog(
                            context: context,
                            builder: (context) => DeleteBoardDialog(
                                  currentIndex: _currentIndex,
                                ));

                        // if (_currentIndex >= 0 &&
                        //     _currentIndex < state.boardList!.length) {
                        //   // Ensure that _currentIndex is within the valid range.
                        //   showDialog(
                        //     context: context,
                        //     builder: (context) => DeleteBoardDialog(
                        //       currenIndex: _currentIndex,
                        //     ),
                        //   );
                        // } else {
                        //   // Handle the case where _currentIndex is out of bounds.
                        //   // You can show an error message or handle it in another way.
                        //   print("Invalid _currentIndex: $_currentIndex");
                        // }
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem<String>(
                        value: 'edit',
                        child: Text('Edit Board'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'delete',
                        child: Text(
                          'Delete Board',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                    child: const Icon(Icons.more_vert),
                  )
                ],
              ),
              body:
                  //  BlocBuilder<BoardsBloc, BoardsState>(
                  //   builder: (context, state) {
                  //     if (state is BoardsLoadingState) {
                  //       return const Center(
                  //         child: CircularProgressIndicator.adaptive(),
                  //       );
                  //     } else if (state is BoardsErrorState) {
                  //       return Center(
                  //         child: Text(state.errorMessageBoardList.toString()),
                  //       );
                  //     } else if (state is BoardsCompleteState) {
                  //       return

                  SizedBox(
                height: context.height,
                width: context.width,
                child: state.boardList == null ||
                        state.boardList!.isEmpty ||
                        state.boardList![_currentIndex].taskConditions!
                            .isEmpty ||
                        state.boardList![_currentIndex].taskConditions == null
                    ? state.boardList == null || state.boardList!.isEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.0.sp),
                                child: Text(
                                  "Board isn't created. Please Create a new \n        \t  board to get started.",
                                  style: TextStyle(
                                    color: const Color(0xFF828FA3),
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AddNewBoardDialog(
                                          currentIndex: _currentIndex));
                                },
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(174, 48),
                                    backgroundColor: const Color(0xFF635FC7)),
                                child: const Center(
                                  child: Text(
                                    "+ Add New Board",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "This board is empty. Create a new \n       \t  column to get started.",
                                  style: TextStyle(
                                    color: Color(0xFF828FA3),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AddNewColumnDialog(
                                          currentIndex: _currentIndex));
                                },
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(174, 48),
                                    backgroundColor: const Color(0xFF635FC7)),
                                child: const Center(
                                  child: Text(
                                    "+ Add New Column",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          )
                    ////   boardsni scroll qilganda xato bor keyin birinchi va 2 chi boardga taskcondition qoshilmayapti
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, outerIndex) {
                          if (outerIndex ==
                              state.boardList![_currentIndex].taskConditions!
                                  .length) {
                            return TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AddNewColumnDialog(
                                        currentIndex: _currentIndex));
                              },
                              child: const Text("+ New Column",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF635FC7),
                                  )),
                            );
                          } else if (outerIndex <
                              state.boardList![_currentIndex].taskConditions!
                                  .length) {
                            final taskCondition = state
                                .boardList![_currentIndex]
                                .taskConditions![outerIndex];
                            return SizedBox(
                              width: 280.w,
                              height: context.height.h,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    addHeigth(24),
                                    Row(
                                      children: [
                                        Container(
                                          width: 15.w,
                                          height: 15.h,
                                          decoration: ShapeDecoration(
                                            color: Color(randomColor),
                                            shape: const OvalBorder(),
                                          ),
                                        ),
                                        addWidth(12),
                                        Text(
                                          taskCondition.title.toString(),
                                          style: TextStyle(
                                            color: const Color(0xFF828FA3),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 2.40,
                                          ),
                                        )
                                      ],
                                    ),
                                    addHeigth(24),
                                    Expanded(
                                      child: ListView.builder(
                                        itemBuilder: (context, innerIndex) {
                                          final taskItem = taskCondition
                                              .taskItem![innerIndex];
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 20, right: 20),
                                            child: SizedBox(
                                              height: 88.h,
                                              child: Card(
                                                elevation: 10,
                                                clipBehavior: Clip.antiAlias,
                                                child: ListTile(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            const OnTapTaskDialog(),
                                                      );
                                                    },
                                                    title: Text(
                                                      taskItem.title.toString(),
                                                      style: const TextStyle(
                                                          overflow: TextOverflow
                                                              .clip),
                                                    ),
                                                    subtitle:
                                                        const Text("subtask")
                                                    // Text(taskItem.subTask![innerIndex].title!.isNotEmpty  ?  taskItem.subTask![innerIndex].title.toString()),
                                                    ),
                                              ),
                                            ),
                                          );
                                        },
                                        itemCount:
                                            taskCondition.taskItem?.length ?? 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                        itemCount: state.boardList![_currentIndex]
                                .taskConditions!.length +
                            1,
                      ),
              ));
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }
}
