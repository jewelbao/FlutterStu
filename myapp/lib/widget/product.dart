import 'package:flutter/material.dart';

class Product {
  final String name;

  const Product({this.name});
}

class ShoppingList extends StatefulWidget {

  final List<Product> products;

  ShoppingList({Key key, this.products}) : super(key: key);

  @override
  _ShoppingListState createState() {
    return new _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingList> {

  Set<Product> _shoppingCart = new Set<Product>();

  _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('shopping'),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((product) {
          return new _ShoppingListItem(
            product: product, inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,);
        }).toList(),
      ),
    );
  }

}

typedef void CartChangedCallback(Product product, bool inCart);

class _ShoppingListItem extends StatelessWidget {

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  _ShoppingListItem({Product product, this.inCart, this.onCartChanged})
      : this.product = product,
        super(key: new ObjectKey(product));

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme
        .of(context)
        .primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return new TextStyle(
        color: Colors.black54, decoration: TextDecoration.underline);
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () => onCartChanged(product, !inCart),
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name.substring(0, 1)),
      ),
      title: new Text(product.name, style: _getTextStyle(context),),
    );
  }
}