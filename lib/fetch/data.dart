import 'package:news/models/model.dart';

List<data> getcatogories() {
  // ignore: deprecated_member_use
  List<data>? a = [];
  data d1 = new data();
  d1.categoryName = 'business';
  d1.imgageURL =
      'https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzR8fGJ1c2luZXNzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60';
  a.add(d1);

  data d2 = new data();
  d2.categoryName = 'Entertainment';
  d2.imgageURL =
      'https://images.unsplash.com/photo-1586899028174-e7098604235b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8ZW50ZXJ0YWlubWVudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60';
  a.add(d2);

  data d3 = new data();
  d3.categoryName = 'Health';
  d3.imgageURL =
      'https://images.unsplash.com/photo-1627488193141-953623010488?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTB8NDMxNTI2NHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=900&q=60';
  a.add(d3);

  data d4 = new data();
  d4.categoryName = 'Science';
  d4.imgageURL =
      'https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHNjaWVuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60';
  a.add(d4);

  data d5 = new data();
  d5.categoryName = 'Sports';
  d5.imgageURL =
      'https://images.unsplash.com/photo-1587280501635-68a0e82cd5ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHNwb3J0c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60';
  a.add(d5);

  data d6 = new data();
  d6.categoryName = 'Technology';
  d6.imgageURL =
      'https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHRlY2hub2xvZ2llc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60';
  a.add(d6);

  data d7 = new data();
  d7.categoryName = 'General';
  d7.imgageURL =
      'https://images.unsplash.com/photo-1494059980473-813e73ee784b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Z2VuZXJhbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60';
  a.add(d7);
  return a;
}
