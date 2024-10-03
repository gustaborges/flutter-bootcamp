enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan;

  String get key => 'filter_$name';
}
