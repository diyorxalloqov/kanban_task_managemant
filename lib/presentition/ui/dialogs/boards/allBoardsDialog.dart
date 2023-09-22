// // ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// import 'package:adaptive_theme/adaptive_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:kanban_task_managemant/application/bloc/BoardBloc/boards_bloc.dart';
// import 'package:kanban_task_managemant/domain/core/constant/extensions/size.dart';
// import 'package:kanban_task_managemant/presentition/ui/dialogs/boards/addNewBoardDialog.dart';
// import 'package:kanban_task_managemant/presentition/ui/widgets/addSpace.dart';

// class AllBoarsdDialog extends StatefulWidget {
//   const AllBoarsdDialog({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<AllBoarsdDialog> createState() => _AllBoarsdDialogState();
// }

// class _AllBoarsdDialogState extends State<AllBoarsdDialog> {
//   bool _isCliked = false;
//   int _currentIndex = 0;

//   @override
//   void initState() {
//     context.read<BoardsBloc>().add(BoardsListGetEvent());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _isCliked = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;

//     return Dialog(
//       alignment: Alignment.topCenter,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       insetPadding: EdgeInsets.only(top: context.height * 0.08),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SizedBox(
//             height: 322.h,
//             width: 264.w,
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 205.h,
//                     width: 240.w,
//                     child: BlocBuilder<BoardsBloc, BoardsState>(
//                         builder: (context, state) {
//                       if (state is BoardsLoadingState) {
//                         print("loading");
//                         return const Center(
//                           child: CircularProgressIndicator.adaptive(
//                               backgroundColor: Colors.white),
//                         );
//                       } else if (state is BoardsErrorState) {
//                         print("error");
//                         return Center(
//                           child: Text(state.errorMessage.toString()),
//                         );
//                       } else if (state is BoardsCompleteState) {
//                         print("complete");
//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(15.0),
//                               child: Text(
//                                 "ALL BOARDS (${state.boardList!.length})",
//                                 style: const TextStyle(
//                                   color: Color(0xFF828FA3),
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w700,
//                                   letterSpacing: 2.40,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 144,
//                               width: 240,
//                               child: (state.boardList == null ||
//                                       state.boardList!.isEmpty)
//                                   ? SizedBox(
//                                       height: 322.h,
//                                       width: 264.w,
//                                       child: const Center(
//                                           child: Text(
//                                               "Hozircha Boardlar Mavjud Emas")),
//                                     )
//                                   : ListView.builder(
//                                       itemBuilder: (context, index) {
//                                         return Column(
//                                           children: [
//                                             InkWell(
//                                               onTap: () {
//                                                 _currentIndex = index;
//                                                 setState(() {});
//                                               },
//                                               child: Container(
//                                                 height: 48.h,
//                                                 width: 240.w,
//                                                 decoration: BoxDecoration(
//                                                     color: _currentIndex ==
//                                                             index
//                                                         ? const Color(
//                                                             0xff635FC7)
//                                                         : null,
//                                                     borderRadius:
//                                                         const BorderRadius
//                                                                 .horizontal(
//                                                             right:
//                                                                 Radius.circular(
//                                                                     100))),
//                                                 child: Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           left: 24),
//                                                   child: Row(
//                                                     children: [
//                                                       Image.asset(
//                                                         "assets/1.png",
//                                                         width: 16,
//                                                         color: _currentIndex ==
//                                                                 index
//                                                             ? null
//                                                             : const Color(
//                                                                 0xFF828FA3),
//                                                       ),
//                                                       addWidth(12),
//                                                       Text(
//                                                         state.boardList![index]
//                                                             .title
//                                                             .toString(),
//                                                         style: TextStyle(
//                                                           color: _currentIndex ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : const Color(
//                                                                   0xFF828FA3),
//                                                           fontSize: 15,
//                                                           fontWeight:
//                                                               FontWeight.w700,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         );
//                                       },
//                                       itemCount: state.boardList!.length,
//                                     ),
//                             ),
//                           ],
//                         );
//                       } else {
//                         return const SizedBox.shrink();
//                       }
//                     }),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           Navigator.pop(context);
//                           showDialog(
//                               context: context,
//                               builder: (c) => const AddNewBoardDialog());
//                         },
//                         child: SizedBox(
//                           width: 235.w,
//                           height: 48.h,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 24),
//                             child: Row(
//                               children: [
//                                 Image.asset(
//                                   "assets/1.png",
//                                   width: 16,
//                                   color: const Color(0xff635FC7),
//                                 ),
//                                 addWidth(12),
//                                 const Text(
//                                   "+ Create New Board",
//                                   style: TextStyle(
//                                     color: Color(0xff635FC7),
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       Center(
//                         child: Container(
//                           width: 235.w,
//                           height: 48.h,
//                           color: Colors.grey.shade300,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Icon(
//                                 Icons.sunny,
//                                 color: Colors.blueGrey,
//                               ),
//                               addWidth(10),
//                               Switch.adaptive(
//                                   value: _isCliked,
//                                   onChanged: (value) {
//                                     setState(() {});
//                                     (() {
//                                       _isCliked = value;
//                                       print(value);
//                                     });
//                                     final newBrightness = value
//                                         ? Brightness.dark
//                                         : Brightness.light;
//                                     AdaptiveTheme.of(context).setThemeMode(
//                                         newBrightness == Brightness.dark
//                                             ? AdaptiveThemeMode.dark
//                                             : AdaptiveThemeMode.light);
//                                   }),
//                               addWidth(10),
//                               const Icon(
//                                 Icons.nightlight_round_outlined,
//                                 color: Colors.blueGrey,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
