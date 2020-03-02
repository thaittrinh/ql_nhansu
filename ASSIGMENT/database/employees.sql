USE master
GO
IF EXISTS(SELECT * FROM sys.databases WHERE name = 'Employee')
		DROP DATABASE Employee
GO
--Tạo CSDL Personel
CREATE DATABASE Employee
GO
--Chọn CSDL làm việc
USE Employee
GO
--Tạo bảng User lưu thông tin người sử dụng
CREATE TABLE Users(
	Username varchar(50) NOT NULL,
	Password varchar(255) NOT NULL,
	Fullname nvarchar(50) NOT NULL,
	PRIMARY KEY(Username)
)
GO
--Tạo bảng Departs lưu thông tin phòng ban
CREATE TABLE Departs(
	Id nvarchar(10) NOT NULL,
	Name nvarchar(50) NOT NULL,
	PRIMARY KEY(Id)
)
GO
--Tạo bảng Staffs lưu thông tin nhân viên
CREATE TABLE Staffs(
	Id int IDENTITY(1,1) NOT NULL,
	Name nvarchar(50) NOT NULL,
	Gender bit NOT NULL,
	Birthday date NOT NULL,
	Photo nvarchar(50),
	Email nvarchar(50) NOT NULL,
	Phone nvarchar(25) NOT NULL,
	Salary int NOT NULL,
	Notes nvarchar(500) NULL,
	DepartId nvarchar(10) NOT NULL,
	PRIMARY KEY(Id),
	FOREIGN KEY(DepartId) REFERENCES Departs(Id) ON DELETE CASCADE ON UPDATE CASCADE
)
GO
--Tạo bảng Records lưu thông tin thành tích và kỷ luật của nhân viên
CREATE TABLE Records(
	Id bigint IDENTITY(1,1) NOT NULL,
	Type int NOT NULL,
	Reason nvarchar(200) NOT NULL,
	Date date NOT NULL,
	StaffId int NOT NULL,
	PRIMARY KEY(Id),
	FOREIGN KEY(StaffId) REFERENCES Staffs(Id) ON DELETE NO ACTION ON UPDATE CASCADE
 )

 GO
 INSERT INTO Users VALUES('admin','$2a$10$X6cJgcyflgYgeAnlC0W26.3G18hOWmTGeaQNrV9igiyWeHy8uzHT2',N'Trần Đức')
 INSERT INTO Users VALUES('admin2','$2a$10$X6cJgcyflgYgeAnlC0W26.3G18hOWmTGeaQNrV9igiyWeHy8uzHT2',N'Nguyễn Mạnh')



 GO 
  INSERT INTO Departs VALUES('PNS',N'Phòng Nhân Sự')
  INSERT INTO Departs VALUES('PKD',N'Phòng Kinh Doanh')
  INSERT INTO Departs VALUES('PPT',N'Phòng Phát Triển')
  INSERT INTO Departs VALUES('PKT',N'Phòng Kế Toán')
  INSERT INTO Departs VALUES('PBH',N'Phòng Bán Hàng')
  INSERT INTO Departs VALUES('PAN',N'Phòng An Ninh')



GO
INSERT INTO Staffs VALUES(N'Đỗ Trung Hiếu',1,'1995/09/18','hieu.jpg','dotrunghieu@gmail.com','068977777',20000000,
								N'Ghét màu hông','PNS')
INSERT INTO Staffs VALUES(N'Nguyễn Văn Mạnh',1,'1993/07/19','manh.jpg','nguyenmanh@gmail.com','068978997',20000000,
								N'Gì cũng thích','PNS')
INSERT INTO Staffs VALUES(N'Nguyễn Thùy Linh',0,'1993/01/18','linh.jpg','nguyenlinh@gmail.com','068977769',20000000,
								N'Yêu màu hông','PNS')


INSERT INTO Staffs VALUES(N'Hanna Gover',1,'1983/05/12','Hanna_Gover.jpg','hana@gmail.com','068977676',35500000,
								N'Yêu màu hồng ','PKD')
INSERT INTO Staffs VALUES(N'Dương Công Vị',1,'1993/11/12','vi.jpg','duongvi@gmail.com','068977689',25000000,
								N'Yêu màu hồng ','PKD')
INSERT INTO Staffs VALUES(N'Nguyễn Thị Linh',0,'1989/07/27','linhmit.jpg','linhmit@gmail.com','068977688',25000000,
								N'Yêu màu hồng  ','PKD')

INSERT INTO Staffs VALUES(N'James Anderson',1,'1968/07/19','James_Anderson.jpg','JamesAndersonu@gmail.com','068977979',35000000,
								N'Ghét màu hông','PKT')
INSERT INTO Staffs VALUES(N'Nguyễn Phương Thảo',0,'1996/08/17','Nguyen_Thao.jpg','phuongthao@gmail.com','068976666',19550000,
								N'Ghét màu hông','PKT')
INSERT INTO Staffs VALUES(N'Lê Việt Nguyên',1,'1989/10/12','nguyen.jpg','vietnguyen@gmail.com','068977677',25000000,
								N'Yêu màu hồng  ','PKT')

INSERT INTO Staffs VALUES(N'Lê Thành',1,'1986/12/18','Le_Thanh.jpg','lethanh@gmail.com','068977666',25000000,
								N'Ghét màu tím','PBH')
INSERT INTO Staffs VALUES(N'Michael Jorden',0,'1995/02/09','Michael_Jorden.jpg','michael@gmail.com','068977888',20000000,
								N'Gì cũng thích','PBH')
INSERT INTO Staffs VALUES(N'Nguyễn Thị Lan',0,'1975/09/08','nguyenlan.jpg','lanhana@gmail.com','068333676',25000000,
								N'Yêu màu hồng  ','PBH')

INSERT INTO Staffs VALUES(N'Lê Đình Hải',0,'1994/02/08','hai.jpg','lehai@gmail.com','068977668',20000000,
								N'Gì cũng thích','PAN')
INSERT INTO Staffs VALUES(N'Trịnh Hữu Diễn',1,'1989/03/12','dien.jpg','huudien@gmail.com','068345676',25000000,
								N'Gì cũng thích','PAN')
INSERT INTO Staffs VALUES(N'Lê Huy Nam',1,'1992/05/19','nam.jpg','huynam@gmail.com','068898989',25000000,
								N'Yêu màu tím ','PAN')

INSERT INTO Staffs VALUES(N'Lê Thị Nhàn',1,'1995/05/10','nhan.jpg','lenhan@gmail.com','067798989',25000000,
								N'Yêu màu tím ','PPT')
INSERT INTO Staffs VALUES(N'Trần Quốc Vương',1,'1996/12/20','vuong.jpg','quocvuong@gmail.com','068977558',20000000,
								N'Gì cũng thích','PPT')
INSERT INTO Staffs VALUES(N'lê Văn Khoa',1,'1995/06/11','khoa.jpg','lekhoa@gmail.com','068345611',25000000,
								N'Gì cũng thích','PPT')
INSERT INTO Staffs VALUES(N'ldâdada',1,'1995/06/11','khoa.jpg','lekhoa@gmail.com','068345611',25000000,
								N'Gì cũng thích','PPT')

GO 
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/05',1)
  INSERT INTO Records VALUES(0,N'Đi trễ','2019/09/06',1)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/07',1)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/08',1)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/09',1)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/09',1)

  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/09',2)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/10',2)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/10',2)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/11',2)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/11',2)
  
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/09',3)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/10',3)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/11',3)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/12',3)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/13',3)
 

  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/05',4)
  INSERT INTO Records VALUES(1,N'Làm Tốt','2019/09/06',4)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/07',4)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/08',4)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/09',4)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/09',4)

  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/09',5)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/10',5)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/10',5)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/11',5)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/11',5)
  
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/09',6)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/10',6)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/11',6)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/12',6)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/13',6)

  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/05',7)
  INSERT INTO Records VALUES(0,'Phạt đi trễ','2019/09/06',7)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/07',7)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/08',7)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/09',7)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/09',7)

  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/09',8)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/10',8)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/10',8)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/11',8)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/11',8)
  
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/09',9)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/10',9)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/11',9)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/12',9)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/13',9)

  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/05',10)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/06',10)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/07',10)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/08',10)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/09',10)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/09',10)

  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/09',11)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/10',11)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/10',11)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/11',11)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/11',11)
  
  INSERT INTO Records VALUES(1,N'Làm Tốt','2019/09/09',12)
  INSERT INTO Records VALUES(1,N'Làm Tốt','2019/09/10',12)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/11',12)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/12',12)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/13',12)


  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/05',13)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/06',13)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/07',13)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/08',13)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/09',13)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/09',13)

  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/08',14)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/19',14)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/10',14)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/11',14)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/11',14)
  
  INSERT INTO Records VALUES(1,N'Làm Tốt','2019/09/09',15)
  INSERT INTO Records VALUES(1,N'Làm Tốt','2019/09/10',15)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/11',15)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/12',15)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/13',15)

  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/05',16)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/06',16)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/07',16)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/08',16)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/09',16)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/10',16)

  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/09',17)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/10',17)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/10',17)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/11',17)
  INSERT INTO Records VALUES(1,N'Làm tốt','2019/09/11',17)
  
  INSERT INTO Records VALUES(1,N'Làm Tốt','2019/09/09',18)
  INSERT INTO Records VALUES(1,N'Làm Tốt','2019/09/10',18)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/11',18)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/12',18)
  INSERT INTO Records VALUES(0,N'Phạt đi trễ','2019/09/13',18)


  go


-----------Thống top 10 nhân viên theo năm hiện tại.
IF OBJECT_ID ('sp_top10') is not null
DROP PROC sp_top10
GO
CREATE PROC sp_top10
AS
BEGIN
	SELECT * FROM Staffs 
	WHERE  id in (Select
					TOP 10	Staffid
					from Records
					Where YEAR(Date) = YEAR(GETDATE())
					Group by StaffId
					Order by 2*SUM(Type) - COUNT(StaffId) desc)		
END
GO

------------------Tổng hợp thành tích nhân viên theo năm hiện tại
IF OBJECT_ID ('sp_ttnhanvien') is not null
DROP PROC sp_ttnhanvien
GO
CREATE PROC sp_ttnhanvien
@Name nvarchar(50),
@Ofset int,
@Fetch int
AS
BEGIN
  	
			SELECT 
				S.Id AS Id,
				S.Name AS Ten,
				SUM(R.Type) AS ThanhTich,
				COUNT(R.StaffId) - SUM(R.Type) AS KyLuat,
				2*SUM(Type) - COUNT(StaffId) AS DiemThuong

			FROM  Staffs S JOIN RECORDS R ON S.Id = R.StaffId
			WHERE  YEAR(R.Date) = YEAR(GETDATE()) and S.Name like N'%' +@Name + '%'
			GROUP BY R.StaffId , S.Id, S.Name
			ORDER BY DiemThuong desc
			OFFSET @Ofset ROWS
			FETCH NEXT @Fetch ROWS ONLY;
		
END
GO

--EXEC sp_ttnhanvien @Name=N'',@Ofset =0,@Fetch =19





--------------Tổng hợp thành tích của phòng ban năm hiện tại.

IF OBJECT_ID ('sp_ttphongban') is not null
DROP PROC sp_ttphongban
GO
CREATE PROC sp_ttphongban
AS
BEGIN	
	SELECT 
		D.Id AS Id,
		D.Name AS Ten,
		SUM(R.Type) AS ThanhTich,
		COUNT(D.Name) - SUM(R.Type) AS KyLuat,
		2*SUM(R.Type) - COUNT(D.Name) AS DiemThuong

	FROM  Staffs S JOIN RECORDS R ON S.Id = R.StaffId
				   JOIN DEPARTS D ON D.Id = S.DepartId
	WHERE  YEAR(R.Date) = YEAR(GETDATE())
	GROUP BY D.Name, D.Id
	ORDER BY DiemThuong desc

END
GO

