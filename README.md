# SQL – BTVN 2: CSDL `university`

Bài tập về nhà buổi 2, module MD01 – Data Analysis.

- **Bài tập 1:** Tạo CSDL `university` gồm 4 bảng `Student`, `Professor`, `Course`, `Assigned`
- **Bài tập 2:** Chèn dữ liệu vào 4 bảng

Hệ quản trị: **Microsoft SQL Server** (chạy bằng DBeaver).
File bài làm: [`BTVN2_university.sql`](BTVN2_university.sql)

## Thiết kế bảng

| Bảng | Cột | Khoá chính | Khoá ngoài |
|---|---|---|---|
| **Student** | Student_ID `int`, StudentName `nvarchar(50)`, StudentBirth `date` (cho phép NULL), IsMale `bit` (cho phép NULL) | Student_ID | – |
| **Professor** | Employee_ID `int`, ProfessorName `nvarchar(50)` | Employee_ID | – |
| **Course** | Course_ID `int`, CourseName `nvarchar(50)`, ProfessorID `int` | Course_ID | ProfessorID → Professor(Employee_ID) |
| **Assigned** | Student_ID `int`, Course_ID `int`, Note `nvarchar(MAX)` (cho phép NULL) | (Student_ID, Course_ID) | Student_ID → Student(Student_ID)<br>Course_ID → Course(Course_ID) |

Quan hệ:
- Professor – Course: **1 – n** (một giảng viên dạy nhiều môn), khoá ngoài đặt ở bảng Course.
- Student – Course: **n – n**, thể hiện qua bảng trung gian `Assigned`.

## Dữ liệu sau khi chèn

| Bảng | Số dòng |
|---|---|
| Student | 6 |
| Professor | 4 |
| Course | 3 |
| Assigned | 4 |

Thứ tự chèn: Student → Professor → Course → Assigned, tức là bảng cha trước, bảng có khoá ngoài sau.

## Cách chạy

1. Mở DBeaver (hoặc SSMS), kết nối tới SQL Server.
2. Mở file `BTVN2_university.sql` và chạy toàn bộ script (DBeaver: `⌥ Option + X`; SSMS: `F5`).
3. Bốn câu `SELECT` ở cuối file hiển thị dữ liệu của 4 bảng để kiểm tra.

Kết quả chạy: 14 câu lệnh thành công, 17 dòng được chèn.
