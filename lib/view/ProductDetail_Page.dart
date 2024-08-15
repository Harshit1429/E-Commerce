import 'package:ecommerce/data/Response/status.dart';
import 'package:ecommerce/view_model/productdetailModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Utils/Routes/Routes_name.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  ProductDetailViewModel productDetailViewModel = ProductDetailViewModel();

  @override
  void initState() {
    productDetailViewModel.getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, color: Colors.black)),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.wishList);
              },
              child: const Center(
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(
              width: 21,
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: ChangeNotifierProvider<ProductDetailViewModel>(
          create: (context) => productDetailViewModel,
          child: Consumer<ProductDetailViewModel>(
            builder: (context, value, child) {
              switch (value.myres.status) {
                case Status.LOADING:
                  return const Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  ));
                case Status.ERROR:
                  if (kDebugMode) {
                    print('ok not');
                  }

                  return Text(value.myres.message.toString());

                case Status.COMPLEATED:
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Visit  the  ${value.myres.data?.products?[index].brand.toString()}",
                                    style: GoogleFonts.almendra(
                                        color: Colors.blue.shade800,
                                        fontWeight: FontWeight.w600)),
                                Text(
                                  "⭐⭐⭐⭐⭐  (${value.myres.data?.products?[index].minimumOrderQuantity.toString()})",
                                  style: const TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                    '${value.myres.data?.products![index].title.toString()} - ${value.myres.data!.products![index].tags!.last.toString()}',
                                    style: GoogleFonts.almendra(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('5k + bought in past month',
                                    style: GoogleFonts.aBeeZee(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                          InteractiveViewer(
                              panEnabled: false,
                              child: Image(
                                  image: NetworkImage(value
                                      .myres.data!.products![index].thumbnail
                                      .toString()))),
                          const Card(
                            elevation: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.favorite_border, size: 30),
                                SizedBox(
                                  width: 18,
                                ),
                                Icon(Icons.share, size: 28),
                                SizedBox(
                                  width: 21,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 11.0),
                            child: Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.yellow,
                                  ),
                                  child: Center(
                                      child: Text("Great Sale",
                                          style: GoogleFonts.almendra(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600))),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0, top: 21),
                            child: Row(
                              children: [
                                Text(
                                  '\$ ${value.myres.data?.products?[index].price.toString()}',
                                  style: GoogleFonts.aBeeZee(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 21),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  width: 21,
                                ),
                                Text(
                                  '\$ ${value.myres.data?.products?[index].discountPercentage.toString()}',
                                  style: GoogleFonts.aBeeZee(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              ' ${value.myres.data?.products?[index].description.toString()}',
                              style: GoogleFonts.aBeeZee(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                              overflow: TextOverflow.visible,
                            ),
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: [
                                Text(
                                  ' •  ${value.myres.data?.products?[index].shippingInformation.toString()}',
                                  style: GoogleFonts.aBeeZee(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.visible,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: [
                                Text(
                                  ' •  ${value.myres.data?.products?[index].returnPolicy.toString()}',
                                  style: GoogleFonts.aBeeZee(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.visible,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                            child: Center(
                                child: Text("Buy Now",
                                    style: GoogleFonts.almendra(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600))),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Row(
                              children: [
                                Text("Ratings & Reviews",
                                    style: GoogleFonts.almendra(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 21)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ListView.separated(
                            controller:
                                ScrollController(keepScrollOffset: false),
                            itemBuilder: (context, rewie) {
                              return Card(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          const CircleAvatar(
                                            maxRadius: 25,
                                            child: Icon(Icons.person),
                                          ),
                                          const SizedBox(
                                            width: 11,
                                          ),
                                          SizedBox(
                                            width: 250,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    value
                                                        .myres
                                                        .data!
                                                        .products![index]
                                                        .reviews![rewie]
                                                        .reviewerName
                                                        .toString(),
                                                    style: GoogleFonts.almendra(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 18),
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                                Text(
                                                    value
                                                        .myres
                                                        .data!
                                                        .products![index]
                                                        .reviews![rewie]
                                                        .reviewerEmail
                                                        .toString(),
                                                    style: GoogleFonts.almendra(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 18),
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 68.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "⭐⭐⭐⭐⭐  (${value.myres.data?.products?[index].reviews?[rewie].rating.toString()})",
                                            style:
                                                const TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 11,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50.0, bottom: 11),
                                      child: Row(
                                        children: [
                                          Text(
                                              value.myres.data!.products![index]
                                                  .reviews![rewie].comment
                                                  .toString(),
                                              style: GoogleFonts.almendra(
                                                  color: Colors.blueAccent,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18),
                                              overflow: TextOverflow.visible),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            shrinkWrap: true,
                            itemCount: value
                                .myres.data!.products![index].reviews!.length,
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 11,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "• For more Information Scan the Qr code Given Below :",
                                style: GoogleFonts.almendra(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Image(
                              image: NetworkImage(value
                                  .myres.data!.products![index].meta!.qrCode
                                  .toString()))
                        ],
                      );
                    },
                    shrinkWrap: true,
                    itemCount: value.myres.data!.products!.length,
                  );
                default:
                  return Container();
              }
            },
          ),
        ));
  }
}
