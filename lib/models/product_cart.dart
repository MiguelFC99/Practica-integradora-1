
import 'package:practica_integradora_uno/models/product_cup.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';

enum ProductSizeCart { CH, M, G }

class ProductCart {
   String productTitle; // nombre del producto
   String productImage; // url de imagen del producto
   double productPrice; // precio del producto autocalculado
   int productAmount; // cantidad de producto por comprar
   String productGen; 
   bool liked;
   bool remove;


    ProductCart.productCartDrinks(ProductDrinks pd){
      this.productTitle = pd.productTitle;
      this.productImage = pd.productImage;
      this.productPrice = pd.productPrice;
      this.productAmount = pd.productAmount;
      this.liked = pd.liked;
      this.remove = false;
  }

    ProductCart.productCartGrain(ProductGrains pg){
      this.productTitle = pg.productTitle;
      this.productImage = pg.productImage;
      this.productPrice = pg.productPrice;
      this.productAmount = pg.productAmount;
      this.productGen = pg.productWeight.toString();
      this.liked = pg.liked;
      this.remove = false;
    }
    ProductCart.productCartCup(ProductCup pc){
      this.productTitle = pc.productTitle;
      this.productImage = pc.productImage;
      this.productPrice = pc.productPrice;
      this.productAmount = pc.productAmount;
      this.productGen = pc.productColor.toString();
      this.liked = pc.liked;
      this.remove = false;    
    }

  

}

  