class Category {
  Category({this.bookName, this.author, this.image, this.price});

  String bookName;
  String author;
  String image;
  String price;
}

List<Category> categories = [
  Category(
      bookName: 'Great Andromeda',
      author: 'Praise Ajepe',
      image: 'List_Book1',
      price: '85'),
  Category(
      bookName: 'Atlantis Ocean',
      author: 'Beta Jin',
      image: 'List_Book2',
      price: '92'),
  Category(
      bookName: 'Southern Wind',
      author: 'Rino Dorita',
      image: 'List_Book3',
      price: '44'),
  Category(
      bookName: 'Jane\s Life After COVID',
      author: 'Mark Mali',
      image: 'List_Book4',
      price: '12'),
  Category(
      bookName: 'Broken Bridge',
      author: 'Lucia Jeremy',
      image: 'List_Book5',
      price: '15'),
  Category(
      bookName: 'Broken Bridge',
      author: 'Murphy Derago',
      image: 'List_Book6',
      price: '54'),
];
