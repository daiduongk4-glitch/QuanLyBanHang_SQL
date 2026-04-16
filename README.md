# QuanLyBanHang_SQL
Bài Tập Lớn Cơ Sở Dữ Liệu - Quản Lý Bán Hàng 

Báo cáo bài tập lớn môn Cơ sở dữ liệu (Mã HP: N03.BT1) - Trường Đại học Giao thông Vận tải.

---

## 👥 Thành viên nhóm (Nhóm 4 - Lớp KT ĐTVT 1 K63)
| STT | Họ và Tên | Vai trò |
|---|---|---|
| 1 | **Đào Minh Đức** | Trưởng nhóm |
| 2 | Nguyễn Đình Hoàng | Thành viên |
| 3 | Nguyễn Đức Anh | Thành viên |
| 4 | Bùi Đại Dương | Thành viên |
| 5 | Nguyễn Thiện Hùng | Thành viên |

---

## 📌 Giới thiệu đề tài
Hệ thống quản lý bán hàng nhằm giúp cửa hàng kiểm soát quy trình từ quản lý sản phẩm, nhân viên, khách hàng đến việc thực hiện các hóa đơn bán hàng và báo cáo doanh thu.

### 🛠 Công nghệ sử dụng
- **Hệ quản trị CSDL:** SQL Server.
- **Công cụ:** SQL Server Management Studio (SSMS).
- **Ngôn ngữ:** T-SQL.

---

## 📊 Cấu trúc Cơ sở dữ liệu (Database Schema)

Hệ thống bao gồm các bảng chính sau:
- `KHACHHANG`: Lưu trữ thông tin khách hàng (Mã KH, họ tên, địa chỉ, doanh số...).
- `NHANVIEN`: Quản lý nhân sự bán hàng (Mã NV, họ tên, ngày vào làm...).
- `SANPHAM`: Danh mục các mặt hàng (Mã SP, tên SP, giá tiền, đơn vị tính...).
- `HOADON`: Thông tin chung về các đơn hàng.
- `CTHD`: Chi tiết từng mặt hàng trong mỗi hóa đơn (Số lượng, thành tiền...).

---

## 🚀 Các chức năng chính (Câu lệnh SQL)
Dự án bao gồm đầy đủ các câu lệnh từ cơ bản đến nâng cao:
1. **Dữ liệu:** Tạo bảng, ràng buộc (Primary Key, Foreign Key), nhập dữ liệu mẫu.
2. **Truy vấn (Select):** Thống kê sản phẩm, liệt kê hóa đơn theo ngày, tìm kiếm khách hàng.
3. **Cập nhật (Update/Delete):** Tính toán lại tổng tiền hóa đơn, cập nhật doanh số khách hàng.
4. **Nâng cao:** (Sửa lại theo file báo cáo của bạn)
   - [x] Tạo bảng GIA để tính toán giá trị hóa đơn.
   - [x] Cập nhật doanh số khách hàng tự động.

---

## 📂 Cách sử dụng
1. Tải file `QuanLyBanHang.sql` về máy.
2. Mở bằng SQL Server Management Studio (SSMS).
3. Nhấn `F5` hoặc `Execute` để chạy toàn bộ kịch bản tạo DB và dữ liệu.

---
📅 *Năm học: 2025 - 2026* 📍 *Hà Nội - UTC*
