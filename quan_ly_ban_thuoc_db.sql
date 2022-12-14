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
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00001', 'M00018', 'H???p', 300000.00, 2);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00001', 'M00020', 'H???p', 370000.00, 2);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00001', 'M00032', 'Chai', 3000.00, 1);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00001', 'M00036', 'Tu??p', 62000.00, 5);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00002', 'M00006', 'H???p', 70000.00, 2);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00002', 'M00021', 'Chai', 53000.00, 2);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00002', 'M00029', 'H???p', 112000.00, 1);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00002', 'M00038', 'Tu??p', 40000.00, 5);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00003', 'M00003', 'H???p', 50000.00, 1);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00003', 'M00015', 'H???p', 150000.00, 1);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00003', 'M00017', 'H???p', 32000.00, 2);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00003', 'M00026', 'H???p', 10000.00, 3);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00003', 'M00033', 'Chai', 19000.00, 1);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00003', 'M00035', 'Tu??p', 49000.00, 3);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00004', 'M00018', 'H???p', 300000.00, 1);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00004', 'M00026', 'H???p', 10000.00, 3);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00004', 'M00029', 'H???p', 112000.00, 2);
INSERT INTO `chi_tiet_hoa_don_thanh_toan` VALUES ('B00004', 'M00036', 'Tu??p', 62000.00, 2);

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
INSERT INTO `khach_hang` VALUES ('C00001', 'Nguy???n Trung Hi???u', 'G?? V???p', '0675359124');
INSERT INTO `khach_hang` VALUES ('C00002', 'Tr???n Th??? Tuy???t Nhung', 'Qu???n 3', '0355462381');
INSERT INTO `khach_hang` VALUES ('C00003', 'B??i Quy???t Chi???n', 'B??nh Th???nh', '0673586233');
INSERT INTO `khach_hang` VALUES ('C00004', 'Nguy???n Th??? Th??y Trang', 'Qu???n 7', '0456665112');
INSERT INTO `khach_hang` VALUES ('C00005', 'Ng?? ????ng Khoa', 'G?? V???p', '0321112238');
INSERT INTO `khach_hang` VALUES ('C00006', 'Ng?? Th??? Qu??? Tr??n', 'Qu???n 2', '0145666387');
INSERT INTO `khach_hang` VALUES ('C00007', 'Tr???n ????nh Tr???ng', 'Qu???n 1', '0128776613');
INSERT INTO `khach_hang` VALUES ('C00008', 'Nguy???n Th??? Thu H???ng', 'T??n B??nh', '0673591862');
INSERT INTO `khach_hang` VALUES ('C00009', 'La Trung Th??nh', 'B??nh T??n', '0673213586');
INSERT INTO `khach_hang` VALUES ('C00010', 'Ng?? Th??? Th??y Dung', 'G?? V???p', '0127776543');
INSERT INTO `khach_hang` VALUES ('C00011', 'Tr???n ????nh Hi???u', 'Ph?? Nhu???n', '0674445581');
INSERT INTO `khach_hang` VALUES ('C00012', 'Tr???n Th??y Di???m', 'Qu???n 12', '0678925431');
INSERT INTO `khach_hang` VALUES ('C00013', 'Nguy???n Th??? Kh??nh B??ng', 'Qu???n 3', '0128883475');
INSERT INTO `khach_hang` VALUES ('C00014', 'Mai B???o Nam', 'G?? V???p', '0355915872');
INSERT INTO `khach_hang` VALUES ('C00015', 'Qu???nh Th??? Nh?? Th???o', 'Ph?? Nhu???n', '0126543881');
INSERT INTO `khach_hang` VALUES ('C00016', 'Ng?? Thanh Tu???n', 'B??nh T??n', '0345816647');

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
INSERT INTO `loai_thuoc` VALUES ('T00001', 'Thu???c gi???m ??au, h??? s???t, kh??ng vi??n');
INSERT INTO `loai_thuoc` VALUES ('T00002', 'Thu???c kh??ng sinh');
INSERT INTO `loai_thuoc` VALUES ('T00003', 'Thu???c kh??ng Histamin');
INSERT INTO `loai_thuoc` VALUES ('T00004', 'Thu???c ho - long ?????m');
INSERT INTO `loai_thuoc` VALUES ('T00005', 'Thu???c kh??ng n???m');
INSERT INTO `loai_thuoc` VALUES ('T00006', 'Thu???c tr??? s???i th???n');
INSERT INTO `loai_thuoc` VALUES ('T00007', 'Thu???c tr??? t??o b??n');
INSERT INTO `loai_thuoc` VALUES ('T00008', 'Thu???c tr??? giun');
INSERT INTO `loai_thuoc` VALUES ('T00009', 'Thu???c b??? t???ng h???p');
INSERT INTO `loai_thuoc` VALUES ('T00010', 'Thu???c nh??? m???t');
INSERT INTO `loai_thuoc` VALUES ('T00011', 'Thu???c b??i l??? mi???ng');
INSERT INTO `loai_thuoc` VALUES ('T00012', 'Thu???c b??i ngo??i da');

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
INSERT INTO `nhan_vien` VALUES ('E00001', 'Nguy???n Th??? Thu Nguy???t', 'B??n h??ng', 'N???', '2000-10-10', 'T??n B??nh', 'nguyetnt@gmail.com', '0128884167', 'thunguyet', 'thunguyet');
INSERT INTO `nhan_vien` VALUES ('E00002', 'Tr???n ????nh Ti???n', 'B??n h??ng', 'Nam', '2000-01-06', 'G?? V???p', 'tientd@gmail.com', '0123675812', 'dinhtien', 'dinhtien');
INSERT INTO `nhan_vien` VALUES ('E00003', 'Ch??u Ho??ng D??ng', 'B??o c??o th???ng k??', 'Nam', '1998-02-18', 'Qu???n 1', 'dungch@gmail.com', '0124745621', 'hoangdung', 'hoangdung');
INSERT INTO `nhan_vien` VALUES ('E00004', 'Tr???nh Th??? Nh?? Qu???nh', 'Ch??m s??c kh??ch h??ng', 'N???', '1999-05-18', 'Qu???n 7', 'quynhtt@gmail.com', '0128786663', 'nhuquynh', 'nhuquynh');
INSERT INTO `nhan_vien` VALUES ('E00005', 'Tr???n Th??? B???o Ng???c', 'B??n h??ng', 'N???', '2000-03-04', 'G?? V???p', 'ngoctt@gmail.com', '0672823309', 'baongoc', 'baongoc');
INSERT INTO `nhan_vien` VALUES ('E00006', 'Nguy???n Tu???n T??', 'Ki???m tra kho', 'Nam', '1998-12-08', 'T??n B??nh', 'tunt@gmail.com', '0127186155', 'tuantu', 'tuantu');
INSERT INTO `nhan_vien` VALUES ('E00007', 'Cao Th??? Th??y Trang', 'B??n h??ng', 'N???', '1999-04-10', 'B??nh T??n', 'trangct@gmail.com', '0125456613', 'thuytrang', 'thuytrang');
INSERT INTO `nhan_vien` VALUES ('E00008', 'Mai Th??? Thu H????ng', 'Ch??m s??c kh??ch h??ng', 'N???', '2000-06-20', 'Qu???n 3', 'huongmt@gmail.com', '0673882166', 'thuhuong', 'thuhuong');
INSERT INTO `nhan_vien` VALUES ('E00009', 'Nguy???n Th??? H??ng', 'Ki???m tra kho', 'Nam', '1999-07-15', 'Qu???n 1', 'hungnt@gmail.com', '0672115874', 'thehung', 'thehung');
INSERT INTO `nhan_vien` VALUES ('E00010', 'Nguy???n Thi??n Kh??i', 'B??o c??o th???ng k??', 'Nam', '1999-03-12', 'G?? V???p', 'khoint@gmail.com', '0128586451', 'thienkhoi', 'thienkhoi');
INSERT INTO `nhan_vien` VALUES ('E00011', 'Cao V???n ?????t', 'Ki???m tra kho', 'Nam', '1999-06-06', 'T??n B??nh', 'datcv@gmail.com', '0673432221', 'vandat', 'vandat');
INSERT INTO `nhan_vien` VALUES ('E00012', 'Tr???n Th??? Anh Th??', 'Ch??m s??c kh??ch h??ng', 'N???', '2000-05-20', 'G?? V???p', 'thutt@gmail.com', '0671412258', 'anhthu', 'anhthu');

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
INSERT INTO `thuoc` VALUES ('M00001', 'Paracetamol 500mg', 'Gi???m ??au, h??? s???t', 'Paracetamol 500mg', 'Chai', 'Hoa K???', 150000.00, 50, 'T00001');
INSERT INTO `thuoc` VALUES ('M00002', 'Alphachymotrypsin 4200 IU', 'Ch???ng vi??n, gi???m ph?? n??? m?? m???m', '??-Chymotrypsin 4200 IU, t?? d?????c', 'H???p', 'Vi???t Nam', 40000.00, 40, 'T00001');
INSERT INTO `thuoc` VALUES ('M00003', 'Meloxicam 7.5mg', 'Gi???m ??au, ch???ng vi??m, h??? s???t', 'Meloxicam 7.5mg, t?? d?????c', 'H???p', 'Vi???t Nam', 50000.00, 55, 'T00001');
INSERT INTO `thuoc` VALUES ('M00004', 'Celecoxib Capsules 200mg', 'Kh??ng vi??n, gi???m ??au v?? s??ng', 'Celecoxib, t?? d?????c', 'H???p', '???n ?????', 350000.00, 65, 'T00001');
INSERT INTO `thuoc` VALUES ('M00005', 'Amoxicillin 500mg', '??i???u tr??? nhi???m tr??ng h?? h???p, tai m??i h???ng, r??ng mi???ng', 'Amoxicilline', 'H???p', '???n ?????', 112000.00, 38, 'T00002');
INSERT INTO `thuoc` VALUES ('M00006', 'Ampicillin 500mg Domesco', '??i???u tr??? nhi???m khu???n ???????ng ti???t ni???u, vi??m t??i m???t, ???????ng ti??u ho??', 'Ampicillin Trihydrat Compactet, t?? d?????c', 'H???p', 'Vi???t Nam', 70000.00, 64, 'T00002');
INSERT INTO `thuoc` VALUES ('M00007', 'Azithromycin 250mg', '??i???u tr??? nhi???m khu???n ???????ng h?? h???p, da v?? c???u tr??c da', 'Azithromycin dihydrat, t?? d?????c', 'H???p', 'Vi???t Nam', 160000.00, 75, 'T00002');
INSERT INTO `thuoc` VALUES ('M00008', 'Acyclovir STELLA 800mg', '??i???u tr??? nhi???m Herpes simplex tr??n da, ??i???u tr??? b???nh th???y ?????u v?? b???nh Zona', 'Acyclovir 800mg, t?? d?????c', 'H???p', 'Vi???t Nam', 133000.00, 80, 'T00002');
INSERT INTO `thuoc` VALUES ('M00009', 'Clorpheniramin 4mg DHG', '??i???u tr??? vi??m m??i, ngh???t m??i, s??? m??i, ng???a, d??? ???ng do th???c ??n, c??n tr??ng c???n', 'Clorpheniramin 4mg', 'Chai', 'Vi???t Nam', 23000.00, 60, 'T00003');
INSERT INTO `thuoc` VALUES ('M00010', 'Alimemazin 5mg', '??i???u tr??? d??? ???ng h?? h???p, vi??m k???t m???c v?? ngo??i da', 'Alimemazin 5mg', 'H???p', 'Vi???t Nam', 20000.00, 100, 'T00003');
INSERT INTO `thuoc` VALUES ('M00011', 'Loratadin 10mg', '??i???u tr??? ng???a ng??y, kh?? n??ng, m???n ?????, c??c b???nh d??? ???ng kh??c', 'Loratadin, t?? d?????c', 'H???p', 'Vi???t Nam', 12000.00, 78, 'T00003');
INSERT INTO `thuoc` VALUES ('M00012', 'Cetirizin 10mg', '??i???u tr??? tri???u ch???ng vi??m m??i d??? ???ng dai d???ng, vi??m m??i d??? ???ng theo m??a, m??y ??ay', 'Cetirizin 10mg', 'H???p', 'Vi???t Nam', 30000.00, 40, 'T00003');
INSERT INTO `thuoc` VALUES ('M00013', 'Terpin Codein', '??i???u tr??? ho khan, gi???m ho, long ?????m', 'Codeine 10mg , Terpin hydrate 100mg, t?? d?????c', 'H???p', 'Vi???t Nam', 150000.00, 30, 'T00004');
INSERT INTO `thuoc` VALUES ('M00014', 'Terpinzoat', '??i???u tr??? c??c tri???u ch???ng ho, long ?????m trong vi??m ph??? qu???n c???p hay m??n t??nh', 'Natri benzoat 50mg, Terpin hydrat 100mg', 'H???p', 'Vi???t Nam', 39000.00, 58, 'T00004');
INSERT INTO `thuoc` VALUES ('M00015', 'Neo-Codion', '??i???u tr??? tri???u ch???ng ho khan do k??ch th??ch ??? ng?????i l???n', 'Sullogaiacol 0.1g, Codein camphosulphonat 25mg, Grindelia 20mg', 'H???p', 'Ph??p', 150000.00, 30, 'T00004');
INSERT INTO `thuoc` VALUES ('M00016', 'Griseofulvin 500mg', 'Kh??ng sinh, kh??ng n???m', 'Griseofulvin 500mg, t?? d?????c', 'H???p', 'Vi???t Nam', 45000.00, 60, 'T00005');
INSERT INTO `thuoc` VALUES ('M00017', 'Nystatin 500.000 IU', '??i???u tr??? n???m Candida ru???t, d??? d??y', 'Nystatin 500000 IU, t?? d?????c', 'H???p', 'Vi???t Nam', 32000.00, 45, 'T00005');
INSERT INTO `thuoc` VALUES ('M00018', 'Itraxcop 100mg', '??i???u tr??? n???m Candida trong mi???ng v?? h???ng h???u, ??i???u tr??? lang ben', 'Itraconazole BP 100mg', 'H???p', '???n ?????', 300000.00, 25, 'T00005');
INSERT INTO `thuoc` VALUES ('M00019', 'Diflucan 150mg', '??i???u tr??? nhi???m n???m to??n th??n v?? n???m tr??n b??? m???t m??', 'Fluconazol 150mg, t?? d?????c', 'H???p', 'Ph??p', 185000.00, 20, 'T00005');
INSERT INTO `thuoc` VALUES ('M00020', 'Rowatinex', '??i???u tr??? b???nh l?? s???i ti???t ni???u, nhi???m tr??ng ???????ng ti???t ni???u', 'Olive Oil 33mg, Pinene 31mg, Borneol 10mg, Cineol 3mg', 'H???p', 'Ireland', 370000.00, 15, 'T00006');
INSERT INTO `thuoc` VALUES ('M00021', 'Kim Ti???n Th???o', '??i???u tr??? s???i ???????ng ti???t ni???u, s???i th???n', 'Kim ti???n th???o 120mg', 'Chai', 'Vi???t Nam', 53000.00, 40, 'T00006');
INSERT INTO `thuoc` VALUES ('M00022', 'Duphalac 667g', '??i???u tr??? t??o b??n, t???o ph??n m???m h??? tr??? tr??? tr??', 'Lactulose 667g/l', 'Chai', 'Vi???t Nam', 86000.00, 35, 'T00007');
INSERT INTO `thuoc` VALUES ('M00023', 'Bisacodyl DHG 5mg', '??i???u tr??? t??o b??n, th???i s???ch ru???t tr?????c v?? sau ph???u thu???t', 'Bisacodyl 5mg', 'H???p', 'Vi???t Nam', 30000.00, 55, 'T00007');
INSERT INTO `thuoc` VALUES ('M00024', 'Sorbitol Domesco 5g', '??i???u tr??? tri???u ch???ng t??o b??n v?? kh?? ti??u', 'Sorbitol 5g', 'H???p', 'Vi???t Nam', 24000.00, 80, 'T00007');
INSERT INTO `thuoc` VALUES ('M00025', 'Fugacar 500mg', '??i???u tr??? nhi???m giun ????a, giun kim, giun m??c', 'Mebendazol 500mg', 'H???p', 'Th??i Lan', 76000.00, 50, 'T00008');
INSERT INTO `thuoc` VALUES ('M00026', 'Benda 500', '??i???u tr??? nhi???m giun ????a, giun kim, giun m??c, giun t??c', 'Mebendazole', 'H???p', 'Th??i Lan', 10000.00, 45, 'T00008');
INSERT INTO `thuoc` VALUES ('M00027', 'Zentel 200mg', '??i???u tr??? nhi???m giun ????a, giun kim, giun m??c', 'Albendazol 200mg', 'H???p', 'Vi???t Nam', 12000.00, 35, 'T00008');
INSERT INTO `thuoc` VALUES ('M00028', 'Pharmaton Kiddi', 'B??? sung vitamin, kho??ng ch???t cho tr??? em', ' L-Leucin 300mg, Vitamin B1 3mg, Vitamin B2 3.5mg, Vitamin B6 6mg, Vitamin D3 400IU, Vitamin E 15mg,...', 'Chai', 'Th???y S???', 115000.00, 25, 'T00009');
INSERT INTO `thuoc` VALUES ('M00029', 'Homtamin Ginseng', 'Cung c???p vitamin v?? mu???i kho??ng, gi???m m???t m???i', 'L?? h???i 5mg, Nh??n s??m 40mg, Vitamin B12 6??g, S???t fumarat 54.76mg, Vitamin A 5000IU, Vitamin B1 2mg, Vitamin B2 2mg,...', 'H???p', 'Vi???t Nam', 112000.00, 45, 'T00009');
INSERT INTO `thuoc` VALUES ('M00030', 'V.Rohto Vitamin', 'H??? tr??? c???i thi???n t??nh tr???ng gi???m th??? l???c, xung huy???t k???t m???c, m???t m???, ng???a m???t', 'Chlorpheniramine 3.9mg, Vitamin B6 13.0mg, Vitamin E 6.5mg, Potassium L-aspartate 130.0mg, Natri chondroitin Sulfat 13.0mg', 'Chai', 'Vi???t Nam', 47000.00, 30, 'T00010');
INSERT INTO `thuoc` VALUES ('M00031', 'Neodex Pharmedic', 'Kh??ng vi??m, kh??ng d??? ???ng v?? ch???ng nhi???m khu???n ??? m???t, ??i???u tr??? c??c b???nh nhi???m tr??ng m???t', 'Neomycin sulfat 25mg, Dexamethason natri phosphat 5.5mg, t?? d?????c', 'Chai', 'Vi???t Nam', 4000.00, 50, 'T00010');
INSERT INTO `thuoc` VALUES ('M00032', 'Natri clorid 0.9%', 'R???a m???t, r???a m??i, ph??? tr??? ch???ng vi??m m??i', 'Natri clorid 90mg', 'Chai', 'Vi???t Nam', 3000.00, 45, 'T00010');
INSERT INTO `thuoc` VALUES ('M00033', 'Osla 0.033g', 'Ng???a ??au m???t, tr??? m???i m???t, ????? m???t, ng???a m???t', 'Natri clorid 0.033g', 'Chai', 'Vi???t Nam', 19000.00, 25, 'T00010');
INSERT INTO `thuoc` VALUES ('M00034', 'Mouthpaste 5g', '??i???u tr??? vi??m ??? ni??m m???c mi???ng, l???i v?? m??i, ng??n ng???a c??c tri???u ch???ng vi??m khi m???c r??ng', 'Triamcinolon acetonid 5mg, t?? d?????c', 'Tu??p', 'Vi???t Nam', 30000.00, 35, 'T00011');
INSERT INTO `thuoc` VALUES ('M00035', 'Daktarin 10g', '??i???u tr??? nhi???m n???m ??? khoang mi???ng h???u v?? ???????ng ti??u h??a', 'Miconazole 20mg', 'Tu??p', 'Th??i lan', 49000.00, 20, 'T00011');
INSERT INTO `thuoc` VALUES ('M00036', 'Dipolac G', 'Ch???ng vi??m, kh??ng n???m, di???t khu???n', 'Betamethasone dipropionate 9.6mg, Gentamicin 15mg, Clotrimazole 150mg', 'Tu??p', 'Vi???t Nam', 62000.00, 30, 'T00012');
INSERT INTO `thuoc` VALUES ('M00037', 'Silkron', 'Kh??ng l???i vi khu???n v?? vi n???m, ??i???u tr??? c??c b???nh ngo??i da', 'Clotrimazol 10mg, Betamethazone dipropionat 0.64mg, Gentamicin sulfat 1mg', 'Tu??p', 'H??n Qu???c', 25000.00, 45, 'T00012');
INSERT INTO `thuoc` VALUES ('M00038', 'Gentrisone 10g', '??i???u tr??? b???nh ch??m, h??m da, l??ng ben, vi??m da, nhi???m tr??ng da', 'Clotrimazol 100mg, Gentamicin 10mg, Betamethasone 6.4mg', 'Tu??p', 'Vi???t Nam', 40000.00, 25, 'T00012');
INSERT INTO `thuoc` VALUES ('M00039', 'Acyclovir Stada 5g', '??i???u tr??? nhi???m virus Herpes simplex ??? da', 'Acyclovir 250mg', 'Tu??p', 'Vi???t Nam', 17000.00, 20, 'T00012');
INSERT INTO `thuoc` VALUES ('M00040', 'Dermovate Cream 15g', 'Kh??ng vi??m, co m???ch v?? gi???m s??? t???ng h???p collagen', 'Clobetasol propionat 0.05%, t?? d?????c', 'Tu??p', 'Anh Qu???c', 110000.00, 15, 'T00012');

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
