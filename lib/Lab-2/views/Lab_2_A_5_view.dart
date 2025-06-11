import 'package:advance_flutter_lab/Lab-2/controllers/Lab_2_A_5_controller.dart';
import 'package:advance_flutter_lab/Lab-2/models/Lab_2_A_5_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsPageView extends StatefulWidget {
  const ProductsPageView({super.key});

  @override
  State<ProductsPageView> createState() => _ProductsPageViewState();
}

class _ProductsPageViewState extends State<ProductsPageView>
    with TickerProviderStateMixin {
  List<Tab> _tabs = [
    Tab(
      child: Text("Products", style: GoogleFonts.rubik(color: Colors.black)),
      icon: Icon(Icons.shopping_bag_outlined, color: Colors.black),
    ),
    Tab(
      child: Text("Cart", style: GoogleFonts.rubik(color: Colors.black)),
      icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
    ),
  ];
  late TabController _tabController;
  ECommerceProductController _productController = ECommerceProductController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(left: 10, top: 11),
            child: Text(
              "Minimalist",
              style: GoogleFonts.rubik(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: Container(
                height: 40,
                width: 68,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black,
                      size: 25,
                    ),
                    SizedBox(width: 5),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      child: Text(
                        "${ECommerceProductController.cartItems.length}",
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                        key: ValueKey(
                          ECommerceProductController.cartItems.length,
                        ),
                      ),
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: _productController.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisExtent: 210,
                    ),
                    itemBuilder: (context, index) {
                      Product product = _productController.products[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shadowColor: Colors.green.withOpacity(0.5),
                          elevation: 5,
                          color: Colors.white,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  child: Image.network(
                                    product.imageUrl,
                                    height: 170,
                                    width: 105,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 20),
                                      Text(
                                        product.name,
                                        style: GoogleFonts.rubik(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        product.description,
                                        style: GoogleFonts.lora(
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "₹ ${product.price.toString()}",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 5,
                                            ),
                                            child: CircleAvatar(
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                ),
                                                onPressed: () {
                                                  _productController
                                                      .addItemToCart(product);
                                                  setState(() {});
                                                },
                                              ),
                                              backgroundColor: Colors.black
                                                  .withOpacity(0.2),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                _productController.isCartEmpty()
                    ? Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_shopping_cart_rounded,
                            color: Colors.black45,
                            size: 100,
                          ),
                          SizedBox(height: 12),
                          Text(
                            "No items show!",
                            style: GoogleFonts.rubik(
                              fontSize: 20,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    )
                    : Expanded(
                      child: GridView.builder(
                        itemCount: ECommerceProductController.cartItems.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisExtent: 210,
                        ),
                        itemBuilder: (context, index) {
                          Product product =
                              ECommerceProductController.cartItems[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shadowColor: Colors.green.withOpacity(0.5),
                              elevation: 5,
                              color: Colors.white,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      child: Image.network(
                                        product.imageUrl,
                                        height: 170,
                                        width: 105,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 20),
                                          Text(
                                            product.name,
                                            style: GoogleFonts.rubik(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            product.description,
                                            style: GoogleFonts.lora(
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "₹ ${product.price.toString()}",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 5,
                                                ),
                                                child: CircleAvatar(
                                                  child: IconButton(
                                                    icon: Icon(
                                                      Icons
                                                          .delete_outline_rounded,
                                                      color: Colors.black,
                                                    ),
                                                    onPressed: () {
                                                      _productController
                                                          .removeItemFromCart(
                                                            product,
                                                          );
                                                      setState(() {});
                                                    },
                                                  ),
                                                  backgroundColor: Colors.black
                                                      .withOpacity(0.2),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: TabBar(
          controller: _tabController,
          tabs: _tabs,
          indicatorColor: Colors.black,
        ),
      ),
    );
  }
}
