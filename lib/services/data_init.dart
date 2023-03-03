import '../models/item.dart';

class DataInit {
  static final List<Item> itemsList = [
    Item(
      id: 1,
      name: 'Apple',
      category: 'fruit',
      price: 2.99,
      image:
          'https://hips.hearstapps.com/hmg-prod/images/apples-at-farmers-market-royalty-free-image-1627321463.jpg',
    ),
    Item(
      id: 2,
      name: 'Banana',
      category: 'fruit',
      price: 1.99,
      image:
          'https://media.cnn.com/api/v1/images/stellar/prod/120604032828-fresh-ripe-bananas.jpg',
    ),
    Item(
      id: 3,
      name: 'Carrot',
      category: 'vegetable',
      price: 1.49,
      image:
          'https://lianaskitchen.co.uk/wp-content/uploads/carrots-960x655.png.webp',
    ),
    Item(
      id: 4,
      name: 'Orange',
      category: 'fruit',
      price: 3.99,
      image:
          'https://nippys.com.au/site/wp-content/uploads/2016/11/Orange_Shutterstock_600x600.jpeg',
    ),
    Item(
      id: 5,
      name: 'Broccoli',
      category: 'vegetable',
      price: 2.99,
      image:
          'https://cheflolaskitchen.com/wp-content/uploads/2022/06/Broccoli--810x1080.jpg',
    ),
    Item(
      id: 6,
      name: 'Tomato',
      category: 'vegetable',
      price: 1.99,
      image:
          'https://upload.wikimedia.org/wikipedia/commons/8/89/Tomato_je.jpg',
    ),
  ];
}
