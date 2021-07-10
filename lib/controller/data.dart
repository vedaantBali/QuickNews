import 'package:quick_news/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = new CategoryModel();

  // 1. India
  categoryModel.categoryName = 'India';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1532375810709-7' +
    '5b1da00537c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx' +
    '8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1955&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  // 2. Global
  categoryModel.categoryName = 'Global';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1609868714484-2b' +
    '2556006301?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.' +
    '1&auto=format&fit=crop&w=1350&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  // 3. Business
  categoryModel.categoryName = 'Business';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1486406146926-' +
    'c627a92ad1ab?ixid=MnwxMjA3fDB8MHxwaG90by1wYWd' +
    'lfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  // 4. Entertainment
  categoryModel.categoryName = 'Entertainment';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1541535650810-10d' +
    '26f5c2ab3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&' +
    'auto=format&fit=crop&w=1355&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  // 5. Auto
  categoryModel.categoryName = 'Auto';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1581020296922-1f7'
  +'baa581f12?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&'
  +'auto=format&fit=crop&w=948&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  // 6. Science
  categoryModel.categoryName = 'Science';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1532187863486-abf'
  +'9dbad1b69?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&'
  +'auto=format&fit=crop&w=1950&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  // 7. Sports
  categoryModel.categoryName = 'Sports';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1594470117722-de4'
  +'b9a02ebed?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1'
  +'&auto=format&fit=crop&w=1574&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  // 8. Technology
  categoryModel.categoryName = 'Technology';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1518770660439-463'
  +'6190af475?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.'
  +'1&auto=format&fit=crop&w=1650&q=80';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  return category;
}
