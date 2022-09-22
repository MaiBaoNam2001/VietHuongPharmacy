/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3360
 Source Schema         : quan_ly_ban_thuoc_db

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 22/09/2022 20:44:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bao_cao
-- ----------------------------
DROP TABLE IF EXISTS `bao_cao`;
CREATE TABLE `bao_cao`  (
  `ma_bao_cao` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `so_luong_thuoc_da_ban` int(11) NULL DEFAULT 0,
  `so_luong_don_hang` int(11) NULL DEFAULT 0,
  `so_luong_khach_hang` int(11) NULL DEFAULT 0,
  `doanh_so_ban_hang` decimal(10, 2) NULL DEFAULT 0.00,
  `ngay_bao_cao` date NULL DEFAULT NULL,
  `ma_nhan_vien` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ma_bao_cao`) USING BTREE,
  INDEX `fk_bao_cao_nhan_vien_idx`(`ma_nhan_vien`) USING BTREE,
  CONSTRAINT `fk_bao_cao_nhan_vien` FOREIGN KEY (`ma_nhan_vien`) REFERENCES `nhan_vien` (`ma_nhan_vien`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bien_ban_giai_quyet
-- ----------------------------
DROP TABLE IF EXISTS `bien_ban_giai_quyet`;
CREATE TABLE `bien_ban_giai_quyet`  (
  `ma_bien_ban` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ten_su_co` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ket_qua_kiem_tra` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `huong_giai_quyet` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ngay_lap` date NULL DEFAULT NULL,
  `ma_nhan_vien` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ma_khach_hang` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ma_bien_ban`) USING BTREE,
  INDEX `fk_bien_ban_nhan_vien_idx`(`ma_nhan_vien`) USING BTREE,
  INDEX `fk_bien_ban_khach_hang_idx`(`ma_khach_hang`) USING BTREE,
  CONSTRAINT `fk_bien_ban_khach_hang` FOREIGN KEY (`ma_khach_hang`) REFERENCES `khach_hang` (`ma_khach_hang`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_bien_ban_nhan_vien` FOREIGN KEY (`ma_nhan_vien`) REFERENCES `nhan_vien` (`ma_nhan_vien`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for chi_tiet_hoa_don_thanh_toan
-- ----------------------------
DROP TABLE IF EXISTS `chi_tiet_hoa_don_thanh_toan`;
CREATE TABLE `chi_tiet_hoa_don_thanh_toan`  (
  `ma_hoa_don` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ma_thuoc` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `don_vi_tinh` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `don_gia_ban` decimal(10, 2) NULL DEFAULT 0.00,
  `so_luong` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`ma_hoa_don`, `ma_thuoc`) USING BTREE,
  INDEX `fk_chi_tiet_hoa_don_thuoc_idx`(`ma_thuoc`) USING BTREE,
  CONSTRAINT `fk_chi_tiet_hoa_don_hoa_don` FOREIGN KEY (`ma_hoa_don`) REFERENCES `hoa_don_thanh_toan` (`ma_hoa_don`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_chi_tiet_hoa_don_thuoc` FOREIGN KEY (`ma_thuoc`) REFERENCES `thuoc` (`ma_thuoc`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chi_tiet_hoa_don_thanh_toan
-- ----------------------------
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00001', 'M00018', 'Hộp', 300000.00, 2);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00001', 'M00020', 'Hộp', 370000.00, 2);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00001', 'M00032', 'Chai', 3000.00, 1);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00001', 'M00036', 'Tuýp', 62000.00, 5);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00002', 'M00006', 'Hộp', 70000.00, 2);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00002', 'M00021', 'Chai', 53000.00, 2);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00002', 'M00029', 'Hộp', 112000.00, 1);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00002', 'M00038', 'Tuýp', 40000.00, 5);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00003', 'M00003', 'Hộp', 50000.00, 1);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00003', 'M00015', 'Hộp', 150000.00, 1);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00003', 'M00017', 'Hộp', 32000.00, 2);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00003', 'M00026', 'Hộp', 10000.00, 3);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00003', 'M00033', 'Chai', 19000.00, 1);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00003', 'M00035', 'Tuýp', 49000.00, 3);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00004', 'M00018', 'Hộp', 300000.00, 1);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00004', 'M00026', 'Hộp', 10000.00, 3);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00004', 'M00029', 'Hộp', 112000.00, 2);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00004', 'M00036', 'Tuýp', 62000.00, 2);

-- ----------------------------
-- Table structure for hoa_don_thanh_toan
-- ----------------------------
DROP TABLE IF EXISTS `hoa_don_thanh_toan`;
CREATE TABLE `hoa_don_thanh_toan`  (
  `ma_hoa_don` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ngay_thanh_toan` date NULL DEFAULT NULL,
  `tong_tien_thanh_toan` decimal(10, 2) NULL DEFAULT 0.00,
  `ma_khach_hang` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ma_nhan_vien` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ma_hoa_don`) USING BTREE,
  INDEX `fk_hoa_don_nhan_vien_idx`(`ma_nhan_vien`) USING BTREE,
  INDEX `fk_hoa_don_khach_hang_idx`(`ma_khach_hang`) USING BTREE,
  CONSTRAINT `fk_hoa_don_khach_hang` FOREIGN KEY (`ma_khach_hang`) REFERENCES `khach_hang` (`ma_khach_hang`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_hoa_don_nhan_vien` FOREIGN KEY (`ma_nhan_vien`) REFERENCES `nhan_vien` (`ma_nhan_vien`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hoa_don_thanh_toan
-- ----------------------------
INSERT INTO `hoa_don_thanh_toan` VALUES ('B00001', '2021-09-26', 1735650.00, 'C00014', 'E00002');
INSERT INTO `hoa_don_thanh_toan` VALUES ('B00002', '2021-09-27', 585900.00, 'C00015', 'E00002');
INSERT INTO `hoa_don_thanh_toan` VALUES ('B00003', '2021-09-28', 483000.00, 'C00010', 'E00008');
INSERT INTO `hoa_don_thanh_toan` VALUES ('B00004', '2021-09-29', 711900.00, 'C00016', 'E00007');

-- ----------------------------
-- Table structure for khach_hang
-- ----------------------------
DROP TABLE IF EXISTS `khach_hang`;
CREATE TABLE `khach_hang`  (
  `ma_khach_hang` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ten_khach_hang` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `dia_chi` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `so_dien_thoai` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ma_khach_hang`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of khach_hang
-- ----------------------------
INSERT INTO `khach_hang` VALUES ('C00001', 'Nguyễn Trung Hiếu', 'Gò Vấp', '0675359124');
INSERT INTO `khach_hang` VALUES ('C00002', 'Trần Thị Tuyết Nhung', 'Quận 3', '0355462381');
INSERT INTO `khach_hang` VALUES ('C00003', 'Bùi Quyết Chiến', 'Bình Thạnh', '0673586233');
INSERT INTO `khach_hang` VALUES ('C00004', 'Nguyễn Thị Thùy Trang', 'Quận 7', '0456665112');
INSERT INTO `khach_hang` VALUES ('C00005', 'Ngô Đăng Khoa', 'Gò Vấp', '0321112238');
INSERT INTO `khach_hang` VALUES ('C00006', 'Ngô Thị Quế Trân', 'Quận 2', '0145666387');
INSERT INTO `khach_hang` VALUES ('C00007', 'Trần Đình Trọng', 'Quận 1', '0128776613');
INSERT INTO `khach_hang` VALUES ('C00008', 'Nguyễn Thị Thu Hằng', 'Tân Bình', '0673591862');
INSERT INTO `khach_hang` VALUES ('C00009', 'La Trung Thành', 'Bình Tân', '0673213586');
INSERT INTO `khach_hang` VALUES ('C00010', 'Ngô Thị Thùy Dung', 'Gò Vấp', '0127776543');
INSERT INTO `khach_hang` VALUES ('C00011', 'Trần Đình Hiếu', 'Phú Nhuận', '0674445581');
INSERT INTO `khach_hang` VALUES ('C00012', 'Trần Thúy Diễm', 'Quận 12', '0678925431');
INSERT INTO `khach_hang` VALUES ('C00013', 'Nguyễn Thị Khánh Băng', 'Quận 3', '0128883475');
INSERT INTO `khach_hang` VALUES ('C00014', 'Mai Bảo Nam', 'Gò Vấp', '0355915872');
INSERT INTO `khach_hang` VALUES ('C00015', 'Quỳnh Thị Như Thảo', 'Phú Nhuận', '0126543881');
INSERT INTO `khach_hang` VALUES ('C00016', 'Ngô Thanh Tuấn', 'Bình Tân', '0345816647');

-- ----------------------------
-- Table structure for loai_thuoc
-- ----------------------------
DROP TABLE IF EXISTS `loai_thuoc`;
CREATE TABLE `loai_thuoc`  (
  `ma_loai_thuoc` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ten_loai_thuoc` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ma_loai_thuoc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of loai_thuoc
-- ----------------------------
INSERT INTO `loai_thuoc` VALUES ('T00001', 'Thuốc giảm đau, hạ sốt, kháng viên');
INSERT INTO `loai_thuoc` VALUES ('T00002', 'Thuốc kháng sinh');
INSERT INTO `loai_thuoc` VALUES ('T00003', 'Thuốc kháng Histamin');
INSERT INTO `loai_thuoc` VALUES ('T00004', 'Thuốc ho - long đờm');
INSERT INTO `loai_thuoc` VALUES ('T00005', 'Thuốc kháng nấm');
INSERT INTO `loai_thuoc` VALUES ('T00006', 'Thuốc trị sỏi thận');
INSERT INTO `loai_thuoc` VALUES ('T00007', 'Thuốc trị táo bón');
INSERT INTO `loai_thuoc` VALUES ('T00008', 'Thuốc trị giun');
INSERT INTO `loai_thuoc` VALUES ('T00009', 'Thuốc bổ tổng hợp');
INSERT INTO `loai_thuoc` VALUES ('T00010', 'Thuốc nhỏ mắt');
INSERT INTO `loai_thuoc` VALUES ('T00011', 'Thuốc bôi lở miệng');
INSERT INTO `loai_thuoc` VALUES ('T00012', 'Thuốc bôi ngoài da');

-- ----------------------------
-- Table structure for nhan_vien
-- ----------------------------
DROP TABLE IF EXISTS `nhan_vien`;
CREATE TABLE `nhan_vien`  (
  `ma_nhan_vien` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ho_ten` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `chuc_vu` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `gioi_tinh` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ngay_sinh` date NULL DEFAULT NULL,
  `dia_chi` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `so_dien_thoai` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ten_dang_nhap` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `mat_khau` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ma_nhan_vien`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nhan_vien
-- ----------------------------
INSERT INTO `nhan_vien` VALUES ('E00001', 'Nguyễn Thị Thu Nguyệt', 'Bán hàng', 'Nữ', '2000-10-10', 'Tân Bình', 'nguyetnt@gmail.com', '0128884167', 'thunguyet', 'thunguyet');
INSERT INTO `nhan_vien` VALUES ('E00002', 'Trần Đình Tiến', 'Bán hàng', 'Nam', '2000-01-06', 'Gò Vấp', 'tientd@gmail.com', '0123675812', 'dinhtien', 'dinhtien');
INSERT INTO `nhan_vien` VALUES ('E00003', 'Châu Hoàng Dũng', 'Báo cáo thống kê', 'Nam', '1998-02-18', 'Quận 1', 'dungch@gmail.com', '0124745621', 'hoangdung', 'hoangdung');
INSERT INTO `nhan_vien` VALUES ('E00004', 'Trịnh Thị Như Quỳnh', 'Chăm sóc khách hàng', 'Nữ', '1999-05-18', 'Quận 7', 'quynhtt@gmail.com', '0128786663', 'nhuquynh', 'nhuquynh');
INSERT INTO `nhan_vien` VALUES ('E00005', 'Trần Thị Bảo Ngọc', 'Bán hàng', 'Nữ', '2000-03-04', 'Gò Vấp', 'ngoctt@gmail.com', '0672823309', 'baongoc', 'baongoc');
INSERT INTO `nhan_vien` VALUES ('E00006', 'Nguyễn Tuấn Tú', 'Kiểm tra kho', 'Nam', '1998-12-08', 'Tân Bình', 'tunt@gmail.com', '0127186155', 'tuantu', 'tuantu');
INSERT INTO `nhan_vien` VALUES ('E00007', 'Cao Thị Thùy Trang', 'Bán hàng', 'Nữ', '1999-04-10', 'Bình Tân', 'trangct@gmail.com', '0125456613', 'thuytrang', 'thuytrang');
INSERT INTO `nhan_vien` VALUES ('E00008', 'Mai Thị Thu Hương', 'Chăm sóc khách hàng', 'Nữ', '2000-06-20', 'Quận 3', 'huongmt@gmail.com', '0673882166', 'thuhuong', 'thuhuong');
INSERT INTO `nhan_vien` VALUES ('E00009', 'Nguyễn Thế Hùng', 'Kiểm tra kho', 'Nam', '1999-07-15', 'Quận 1', 'hungnt@gmail.com', '0672115874', 'thehung', 'thehung');
INSERT INTO `nhan_vien` VALUES ('E00010', 'Nguyễn Thiên Khôi', 'Báo cáo thống kê', 'Nam', '1999-03-12', 'Gò Vấp', 'khoint@gmail.com', '0128586451', 'thienkhoi', 'thienkhoi');
INSERT INTO `nhan_vien` VALUES ('E00011', 'Cao Vạn Đạt', 'Kiểm tra kho', 'Nam', '1999-06-06', 'Tân Bình', 'datcv@gmail.com', '0673432221', 'vandat', 'vandat');
INSERT INTO `nhan_vien` VALUES ('E00012', 'Trần Thị Anh Thư', 'Chăm sóc khách hàng', 'Nữ', '2000-05-20', 'Gò Vấp', 'thutt@gmail.com', '0671412258', 'anhthu', 'anhthu');

-- ----------------------------
-- Table structure for thuoc
-- ----------------------------
DROP TABLE IF EXISTS `thuoc`;
CREATE TABLE `thuoc`  (
  `ma_thuoc` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ten_thuoc` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `cong_dung` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `thanh_phan` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `don_vi_tinh` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `xuat_su` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `gia_ban` decimal(10, 2) NULL DEFAULT 0.00,
  `so_luong` int(11) NULL DEFAULT 0,
  `ma_loai_thuoc` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ma_thuoc`) USING BTREE,
  INDEX `fk_thuoc_loai_thuoc_idx`(`ma_loai_thuoc`) USING BTREE,
  CONSTRAINT `fk_thuoc_loai_thuoc` FOREIGN KEY (`ma_loai_thuoc`) REFERENCES `loai_thuoc` (`ma_loai_thuoc`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of thuoc
-- ----------------------------
INSERT INTO `thuoc` VALUES ('M00001', 'Paracetamol 500mg', 'Giảm đau, hạ sốt', 'Paracetamol 500mg', 'Chai', 'Hoa Kỳ', 150000.00, 50, 'T00001');
INSERT INTO `thuoc` VALUES ('M00002', 'Alphachymotrypsin 4200 IU', 'Chống viên, giảm phù nề mô mềm', 'α-Chymotrypsin 4200 IU, tá dược', 'Hộp', 'Việt Nam', 40000.00, 40, 'T00001');
INSERT INTO `thuoc` VALUES ('M00003', 'Meloxicam 7.5mg', 'Giảm đau, chống viêm, hạ sốt', 'Meloxicam 7.5mg, tá dược', 'Hộp', 'Việt Nam', 50000.00, 55, 'T00001');
INSERT INTO `thuoc` VALUES ('M00004', 'Celecoxib Capsules 200mg', 'Kháng viên, giảm đau và sưng', 'Celecoxib, tá dược', 'Hộp', 'Ấn Độ', 350000.00, 65, 'T00001');
INSERT INTO `thuoc` VALUES ('M00005', 'Amoxicillin 500mg', 'Điều trị nhiễm trùng hô hấp, tai mũi họng, răng miệng', 'Amoxicilline', 'Hộp', 'Ấn Độ', 112000.00, 38, 'T00002');
INSERT INTO `thuoc` VALUES ('M00006', 'Ampicillin 500mg Domesco', 'Điều trị nhiễm khuẩn đường tiết niệu, viêm túi mật, đường tiêu hoá', 'Ampicillin Trihydrat Compactet, tá dược', 'Hộp', 'Việt Nam', 70000.00, 64, 'T00002');
INSERT INTO `thuoc` VALUES ('M00007', 'Azithromycin 250mg', 'Điều trị nhiễm khuẩn đường hô hấp, da và cấu trúc da', 'Azithromycin dihydrat, tá dược', 'Hộp', 'Việt Nam', 160000.00, 75, 'T00002');
INSERT INTO `thuoc` VALUES ('M00008', 'Acyclovir STELLA 800mg', 'Điều trị nhiễm Herpes simplex trên da, điều trị bệnh thủy đậu và bệnh Zona', 'Acyclovir 800mg, tá dược', 'Hộp', 'Việt Nam', 133000.00, 80, 'T00002');
INSERT INTO `thuoc` VALUES ('M00009', 'Clorpheniramin 4mg DHG', 'Điều trị viêm mũi, nghẹt mũi, sổ mũi, ngứa, dị ứng do thức ăn, côn trùng cắn', 'Clorpheniramin 4mg', 'Chai', 'Việt Nam', 23000.00, 60, 'T00003');
INSERT INTO `thuoc` VALUES ('M00010', 'Alimemazin 5mg', 'Điều trị dị ứng hô hấp, viêm kết mạc và ngoài da', 'Alimemazin 5mg', 'Hộp', 'Việt Nam', 20000.00, 100, 'T00003');
INSERT INTO `thuoc` VALUES ('M00011', 'Loratadin 10mg', 'Điều trị ngứa ngáy, khô nóng, mẩn đỏ, các bệnh dị ứng khác', 'Loratadin, tá dược', 'Hộp', 'Việt Nam', 12000.00, 78, 'T00003');
INSERT INTO `thuoc` VALUES ('M00012', 'Cetirizin 10mg', 'Điều trị triệu chứng viêm mũi dị ứng dai dẳng, viêm mũi dị ứng theo mùa, mày đay', 'Cetirizin 10mg', 'Hộp', 'Việt Nam', 30000.00, 40, 'T00003');
INSERT INTO `thuoc` VALUES ('M00013', 'Terpin Codein', 'Điều trị ho khan, giảm ho, long đờm', 'Codeine 10mg , Terpin hydrate 100mg, tá dược', 'Hộp', 'Việt Nam', 150000.00, 30, 'T00004');
INSERT INTO `thuoc` VALUES ('M00014', 'Terpinzoat', 'Điều trị các triệu chứng ho, long đờm trong viêm phế quản cấp hay mãn tính', 'Natri benzoat 50mg, Terpin hydrat 100mg', 'Hộp', 'Việt Nam', 39000.00, 58, 'T00004');
INSERT INTO `thuoc` VALUES ('M00015', 'Neo-Codion', 'Điều trị triệu chứng ho khan do kích thích ở người lớn', 'Sullogaiacol 0.1g, Codein camphosulphonat 25mg, Grindelia 20mg', 'Hộp', 'Pháp', 150000.00, 30, 'T00004');
INSERT INTO `thuoc` VALUES ('M00016', 'Griseofulvin 500mg', 'Kháng sinh, kháng nấm', 'Griseofulvin 500mg, tá dược', 'Hộp', 'Việt Nam', 45000.00, 60, 'T00005');
INSERT INTO `thuoc` VALUES ('M00017', 'Nystatin 500.000 IU', 'Điều trị nấm Candida ruột, dạ dày', 'Nystatin 500000 IU, tá dược', 'Hộp', 'Việt Nam', 32000.00, 45, 'T00005');
INSERT INTO `thuoc` VALUES ('M00018', 'Itraxcop 100mg', 'Điều trị nấm Candida trong miệng và họng hầu, điều trị lang ben', 'Itraconazole BP 100mg', 'Hộp', 'Ấn Độ', 300000.00, 25, 'T00005');
INSERT INTO `thuoc` VALUES ('M00019', 'Diflucan 150mg', 'Điều trị nhiễm nấm toàn thân và nấm trên bề mặt mô', 'Fluconazol 150mg, tá dược', 'Hộp', 'Pháp', 185000.00, 20, 'T00005');
INSERT INTO `thuoc` VALUES ('M00020', 'Rowatinex', 'Điều trị bệnh lý sỏi tiết niệu, nhiễm trùng đường tiết niệu', 'Olive Oil 33mg, Pinene 31mg, Borneol 10mg, Cineol 3mg', 'Hộp', 'Ireland', 370000.00, 15, 'T00006');
INSERT INTO `thuoc` VALUES ('M00021', 'Kim Tiền Thảo', 'Điều trị sỏi đường tiết niệu, sỏi thận', 'Kim tiền thảo 120mg', 'Chai', 'Việt Nam', 53000.00, 40, 'T00006');
INSERT INTO `thuoc` VALUES ('M00022', 'Duphalac 667g', 'Điều trị táo bón, tạo phân mềm hỗ trợ trị trĩ', 'Lactulose 667g/l', 'Chai', 'Việt Nam', 86000.00, 35, 'T00007');
INSERT INTO `thuoc` VALUES ('M00023', 'Bisacodyl DHG 5mg', 'Điều trị táo bón, thải sạch ruột trước và sau phẫu thuật', 'Bisacodyl 5mg', 'Hộp', 'Việt Nam', 30000.00, 55, 'T00007');
INSERT INTO `thuoc` VALUES ('M00024', 'Sorbitol Domesco 5g', 'Điều trị triệu chứng táo bón và khó tiêu', 'Sorbitol 5g', 'Hộp', 'Việt Nam', 24000.00, 80, 'T00007');
INSERT INTO `thuoc` VALUES ('M00025', 'Fugacar 500mg', 'Điều trị nhiễm giun đũa, giun kim, giun móc', 'Mebendazol 500mg', 'Hộp', 'Thái Lan', 76000.00, 50, 'T00008');
INSERT INTO `thuoc` VALUES ('M00026', 'Benda 500', 'Điều trị nhiễm giun đũa, giun kim, giun móc, giun tóc', 'Mebendazole', 'Hộp', 'Thái Lan', 10000.00, 45, 'T00008');
INSERT INTO `thuoc` VALUES ('M00027', 'Zentel 200mg', 'Điều trị nhiễm giun đũa, giun kim, giun móc', 'Albendazol 200mg', 'Hộp', 'Việt Nam', 12000.00, 35, 'T00008');
INSERT INTO `thuoc` VALUES ('M00028', 'Pharmaton Kiddi', 'Bổ sung vitamin, khoáng chất cho trẻ em', ' L-Leucin 300mg, Vitamin B1 3mg, Vitamin B2 3.5mg, Vitamin B6 6mg, Vitamin D3 400IU, Vitamin E 15mg,...', 'Chai', 'Thụy Sỹ', 115000.00, 25, 'T00009');
INSERT INTO `thuoc` VALUES ('M00029', 'Homtamin Ginseng', 'Cung cấp vitamin và muối khoáng, giảm mệt mỏi', 'Lô hội 5mg, Nhân sâm 40mg, Vitamin B12 6µg, Sắt fumarat 54.76mg, Vitamin A 5000IU, Vitamin B1 2mg, Vitamin B2 2mg,...', 'Hộp', 'Việt Nam', 112000.00, 45, 'T00009');
INSERT INTO `thuoc` VALUES ('M00030', 'V.Rohto Vitamin', 'Hỗ trợ cải thiện tình trạng giảm thị lực, xung huyết kết mạc, mắt mờ, ngứa mắt', 'Chlorpheniramine 3.9mg, Vitamin B6 13.0mg, Vitamin E 6.5mg, Potassium L-aspartate 130.0mg, Natri chondroitin Sulfat 13.0mg', 'Chai', 'Việt Nam', 47000.00, 30, 'T00010');
INSERT INTO `thuoc` VALUES ('M00031', 'Neodex Pharmedic', 'Kháng viêm, kháng dị ứng và chống nhiễm khuẩn ở mắt, điều trị các bệnh nhiễm trùng mắt', 'Neomycin sulfat 25mg, Dexamethason natri phosphat 5.5mg, tá dược', 'Chai', 'Việt Nam', 4000.00, 50, 'T00010');
INSERT INTO `thuoc` VALUES ('M00032', 'Natri clorid 0.9%', 'Rửa mắt, rửa mũi, phụ trị chứng viêm mũi', 'Natri clorid 90mg', 'Chai', 'Việt Nam', 3000.00, 45, 'T00010');
INSERT INTO `thuoc` VALUES ('M00033', 'Osla 0.033g', 'Ngừa đau mắt, trị mỏi mắt, đỏ mắt, ngứa mắt', 'Natri clorid 0.033g', 'Chai', 'Việt Nam', 19000.00, 25, 'T00010');
INSERT INTO `thuoc` VALUES ('M00034', 'Mouthpaste 5g', 'Điều trị viêm ở niêm mạc miệng, lợi và môi, ngăn ngừa các triệu chứng viêm khi mọc răng', 'Triamcinolon acetonid 5mg, tá dược', 'Tuýp', 'Việt Nam', 30000.00, 35, 'T00011');
INSERT INTO `thuoc` VALUES ('M00035', 'Daktarin 10g', 'Điều trị nhiễm nấm ở khoang miệng hầu và đường tiêu hóa', 'Miconazole 20mg', 'Tuýp', 'Thái lan', 49000.00, 20, 'T00011');
INSERT INTO `thuoc` VALUES ('M00036', 'Dipolac G', 'Chống viêm, kháng nấm, diệt khuẩn', 'Betamethasone dipropionate 9.6mg, Gentamicin 15mg, Clotrimazole 150mg', 'Tuýp', 'Việt Nam', 62000.00, 30, 'T00012');
INSERT INTO `thuoc` VALUES ('M00037', 'Silkron', 'Kháng lại vi khuẩn và vi nấm, điều trị các bệnh ngoài da', 'Clotrimazol 10mg, Betamethazone dipropionat 0.64mg, Gentamicin sulfat 1mg', 'Tuýp', 'Hàn Quốc', 25000.00, 45, 'T00012');
INSERT INTO `thuoc` VALUES ('M00038', 'Gentrisone 10g', 'Điều trị bệnh chàm, hăm da, lăng ben, viêm da, nhiễm trùng da', 'Clotrimazol 100mg, Gentamicin 10mg, Betamethasone 6.4mg', 'Tuýp', 'Việt Nam', 40000.00, 25, 'T00012');
INSERT INTO `thuoc` VALUES ('M00039', 'Acyclovir Stada 5g', 'Điều trị nhiễm virus Herpes simplex ở da', 'Acyclovir 250mg', 'Tuýp', 'Việt Nam', 17000.00, 20, 'T00012');
INSERT INTO `thuoc` VALUES ('M00040', 'Dermovate Cream 15g', 'Kháng viêm, co mạch và giảm sự tổng hợp collagen', 'Clobetasol propionat 0.05%, tá dược', 'Tuýp', 'Anh Quốc', 110000.00, 15, 'T00012');

-- ----------------------------
-- Procedure structure for add_bill
-- ----------------------------
DROP PROCEDURE IF EXISTS `add_bill`;
delimiter ;;
CREATE PROCEDURE `add_bill`(in bill_id varchar(10), created_date date, total_payment decimal(10,2),
    in customer_id varchar(10), in employee_id varchar(10))
BEGIN
	insert into hoa_don_thanh_toan values(bill_id, created_date, total_payment, customer_id, employee_id);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for add_bill_details
-- ----------------------------
DROP PROCEDURE IF EXISTS `add_bill_details`;
delimiter ;;
CREATE PROCEDURE `add_bill_details`(in bill_id varchar(10), in drug_id varchar(10), in unit varchar(20),
    in unit_price decimal(10,2), in quantity int)
BEGIN
	insert into chi_tiet_hoa_don_thanh_toan
    values(bill_id, drug_id, unit, unit_price, quantity);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for add_customer
-- ----------------------------
DROP PROCEDURE IF EXISTS `add_customer`;
delimiter ;;
CREATE PROCEDURE `add_customer`(in id varchar(10), in name varchar(100),
    in address varchar(100), in phone_number varchar(20))
BEGIN
	insert into khach_hang values(id, name, address, phone_number);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_customer
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_customer`;
delimiter ;;
CREATE PROCEDURE `delete_customer`(in id varchar(10))
BEGIN
	delete from khach_hang
    where ma_khach_hang = id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_bill_details_list
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_bill_details_list`;
delimiter ;;
CREATE PROCEDURE `get_bill_details_list`()
BEGIN
	select ct.*, ten_thuoc
    from chi_tiet_hoa_don_thanh_toan ct, thuoc t
    where ct.ma_thuoc = t.ma_thuoc;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_bill_list
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_bill_list`;
delimiter ;;
CREATE PROCEDURE `get_bill_list`()
BEGIN
	select hd.*, ten_khach_hang, ho_ten
    from hoa_don_thanh_toan hd, khach_hang kh, nhan_vien nv
    where hd.ma_khach_hang = kh.ma_khach_hang and hd.ma_nhan_vien = nv.ma_nhan_vien;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_customer_list
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_customer_list`;
delimiter ;;
CREATE PROCEDURE `get_customer_list`()
BEGIN
	select *
    from khach_hang;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_drug_list
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_drug_list`;
delimiter ;;
CREATE PROCEDURE `get_drug_list`()
BEGIN
	select t.*, lt.ten_loai_thuoc
    from thuoc t, loai_thuoc lt
    where t.ma_loai_thuoc = lt.ma_loai_thuoc;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_drug_type_name_list
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_drug_type_name_list`;
delimiter ;;
CREATE PROCEDURE `get_drug_type_name_list`()
BEGIN
	select ten_loai_thuoc from loai_thuoc;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_login
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_login`;
delimiter ;;
CREATE PROCEDURE `get_login`(in username varchar(20), in password varchar(20))
BEGIN
	select *
    from nhan_vien
    where ten_dang_nhap = username and mat_khau = password;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_customer
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_customer`;
delimiter ;;
CREATE PROCEDURE `update_customer`(in original_id varchar(10), in id varchar(10), in name varchar(100),
    in address varchar(100), in phone_number varchar(20))
BEGIN
	update khach_hang
    set ma_khach_hang = id,
		ten_khach_hang = name,
        dia_chi = address,
        so_dien_thoai = phone_number
	where ma_khach_hang = original_id;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
