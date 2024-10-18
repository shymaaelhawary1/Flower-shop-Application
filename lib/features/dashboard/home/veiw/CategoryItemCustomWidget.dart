// import 'package:flower_shop/features/dashboard/details/veiw/details.dart';
// import 'package:flutter/material.dart';

// import '../model/CategoryModel.dart';

// class CategoryItemCustomWidget extends StatelessWidget {
//   CategoryItemCustomWidget({
//     super.key,
//     required this.popular, required CategoryModel categoryModel,
//   });
//   // final CategoryModel categoryModel;
//   final bool popular;
//   final List<CategoryModel> popularModel = [
//     CategoryModel(image: 'assets/Rectangle 8.png', title: 'Roses', price: 90),
//     CategoryModel(image: 'assets/Rectangle 9.png', title: 'lilies ', price: 70),
//     CategoryModel(
//         image: 'assets/Rectangle 10.png', title: 'seasonal', price: 50),
//     CategoryModel(
//         image: 'assets/Rectangle 14.png', title: 'uniflora', price: 45),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: 4,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8),
//           child: InkWell(
//             onTap: () =>
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//               return Details(
//                 categoryModel: popularModel[index],
//               );
//             })),
//             child: Container(
//               width: 150,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(popularModel[index].image),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: buttonNamesCategores(
//                   popular: popular, index: index, context: context),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Padding buttonNamesCategores(
//       {required int index,
//       required bool? popular,
//       required BuildContext context}) {
//     if (popular == false) {
//       return Padding(
//         padding:
//             const EdgeInsets.only(top: 115, bottom: 5, right: 30, left: 30),
//         child: ElevatedButton(
//           onPressed: () {
//             // Navigator.push(
//             //   context,
//             //   MaterialPageRoute(
//             //     builder: (context) {
//             //       return CategoryPage(categoryType: '',);
//             //     },
//             //   ),
//             // );
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: const Color(0xFFBD8F97),
//           ),
//           child: Text(
//             popularModel[index].title,
//             style: const TextStyle(
//               color: Colors.white,
//             ),
//           ),
//         ),
//       );
//     } else {
//       return Padding(
//         padding: const EdgeInsets.only(top: 115, bottom: 5, right: 5, left: 0),
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) {
//               return Details(
//                 categoryModel: popularModel[index],
//               );
//             }));
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: const Color(0xFFBD8F97),
//           ),
//           child: Row(
//             children: [
//               Text(
//                 popularModel[index].title,
//                 style: const TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//               const Spacer(),
//               Text(
//                 '${popularModel[index].price}\$',
//                 style: const TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }
// }
