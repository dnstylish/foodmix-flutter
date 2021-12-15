class Category {
  final String name;
  final String avatar;
  final String slug;
  final String content;

  Category({ required this.name, required this.avatar, required this.slug, this.content = '' });

}

final List<Category> categoriesExample = [categoryExample, categoryExample, categoryExample];

final Category categoryExample = Category(
    name: 'Ăn Trưa',
    avatar: 'https://api.foodmix.xyz/images/users/61b462a153050d21cbe369cf/category/c0cb7c87-57f1-4577-966f-13426e02e26d.jpg',
    slug: '',
    content: 'Thức ăn nhẹ hay thức ăn vặt (tiếng Anh: snack) là các loại thức ăn phục vụ cho việc ăn giữa các bữa ăn và thường dưới hình thức thực phẩm đóng gói và chế biến sẵn cũng như mặt hàng làm từ nguyên liệu tươi được đóng gói ăn liền. Thức ăn nhẹ thông dụng gồm các đồ khô. Thức ăn nhẹ được sử dụng giữa các bữa ăn nhỏ, để làm dịu cơn đói và một số còn giúp bổ sung các chất khoáng cho cơ thể như calci, sắt hoặc giúp giảm cân. Theo truyền thống, thức ăn nhẹ đã được chuẩn bị từ các thành phần thường có sẵn trong nhà.'
);