# BTVN 3: Các câu lệnh truy vấn dữ liệu

CSDL sử dụng: **AdventureWorksDW** (database mẫu của Microsoft, kiểu Data Warehouse / OLAP).

## Bài tập 1: Mô tả các bảng trong AdventureWorksDW

| STT | Tên bảng | Bảng này lưu trữ dữ liệu về cái gì? | Mỗi một bản ghi (dòng) trong bảng đại diện cho cái gì? |
|---|---|---|---|
| 1 | `DimAccount` | Danh mục các tài khoản kế toán của công ty có liên kết đệ quy, cột ParentAccountKey cho biết tài khoản thuộc nhóm cha nào | 1 tài khoản kế toán |
| 2 | `DimCurrency` | Thông tin về các loại tiền tệ | Mỗi dòng đại diện cho 1 loại tiền tệ |
| 3 | `DimCustomer` | Thông tin về khách hàng bao gồm tên, ngày sinh, giới tính, thu nhập, thông tin liên lạc, học vấn, địa chỉ... | Thông tin cá nhân của 1 khách hàng |
| 4 | `DimDate` | Thông tin mô tả về từng ngày cụ thể, như ngày đó là thứ mấy, tháng, quý, năm và năm tài chính nào | Một ngày trên lịch thực tế |
| 5 | `DimDepartmentGroup` | Các nhóm phòng ban của công ty (Corporate, Manufacturing, Quality Assurance…), có liên kết đệ quy: cột ParentDepartmentGroupKey cho biết nhóm này thuộc nhóm cha nào | 1 nhóm phòng ban |
| 6 | `DimEmployee` | Thông tin về nhân viên của công ty, có liên kết đệ quy: cột ParentEmployeeKey cho biết người quản lý trực tiếp của nhân viên | Thông tin của 1 nhân viên |
| 7 | `DimGeography` | Thông tin địa lý: thành phố, tỉnh, quốc gia, mã bưu điện, khu vực bán hàng mà địa điểm đó nằm trong | 1 địa điểm (1 thành phố) |
| 8 | `DimOrganization` | Các công ty đơn vị thuộc tập đoàn, thông tin tỷ lệ sở hữu và loại tiền mỗi đơn vị dùng | Một đơn vị tổ chức |
| 9 | `DimProduct` | Thông tin sản phẩm của công ty | 1 sản phẩm |
| 10 | `DimProductCategory` | Danh mục sản phẩm lớn | 1 danh mục sản phẩm lớn |
| 11 | `DimProductSubcategory` | Danh mục con của sản phẩm, mỗi danh mục con thuộc một danh mục lớn | 1 danh mục con |
| 12 | `DimPromotion` | Thông tin về các chương trình khuyến mãi của công ty | 1 chương trình khuyến mãi |
| 13 | `DimReseller` | Thông tin về các nhà phân phối sản phẩm | một nhà phân phối |
| 14 | `DimSalesReason` | Lý do khiến khách mua hàng | 1 lý do mua hàng |
| 15 | `DimSalesTerritory` | Các khu vực bán hàng | 1 khu vực bán hàng |
| 16 | `DimScenario` | Các kịch bản cho số liệu tài chính (Actual, budget, forecast) | 1 kịch bản số liệu |
| 17 | `FactAdditionalInternationalProductDescription` | Mô tả sản phẩm bằng các ngôn ngữ khác nhau | mô tả 1 sản phẩm trong 1 ngôn ngữ |
| 18 | `FactCallCenter` | Số liệu về các ca làm việc của tổng đài chăm sóc khách hàng | Từng ca làm việc |
| 19 | `FactCurrencyRate` | Tỷ giá của từng loại tiền theo ngày | tỷ giá của 1 loại tiền trong 1 ngày |
| 20 | `FactFinance` | Số liệu tài chính của công ty | 1 khoản tiền nhất định được ghi nhận cho 1 tài khoản kế toán, của 1 đơn vị, 1 nhóm phòng ban, theo 1 kịch bản(actual, budget, forecast), vào 1 ngày cụ thể |
| 21 | `FactInternetSales` | Thông tin về các giao dịch bán hàng cho khách hàng | 1 sản phẩm trong 1 đơn hàng |
| 22 | `FactInternetSalesReason` | Liên kết giữa đơn hàng và lý do mua hàng | 1 lý do mua hàng của 1 dòng đơn hàng |
| 23 | `FactProductInventory` | Tình trạng tồn kho của sản phẩm theo ngày: số lượng nhập, xuất, tồn, giá vốn | Tình trạng tồn kho của 1 sản phẩm trong 1 ngày |
| 24 | `FactResellerSales` | Các giao dịch bán hàng cho nhà phân phối | 1 dòng sản phẩm trong 1 đơn hàng bán cho đại lý |
| 25 | `FactSalesQuota` | Chỉ tiêu doanh số của 1 nhân viên bán hàng | Chỉ tiêu doanh số của 1 nhân viên trong 1 quý |

## Bài tập 2: Các câu truy vấn

File đầy đủ: [`BTVN3_truy_van.sql`](BTVN3_truy_van.sql)

```sql
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
```
