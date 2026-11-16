-- =====================================================================
--  BTVN 3 - Chương 3: Các câu lệnh truy vấn dữ liệu
--  Bài tập 2: Truy vấn trên CSDL AdventureWorksDW (SQL Server)
-- =====================================================================
USE AdventureWorksDW;
GO

-- Câu 1 · Nhân viên nam, phòng Engineering, base rate 30–40
SELECT * 
FROM DimEmployee
Where Gender = 'M' AND DepartmentName = 'Engineering' AND BaseRate BETWEEN 30 AND 40;

-- Câu 2 · Đại lý theo năm thành lập và doanh số
SELECT *
FROM DimReseller
WHERE (YearOpened >= 2001 AND AnnualSales >= 3000000)
   OR (YearOpened <= 2000 AND AnnualSales <= 800000);

-- Câu 3 (nâng cao) · Sản phẩm có tên bắt đầu bằng HL
SELECT *
FROM DimProduct
WHERE EnglishProductName LIKE 'HL%';
