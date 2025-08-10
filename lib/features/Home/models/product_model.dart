class ProductModel {
  final String productName;
  final String productDescription;
  final double productPrice;
  final String productImage;
  const ProductModel({
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
  });

  static List<ProductModel> getProducts() {
    return [
      ProductModel(
        productName: 'Product 1',
        productDescription: 'Description of Product 1',
        productPrice: 29.99,
        productImage: 'assets/product/product1.png',
      ),
      ProductModel(
        productName: 'Product 2',
        productDescription: 'Description of Product 2',
        productPrice: 49.99,
        productImage: 'assets/product/product2.png',
      ),
      ProductModel(
        productName: 'Product 3',
        productDescription: 'Description of Product 3',
        productPrice: 19.99,
        productImage: 'assets/product/product3.png',
      ),

      ProductModel(
        productName: 'Product 4',
        productDescription: 'Description of Product 4',
        productPrice: 39.99,
        productImage: 'assets/product/product4.png',
      ),
      ProductModel(
        productName: 'Product 5',
        productDescription: 'Description of Product 5',
        productPrice: 59.99,
        productImage: 'assets/product/product5.png',
      ),
      ProductModel(
        productName: 'Product 6',
        productDescription: 'Description of Product 6',
        productPrice: 24.99,
        productImage: 'assets/product/product6.png',
      ),
    ];
  }
}
