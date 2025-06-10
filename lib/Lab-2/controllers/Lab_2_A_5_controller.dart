import 'package:advance_flutter_lab/Lab-2/models/Lab_2_A_5_model.dart';

class ECommerceProductController {
  List<Product> _products = [
    Product(
      name: 'Organic Rosehip Oil',
      description: 'Pure cold-pressed rosehip oil for skin rejuvenation.',
      imageUrl:
          "https://sfycdn.speedsize.com/56385b25-4e17-4a9a-9bec-c421c18686fb/beminimalist.co/cdn/shop/files/SalicylicCleanserNew.jpg?crop=center&height=630&v=1721379190&width=420",
      price: 2500, // Price in cents or smallest unit
      isFav: true,
    ),
    Product(
      name: 'Lavender Essential Oil',
      description:
          'Relaxing and calming essential oil, perfect for aromatherapy.',
      imageUrl:
          "https://sfycdn.speedsize.com/56385b25-4e17-4a9a-9bec-c421c18686fb/https://cdn.shopify.com/s/files/1/0410/9608/5665/files/SPF50New.jpg?v=1721379190",
      price: 1500,
      isFav: false,
    ),
    Product(
      name: 'Shea Butter Body Cream',
      description: 'Intensely moisturizing cream with pure shea butter.',
      imageUrl:
          "https://sfycdn.speedsize.com/56385b25-4e17-4a9a-9bec-c421c18686fb/https://cdn.shopify.com/s/files/1/0410/9608/5665/products/B5Moisturizer1200-2-min.png?v=1741532482",
      price: 1850,
      isFav: true,
    ),
    Product(
      name: 'Tea Tree Face Wash',
      description:
          'Cleansing face wash with tea tree oil, suitable for acne-prone skin.',
      imageUrl:
          "https://sfycdn.speedsize.com/56385b25-4e17-4a9a-9bec-c421c18686fb/https://cdn.shopify.com/s/files/1/0410/9608/5665/products/SalicylicAcid2_1200-1-min.png?v=1646458899",
      price: 1200,
      isFav: false,
    ),
    Product(
      name: 'Coconut Hair Mask',
      description: 'Nourishing hair mask for strong and shiny hair.',
      imageUrl:
          "https://sfycdn.speedsize.com/56385b25-4e17-4a9a-9bec-c421c18686fb/https://cdn.shopify.com/s/files/1/0410/9608/5665/files/Nia10New.png?v=1721398127",
      price: 2000,
      isFav: true,
    ),
    Product(
      name: 'Jojoba Oil',
      description:
          'Versatile oil for skin, hair, closely mimics natural sebum.',
      imageUrl:
          "https://sfycdn.speedsize.com/56385b25-4e17-4a9a-9bec-c421c18686fb/beminimalist.co/cdn/shop/files/PHANew.jpg?crop=center&height=630&v=1721379191&width=420",
      price: 1700,
      isFav: false,
    ),
    Product(
      name: 'Activated Charcoal Mask',
      description: 'Detoxifying mask to draw out impurities and reduce pores.',
      imageUrl:
          "https://sfycdn.speedsize.com/56385b25-4e17-4a9a-9bec-c421c18686fb/beminimalist.co/cdn/shop/files/GlycolicNew.png?crop=center&height=630&v=1721398128&width=420",
      price: 2200,
      isFav: false,
    ),
    Product(
      name: 'Vitamin C Serum',
      description: 'Brightening serum with potent Vitamin C for radiant skin.',
      imageUrl:
          "https://sfycdn.speedsize.com/56385b25-4e17-4a9a-9bec-c421c18686fb/beminimalist.co/cdn/shop/products/AHAPHABHA32_1200-1-min.png?crop=center&height=630&v=1646480856&width=420",
      price: 3500,
      isFav: true,
    ),
  ];
  static List<Product> cartItems = [];

  List<Product> get products => _products;

  void addItemToCart(Product product) {
    cartItems.add(product);
  }

  void removeItemFromCart(Product product) {
    int index = cartItems.indexWhere((element) => element == product);
    cartItems.removeAt(index);
  }

  bool isCartEmpty() {
    return cartItems.isEmpty;
  }
}
