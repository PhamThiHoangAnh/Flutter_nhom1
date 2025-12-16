// MyProduct.dart

import 'package:flutter/material.dart';
// Lưu ý: Cần đảm bảo các import này hợp lệ trong dự án của bạn
import 'package:flutter_application_1/api.dart';
import 'package:flutter_application_1/product.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  // Biến để lưu trữ Future, tránh việc gọi API nhiều lần
  late Future<List<Product>> _productsFuture;

  // Controller cho thanh tìm kiếm
  final TextEditingController _searchController = TextEditingController();

  // Trạng thái tìm kiếm: true nếu đang tìm kiếm
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    // Khởi tạo Future chỉ 1 lần
    _productsFuture = testApi.getAllProduct();
  }

  // Hàm xử lý khi nhấn vào nút Thêm Sản Phẩm (giả lập)
  void _addProduct() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Chức năng: Thêm Sản Phẩm mới...')),
    );
    // TODO: Triển khai logic điều hướng đến trang thêm sản phẩm
  }

  // Hàm xử lý khi nhấn vào biểu tượng Giỏ hàng (giả lập)
  void _viewCart() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Chức năng: Xem Giỏ Hàng...')));
    // TODO: Triển khai logic điều hướng đến trang giỏ hàng
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // === THANH TÌM KIẾM, GIỎ HÀNG, THÊM SẢN PHẨM ===
      appBar: AppBar(
        title: _isSearching
            ? _buildSearchField()
            : const Text('Danh Sách Sản Phẩm'),
        backgroundColor: Colors.blueGrey,
        actions: _buildAppBarActions(),
      ),

      body: FutureBuilder<List<Product>>(
        future: _productsFuture, // Sử dụng Future đã lưu
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Đã xảy ra lỗi: ${snap.error}'));
          }
          if (snap.hasData && snap.data!.isNotEmpty) {
            // Lọc sản phẩm theo từ khóa tìm kiếm (Tạm thời lọc UI)
            final filteredProducts = snap.data!.where((p) {
              if (_searchController.text.isEmpty) return true;
              return p.title.toLowerCase().contains(
                _searchController.text.toLowerCase(),
              );
            }).toList();

            if (filteredProducts.isEmpty) {
              return const Center(
                child: Text('Không tìm thấy kết quả tìm kiếm.'),
              );
            }

            return mylistview(filteredProducts);
          }
          return const Center(child: Text('Không tìm thấy sản phẩm nào.'));
        },
      ),
    );
  }

  // --- Helper Methods cho AppBar ---

  // Xây dựng trường nhập liệu tìm kiếm
  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      cursorColor: Colors.white,
      decoration: const InputDecoration(
        hintText: 'Tìm kiếm sản phẩm...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white70),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 18.0),
      onChanged: (query) {
        // Cập nhật UI khi nội dung tìm kiếm thay đổi để lọc danh sách
        setState(() {});
      },
    );
  }

  // Xây dựng các Action buttons
  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            // Xóa nội dung tìm kiếm và tắt chế độ tìm kiếm
            _searchController.clear();
            setState(() {
              _isSearching = false;
            });
          },
        ),
      ];
    } else {
      return [
        // Nút Tìm kiếm
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            setState(() {
              _isSearching = true;
            });
          },
        ),
        // Nút Thêm sản phẩm (Dành cho quản trị viên/người bán)
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          onPressed: _addProduct,
        ),
        // Nút Giỏ hàng
        IconButton(icon: const Icon(Icons.shopping_cart), onPressed: _viewCart),
      ];
    }
  }

  // --- Helper Widgets cho Body ---

  Widget mylistview(List<Product> ls) {
    return ListView(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      children: ls.map((p) => myItem(p)).toList(),
    );
  }

  // Widget hiển thị một item sản phẩm (Đã thêm xử lý nhấn)
  Widget myItem(Product p) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          // === XỬ LÝ XEM CHI TIẾT SẢN PHẨM ===
          onTap: () {
            _viewProductDetails(p);
          },

          leading: SizedBox(
            width: 70,
            height: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                p.image, // Giả định trường image trong Product Model là p.image
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.image_not_supported,
                    size: 40,
                    color: Colors.grey,
                  );
                },
              ),
            ),
          ),

          title: Text(
            p.title, // Giả định trường tên sản phẩm là p.title
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),

          subtitle: Text(
            '\$${p.price.toStringAsFixed(2)}',
            style: const TextStyle(
              color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),

          contentPadding: const EdgeInsets.all(10.0),
        ),
      ),
    );
  }

  // Hàm xử lý điều hướng đến trang chi tiết sản phẩm
  void _viewProductDetails(Product product) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Chức năng: Xem chi tiết sản phẩm ID: ${product.id}'),
      ),
    );
    // TODO: Triển khai Navigator.push để chuyển sang màn hình ProductDetailScreen(product: product)
  }
}
