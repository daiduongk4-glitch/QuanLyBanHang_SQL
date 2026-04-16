-- ============================================================
-- HE QUAN TRI CO SO DU LIEU - QUAN LY BAN HANG (QLBH)
-- Bao cao Bai tap lon - Co so Du lieu (Ma HP: N03.BT1)
-- Truong DH Giao thong Van tai - Khoa Dien - Dien tu
-- Nhom: Dao Minh Duc, Nguyen Dinh Hoang, Nguyen Duc Anh,
--        Bui Dai Duong, Nguyen Thien Hung
-- Nam hoc 2025-2026
-- ============================================================


-- ============================================================
-- PHAN 1: TAO DATABASE VA CAC BANG
-- ============================================================

-- Xoa database neu da ton tai de chay lai tu dau
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'QLBH')
BEGIN
    ALTER DATABASE QLBH SET SINGLE_USER WITH ROLLBACK IMMEDIATE
    DROP DATABASE QLBH
END
GO

CREATE DATABASE QLBH
GO

USE QLBH
GO

-- ------------------------------------------------------------
-- Bang KHACHHANG
-- ------------------------------------------------------------
CREATE TABLE KHACHHANG (
    MAKH    char(4)     NOT NULL,
    HOTEN   varchar(40),
    DCHI    varchar(50),
    SODT    varchar(20),
    NGSINH  smalldatetime,
    NGDK    smalldatetime,
    DOANHSO money,
    CONSTRAINT pk_kh PRIMARY KEY (MAKH)
)
GO

-- ------------------------------------------------------------
-- Bang NHANVIEN
-- ------------------------------------------------------------
CREATE TABLE NHANVIEN (
    MANV    char(4)     NOT NULL,
    HOTEN   varchar(40),
    SODT    varchar(20),
    DIACHI  varchar(40),
    NGVL    smalldatetime,
    CONSTRAINT pk_nv PRIMARY KEY (MANV)
)
GO

-- ------------------------------------------------------------
-- Bang SANPHAM
-- ------------------------------------------------------------
CREATE TABLE SANPHAM (
    MASP    char(4)     NOT NULL,
    TENSP   varchar(40),
    DVT     varchar(20),
    NUOCSX  varchar(40),
    GIA     money,
    CONSTRAINT pk_sp PRIMARY KEY (MASP)
)
GO

-- ------------------------------------------------------------
-- Bang HOADON
-- ------------------------------------------------------------
CREATE TABLE HOADON (
    SOHD    int         NOT NULL,
    NGHD    smalldatetime,
    MAKH    char(4),
    MANV    char(4),
    TRIGIA  money,
    CONSTRAINT pk_hd PRIMARY KEY (SOHD)
)
GO

-- ------------------------------------------------------------
-- Bang CTHD (Chi tiet hoa don)
-- ------------------------------------------------------------
CREATE TABLE CTHD (
    SOHD    int,
    MASP    char(4),
    SL      int,
    CONSTRAINT pk_cthd PRIMARY KEY (SOHD, MASP)
)
GO

-- ------------------------------------------------------------
-- Khoa ngoai
-- ------------------------------------------------------------
ALTER TABLE HOADON ADD CONSTRAINT fk01_HD   FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH)
ALTER TABLE HOADON ADD CONSTRAINT fk02_HD   FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
ALTER TABLE CTHD   ADD CONSTRAINT fk01_CTHD FOREIGN KEY (SOHD) REFERENCES HOADON(SOHD)
ALTER TABLE CTHD   ADD CONSTRAINT fk02_CTHD FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
GO


-- ============================================================
-- PHAN 2: NHAP DU LIEU
-- ============================================================

SET DATEFORMAT dmy
GO

-- ------------------------------------------------------------
-- Du lieu KHACHHANG
-- ------------------------------------------------------------
INSERT INTO KHACHHANG VALUES ('KH01','Nguyen Trung Anh','Luong The Vinh , Ha Noi','8823451','22/10/2000','22/07/2020',13060000)
INSERT INTO KHACHHANG VALUES ('KH02','Ta Tien Dat','Hai Ba Trung , Ha Noi','908256478','03/04/2000','30/07/2020',280000)
INSERT INTO KHACHHANG VALUES ('KH03','Nguyen Son Tung','Soc Son , Ha Noi','938776266','12/06/2000','08/05/2020',3860000)
INSERT INTO KHACHHANG VALUES ('KH04','Tran Hoang Long','Ba Dinh , Ha Noi','917325476','09/03/2000','10/02/2020',250000)
INSERT INTO KHACHHANG VALUES ('KH05','Le Nhat Minh','Hang Bai , Ha Noi','8246108','10/03/2000','28/10/2020',21000)
INSERT INTO KHACHHANG VALUES ('KH06','Nguyen Hoai Thuong','Nguyen Van Cu, Ha Noi','8631738','31/12/2000','24/11/2020',915000)
INSERT INTO KHACHHANG VALUES ('KH07','Nguyen Hai Ha','To Huu , Ha Noi','916783565','06/04/2000','12/01/2020',12500)
INSERT INTO KHACHHANG VALUES ('KH08','Phan Thanh Hai','Tran Phu , Ha Noi','938435756','10/01/2002','13/12/2020',365000)
INSERT INTO KHACHHANG VALUES ('KH09','Le Dan Nguyen','Thanh Xuan , Ha Noi','8654763','03/09/1999','14/01/2021',70000)
INSERT INTO KHACHHANG VALUES ('KH10','Tran Quang Hieu','Tran Quang Dieu , Ha Noi','8768904','02/05/1998','16/01/2021',67500)
GO

-- ------------------------------------------------------------
-- Du lieu NHANVIEN
-- ------------------------------------------------------------
INSERT INTO NHANVIEN VALUES ('NV01','Pham Quang Huy','927345678','Thai Binh','13/04/2000')
INSERT INTO NHANVIEN VALUES ('NV02','Le Thu Ha','987567390','Ha Noi','21/04/2001')
INSERT INTO NHANVIEN VALUES ('NV03','Nguyen Thanh Long','997047382','Ninh Binh','27/04/2000')
INSERT INTO NHANVIEN VALUES ('NV04','Ngo Van Thanh','913758498','Quang Ninh','24/06/2002')
INSERT INTO NHANVIEN VALUES ('NV05','Nguyen Thanh Hai','918590387','Nghe An','20/07/1999')
GO

-- ------------------------------------------------------------
-- Du lieu SANPHAM
-- ------------------------------------------------------------
INSERT INTO SANPHAM VALUES ('BC01','But chi','cay','Singapore',3000)
INSERT INTO SANPHAM VALUES ('BC02','But chi','cay','Singapore',5000)
INSERT INTO SANPHAM VALUES ('BC03','But chi','cay','Viet Nam',3500)
INSERT INTO SANPHAM VALUES ('BC04','But chi','hop','Viet Nam',30000)
INSERT INTO SANPHAM VALUES ('BB01','But bi','cay','Viet Nam',5000)
INSERT INTO SANPHAM VALUES ('BB02','But bi','cay','Trung Quoc',7000)
INSERT INTO SANPHAM VALUES ('BB03','But bi','hop','Thai Lan',100000)
INSERT INTO SANPHAM VALUES ('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
INSERT INTO SANPHAM VALUES ('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
INSERT INTO SANPHAM VALUES ('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
INSERT INTO SANPHAM VALUES ('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
INSERT INTO SANPHAM VALUES ('TV05','Tap 100 trang','chuc','Viet Nam',23000)
INSERT INTO SANPHAM VALUES ('TV06','Tap 200 trang','chuc','Viet Nam',53000)
INSERT INTO SANPHAM VALUES ('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
INSERT INTO SANPHAM VALUES ('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
INSERT INTO SANPHAM VALUES ('ST02','So tay loai 1','quyen','Viet Nam',55000)
INSERT INTO SANPHAM VALUES ('ST03','So tay loai 2','quyen','Viet Nam',51000)
INSERT INTO SANPHAM VALUES ('ST04','So tay','quyen','Thai Lan',55000)
INSERT INTO SANPHAM VALUES ('ST05','So tay mong','quyen','Thai Lan',20000)
INSERT INTO SANPHAM VALUES ('ST06','Phan viet bang','hop','Viet Nam',5000)
INSERT INTO SANPHAM VALUES ('ST07','Phan khong bui','hop','Viet Nam',7000)
INSERT INTO SANPHAM VALUES ('ST08','Bong bang','cai','Viet Nam',1000)
INSERT INTO SANPHAM VALUES ('ST09','But long','cay','Viet Nam',5000)
INSERT INTO SANPHAM VALUES ('ST10','But long','cay','Trung Quoc',7000)
GO

-- ------------------------------------------------------------
-- Du lieu HOADON
-- ------------------------------------------------------------
INSERT INTO HOADON VALUES (1001,'23/07/2020','KH01','NV01',320000)
INSERT INTO HOADON VALUES (1002,'12/08/2020','KH01','NV02',840000)
INSERT INTO HOADON VALUES (1003,'23/08/2020','KH02','NV01',100000)
INSERT INTO HOADON VALUES (1004,'01/09/2020','KH02','NV01',180000)
INSERT INTO HOADON VALUES (1005,'20/10/2020','KH01','NV02',3800000)
INSERT INTO HOADON VALUES (1006,'16/10/2020','KH01','NV03',2430000)
INSERT INTO HOADON VALUES (1007,'28/10/2020','KH03','NV03',510000)
INSERT INTO HOADON VALUES (1008,'28/10/2020','KH01','NV03',440000)
INSERT INTO HOADON VALUES (1009,'28/10/2020','KH03','NV04',200000)
INSERT INTO HOADON VALUES (1010,'01/11/2020','KH01','NV01',5200000)
INSERT INTO HOADON VALUES (1011,'04/11/2020','KH04','NV03',250000)
INSERT INTO HOADON VALUES (1012,'30/11/2020','KH05','NV03',21000)
INSERT INTO HOADON VALUES (1013,'12/12/2020','KH06','NV01',5000)
INSERT INTO HOADON VALUES (1014,'31/12/2020','KH03','NV02',3150000)
INSERT INTO HOADON VALUES (1015,'01/01/2021','KH06','NV01',910000)
INSERT INTO HOADON VALUES (1016,'01/01/2021','KH07','NV02',12500)
INSERT INTO HOADON VALUES (1017,'02/01/2021','KH08','NV03',35000)
INSERT INTO HOADON VALUES (1018,'13/01/2021','KH08','NV03',330000)
INSERT INTO HOADON VALUES (1019,'13/01/2021','KH01','NV03',30000)
INSERT INTO HOADON VALUES (1020,'14/01/2021','KH09','NV04',70000)
INSERT INTO HOADON VALUES (1021,'16/01/2021','KH10','NV03',67500)
INSERT INTO HOADON VALUES (1022,'16/01/2021', NULL ,'NV03',7000)
INSERT INTO HOADON VALUES (1023,'17/01/2021', NULL ,'NV01',330000)
GO

-- ------------------------------------------------------------
-- Du lieu CTHD
-- ------------------------------------------------------------
INSERT INTO CTHD VALUES (1001,'TV02',10)
INSERT INTO CTHD VALUES (1001,'ST01',5)
INSERT INTO CTHD VALUES (1001,'BC01',5)
INSERT INTO CTHD VALUES (1001,'BC02',10)
INSERT INTO CTHD VALUES (1001,'ST08',10)
INSERT INTO CTHD VALUES (1002,'BC04',20)
INSERT INTO CTHD VALUES (1002,'BB01',20)
INSERT INTO CTHD VALUES (1002,'BB02',20)
INSERT INTO CTHD VALUES (1003,'BB03',10)
INSERT INTO CTHD VALUES (1004,'TV01',20)
INSERT INTO CTHD VALUES (1004,'TV02',10)
INSERT INTO CTHD VALUES (1004,'TV03',10)
INSERT INTO CTHD VALUES (1004,'TV04',10)
INSERT INTO CTHD VALUES (1005,'TV05',50)
INSERT INTO CTHD VALUES (1005,'TV06',50)
INSERT INTO CTHD VALUES (1006,'TV07',20)
INSERT INTO CTHD VALUES (1006,'ST01',30)
INSERT INTO CTHD VALUES (1006,'ST02',10)
INSERT INTO CTHD VALUES (1007,'ST03',10)
INSERT INTO CTHD VALUES (1008,'ST04',8)
INSERT INTO CTHD VALUES (1009,'ST05',10)
INSERT INTO CTHD VALUES (1010,'TV07',50)
INSERT INTO CTHD VALUES (1010,'ST07',50)
INSERT INTO CTHD VALUES (1010,'ST08',100)
INSERT INTO CTHD VALUES (1010,'ST04',50)
INSERT INTO CTHD VALUES (1010,'TV03',100)
INSERT INTO CTHD VALUES (1011,'ST06',50)
INSERT INTO CTHD VALUES (1012,'ST07',3)
INSERT INTO CTHD VALUES (1013,'ST08',5)
INSERT INTO CTHD VALUES (1014,'BC02',80)
INSERT INTO CTHD VALUES (1014,'BB02',100)
INSERT INTO CTHD VALUES (1014,'BC04',60)
INSERT INTO CTHD VALUES (1014,'BB01',50)
INSERT INTO CTHD VALUES (1015,'BB02',30)
INSERT INTO CTHD VALUES (1015,'BB03',7)
INSERT INTO CTHD VALUES (1016,'TV01',5)
INSERT INTO CTHD VALUES (1017,'TV02',1)
INSERT INTO CTHD VALUES (1017,'TV03',1)
INSERT INTO CTHD VALUES (1017,'TV04',5)
INSERT INTO CTHD VALUES (1018,'ST04',6)
INSERT INTO CTHD VALUES (1019,'ST05',1)
INSERT INTO CTHD VALUES (1019,'ST06',2)
INSERT INTO CTHD VALUES (1020,'ST07',10)
INSERT INTO CTHD VALUES (1021,'ST08',5)
INSERT INTO CTHD VALUES (1021,'TV01',7)
INSERT INTO CTHD VALUES (1021,'TV02',10)
INSERT INTO CTHD VALUES (1022,'ST07',1)
INSERT INTO CTHD VALUES (1023,'ST04',6)
GO


-- ============================================================
-- PHAN 3: CAU LENH TRUY VAN DU LIEU SQL
-- ============================================================

-- ============================================================
-- 1) 3 cau lenh SELECT co dieu kien (WHERE)
-- ============================================================

-- Cau 1: In ra danh sach cac san pham (MASP, TENSP) do "Thai Lan" san xuat
PRINT '=== Cau 1: San pham do Thai Lan san xuat ==='
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Thai Lan'
GO

-- Cau 2: In danh sach cac san pham co don vi tinh la "hop" hoac "quyen"
PRINT '=== Cau 2: San pham co DVT la hop hoac quyen ==='
SELECT MASP, TENSP, DVT
FROM SANPHAM
WHERE DVT IN ('hop', 'quyen')
GO

-- Cau 3: San pham do "Trung Quoc" hoac "Thai Lan" sx, gia tu 30000 den 40000
PRINT '=== Cau 3: San pham Trung Quoc/Thai Lan, gia 30000-40000 ==='
SELECT MASP, TENSP, NUOCSX, GIA
FROM SANPHAM
WHERE NUOCSX IN ('Trung Quoc', 'Thai Lan')
AND GIA BETWEEN 30000 AND 40000
GO


-- ============================================================
-- 2) 3 cau lenh SELECT co WHERE va GROUP BY
-- ============================================================

-- Cau 1: Tinh tong so san pham cua tung nuoc san xuat
PRINT '=== Cau 4: Tong so san pham theo nuoc san xuat ==='
SELECT NUOCSX, COUNT(DISTINCT MASP) AS TONGSOSANPHAM
FROM SANPHAM
GROUP BY NUOCSX
GO

-- Cau 2: Tinh tong so luong cua tung san pham ban ra trong thang 10/2020
PRINT '=== Cau 5: Tong so luong tung san pham ban thang 10/2020 ==='
SELECT C.MASP, SP.TENSP, SUM(C.SL) AS TONGSOLUONG
FROM CTHD C
INNER JOIN HOADON H  ON C.SOHD = H.SOHD
INNER JOIN SANPHAM SP ON C.MASP = SP.MASP
WHERE MONTH(H.NGHD) = 10 AND YEAR(H.NGHD) = 2020
GROUP BY C.MASP, SP.TENSP
GO

-- Cau 3: Tinh doanh thu ban hang cua tung thang trong nam 2020
PRINT '=== Cau 6: Doanh thu tung thang nam 2020 ==='
SELECT MONTH(NGHD) AS THANG, SUM(TRIGIA) AS DOANHTHU
FROM HOADON
WHERE YEAR(NGHD) = 2020
GROUP BY MONTH(NGHD)
ORDER BY THANG
GO


-- ============================================================
-- 3) 3 cau lenh SELECT co WHERE, GROUP BY, HAVING
-- ============================================================

-- Cau 1: Tim hoa don co mua it nhat 4 san pham khac nhau
PRINT '=== Cau 7: Hoa don co it nhat 4 san pham khac nhau ==='
SELECT SOHD, COUNT(MASP) AS SO_SP_KHAC_NHAU
FROM CTHD
GROUP BY SOHD
HAVING COUNT(MASP) >= 4
GO

-- Cau 2: So luong khach hang o moi dia chi, sap xep cao den thap
PRINT '=== Cau 8: So luong KH theo dia chi ==='
SELECT DCHI, COUNT(MAKH) AS SOKH
FROM KHACHHANG
GROUP BY DCHI
HAVING COUNT(MAKH) > 0
ORDER BY SOKH DESC
GO

-- Cau 3: Khach hang o 'Luong The Vinh , Ha Noi' da mua it nhat 5 san pham
PRINT '=== Cau 9: KH Luong The Vinh mua >= 5 san pham ==='
SELECT K.HOTEN, COUNT(C.SOHD) AS SOLUONGMUAHANG
FROM KHACHHANG K
INNER JOIN HOADON H ON K.MAKH = H.MAKH
INNER JOIN CTHD   C ON H.SOHD = C.SOHD
WHERE K.DCHI = 'Luong The Vinh , Ha Noi'
GROUP BY K.HOTEN
HAVING COUNT(C.SOHD) >= 5
GO


-- ============================================================
-- 4) 2 cau lenh SELECT co WHERE, GROUP BY, HAVING va ORDER BY
-- ============================================================

-- Cau 1: Khach hang co tong don hang lon hon 4.000.000
PRINT '=== Cau 10: KH co tong don hang > 4.000.000 ==='
SELECT K.MAKH, K.HOTEN, SUM(B.GiaTriHoaDon) AS TongHoaDon
FROM (
    SELECT C.SOHD, H.MAKH, SUM(C.SL * SP.GIA) AS GiaTriHoaDon
    FROM SANPHAM SP
    INNER JOIN CTHD   C ON SP.MASP = C.MASP
    INNER JOIN HOADON H ON C.SOHD  = H.SOHD
    GROUP BY C.SOHD, H.MAKH
) AS B
INNER JOIN KHACHHANG K ON B.MAKH = K.MAKH
GROUP BY K.MAKH, K.HOTEN
HAVING SUM(B.GiaTriHoaDon) > 4000000
ORDER BY TongHoaDon DESC
GO

-- Cau 2: Khach hang co so lan mua hang nhieu nhat
PRINT '=== Cau 11: KH co so lan mua hang nhieu nhat ==='
SELECT TOP 1 WITH TIES K.MAKH, K.HOTEN, COUNT(H.SOHD) AS SoLanMua
FROM KHACHHANG K
INNER JOIN HOADON H ON K.MAKH = H.MAKH
GROUP BY K.MAKH, K.HOTEN
ORDER BY COUNT(H.SOHD) DESC
GO


-- ============================================================
-- 5) 1 cau lenh SELECT co WHERE, GROUP BY, HAVING va truy van con
-- ============================================================

-- In danh sach san pham ban duoc trong nam 2020 (bo 2 sp ban nhieu nhat),
-- voi dieu kien tong so luong ban > 10
PRINT '=== Cau 12: SP ban duoc nam 2020 (bo 2 sp nhieu nhat), SL > 10 ==='
SELECT SP.MASP, SP.TENSP, SUM(C.SL) AS TongSoLuongBan
FROM SANPHAM SP
INNER JOIN CTHD   C ON SP.MASP = C.MASP
INNER JOIN HOADON H ON C.SOHD  = H.SOHD
WHERE YEAR(H.NGHD) = 2020
  AND SP.MASP NOT IN (
      SELECT TOP 2 C2.MASP
      FROM CTHD C2
      INNER JOIN HOADON H2 ON C2.SOHD = H2.SOHD
      WHERE YEAR(H2.NGHD) = 2020
      GROUP BY C2.MASP
      ORDER BY SUM(C2.SL) DESC
  )
GROUP BY SP.MASP, SP.TENSP
HAVING SUM(C.SL) > 10
ORDER BY TongSoLuongBan DESC
GO


-- ============================================================
-- 6) Cau lenh INSERT - Them khach hang moi vao KHACHHANG
-- ============================================================

PRINT '=== Cau 13: INSERT - Them KH11 ==='
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, NGDK, DOANHSO)
VALUES ('KH11', 'Anh Nam', 'Tu Son , Bac Ninh', '967711254', '12/12/1997', '17/01/2021', 1200000)
GO

-- Kiem tra
SELECT * FROM KHACHHANG WHERE MAKH = 'KH11'
GO


-- ============================================================
-- 7) Cau lenh UPDATE - Tao bang GIA va cap nhat DOANHSO
-- ============================================================

PRINT '=== Cau 14: Tao bang GIA ==='
SELECT C.SOHD,
       SUM(C.SL * SP.GIA) AS GiaTriHoaDon,
       H.NGHD,
       H.MAKH,
       H.MANV
INTO GIA
FROM SANPHAM SP
INNER JOIN CTHD   C ON SP.MASP = C.MASP
INNER JOIN HOADON H ON C.SOHD  = H.SOHD
GROUP BY C.SOHD, H.NGHD, H.MAKH, H.MANV
GO

PRINT '=== Cau 15: UPDATE - Cap nhat DOANHSO theo thuc te ==='
UPDATE KHACHHANG
SET DOANHSO = (
    SELECT SUM(G.GiaTriHoaDon)
    FROM GIA G
    WHERE G.MAKH = KHACHHANG.MAKH
)
WHERE MAKH IN (SELECT DISTINCT MAKH FROM GIA WHERE MAKH IS NOT NULL)
GO

-- Kiem tra
SELECT MAKH, HOTEN, DOANHSO FROM KHACHHANG
GO


-- ============================================================
-- 8) Cau lenh DELETE - Xoa toan bo du lieu trong bang GIA
-- ============================================================

PRINT '=== Cau 16: DELETE - Xoa toan bo du lieu bang GIA ==='
DELETE FROM GIA
GO

-- Kiem tra
SELECT * FROM GIA
GO

-- ============================================================
-- KET THUC FILE SQL
-- ============================================================
