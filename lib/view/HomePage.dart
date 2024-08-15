import 'package:ecommerce/Utils/Routes/Routes_name.dart';
import 'package:ecommerce/res/index.dart';
import 'package:ecommerce/view/ProductDetail_Page.dart';
import 'package:ecommerce/view_model/cartPageViewModel.dart';
import 'package:ecommerce/view_model/homeViewModel.dart';
import 'package:ecommerce/view_model/wishlistViewModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../data/Response/status.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    homeViewModel.homeApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Index indexalue = Provider.of<Index>(context);
    WishListViewModel favlist = Provider.of<WishListViewModel>(context);
    CartPageViewModel cartPageViewModel =
        Provider.of<CartPageViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("E-Commerce 🛍️",
            style: GoogleFonts.aBeeZee(color: Colors.black, fontSize: 25)),
        actions: [
          IconButton(
              onPressed: () {
                //  showSearch(context: context, delegate: CustomSearchDelegate());
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              )),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 11.0, bottom: 8, left: 8, right: 8),
              child: Flexible(
                child: Container(
                  height: 150,
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://th.bing.com/th/id/OIP.T_VrXPrGFVy9kz4gMfppZgHaEQ?rs=1&pid=ImgDetMain"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 21.0, bottom: 8, top: 8),
              child: Row(
                children: [
                  Text('• All products 📃',
                      style: GoogleFonts.abel(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black)),
                ],
              ),
            ),
            ChangeNotifierProvider<HomeViewModel>(
                create: (context) => homeViewModel,
                child:
                    Consumer<HomeViewModel>(builder: (context, value, child) {
                  switch (value.mylist.status) {
                    case Status.LOADING:
                      return const Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 58.0),
                                child: CircularProgressIndicator(),
                              )
                            ]),
                      );

                    case Status.ERROR:
                      if (kDebugMode) {
                        print('ok not');
                      }

                      return Text(value.mylist.message.toString());

                    case Status.COMPLEATED:
                      return Padding(
                        padding: const EdgeInsets.only(top: 11.0, bottom: 18),
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return Container(
                              height: 1,
                              color: Colors.black,
                            );
                          },
                          controller: ScrollController(keepScrollOffset: false),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                indexalue.updateIndex(index);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ProductDetailPage(),
                                    ));
                              },
                              child: Flexible(
                                  child: Card(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Stack(children: [
                                          Image(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              image: NetworkImage(value
                                                  .mylist
                                                  .data!
                                                  .products![index]
                                                  .thumbnail
                                                  .toString()),
                                              fit: BoxFit.fill),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Consumer<WishListViewModel>(
                                              builder: (context, value, child) {
                                                return InkWell(
                                                  onTap: () {
                                                    if (favlist.selectedFav
                                                        .contains(index)) {
                                                      favlist.removeItem(index);
                                                    } else {
                                                      favlist.addItem(index);
                                                    }
                                                  },
                                                  child: Container(
                                                      width: 35,
                                                      height: 30,
                                                      color: Colors.black12,
                                                      child: Icon(
                                                        favlist.selectedFav
                                                                .contains(index)
                                                            ? Icons.favorite
                                                            : Icons
                                                                .favorite_border,
                                                        color: Colors.red,
                                                      )),
                                                );
                                              },
                                            ),
                                          )
                                        ]),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.55,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, bottom: 8, left: 8),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    value.mylist.data!
                                                        .products![index].title
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.visible,
                                                    style: GoogleFonts.almendra(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const SizedBox(
                                                  height: 11,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        (" ${value.mylist.data!.products![index].rating}"),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    const Text("  ⭐⭐⭐⭐⭐"),
                                                    Text(
                                                        (" (${value.mylist.data!.products![index].minimumOrderQuantity})")),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 11,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '\$ ${value.mylist.data!.products![index].price.toString()}',
                                                      style: const TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          fontSize: 15),
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                        '\$ ${value.mylist.data!.products![index].discountPercentage.toString()}',
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18)),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 18,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Consumer<CartPageViewModel>(
                                                      builder: (context, value,
                                                          child) {
                                                        return InkWell(
                                                          onTap: () {
                                                            if (cartPageViewModel
                                                                .selected
                                                                .contains(
                                                                    index)) {
                                                              cartPageViewModel
                                                                  .removeItem(
                                                                      index);
                                                            } else {
                                                              cartPageViewModel
                                                                  .addItem(
                                                                      index);
                                                            }
                                                          },
                                                          child:
                                                              cartPageViewModel
                                                                      .selected
                                                                      .contains(
                                                                          index)
                                                                  ? Container(
                                                                      height:
                                                                          35,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        color: Colors
                                                                            .red,
                                                                      ),
                                                                      child: Center(
                                                                          child: Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child: Text(
                                                                            " Remove  🛒 ",
                                                                            style:
                                                                                GoogleFonts.almendra(color: Colors.black, fontWeight: FontWeight.w600)),
                                                                      )),
                                                                    )
                                                                  : Container(
                                                                      height:
                                                                          35,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        color: Colors
                                                                            .yellow,
                                                                      ),
                                                                      child: Center(
                                                                          child: Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child: Text(
                                                                            "Add to Cart 🛒 ",
                                                                            style:
                                                                                GoogleFonts.almendra(color: Colors.black, fontWeight: FontWeight.w600)),
                                                                      )),
                                                                    ),
                                                        );
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 11,
                                                    ),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        height: 35,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.2,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors.yellow,
                                                        ),
                                                        child: Center(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text("Buy",
                                                              style: GoogleFonts.almendra(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                        )),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                            );
                          },
                          shrinkWrap: true,
                          itemCount: value.mylist.data!.products!.length,
                        ),
                      );

                    default:
                      return Container();
                  }
                })),
          ],
        ),
      ),
    );
  }
}
