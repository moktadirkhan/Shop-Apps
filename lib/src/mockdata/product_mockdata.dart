import 'package:shop_app/src/models/grid_container_data.dart';
import 'package:shop_app/src/models/grid_item.dart';
import 'package:shop_app/src/models/list_container_data.dart';
import 'package:shop_app/src/models/list_item.dart';
import 'package:shop_app/src/models/product.dart';

Product product1 = Product(
  productId: "product1",
  productName: "Cool Panjabi",
  merchantId: "aarong",
  merchantName: "aarong",
  regularPrice: 1000.00,
  discountedPrice: 1200.00,
  discount: 100,
  description: "This is a cool panjabi, so very naise",
  sizes: ['32', '69', '88'],
);

Product product2 = Product(
  productId: "product2",
  productName: "Cool Pant",
  merchantId: "aarong",
  merchantName: "aarong",
  regularPrice: 1000.00,
  discountedPrice: 1200.00,
  discount: 100,
  description: "This is a cool pant, so very naise",
  sizes: ['32', '69', '88'],
);

Product product3 = Product(
  productId: "product3",
  productName: "Cool Boot",
  merchantId: "bata",
  merchantName: "bata",
  regularPrice: 1000.00,
  discountedPrice: 1200.00,
  discount: 100,
  description: "This is a cool Boot, so very naise",
  sizes: ['32', '69', '88'],
);

Product product4 = Product(
  productId: "product4",
  productName: "Cool Shoe",
  merchantId: "bata",
  merchantName: "bata",
  regularPrice: 1000.00,
  discountedPrice: 1200.00,
  discount: 100,
  description: "This is a cool Shoe, so very naise",
  sizes: ['32', '69', '88'],
);

List<Product> aarongList = [product1, product2];
List<Product> bataList = [product3, product4];

GridItem GridItem1 = GridItem(
  itemType: GridItemType.HOME_PRODUCT_GRID,
  product: product2,
);
GridItem GridItem2 = GridItem(
  itemType: GridItemType.HOME_PRODUCT_GRID,
  product: product1,
);
GridItem GridItem3 = GridItem(
  itemType: GridItemType.HOME_PRODUCT_GRID,
  product: product3,
);
GridItem GridItem4 = GridItem(
  itemType: GridItemType.HOME_PRODUCT_GRID,
  product: product4,
);
List<GridItem> gridOfProduct = [GridItem1, GridItem2, GridItem3, GridItem4];
GridContainerData homePageProductGrid = GridContainerData(
  items: gridOfProduct,
);
