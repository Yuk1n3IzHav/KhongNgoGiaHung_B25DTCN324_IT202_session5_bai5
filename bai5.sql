-- Giải pháp: Dùng CASE WHEN ... THEN ... END
-- Xử lý ngoại lệ: Khi total_orders mang trạng thái NULL thì ta sẽ gán luôn cho nó xếp hạng bạc
-- Triển khai
CREATE DATABASE session_5_bai_5;
USE session_5_bai_5;

CREATE TABLE Users (
	user_id INT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    total_orders INT NOT NULL
);

INSERT INTO Users (user_id, user_name, total_orders) VALUES
(1, 'Nguyen Van A', 0),   
(2, 'Tran Thi B', NULL),      
(3, 'Le Van C', 5),            
(4, 'Pham Minh D', 50),          
(5, 'Hoang Van E', 120),         
(6, 'Vu Thi F', 250),            
(7, 'Dang Van G', 499),          
(8, 'Bui Thi H', 500),           
(9, 'Do Van I', 501),            
(10, 'Ho Van K', 1200);          

SELECT 
    user_name AS Ten_Khach_Hang,
    CASE 
		WHEN total_orders > 500 THEN 'Kim Cương'
		WHEN total_orders BETWEEN 100 AND 500 THEN 'Vàng'
		WHEN total_orders IS NULL THEN 'Bạc'
		ELSE 'Bạc'
	END AS Xep_Hang
FROM Users;
