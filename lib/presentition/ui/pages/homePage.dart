import 'dart:async';
import 'dart:math';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban_task_managemant/application/bloc/BoardBloc/boards_bloc.dart';
import 'package:kanban_task_managemant/domain/core/constant/extensions/size.dart';
import 'package:kanban_task_managemant/domain/services/auth/token/updateAccessToken.dart';
import 'package:kanban_task_managemant/presentition/ui/dialogs/boards/addNewBoardDialog.dart';
import 'package:kanban_task_managemant/presentition/ui/dialogs/tasks/addNewTaskDialog.dart';
import 'package:kanban_task_managemant/presentition/ui/dialogs/boards/deleteBoardDialog.dart';
import 'package:kanban_task_managemant/presentition/ui/dialogs/boards/editBoardDialog.dart';
import 'package:kanban_task_managemant/presentition/ui/dialogs/ontapTaskDialog.dart';
import 'package:kanban_task_managemant/presentition/ui/widgets/addSpace.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isTap = false;

  @override
  void initState() {
    Timer.periodic(const Duration(minutes: 4), (timer) {
      UpdateAccessTokenService().updateAccessToken();
      isTap = true;
    });
    context.read<BoardsBloc>().add(const BoardsListGetEvent());

    super.initState();
  }

  bool _isCliked = false;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    _isCliked = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;

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
                              EdgeInsets.only(top: context.height * 0.08),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 322.h,
                                width: 264.w,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 205.h,
                                        width: 240.w,
                                        child: BlocBuilder<BoardsBloc,
                                                BoardsState>(
                                            builder: (context, state) {
                                          if (state is BoardsLoadingState) {
                                            return const Center(
                                              child: CircularProgressIndicator
                                                  .adaptive(
                                                      backgroundColor:
                                                          Colors.white),
                                            );
                                          } else if (state
                                              is BoardsErrorState) {
                                            return Center(
                                              child: Text(state.errorMessage
                                                  .toString()),
                                            );
                                          } else if (state
                                              is BoardsCompleteState) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Text(
                                                    "ALL BOARDS (${state.boardList!.length})",
                                                    style: const TextStyle(
                                                      color: Color(0xFF828FA3),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      letterSpacing: 2.40,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 144,
                                                  width: 240,
                                                  child: (state.boardList ==
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
                                                      : StatefulBuilder(builder:
                                                          (context,
                                                              setStateInside) {
                                                          return ListView
                                                              .builder(
                                                            itemBuilder:
                                                                (context,
                                                                    indexxx) {
                                                              return Column(
                                                                children: [
                                                                  InkWell(
                                                                    onTap: () {
                                                                      _currentIndex =
                                                                          indexxx;
                                                                      setStateInside(
                                                                          () {});
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          48.h,
                                                                      width:
                                                                          240.w,
                                                                      decoration: BoxDecoration(
                                                                          color: _currentIndex == indexxx
                                                                              ? const Color(
                                                                                  0xff635FC7)
                                                                              : null,
                                                                          borderRadius: const BorderRadius
                                                                              .horizontal(
                                                                              right: Radius.circular(100))),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                24),
                                                                        child:
                                                                            Row(
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
                                                        }),
                                                ),
                                              ],
                                            );
                                          } else {
                                            return const SizedBox.shrink();
                                          }
                                        }),
                                      ),
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
                                                      const AddNewBoardDialog());
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
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          StatefulBuilder(builder:
                                              (context, setStateInside) {
                                            return Center(
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
                                                          setStateInside(() {
                                                            _isCliked = value;
                                                          });
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
                                            );
                                          }),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
                setState(() {});
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Platform Launch",
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
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
                    builder: (context) => const AddNewTaskDialog());
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
                      builder: (context) => const EditBoardDialog());
                } else if (value == 'delete') {
                  // delete board
                  showDialog(
                      context: context,
                      builder: (context) => DeleteBoardDialog(
                          // id: IDDBService().idBox!.getAt(_currentIndex)['id'],
                          ));
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
        body: BlocBuilder<BoardsBloc, BoardsState>(builder: (context, state) {
          if (state is BoardsLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is BoardsErrorState) {
            return Center(
              child: Text(state.errorMessageBoardList.toString()),
            );
          } else if (state is BoardsCompleteState) {
            final randomColor = Random().nextInt(0xFFFFFF) + 0xFF000000;
            return SizedBox(
              height: context.height,
              width: context.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, outerIndex) {
                  if (outerIndex == state.boardList!.length) {
                    return TextButton(
                      onPressed: () {
                        // showDialog(context: context, builder: (context)=>AddNewBoardDialog());
                      },
                      child: const Text("+ New Column",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF635FC7),
                          )),
                    );
                  } else {
                    if (outerIndex <
                        state
                            .boardList![_currentIndex].taskConditions!.length) {
                      final taskCondition = state.boardList![_currentIndex]
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
                                    final taskItem =
                                        taskCondition.taskItem![innerIndex];
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
                                                    overflow:
                                                        TextOverflow.clip),
                                              ),
                                              subtitle: Text("subtask")
                                              // Text(taskItem.subTask![innerIndex].title!.isNotEmpty  ?  taskItem.subTask![innerIndex].title.toString()),
                                              ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: taskCondition.taskItem!.length,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  }
                  return null;
                },
                itemCount: state.boardList!.length + 2,
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        }));
  }
}
