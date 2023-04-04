USE [my_shop_db]
GO

DECLARE @custom_password VARBINARY(100) = HASHBYTES('SHA2_512', '123456')

/* =================== CUSTOMERS =================== */
INSERT INTO [account]
([id], [username], [password], [full_name], [gender], [email], [phone], [address], [date_of_birth], created_at,
 updated_at)
VALUES ('1FCDD47A-FB91-45C4-B063-583BE3025AD7', 'nvphong', @custom_password, N'Nguyễn Văn Phong', 1,
        'nvphong@myshop.com', '0986118119', N'249 Lê Hồng Phong, Phường 4, Quận 5, Tp.HCM', '1994-09-22',
        '2023-03-21 02:41:16', '2023-03-21 02:41:16')

INSERT INTO [account]
([id], [username], [password], [full_name], [gender], [email], [phone], [address], [date_of_birth], created_at,
 updated_at)
VALUES ('DB316FD5-000C-4FC0-831F-CA28BCBD53C2', 'tmquoc', @custom_password, N'Trần Minh Quốc', 1, 'tmquoc@myshop.com',
        '0987654321', N'123 Tôn Đức Thắng, Phường 2, Quận 8, Tp.HCM', '1997-01-25', '2023-03-24 09:04:14',
        '2023-03-24 09:04:14')

INSERT INTO [account]
([id], [username], [password], [full_name], [gender], [email], [phone], [address], [date_of_birth], created_at,
 updated_at)
VALUES ('17817A7B-9240-4911-912D-6C45A3DC87F3', 'hhduc', @custom_password, N'Huỳnh Huy Đức', 1, 'hhduc@myshop.com',
        '0353098127', N'102 Phan Văn Hớn, Tân Thới Nhất, Quận 12, Tp.HCM', '1991-11-30', '2023-03-06 10:49:34',
        '2023-03-06 10:49:34')

INSERT INTO [account]
([id], [username], [password], [full_name], [gender], [email], [phone], [address], [date_of_birth], created_at,
 updated_at)
VALUES ('F3B007E9-033E-4C42-AB64-866CA3034CA0', 'hththao', @custom_password, N'Huỳnh Thị Hiếu Thảo', 0,
        'hththao@myshop.com', '0389709057', N'1/45 Nguyễn Văn Quá, Đông Hưng Thuận, Quận 12, Tp.HCM',
        '1991-07-22', '2023-03-10 19:34:41', '2023-03-10 19:34:41')

INSERT INTO [account]
([id], [username], [password], [full_name], [gender], [email], [phone], [address], [date_of_birth], created_at,
 updated_at)
VALUES ('35382B92-3B89-4CA5-BEA8-C364DE661C6B', 'dvha', @custom_password, N'Dương Vũ Hà', 0, 'dvha@myshop.com',
        '0977686859', N'36/3E Phan Văn Đối, Bà Điểm, Hóc Môn, Tp.HCM', '1981-11-12', '2023-03-07 20:09:23',
        '2023-03-07 20:09:23')

INSERT INTO [customer] ([id])
VALUES ('1FCDD47A-FB91-45C4-B063-583BE3025AD7'),
       ('DB316FD5-000C-4FC0-831F-CA28BCBD53C2'),
       ('17817A7B-9240-4911-912D-6C45A3DC87F3'),
       ('F3B007E9-033E-4C42-AB64-866CA3034CA0'),
       ('35382B92-3B89-4CA5-BEA8-C364DE661C6B')
/* =================== CUSTOMERS =================== */


/* =================== EMPLOYEES =================== */
INSERT INTO [account]
([id], [username], [password], [full_name], [gender], [email], [phone], [address], [date_of_birth], created_at,
 updated_at)
VALUES ('997C2440-D56C-4D84-A724-5E00FEA3EC1E', 'ldtam', @custom_password, N'Lê Duy Tâm', 1, 'ldtam@myshop.com',
        '0925105840', N'227 Nguyễn Văn Cừ, P4, Quận 5, Tp.HCM', '1995-08-22', '2023-02-10 08:30:21',
        '2023-02-10 08:30:21')

INSERT INTO [account]
([id], [username], [password], [full_name], [gender], [email], [phone], [address], [date_of_birth], created_at,
 updated_at)
VALUES ('4B4CB720-9F18-4C1A-B8B1-C326638E48E1', 'btsang', @custom_password, N'Bùi Tấn Sang', 1, 'btsang@myshop.com',
        '0324831706', N'52 Hồ Thị Kỷ, Phường 1, Quận 10, Tp.HCM', '2000-09-19', '2023-02-13 07:21:38',
        '2023-02-13 07:21:38')

INSERT INTO [account]
([id], [username], [password], [full_name], [gender], [email], [phone], [address], [date_of_birth], created_at,
 updated_at)
VALUES ('0D34C079-DFD0-4AF4-B488-70BCFCB477E8', 'lakiet', @custom_password, N'Lê Anh Kiệt', 1, 'lakiet@myshop.com',
        '0799420203', N'36 An Dương Vương, Phường 9, Quận 5, Tp.HCM', '1996-03-31', '2023-02-04 06:14:29',
        '2023-02-04 06:14:29')

INSERT INTO [account]
([id], [username], [password], [full_name], [gender], [email], [phone], [address], [date_of_birth], created_at,
 updated_at)
VALUES ('BDE46E58-31D4-4EE1-BE19-B0B0B8C14F1F', 'bhtoan', @custom_password, N'Bành Hảo Toàn', 1, 'bhtoan@myshop.com',
        '0523017025', N'356 Trần Hưng Đạo, Phường 2, Quận 5, Tp.HCM', '1999-01-17', '2023-02-23 13:56:04',
        '2023-02-23 13:56:04')

INSERT INTO [employee] ([id], [job_title], [salary])
VALUES ('997C2440-D56C-4D84-A724-5E00FEA3EC1E', N'Nhân Viên Bán Hàng', 20000000),
       ('4B4CB720-9F18-4C1A-B8B1-C326638E48E1', N'Nhân Viên Bán Hàng', 20000000),
       ('0D34C079-DFD0-4AF4-B488-70BCFCB477E8', N'Nhân Viên Bán Hàng', 20000000),
       ('BDE46E58-31D4-4EE1-BE19-B0B0B8C14F1F', N'Nhân Viên Bán Hàng', 20000000)
/* =================== EMPLOYEES =================== */


/* =================== GENRES =================== */
INSERT INTO [genre] ([id], [name], [description], [created_at], [updated_at])
VALUES ('14682BF2-C535-48E9-B0E7-C40379C201C6', N'Tiểu Thuyết',
        N'Tiểu thuyết là thể loại sách dài và tập trung vào việc phát triển các nhân vật và câu chuyện. Nó có thể được viết về bất kỳ chủ đề nào, từ lãng mạn đến phiêu lưu đến khoa học viễn tưởng. Các tác phẩm tiểu thuyết thường có mục đích giải trí và giúp người đọc thoát khỏi thế giới thực.',
        '2023-01-30 22:55:23', '2023-01-30 22:55:23')

INSERT INTO [genre] ([id], [name], [description], [created_at], [updated_at])
VALUES ('ABDE64C7-594F-4A0E-96EA-6BCE60BB1735', N'Kinh Dị',
        N' Thể loại kinh dị là những tác phẩm có nội dung và tình tiết đáng sợ, khiến người đọc cảm thấy sợ hãi, thường bao gồm những yếu tố như ma quỷ, tội ác, đại dịch, thảm họa, và nhiều hơn nữa. Các tác phẩm kinh dị thường được viết để làm tăng cảm giác lo lắng, ám ảnh cho người đọc.',
        '2023-01-30 21:24:10', '2023-01-30 21:24:10')

INSERT INTO [genre] ([id], [name], [description], [created_at], [updated_at])
VALUES ('17452981-3BB2-44B5-BB91-8D6B223FA316', N'Hài Hước',
        N'Thể loại hài hước là những tác phẩm có mục đích làm cho người đọc cười và tạo cảm giác vui vẻ, hạnh phúc. Nó có thể bao gồm những tình huống hài hước, những nhân vật độc đáo, hoặc những câu chuyện hài hước.',
        '2023-01-30 03:39:19', '2023-01-30 03:39:19')

INSERT INTO [genre] ([id], [name], [description], [created_at], [updated_at])
VALUES ('571E8426-0EBA-45A2-899A-AFF91E87558C', N'Khoa Học Viễn Tưởng',
        N' Thể loại khoa học viễn tưởng là những tác phẩm tập trung vào các khía cạnh khoa học, công nghệ và tương lai. Nó có thể bao gồm những câu chuyện về vũ trụ, viễn tưởng về cuộc sống trong tương lai, hoặc những nghiên cứu khoa học mới nhất.',
        '2023-01-30 23:22:19', '2023-01-30 23:22:19')

INSERT INTO [genre] ([id], [name], [description], [created_at], [updated_at])
VALUES ('897E43C8-29B9-4D52-8D3D-81093EF5EC26', N'Lịch Sử',
        N'Thể loại lịch sử là những tác phẩm nghiên cứu và phân tích các sự kiện quan trọng trong quá khứ, để giúp người đọc hiểu rõ hơn về các giai đoạn lịch sử và quá trình phát triển của nhân loại.',
        '2023-01-30 04:53:38', '2023-01-30 04:53:38')

INSERT INTO [genre] ([id], [name], [description], [created_at], [updated_at])
VALUES ('C6FE6BB3-AA46-4FF7-B3D9-04763225BD5B', N'Truyện Tranh',
        N'Thể loại truyện tranh là những tác phẩm vẽ minh họa và có cốt truyện tương tự như tiểu thuyết. Tuy nhiên, chúng sử dụng những hình ảnh vẽ để truyền tải thông điệp và câu chuyện.',
        '2023-01-30 17:54:35', '2023-01-30 17:54:35')

INSERT INTO [genre] ([id], [name], [description], [created_at], [updated_at])
VALUES ('555CF4EA-3C56-46BA-B959-79948323B3D5', N'Truyện Ngắn',
        N'Thể loại truyện ngắn là những tác phẩm có độ dài ngắn, tập trung vào việc kể một câu chuyện, tập trung vào một số nhân vật và sự kiện. Thường xuyên được đăng tải trên các tạp chí, báo hoặc các trang web truyện tranh.',
        '2023-01-30 11:07:36', '2023-01-30 11:07:36')

INSERT INTO [genre] ([id], [name], [description], [created_at], [updated_at])
VALUES ('969532F0-10EF-4990-92C2-8044F1C88531', N'Tâm Lý',
        N'Thể loại tâm lý tập trung vào tình cảm và suy nghĩ của các nhân vật, thường bao gồm các tình huống khó khăn và sự phát triển cá nhân của nhân vật. Nó thường có mục đích giúp người đọc hiểu rõ hơn về các cảm xúc, suy nghĩ và hành vi của con người.',
        '2023-01-30 17:32:04', '2023-01-30 17:32:04')

INSERT INTO [genre] ([id], [name], [description], [created_at], [updated_at])
VALUES ('8BDB0BDF-C665-4DF4-97D1-66FDCEDFD031', N'Kinh Doanh',
        N'Thể loại kinh doanh là những tác phẩm liên quan đến các vấn đề kinh tế, quản lý, marketing và kinh doanh. Nó có thể cung cấp kiến thức và kinh nghiệm cho những người đang làm việc trong lĩnh vực kinh doanh hoặc những người quan tâm đến kinh tế.',
        '2023-01-30 06:06:39', '2023-01-30 06:06:39')

INSERT INTO [genre] ([id], [name], [description], [created_at], [updated_at])
VALUES ('E79E193C-DF4F-4FC7-9B0D-D5E414F3E576', N'Tôn Giáo',
        N'Thể loại tôn giáo tập trung vào các giá trị và tôn giáo của một tôn giáo cụ thể. Nó có thể giúp người đọc hiểu rõ hơn về các tôn giáo khác nhau trên thế giới và các giá trị tôn giáo có thể có ảnh hưởng đến cuộc sống của con người.',
        '2023-01-30 07:46:23', '2023-01-30 07:46:23')

INSERT INTO [genre] ([id], [name], [description], [created_at], [updated_at])
VALUES ('11B58AF7-34D7-4F36-8110-713CA947F456', N'Kỹ Năng Sống',
        N'Thể loại kỹ năng sống tập trung vào việc giúp người đọc học các kỹ năng cần thiết để thành công trong cuộc sống. Nó có thể bao gồm các chủ đề như kỹ năng giao tiếp, kỹ năng quản lý thời gian, kỹ năng tài chính, và các kỹ năng sống khác.',
        '2023-01-30 20:00:06', '2023-01-30 20:00:06')

INSERT INTO [genre] ([id], [name], [description], [created_at], [updated_at])
VALUES ('8A0FA500-7D78-4AFD-8909-57038B6F55AF', N'Kinh Tế',
        N'Thể loại kinh tế tập trung vào các vấn đề kinh tế của một quốc gia hoặc toàn cầu. Nó có thể cung cấp thông tin và hiểu biết về các vấn đề kinh tế, chính trị, xã hội và văn hóa liên quan đến cuộc sống.',
        '2023-01-30 22:31:28', '2023-01-30 22:31:28')

INSERT INTO [genre] ([id], [name], [description], [created_at], [updated_at])
VALUES ('83C07350-AFA9-46EC-B917-29329497FB50', N'Chính Trị',
        N'Thể loại chính trị là những tác phẩm liên quan đến các vấn đề chính trị của một quốc gia hoặc toàn cầu, bao gồm các nghiên cứu về các hệ thống chính trị và các vấn đề chính trị hiện đại.',
        '2023-01-30 20:47:00', '2023-01-30 20:47:00')

INSERT INTO [genre] ([id], [name], [description], [created_at], [updated_at])
VALUES ('2B5B7C99-C386-4FEA-83C5-9C5A82BA3D17', N'Văn Học',
        N'Thể loại văn học tập trung vào các tác phẩm văn học, bao gồm các thể loại như thơ, truyện ngắn, tiểu thuyết, kịch và các tác phẩm văn học khác. Nó giúp người đọc tìm hiểu về các tác phẩm văn học nổi tiếng, cũng như phát triển sự hiểu biết và kỹ năng đọc và viết văn của mình.',
        '2023-01-30 17:03:29', '2023-01-30 17:03:29')
/* =================== GENRES =================== */


/* =================== BOOKS =================== */
INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('3109ACE1-4718-4799-B37C-3FC01A6ACBA8', N'Trên Đường Băng',
        N'Trên Đường Băng là cuốn sách tập hợp những bài viết truyền cảm hứng và hướng dẫn kỹ năng cho các bạn trẻ khi chuẩn bị bước vào đời.',
        'images/books/tren_duong_bang.jpg', '8934974179979', 84000, 60000, 20, 100, 2022, N'Tony Buổi Sáng', N'Trẻ',
        '2023-02-28 10:09:19', '2023-02-28 10:09:19')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('B368061D-A94B-4499-8A8A-31CA0B4DDBBD', N'Cà Phê Cùng Tony',
        N'Có đôi khi vào những tháng năm bắt đầu vào đời, giữa vô vàn ngả rẽ và lời khuyên, khi rất nhiều dự định mà thiếu đôi phần định hướng, thì CẢM HỨNG là điều quan trọng để bạn trẻ bắt đầu bước chân đầu tiên trên con đường theo đuổi giấc mơ của mình. Cà Phê Cùng Tony là tập hợp những bài viết của tác giả Tony Buổi Sáng. Đúng như tên gọi, mỗi bài nhẹ nhàng như một tách cà phê, mà bạn trẻ có thể nhận ra một chút gì của chính mình trong những câu chuyện đơn giản, những lời khuyên đầy tình yêu và những câu chuyện thú vị.',
        'images/books/ca_phe_cung_tony.jpg', '8934974179986', 90000, 62000, 5, 100, 2018, N'Tony Buổi Sáng',
        N'Trẻ', '2023-02-28 02:59:15', '2023-02-28 02:59:15')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('06B8B317-64B6-41C1-B590-F4AD4CCB7A98', N'Sapiens: Lược Sử Loài Người',
        N'Sapiens là một câu chuyện lịch sử lớn về nền văn minh nhân loại – cách chúng ta phát triển từ xã hội săn bắt hái lượm thuở sơ khai đến cách chúng ta tổ chức xã hội và nền kinh tế ngày nay.\nTrong ấn bản mới này của cuốn Sapiens - Lược sử loài người, chúng tôi đã có một số hiệu chỉnh về nội dung với sự tham gia, đóng góp của các thành viên Cộng đồng đọc sách Tinh hoa. Xin trân trọng cảm ơn ý kiến đóng góp tận tâm của các quý độc giả, đặc biệt là ông',
        'images/books/luoc_su_loai_nguoi.jpg', '8934974179993', 299900, 189000, 30, 100, 2021, N'Yuval Noah Harari',
        N'Thế Giới', '2023-02-28 01:17:40', '2023-02-28 01:17:40')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('E22E0546-2C10-408B-A83C-6C86B385A3AF', N'Homo Deus: Lược Sử Tương Lai',
        N'Homo sapiens có phải là một dạng sống siêu đẳng, hay chỉ là một tay đầu gấu địa phương? Làm thế nào con người lại tin rằng họ không chỉ đã kiểm soát thế giới, mà còn mang lại ý nghĩa cho nó? Công nghệ sinh học và trí thông minh nhân tạo đe doạ loài người ra sao? Sinh vật nào có thể kế thừa loài người, và tôn giáo mới nào sẽ được sản sinh?\nVới giọng kể cuốn hút và mới lạ, Harari sẽ dần gợi mở và trả lời những câu hỏi trê, nhờ phân tích chi tiết những luận điểm gây nhiều tranh cãi: chủ nghĩa nhân đạo là một dạng tôn giáo, thứ tôn giáo tôn thờ con người thay vì thần thánh; sinh vật là thuật toán… ông vẽ ra một viễn cảnh tương lai khi Sapiens thất thế và Dữ liệu giáo trở thành một hình mẫu. HOMO DEUS còn bàn sâu hơn về các năng lực mà con người đã tự trang bị để sinh tồn và tiến hoá thành một giống loài ngự trị trên trái đất, để rồi chính trong tiến trình hoàn thiện và nâng cấp các năng lực ấy chúng ta sẽ bị truất quyền kiểm soát bởi một sinh vật mới, mang tên Homo Deus.',
        'images/books/luoc_su_tuong_lai.jpg', '8935235216976', 189000, 115000, 16, 100, 2022, N'Yuval Noah Harari',
        N'Thế Giới', '2023-02-28 13:05:09', '2023-02-28 13:05:09')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('71575D41-4D9E-4618-9216-F6E4804E0036', N'Sống Thực Tế Giữa Đời Thực Dụng',
        N'THỰC DỤNG Ư? KHÔNG HỀ, TÔI CHỈ RẤT THỰC TẾ THÔI!\nCon người muốn trưởng thành đều phải trải qua ba lần lột xác “phá kén hóa bướm”. Lần đầu tiên là khi nhận ra mình không phải trung tâm thế giới. Lần thứ hai là khi phát hiện ra dù cố gắng đến đâu vẫn có những việc cảm thấy thật bất lực. Lần thứ  ba là khi biết rõ có những việc bản thân không thể làm được nhưng vẫn cố tranh đấu đến cùng.\nTrưởng thành là khi chúng ta hiểu ra rằng, không thể sống quá thật thà, quá trong sáng giữa cuộc đời đầy biến cố này. Thay vì kêu than “Thế giới này thực tế đến thực dụng!”, sao bạn không tự hỏi “Thực tế có gì không tốt?” Ít nhất, thực tế sẽ giúp bạn mạnh mẽ hơn, bản lĩnh hơn, dạy bạn cách vượt qua nghịch cảnh, trung thực với chính mình.\nKhi bạn chưa đủ mạnh mẽ, cơ hội dù là nhỏ nhất cũng không đến với bạn.\nKhi bạn đủ tài giỏi, bạn chẳng thể ngăn nổi hàng vạn cơ hội đến với mình, mọi thứ bạn muốn đều chủ động chạy về phía bạn.\nThế giới này làm gì có đưa than ngày tuyết rơi, chỉ có dệt hoa lên gấm thôi. Bạn muốn được người khác dệt hoa lên gấm, trước tiên bạn phải trở thành gấm đã.',
        'images/books/song_thuc_te_giua_cuoc_doi_thuc_dung.jpg', '8935325050244', 120000, 70000, 20, 100, 2021,
        N'Mễ Mông', N'Dân Trí', '2023-02-28 06:19:50', '2023-02-28 06:19:50')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('EF3707E8-0295-4E10-AD14-C35E63FD5936', N'Bạn Đắt Giá Bao Nhiêu?',
        N'Câu trả lời này do chính bạn quyết định, chính bạn “định giá”.\nHơn bốn mươi câu chuyện trong sách xoay quanh các chủ đề tình yêu, hôn nhân, gia đình, sự nghiệp… đến từ chính cuộc sống của tác giả và những người xung quanh, vừa thực tế lại vừa gợi mở, dễ dàng giúp chúng ta liên hệ với tình huống của chính mình. Với những câu chuyện đó, Vãn Tình hi vọng có thể giúp các cô gái thoát khỏi tình cảnh khó khăn, tìm lại bản ngã, sống cuộc đời theo cách mà mình mong muốn.\nĐọc cuốn sách này, đôi khi bạn nên dừng lại và thành thực với bản thân, liệu bạn có đang là phiên-bản-mà-bạn-yêu-thích-nhất, phiên-bản-bạn-mong-muốn-trở-thành. Hãy thử trả lời các câu hỏi: Sự thỏa hiệp có làm bạn hạnh phúc hay không? Bạn có đang cố gắng lấy lòng tất cả mọi người? Bạn có dám thay đổi? Và quan trọng nhất: Bạn đắt giá bao nhiêu?',
        'images/books/ban_dat_gia_bao_nhieu.jpg', '8935325050299', 119000, 74000, 20, 100, 2021,
        N'Vãn Tình', N'Thế Giới', '2023-02-28 12:34:13', '2023-02-28 12:34:13')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('000D1D44-E0DB-4D4B-B3E8-E89DD2E487A3', N'Càng Bình Tĩnh Càng Hạnh Phúc',
        N'Tiếp nối thành công rực rỡ của Bạn đắt giá bao nhiêu?, Khí chất bao nhiêu hạnh phúc bấy nhiêu, Không sợ chậm chỉ sợ dừng,… Vãn Tình đã quay trở lại cùng cuốn sách Càng bình tĩnh Càng hạnh phúc. Đây là cuốn sách thứ bảy của cô được xuất bản tại Việt Nam bởi thương hiệu sách Bloom Books, đánh dấu cho hành trình trưởng thành đầy rực rỡ của Vãn Tình – từ một cô gái trẻ trung, mạnh mẽ trở nên chín chắn, điềm tĩnh và bao dung hơn với cuộc đời.\nGần bảy mươi câu chuyện trong sách xoay quanh các chủ đề tình yêu, hôn nhân, gia đình, sự nghiệp… đến từ chính cuộc sống của tác giả và những người xung quanh, vừa thực tế lại vừa gợi mở, dễ dàng giúp chúng ta liên hệ với tình huống của chính mình. Với những câu chuyện đó, Vãn Tình hy vọng có thể giúp các cô gái trưởng thành, độc lập và tự tin hơn, tìm lại bản ngã và sống cuộc đời theo cách mà mình mong muốn.',
        'images/books/cang_binh_tinh_cang_hanh_phuc.jpg', '8935325007972', 139000, 74000, 20, 100, 2022,
        N'Vãn Tình', N'Thế Giới', '2023-02-28 01:52:17', '2023-02-28 01:52:17')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('2946FE2B-E216-4D66-A9CF-98B47AE88818', N'Càng Kỷ Luật, Càng Tự Do',
        N'KỶ LUẬT vốn là ván cờ bạn phải tự đấu với chính mình. Thắng - bạn sẽ có được “bản năng của người mạnh mẽ nhất”, đó là sự tự kiểm soát bản thân. Thua - bạn mãi sống trong cảm giác tạm bợ, nuối tiếc. Càng dễ dàng dung túng cho những thói quen trì hoãn bao nhiêu, cuộc sống của bạn sẽ đi càng nhanh tới sự mất kiểm soát và thiếu quy hoạch bấy nhiêu.\nHãy kiên trì đặt ra yêu cầu cao với bản thân, từ chối sự mê hoặc của thói tùy tiện đồng thời thiết lập cho mình những thói quen tốt trong hành vi thường ngày. Sự nỗ lực sẽ luôn được đền đáp xứng đáng nếu bạn biết cách đầu tư công sức và thời gian. Bởi một ngày nào đó trong tương lai, những gì bạn làm sẽ phản chiếu đầy đủ trên chính con người và cuộc đời của bạn. \nCÀNG KỶ LUẬT, CÀNG TỰ DO - Mong rằng tại thời điểm kết thúc hành trình với cuốn sách, bạn đã là một phiên bản khác kỷ luật hơn, nhưng tự do hơn.',
        'images/books/cang_ky_luat_cang_tu_do.jpg', '8936186546945', 109000, 52000, 34, 100, 2020,
        N'Ca Tây', N'Thế Giới', '2023-02-28 07:23:20', '2023-02-28 07:23:20')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('58394451-8450-4829-922C-C7AE625F6E38', N'Chuyến Tàu Một Chiều Không Trở Lại',
        N'Giờ khởi hành đã điểm…\nChào bạn, mình là Kien Tran, người đồng hành cùng bạn trong chuyến đi này. Phải nhắn nhủ với bạn trước rằng đây không phải là một chuyến tàu bình thường mà bạn đã từng đi. Có lẽ bạn đã từng nghe tới dự án đưa người lên sao Hỏa bằng chuyến du hành một chiều? Một đi không trở lại. Chuyến tàu này cũng giống như vậy. Một khi bạn đã tới nơi, bạn sẽ không thể quay đầu lại được. Sẽ không có tàu cho bạn quay về, và có lẽ chính bạn cũng không muốn quay về.\nNhưng yên tâm, ít ra bạn không phải đi lên sao Hỏa. Đây là chuyến tàu trong chính tâm trí bạn. Bạn muốn thay đổi tư duy, bạn cần phải book vé. Và bạn đã làm. Mình sẽ trò chuyện cùng bạn trong cả chuyến đi này.\nChuyến đi này sẽ có nhiều chặng đường khác nhau. Mỗi chặng đường sẽ khiến cho bạn phải dừng lại suy nghĩ. Có chặng đường bạn đã quen thuộc rồi, bạn hãy coi chúng như một sự nhắc nhở. Vì đó có thể là những chặng bạn đã đi qua nhưng chưa đủ lòng tin vững vàng để cảm nhận cho trọn vẹn.\nCó những chặng bất ngờ hơn, làm bạn suy nghĩ nhiều hơn. Thậm chí khi đọc xong bạn sẽ nảy sinh tâm lý kháng cự, phản cảm. Đây là những chặng đường thú vị. Mình muốn bạn đừng vội sử dụng tư duy hiện có để đánh giá mà hãy cảm nhận trước. Có thể để đó rồi vài năm sau đánh giá lại. Hãy giữ một cái đầu mở.\nMỗi chặng đường có những đặc trưng và điểm nhấn riêng. Chúng có thể không dài, nhưng tất cả những chặng này cộng lại đã tạo nên hẳn một con đường. Con đường mà bạn phải lên tàu để có thể đi đến đích như bạn thấy chứ không thể đi bộ. Mình muốn bạn xem việc đọc cuốn sách này giống như một hành trình và muốn bạn tận hưởng nó nhiều hơn là cố gắng hoàn thành nó cho xong. Bởi bạn nghĩ xem, việc mình viết cuốn sách này, hay mở ra con đường này trước mặt bạn, về bản chất cũng là một cuộc hành trình.\nKhi bạn tới điểm đến cuối cùng của cuộc hành trình này, bạn sẽ trở thành một con người khác.\nChuyến tàu này sinh ra không phải để đi một vòng quanh thành phố rồi quay lại chỗ cũ. Nó sinh ra để đưa bạn tới điểm đến cách rất xa vị trí hiện tại của bạn.\nBạn đã sẵn sàng cho cuộc hành trình? Hãy vẫy tay chào thế giới cũ của bạn. Thắt dây an toàn.\nChuyến tàu chính thức khởi hành.',
        'images/books/chuyen_tau_mot_chieu_khong_tro_lai.jpg', '8935278604334', 120000, 66000, 20, 100, 2019,
        N'Kiên Trần', N'Hồng Đức', '2023-02-28 05:45:38', '2023-02-28 05:45:38')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('C55BFBE2-ABE2-4FC9-8522-5B45382BD74B', N'Code Dạo Kí Sự',
        N'Nếu các bạn có đọc các blog về lập trình ở Việt Nam thì có lẽ cái tên Tôi đi code dạo không có gì quá xa lạ đối với các bạn.\nVề tác giả của blog Tôi đi code dạo, anh tên thật là Phạm Huy Hoàng, một Developer Full Stack, cựu sinh viên trường FPT University, hiện tại anh đang học Thạc sĩ Computer Science tại Đại học Lancaster ở Anh (học bổng $18000). Trước khi qua Xứ Sở Sương Mù, anh đã từng làm việc tại FPT Software và ASWIG Solutions.\nVới mong muốn chia sẻ kinh nghiệm học lập trình và các kỹ năng mà anh đã trải qua trong suốt quá trình học và làm việc với tư cách là người đi trước cũng như là một Developer Full Stack, nên anh đã quyết định xuất bản sách “Code dạo ký sự – lập trình viên đâu phải chỉ biết code”.\nHiện tại, trên thị trường sách Việt Nam với chủ đề về IT nói chung và lập trình viên nói riêng đều rất khan hiếm, chủ yếu là dịch lại từ tác giả nước ngoài. Chúng ta đã quá mải mê vào những đầu sách dạng “Những cách làm giàu hay đại loại vậy” đã khiến chúng ta ảo tưởng phần nào về bản thân mà thật sự kỹ năng của bạn không cho phép để làm điều đó.\nVì thế chúng ta cần những đầu sách để định hướng nghề nghiệp và xây dựng kiến thức thật vững chắc, khi đó bạn mới có thể nghĩ tới những điều tuyệt vời hơn trong tương lai. “Code dạo ký sự – lập trình viên đâu phải chỉ biết code” sẽ đem lại cho bạn điều đó.\nMột số sách công nghệ hiện nay quá khô cứng, tập trung nhiều vào kĩ thuật nên khó tiếp thu. Số sách cò lại đa phần là về thuật toán, khá cũ, hoặc tập trung vào một công nghệ, rất mau hết hạn.',
        'images/books/code_dao_ki_su.jpg', '8936107810230', 119000, 70000, 0, 0, 2019,
        N'Phạm Huy Hoàng', N'Thanh Niên', '2023-02-28 02:15:53', '2023-02-28 02:15:53')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('D6B469EB-E52A-4007-AC6A-90101CA9EF2C', N'Hello Các Bạn Mình Là Tôi Đi Code Dạo',
        N'Cho tới thời điểm hiện tại, IT vẫn đang là một ngành hot và là sự lựa chọn của rất nhiều các bạn học sinh, sinh viên. Tuy nhiên, cho đến nay, những nguồn tài nguyên học tập trong ngành còn quá ít. Ngoài những tài liệu học tập của trường học thì những tài liệu khác chủ yếu vẫn là các thông tin trên internet hoặc từ những kinh nghiệm của những người đi trước. Để bạn đọc có cái nhìn chân thực và rõ nét hơn về ngành IT, thông qua cuốn sách này, tác giả Phạm Huy Hoàng đã tóm tắt và chia sẻ lại những câu chuyện, bài học kinh nghiệm đã gặp, đã đúc rút được để bạn đọc tham khảo và tìm ra những điểm tương đồng với những gì mình gặp trong khi học tập và làm việc để từ đó rút ra được bài học cho riêng mình.\n“Tôi Đi Code Dạo” là một blog, fanpage và Youtube channel được sáng lập bởi Phạm Huy Hoàng - một full-stack developer đã tốt nghiệp Thạc sĩ ngành Computer Science tại Đại học Lancaster ở Anh (Học bổng 18.000 bảng) và hiện đang làm việc cho một startup công nghệ tại Singapore.\nNội dung mà "Tôi Đi Code Dạo" chia sẻ một nửa là về kĩ thuật lập trình, một nửa còn lại là những kinh nghiệm mà "Mr. Code Dạo" đã học được như: cách deal lương, sắp xếp thời gian, kĩ năng mềm, ngôn ngữ lập trình nên học, con đường phát triển nghề nghiệp… Đó là những điều quan trọng không thua gì kĩ năng lập trình.',
        'images/books/hello_cac_ban_minh_la_toi_di_code_dao.jpg', '3300000017068', 189000, 120000, 22, 100, 2022,
        N'Phạm Huy Hoàng', N'Thanh Niên', '2023-02-28 05:53:29', '2023-02-28 05:53:29')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('4B67CC07-156C-47CE-835C-E1E9EF047049', N'Đắc Nhân Tâm',
        N'Đắc nhân tâm của Dale Carnegie là quyển sách nổi tiếng nhất, bán chạy nhất và có tầm ảnh hưởng nhất của mọi thời đại. Tác phẩm đã được chuyển ngữ sang hầu hết các thứ tiếng trên thế giới và có mặt ở hàng trăm quốc gia. Đây là quyển sách duy nhất về thể loại self-help liên tục đứng đầu danh mục sách bán chạy nhất (best-selling Books) do báo The New York Times bình chọn suốt 10 năm liền.\nRiêng bản tiếng Anh của sách đã bán được hơn 15 triệu bản trên thế giới. Tác phẩm có sức lan toả vô cùng rộng lớn - dù bạn đi đến bất cứ đâu, bất kỳ quốc gia nào cũng đều có thể nhìn thấy. Tác phẩm được đánh giá là quyển sách đầu tiên và hay nhất, có ảnh hưởng làm thay đổi cuộc đời của hàng triệu người trên thế giới.',
        'images/books/dac_nhan_tam.jpg', '8935086854754', 86000, 40000, 20, 100, 2021,
        N'Dale Carnegie', N'Tổng Hợp', '2023-02-28 01:06:04', '2023-02-28 01:06:04')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('FC8B8BB4-61E0-47E8-840C-DCEA5599B5D7', N'Dám Bị Ghét',
        N'Các mối quan hệ xã hội thật mệt mỏi.\nCuộc sống sao mà nhạt nhẽo và vô nghĩa.\nBản thân mình xấu xí và kém cỏi.\nQuá khứ đầy buồn đau còn tương lai thì mờ mịt.',
        'images/books/dam_bi_ghet.jpg', '8935235215283', 96000, 45000, 20, 100, 2018,
        N'Kishimi Ichiro, Koga Fumitake', N'Lao Động', '2023-02-28 15:26:38', '2023-02-28 15:26:38')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('19A94085-2256-47A6-9E41-672BB3C3EE08', N'Đọc Vị Bất Kỳ Ai',
        N'Bạn băn khoăn không biết người ngồi đối diện đang nghĩ gì? Họ có đang nói dối bạn không? Đối tác đang ngồi đối diện với bạn trên bàn đàm phán đang nghĩ gì và nói gì tiếp theo?\nĐỌC người khác là một trong những công cụ quan trọng, có giá trị nhất, giúp ích cho bạn trong mọi khía cạnh của cuộc sống. ĐỌC VỊ người khác để:\nHãy chiếm thế thượng phong trong việc chủ động nhận biết điều cần tìm kiếm - ở bất kỳ ai bằng cách “thâm nhập vào suy nghĩ” của người khác. ĐỌC VỊ BẤT KỲ AI là cẩm nang dạy bạn cách thâm nhập vào tâm trí của người khác để biết điều người ta đang nghĩ. Cuốn sách này sẽ không giúp bạn rút ra các kết luận chung về một ai đó dựa vào cảm tính hay sự võ đoán. Những nguyên tắc được chia sẻ trong cuốn sách này không đơn thuần là những lý thuyết hay mẹo vặt chỉ đúng trong một số trường hợp hoặc với những đối tượng nhất định. Các kết quả nghiên cứu trong cuốn sách này được đưa ra dựa trên phương pháp S.N.A.P - cách thức phân tích và tìm hiểu tính cách một cách bài bản trong phạm vi cho phép mà không làm mếch lòng đối tượng được phân tích. Phương pháp này dựa trên những phân tích về tâm lý, chứ không chỉ đơn thuần dựa trên ngôn ngữ cử chỉ, trực giác hay võ đoán.',
        'images/books/doc_vi_bat_ky_ai.jpg', '8935280911079', 229000, 120000, 37, 100, 2022,
        N'David J Lieberman', N'Lao Động', '2023-02-28 15:14:49', '2023-02-28 15:14:49')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('49E9AA7C-8F29-46D3-BAF4-5E407D63B731', N'Đừng Bao Giờ Đi Ăn Một Mình',
        N'Bạn mong muốn đi tắt đón đầu?\nBạn muốn vững bước đến thành công?\nCông thức để làm được điều này, theo lời bậc thầy về kết nối là Keith Ferrazzi, chính là phải biết làm quen với mọi người. Ferrazzi đã khám phá từ khi còn trẻ rằng điểm khác biệt của những người thành công rực rỡ chính là cách họ vận dụng quyền năng của những mối quan hệ - để mọi người cùng thắng.\nTrong quyển sách Đừng bao giờ đi ăn một mình, Ferrazzi chỉ ra từng bước cách thức - và lý do - mà chính ông đã áp dụng để kết nối với hàng ngàn người là đồng nghiệp, bạn bè có tên trong số danh bạ, những người ông đã giúp đỡ và ngược lại cũng sẵn sàng giúp đỡ ông.\nFerrazzi sinh ra trong một gia đình có cha là công nhân nhà máy thép tỉnh lẻ và mẹ là lao công. Tuy vậy ông đã biết tận dụng khả năng kết nối xuất sắc của mình để dọn đường vào đến Yale, nhận bằng MBA tại Harvard, và giữ những chức vụ lãnh đạo quan trọng. Mặc dù chưa quá 40, Ferrazzi đã tạo được một mạng lưới trải dài từ hành lang ở Washington đến các tên tuổi lớn tại Hollywood. Ông đã được tạp chí Crain bình chọn là một trong số 40 người lãnh đạo kinh doanh dưới 40 tuổi đồng thời là Nhà lãnh đạo tương lai của thế giới tại Diễn đàn Kinh tế Thế giới ở Davos.',
        'images/books/dung_bao_gio_di_an_mot_minh.jpg', '8934974180630', 145000, 80000, 20, 100, 2022,
        N'Keith Ferrazzi, Tahl Raz', N'Trẻ', '2023-02-28 04:11:31', '2023-02-28 04:11:31')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('BCE863CB-EFDC-47E1-B6D2-6F03895E86B7', N'Đừng Lựa Chọn An Nhàn Khi Còn Trẻ',
        N'Trong độ xuân xanh phơi phới ngày ấy, bạn không dám mạo hiểm, không dám nỗ lực để kiếm học bổng, không chịu tìm tòi những thử thách trong công việc, không phấn đấu hướng đến ước mơ của mình. Bạn mơ mộng rằng làm việc xong sẽ vào làm ở một công ty nổi tiếng, làm một thời gian sẽ thăng quan tiến chức. Mơ mộng rằng khởi nghiệp xong sẽ lập tức nhận được tiền đầu tư, cầm được tiền đầu tư là sẽ niêm yết trên sàn chứng khoán. Mơ mộng rằng muốn gì sẽ có đó, không thiếu tiền cũng chẳng thiếu tình, an hưởng những năm tháng êm đềm trong cuộc đời mình. Nhưng vì sao bạn lại nghĩ rằng bạn chẳng cần bỏ ra chút công sức nào, cuộc sống sẽ dâng đến tận miệng những thứ bạn muốn? Bạn cần phải hiểu rằng: Hấp tấp muốn mau chóng thành công rất dễ khiến chúng ta đi vào mê lộ. Thanh xuân là khoảng thời gian đẹp đẽ nhất trong đời, cũng là những năm tháng then chốt có thể quyết định tương lai của một người. Nếu bạn lựa chọn an nhàn trong 10 năm, tương lai sẽ buộc bạn phải vất vả trong 50 năm để bù đắp lại. Nếu bạn bươn chải vất vả trong 10 năm, thứ mà bạn chắc chắn có được là 50 năm hạnh phúc. Điều quý giá nhất không phải là tiền mà là tiền bạc. Thế nên, bạn à, đừng lựa chọn an nhàn khi còn trẻ.',
        'images/books/dung_lua_chon_an_nhan_khi_con_tre.jpg', '8935325001826', 99000, 42000, 20, 100, 2021,
        N'Cảnh Thiên', N'Thế Giới', '2023-02-28 01:01:34', '2023-02-28 01:01:34')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('F8351627-F107-4A41-89B0-5BD5BCEAEC01', N'Hành Tinh Của Một Kẻ Nghĩ Nhiều',
        N'“Đó là mùa hè năm 2020, mùa hè của COVID-19 và một ngàn vạn khủng hoảng tuổi đôi mươi. Đó là mùa hè mình bắt chuyến bay sớm nhất có thể vào ngày 20 tháng 3 để chạy khỏi nước Anh đang bùng dịch, bị kẹt lại sân bay Bangkok trong 24 giờ đồng hồ vì chuyến bay quá cảnh về Sài Gòn bị huỷ\nĐó là mỗi đêm mùa hè nằm trên giường stress chuyện deadline luận văn, stress chuyện thất nghiệp không kiếm ra tiền, stress chuyện bỏ lỡ cơ hội thực tập giúp ích cho sự nghiệp của mình, stress chuyện học hành dở dang - không biết bao giờ mới có thể quay lại Anh và hoàn thành tấm bằng đại học, stress chuyện tồn tại một cách mơ hồ, không biết mình là ai.”',
        'images/books/hanh_tinh_cua_mot_ke_nghi_nhieu.jpg', '8935325005312', 86000, 33000, 17, 100, 2023,
        N'Nguyễn Đoàn Minh Thư', N'Thế Giới', '2023-02-28 10:22:20', '2023-02-28 10:22:20')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('B5764C8C-E859-476D-85DF-2C50AB256CD8', N'Hành Trình Về Phương Đông',
        N'Một trong những tác phẩm đương đại độc đáo nhất về văn hoá phương Đông. Hành trình về phương Đông kể về những trải nghiệm của một đoàn khoa học gồm các chuyên gia hàng đầu của Hội Khoa Học Hoàng Gia Anh được cử sang Ấn Độ nghiên cứu về huyền học và những khả năng siêu nhiên của con người. Suốt hai năm trời rong ruổi khắp các đền chùa Ấn Độ, chúng kiến nhiều pháp luật, nhiều cảnh mê tín dị đoan, thậm chí lừa đảủa nhiều pháp sư, đạo sĩọ được tiếp xúc với những vị thế, họ được chứng kiến, trải nghiệm, hiểu biết sâu sắc về các khoa học cổ xưa và bí truyền của văn hóa Ấn Độ như Yoga, thiền định, thuật chiêm duyên, nghiệp báo, luật nhân quả, cõi sống và cõi chế\nĐúng lúc một cuộc đối thoại cởi mở và chân thành đang sắp diễn ra với các đạo sĩ bậc thầy, thì đoàn nhận được tối hậu thư từ chính quyền Anh Quốc là phải ngừng ngay việc nghiên cứu, tức khắc hồi hương và bị buộc phải im lặng, không được phát ngôn về bất cứ điều gì mà họ đã chứng nghiệm. Sau cùng ba nhà khoa học trong đoàn đã chấp nhận bỏ lại tất cả sau lưng, ở lại Ấn Độ tiếp tục nghiên cứu và cuối cùng trở thành tu sĩ. Trong số đó có giáo sư Spalding - tác giả hồi ký đặc biệt này.\nHành trình về phương Đông - thông qua ngòi bút của dịch giả Nguyên phong - giúp người đọc đến gần với những nét văn hoá của phương Đông, khám phá các giá trị vình hằng của cuộc sống. Tác phẩm luôn nằm trong top 10 cuốn sách bán chạy nhất của First News, được đánh giá là một trong những cuốn sách đương đại độc đáo, khác biệt nhất về phương Đông.',
        'images/books/hanh_trinh_ve_phuong_dong.jpg', '8935086855034', 138000, 82000, 20, 100, 2021,
        N'Dr Blair Thomas Spalding', N'Thế Giới', '2023-02-28 07:45:19', '2023-02-28 07:45:19')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('CA082C5B-A0DA-450E-86AD-9DC692990333', N'Khéo Ăn Nói Sẽ Có Được Thiên Hạ',
        N'Trong xã hội thông tin hiện đại, sự im lặng không còn là vàng nữa, nếu không biết cách giao tiếp thì dù là vàng cũng sẽ bị chôn vùi. Trong cuộc đời một con người, từ xin việc đến thăng tiến, từ tình yêu đến hôn nhân, từ tiếp thị cho đến đàm phán, từ xã giao đến làm việc... không thể không cần đến kĩ năng và khả năng giao tiếp. Khéo ăn khéo nói thì đi đâu, làm gì cũng gặp thuận lợi. Không khéo ăn nói, bốn bề đều là trở ngại, khó khăn. Trong thời đại thông tin và liên lạc phát triển nhanh chóng, tin tức được cập nhật liên tục, các công cụ thông tin và kĩ thuật truyền thông được ứng dụng rộng rãi như ngày nay thì việc khéo ăn nói đã trở thành “cái tài số một thiên hạ”. Trong khoảng thời gian ngắn nhất, nếu ai có thể nêu bật được khả năng, thực lực của mình cho đối phương biết thì đó sẽ là người chiến thắng. Chính vì vậy mà câu nói “Khéo ăn nói sẽ có được thiên hạ” rất có ý nghĩa. Vậy, như thế nào mới gọi là biết cách ăn nói? Nói năng lưu loát, không ấp úng có được gọi là biết cách nói chuyện không? Nói ngắn gọn, nói ít nhưng ý nghĩa thâm sâu có được gọi là biết cách nói chuyện không? Hay nhất định phải nói nhiều mới là biết nói chuyện?',
        'images/books/kheo_an_kheo_noi_se_co_duoc_thien_ha.jpg', '8936067605693', 130000, 53000, 40, 100, 2022,
        N'Trác Nhã', N'Văn Học', '2023-02-28 11:57:55', '2023-02-28 11:57:55')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('83F3665A-7143-48BD-AEEB-3BBADE2AF2D4', N'Khi Bạn Đang Mơ Thì Người Khác Đang Nỗ Lực',
        N'Có rất nhiều người hỏi tôi: “Tại sao em có thành tích tốt, cũng không lười, nhưng vẫn không đủ xuất sắc?”. Tôi chỉ có một câu trả lời cho vấn đề này: Bạn vẫn chưa thực sự thay đổi bản thân nhưng lại ép mình phải thành công, vì thế bạn mãi mãi không biết mình có thể xuất sắc thế nào.\nMột huấn luyện viên dạy bơi cho trẻ em từng nói với tôi: “Ngài có biết làm thế nào để một đứa trẻ không biết bơi lại nhanh chóng học bơi được không? Rất đơn giản, chỉ cần  thả trẻ xuống nước, để trẻ giãy giụa, làm quen với cảm giác ở dưới nước”. Tôi hỏi cậu ấy, làm như thế có nguy hiểm quá không? Huấn luyện viên nói rằng không cần quá lo lắng, chỉ cần kịp thời giúp sức, cứ luyện tập từ từ, bất kể ai cũng đều có thể biết bơi. Bởi vì trong tình huống nguy hiểm, tiềm năng của con người mới được bộc lộ rõ, học tập hay làm việc đều vừa nhanh vừa hiệu quả.',
        'images/books/khi_ban_uoc_mo_thi_nguoi_khac_dang_no_luc.jpg', '8936067606317', 136000, 43000, 40, 100, 2022,
        N'Vĩ Nhân', N'Văn Học', '2023-02-28 18:03:39', '2023-02-28 18:03:39')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('54E34952-A191-4986-9A62-66D58DC63331', N'Không Diệt Không Sinh Đừng Sợ Hãi',
        N'Nhiều người trong chúng ta tin rằng cuộc đời của ta bắt đầu từ lúc chào đời và kết thúc khi ta chết. Chúng ta tin rằng chúng ta tới từ cái Không, nên khi chết chúng ta cũng không còn lại gì hết. Và chúng ta lo lắng vì sẽ trở thành hư vô.\nBụt có cái hiểu rất khác về cuộc đời. Ngài hiểu rằng sống và chết chỉ là những ý niệm không có thực. Coi đó là sự thực, chính là nguyên do gây cho chúng ta khổ não. Bụt dạy không có sinh, không có diệt, không tới cũng không đi, không giống nhau cũng không khác nhau, không có cái ngã thường hằng cũng không có hư vô. Chúng ta thì coi là Có hết mọi thứ. Khi chúng ta hiểu rằng mình không bị hủy diệt thì chúng ta không còn lo sợ. Đó là sự giải thoát. Chúng ta có thể an hưởng và thưởng thức đời sống một cách mới mẻ.\nKhông diệt Không sinh Đừng sợ hãi là tựa sách được Thiền sư Thích Nhất Hạnh viết nên dựa trên kinh nghiệm của chính mình. Ở đó, Thầy Nhất Hạnh đã đưa ra một thay thế đáng ngạc nhiên cho hai triết lý trái ngược nhau về vĩnh cửu và hư không: “Tự muôn đời tôi vẫn tự do. Tử sinh chỉ là cửa ngõ ra vào, tử sinh là trò chơi cút bắt. Tôi chưa bao giờ từng sinh cũng chưa bao giờ từng diệt” và “Nỗi khổ lớn nhất của chúng ta là ý niệm về đến-đi, lui-tới.”\nĐược lặp đi lặp lại nhiều lần, Thầy khuyên chúng ta thực tập nhìn sâu để chúng ta hiểu được và tự mình nếm được sự tự do của con đường chính giữa, không bị kẹt vào cả hai ý niệm của vĩnh cửu và hư không. Là một thi sĩ nên khi giải thích về các sự trái ngược trong đời sống, Thầy đã nhẹ nhàng vén bức màn vô minh ảo tưởng dùm chúng ta, cho phép chúng ta (có lẽ lần đầu tiên trong đời) được biết rằng sự kinh hoàng về cái chết chỉ có nguyên nhân là các ý niệm và hiểu biết sai lầm của chính mình mà thôi.\nTri kiến về sống, chết của Thầy vô cùng vi tế và đẹp đẽ. Cũng như những điều vi tế, đẹp đẽ khác, cách thưởng thức hay nhất là thiền quán trong thinh lặng. Lòng nhân hậu và từ bi phát xuất từ suối nguồn thâm tuệ của Thiền sư Thích Nhất Hạnh là một loại thuốc chữa lành những vết thương trong trái tim chúng ta.',
        'images/books/khong_diet_khong_sinh_dung_so_hai.jpg', '8935278607311', 110000, 51000, 20, 100, 2022,
        N'Thích Nhất Hạnh', N'Thế Giới', '2023-02-28 15:25:58', '2023-02-28 15:25:58')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('8AF4B174-BF9D-4278-B5D0-12D2020F11D3', N'Luật Hấp Dẫn',
        N'“Nếu bạn nghĩ về bất cứ điều gì trong một giây, bạn sẽ biến điều đó thành một thực tại không thể thấy được kéo dài một giây. Nếu bạn nghĩ về nó trong nhiều giờ, nhiều ngày và nhiều năm, bằng một cách nào đó, bạn sẽ mang thực tế đó đến với mình trong thế giới vật chất.”\nLuật hấp dẫn giới thiệu những quy luật phổ quát được áp dụng trong mọi khía cạnh tâm thức của con người, từ đó giúp chúng ta có thể tận dụng tối đa sức mạnh của tâm trí để thu được thành công tối đa trong cuộc sống và sự nghiệp.',
        'images/books/luat_hap_dan.jpg', '8936066693783', 129000, 67000, 20, 100, 2022,
        N'Prentice Mulford', N'Thanh Niên', '2023-02-28 14:05:39', '2023-02-28 14:05:39')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('867DB237-80BD-4B85-A4EC-36D0ABF44571', N'Mắt Biếc',
        N'Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát)',
        'images/books/mat_biet.jpg', '8934974163442', 110000, 80000, 0, 100, 2022,
        N'Nguyễn Nhật Ánh', N'Trẻ', '2023-02-28 10:48:16', '2023-02-28 10:48:16')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('A17AF6DC-DCAB-4398-B25A-C59F300D0AEA', N'Nhà Giả Kim',
        N'Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người.\nTiểu thuyết Nhà giả kim của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm thay đổi cuộc đời người đọc.',
        'images/books/nha_gia_kim.jpg', '8935235226272', 79000, 33000, 10, 100, 2020,
        N'Paulo Coelho', N'Hội Nhà Văn', '2023-02-28 15:13:23', '2023-02-28 15:13:23')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('DC2D4386-3C72-4330-8868-B0E14B00981E', N'Sức Mạnh Tiềm Thức',
        N'Là một trong những quyển sách về nghệ thuật sống nhận được nhiều lời ngợi khen và bán chạy nhất mọi thời đại, Sức Mạnh Tiềm Thức đã giúp hàng triệu độc giả trên thế giới đạt được những mục tiêu quan trọng trong đời chỉ bằng một cách đơn giản là thay đổi tư duy.\nSức Mạnh Tiềm Thức giới thiệu và giải thích các phương pháp tập trung tâm thức nhằm xoá bỏ những rào cản tiềm thức đã ngăn chúng ta đạt được những điều mình mong muốn.\nSức Mạnh Tiềm Thức không những có khả năng truyền cảm hứng cho người đọc, mà nó còn rất thực tế vì được minh hoạ bằng những ví dụ sinh động trong cuộc sống hằng ngày. Từ đó, Sức Mạnh Tiềm Thức giúp độc giả vận dụng năng lực trí tuệ phi thường tiềm ẩn troing mỗi người để tạo dựng sự tự tin, xây dựng các mối quan hệ hoà hợp, đạt được thành công trong sự nghiệp, vượt qua những nỗi sợ hãi và ám ảnh, xua đi những thói quen tiêu cực, và thậm chí còn hướng dẫn cách ta chữa lành những vết thương về thể chất cũng như tâm hồn để có sự bình an, hạnh phúc trọn vẹn trong cuộc sống.',
        'images/books/suc_manh_tiem_thuc.jpg', '8935086854617', 128000, 82000, 20, 100, 2021,
        N'Joseph Murphyc', N'Tổng Hợp', '2023-02-28 23:05:13', '2023-02-28 23:05:13')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('D61FB6A3-21B8-43BB-BA96-E780F1236CFD', N'Tâm Lý Học Về Tiền',
        N'Tiền bạc có ở khắp mọi nơi, nó ảnh hưởng đến tất cả chúng ta, và khiến phần lớn chúng ta bối rối. Mọi người nghĩ về nó theo những cách hơi khác nhau một chút. Nó mang lại những bài học có thể được áp dụng tới rất nhiều lĩnh vực trong cuộc sống, như rủi ro, sự tự tin, và hạnh phúc. Rất ít chủ đề cung cấp một lăng kính phóng to đầy quyền lực giúp giải thích vì sao mọi người lại hành xử theo cách họ làm hơn là về tiền bạc. Đó mới là một trong những chương trình hoành tráng nhất trên thế giới.\nChúng ta hiếm khi lâm vào hoàn cảnh nợ ngập đầu ư? Biết tiết kiệm để dành cho lúc khốn khó hơn ư? Chuẩn bị sẵn sàng cho việc nghỉ hưu? Có những cái nhìn thiết thực về mối quan hệ giữa tiền và hạnh phúc của chúng ta hơn phải không?\nChúng ta đều làm những điều điên rồ với tiền bạc, bởi vì chúng ta đều còn khá mới mẻ với trò chơi này và điều có vẻ điên rồ với bạn lại có khi hợp lý với tôi. Nhưng không ai là điên rồ cả – chúng ta đều đưa ra các quyết định dựa trên những trải nghiệm độc đáo riêng có mang vẻ hợp lý với mình ở bất cứ thời điểm nào.',
        'images/books/tam_ly_hoc_ve_tien.jpg', '8936066689953', 189000, 120000, 20, 100, 2022,
        N'Morgan Housel', N'Dân Trí', '2023-02-28 08:17:52', '2023-02-28 08:17:52')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('526A7A16-3B5B-49C0-A135-D2FF8878664D', N'Thời Niên Thiếu Của Anh Và Em',
        N'Là ai đã từng cầm nhành cây viết tên mình dưới nắng hè chói chang rực rỡ, nói với cậu thiếu niên đó tên mình có nghĩa là, trái tim này vẫn luôn ở đây;\nLà ai đã từng dùng ánh mắt trong veo quá đỗi dụ dỗ cô đọc thuộc tên mình, dùng đầu lưỡi trao viên kẹo chua chua ngọt ngọt từ miệng mình sang miệng cô;\nLà ai đã từng kéo cô chạy như bay trong khu xưởng bỏ hoang, ngắm nhìn phép thuật thắp lên hàng ngàn ánh đèn từ những ô cửa của những ngôi nhà xung quanh;\nLà ai đã từng lao lên bậc thang chạy dọc theo sân khấu ngoài trời dưới cơn mưa tầm tã, đôi bàn tay nắm chặt của đôi trẻ lơ lửng giữa không trung.',
        'images/books/thoi_nien_thieu_cua_anh_va_em.jpg', '8936186540035', 120000, 87000, 22, 0, 2019,
        N'Cửu Nguyệt Hi', N'Hà Nội', '2023-02-28 00:34:04', '2023-02-28 00:34:04')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('507C173B-C6F2-4E39-890F-C3A243268D34', N'Tuổi Trẻ Đáng Giá Bao Nhiêu',
        N'“Bạn hối tiếc vì không nắm bắt lấy một cơ hội nào đó, chẳng có ai phải mất ngủ.\nBạn trải qua những ngày tháng nhạt nhẽo với công việc bạn căm ghét, người ta chẳng hề bận lòng.\nBạn có chết mòn nơi xó tường với những ước mơ dang dở, đó không phải là việc của họ.\nSuy cho cùng, quyết định là ở bạn. Muốn có điều gì hay không là tùy bạn.\nNên hãy làm những điều bạn thích. Hãy đi theo tiếng nói trái tim. Hãy sống theo cách bạn cho là mình nên sống.\nVì sau tất cả, chẳng ai quan tâm.”\n“Tôi đã đọc quyển sách này một cách thích thú. Có nhiều kiến thức và kinh nghiệm hữu ích, những điều mới mẻ ngay cả với người gần trung niên như tôi.\nTuổi trẻ đáng giá bao nhiêu? được tác giả chia làm 3 phần: HỌC, LÀM, ĐI.\nNhưng tôi thấy cuốn sách còn thể hiện một phần thứ tư nữa, đó là ĐỌC.\nHãy đọc sách, nếu bạn đọc sách một cách bền bỉ, sẽ đến lúc bạn bị thôi thúc không ngừng bởi ý muốn viết nên cuốn sách của riêng mình.\nNếu tôi còn ở tuổi đôi mươi, hẳn là tôi sẽ đọc Tuổi trẻ đáng giá bao nhiêu? nhiều hơn một lần.”\n- Đặng Nguyễn Đông Vy, tác giả, nhà báo',
        'images/books/tuoi_tre_dang_gia_bao_nhieu.jpg', '8935235231115', 90000, 62000, 20, 100, 2021,
        N'Rosie Nguyễn', N'Hội Nhà Văn', '2023-02-28 17:00:14', '2023-02-28 17:00:14')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('190D0C8E-2929-4EDD-B5D2-88320882E9BD', N'Thần Thoại Bắc Âu',
        N'Sau những thế giới hư cấu tuyệt vời trong những tác phẩm trước đó, Neil Gaiman, một trong những cây bút hấp dẫn của thể loại truyện giả tưởng, đã trở lại với một thế giới nguyên sơ và nguyên bản hơn với các vị thần Bắc Âu, cùng Odin, Thor và Loki, Cây tần bì Yggdrasil nối liền cửu giới, những người khổng lồ, những người lùn.\nTập sách nhỏ này kể lại những câu chuyện mà hẳn nhiều người đã biết nhưng hoặc không rõ hoặc đã lãng quên. Neil Gaiman, bằng tài năng xuất chúng và tình yêu sâu sắc dành cho thần thoại của một vùng đất lạnh giá với những đêm đông dài thật dài và những ngày hè vô tận, đã thổi một hơi thở mới vào Thần thoại Bắc Âu, xâu chuỗi những mẩu chuyện nhỏ thành một hành trình liền mạch, mê say và cuốn hút, từ “băng giá và lửa cháy buổi đầu vũ trụ cho tới lửa cháy và băng giá đã kết thúc thế giới.”',
        'images/books/thuan_thoai_bac_au.jpg', '8935235220164', 110000, 51000, 25, 100, 2019,
        N'Neil Gaiman', N'Văn Học', '2023-02-28 05:46:10', '2023-02-28 05:46:10')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('A4B1E239-C985-47D4-95E5-8684802364FB', N'Nghệ Thuật Tư Duy Rành Mạch',
        N'Mọi người đều mắc sai lầm.\nNhững sai lầm trong việc ra quyết định đều bắt nguồn từ các lỗi tư duy tưởng như đơn giản, nhưng dần dà chúng tích tụ thành những thành kiến khó bỏ. Vậy mà hiếm khi chúng ta nhận ra điều đó, nên sai lầm cứ nối tiếp sai lầm, dẫn đến bao hối tiếc vì những quyết định không đúng cho cuộc đời mình: Cứ mãi đeo bám một công việc dù biết trước chẳng thu được lợi lộc gì; cho rằng một dự án thành công suôn sẻ là do tài năng và trí lực, còn thất bại do ngoại cảnh khách quan; bán cổ phiếu lúc đã quá trễ, hoặc bán quá sớm… Và đó chỉ là một vài trong số hàng loạt các sai lầm “cơ bản” được Dobelli mổ xẻ phân tích qua 99 chương sách ngắn gọn, súc tích với những ví dụ minh họa thiết thực giúp ta có thể nhận diện và né tránh chúng.\nĐơn giản, rõ ràng và toàn diện một cách đáng  ngạc nhiên, cuốn cẩm nang nhất định phải có này có thể thay đổi mãi mãi cách ta suy nghĩ, giúp ta quyết định sáng suốt hơn mỗi ngày ở bất cứ đâu,  trong bất cứ tình huống nào.',
        'images/books/nghe_thuat_tu_duy_ranh_mach.jpg', '8935235219885', 118000, 67000, 26, 100, 2018,
        N'Rolf Dobell', N'Thế Giới', '2023-02-28 10:36:35', '2023-02-28 10:36:35')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('46980A5E-2100-44CA-B725-D2A2B0CB43C6', N'Tôi Tự Học',
        N'Sách “Tôi tự học” của tác giả Nguyễn Duy Cần đề cập đến khái niệm, mục đích của học vấn đối với con người đồng thời nêu lên một số phương pháp học tập đúng đắn và hiệu quả. Tác giả cho rằng giá trị của học vấn nằm ở sự lĩnh hội và mở mang tri thức của con người chứ không đơn thuần thể hiện trên bằng cấp. Trong xã hội ngày nay, không ít người quên đi ý nghĩa đích thực của học vấn, biến việc học của mình thành công cụ để kiếm tiền nhưng thực ra nó chỉ là phương tiện để đưa con người đến thành công mà thôi. Bởi vì học không phải để lấy bằng mà học còn để “biết mình” và để “đối nhân xử thế”.\nCuốn sách này tuy đã được xuất bản từ rất lâu nhưng giá trị của sách vẫn còn nguyên vẹn. Những tư tưởng, chủ đề của sách vẫn phù hợp và có thể áp dụng trong đời sống hiện nay. Thiết nghĩ, cuốn sách này rất cần cho mọi đối tượng bạn đọc vì không có giới hạn nào cho việc truy tầm kiến thức, việc học là sự nghiệp lâu dài của mỗi con người. Đặc biệt, cuốn sách là một tài liệu quý để các bạn học sinh – sinh viên tham khảo, tổ chức lại việc học của mình một cách hợp lý và khoa học. Các bậc phụ huynh cũng cần tham khảo sách này để định hướng và tư vấn cho con em mình trong quá trình học tập.',
        'images/books/toi_tu_hoc.jpg', '8934974177708', 118000, 67000, 25, 100, 2022,
        N'Thu Giang, Nguyễn Duy Cần', N'Trẻ', '2023-02-28 02:06:22', '2023-02-28 02:06:22')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('D8214777-7363-434A-9A9F-F32BF2354C8D', N'Giao Tiếp Bất Kỳ Ai',
        N'Một doanh nghiệp thành công hay thất bại thường tùy thuộc vào những kỹ năng giao tiếp nhiều hơn là phát triển kỹ thuật. Cuốn sách tuyệt vời này giúp bạn nâng cao các kỹ năng giao tiếp như nghe và nói trên mọi phương diện; với cả những yếu tố khác như: ngôn ngữ cơ thể, hành vi ứng xử và thái độ… giúp bạn có thể chinh phục được khách hàng, nhà cung cấp và tất cả những người liên quan tới bạn. Jo và Bennie thừa đủ tư cách để giúp bạn phát triển mạnh mẽ doanh nghiệp của mình.',
        'images/books/giao_tiep_bat_ky_ai.jpg', '8935280908352', 55000, 22000, 25, 100, 2021,
        N'Jo Condrill, Bennie Bough', N'Công Thương', '2023-02-28 22:04:11', '2023-02-28 22:04:11')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('AAD0D43A-5078-49C4-AA48-5F0B53F86AB7', N'Mặt Dày Tâm Đen',
        N'Mặt dày tâm đen là cuốn cẩm nang kết hợp tri thức Đông Tây, khám phá cách thức áp dụng binh pháp trận mạc của Á Đông cùng những tư duy văn hóa để có được tinh thần bền bỉ và rèn luyện những kỹ năng kinh doanh trong thời đại ngày nay. Với công thức thành công được đúc kết từ cuốn sách Hậu Hắc học xuất bản năm 1911 (và bị cấm tại Trung Quốc từ thời điểm đó), Mặt dày tâm đen khẳng định rằng sẽ không có sự khai sáng thực sự nếu chúng ta không nhận thức đầy đủ về những mặt tối. Để thành công, một người phải “dày mặt” để làm tấm khiên chống lại lòng tự trọng của chính mình, cùng một trái “tim đen” để thực thi đến cùng. Kết quả sẽ là hình tượng về một người hùng trong thế giới hiện đại, một người không ngừng suy ngẫm và hành động bất chấp mọi ràng buộc. Vượt qua cả Binh pháp Tôn Tử, cuốn sách này sẽ giúp độc giả tìm thấy người chiến binh bên trong bản thân mình và chinh phục mọi thứ trên con đường mình đã chọn, cũng như biến mọi trở ngại tiêu cực thành lợi thế cho mình.',
        'images/books/mat_day_tam_den.jpg', '8794069303388', 169000, 110000, 15, 100, 2021,
        N'Chin Ning Chu', N'Hồng Đức', '2023-02-28 16:50:03', '2023-02-28 16:50:03')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('5B14CEAC-29F9-4AF8-9C60-BCDF0EFD4071', N'Chó sủa nhầm cây',
        N'Bạn có biết:\n- Các thủ khoa hiếm khi trở thành triệu phú, và nhược điểm lớn nhất có khi lại là ưu điểm tuyệt vời nhất mà ai ai cũng khao khát sở hữu.\n- Ở công ty, sự chăm chỉ đang bị thổi phồng quá mức, còn những trò nịnh bợ lại thường mang đến kết quả tốt, và liệu đề cao chính nghĩa hay sa vào tà đạo mới là con đường dẫn đến thành công?\n- Những người lính Navy SEAL và những nhân viên bán bảo hiểm có một điểm chung quan trọng, và cách sử dụng nguyên tắc WNGF trong thiết kế trò chơi để biến đống bài tập chán ngắt thành những trò chơi hấp dẫn.\nRất nhiều lời khuyên về thành công rất logic, đầy cảm hứng, và sai bét. Bằng cách nhìn qua lăng kính khoa học để xem những người cực kỳ thành công khác với mình ở những điểm nào, ta học được cách để trở nên giống họ—và nhận ra trong vài trường hợp, không được như họ hóa ra lại tốt hơn.\nCHÓ SỦA NHẦM CÂY - BARKING UP THE WRONG TREE - là quyển sách gây tiếng vang, liên tục nằm trong danh sách bestseller Amazon của tác giả kiêm chủ trang blog Barking up the wrong tree - Eric Barker. Xuyên suốt nội dung sách, Eric sẽ cùng chúng ta lý giải một cách đầy hóm hỉnh nhưng không kém phần chặt chẽ những quan niệm khác nhau về thành công từ trước đến nay. Và ở cuối con đường đó, mỗi người chúng ta sẽ tự tìm thấy ngưỡng cửa thành công cho riêng mình.',
        'images/books/cho_sua_nham_cay.jpg', '9786043460315', 150000, 86000, 20, 100, 2022,
        N'Eric Barker', N'Kinh tế', '2023-02-28 16:50:03', '2023-02-28 16:50:03')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('7454C139-01D1-4896-836D-23984A161AB6', N'Sách Thay Đổi Cuộc Sống Với Nhân Số Học',
        N'Cuốn sách Thay đổi cuộc sống với Nhân số học là tác phẩm được chị Lê Đỗ Quỳnh Hương phát triển từ tác phẩm gốc “The Complete Book of Numerology” của tiến sỹ David A. Phillips, khiến bộ môn Nhân số học khởi nguồn từ nhà toán học Pythagoras trở nên gần gũi, dễ hiểu hơn với độc giả Việt Nam.\nĐầu năm 2020, chuỗi chương trình “Thay đổi cuộc sống với Nhân số học” của biên tập viên, người dẫn chương trình quen thuộc tại Việt Nam Lê Đỗ Quỳnh Hương ra đời trên Youtube, với mục đích chia sẻ kiến thức, giúp mọi người tìm hiểu và phát triển, hoàn thiện bản thân, các mối quan hệ xã hội thông qua bộ môn Nhân số học. Chương trình đã nhận được sự yêu mến và phản hồi tích cực của rất nhiều khán giả và độc giả sau mỗi tập phát sóng.\nNhân số học là một môn nghiên cứu sự tương quan giữa những con số trong ngày sinh, cái tên với cuộc sống, vận mệnh, đường đời và tính cách của mỗi người. Bộ môn này đã được nhà toán học Pythagoras khởi xướng cách đây 2.600 năm và sau này được nhiều thế hệ học trò liên tục kế thừa, phát triển.',
        'images/books/thay_doi_cuoc_song_voi_nhan_so_hoc.jpg', '8935086853634', 248000, 127000, 25, 100, 2020,
        N'Lê Đỗ Quỳnh Hương', N'Tổng Hợp', '2023-02-28 16:50:03', '2023-02-28 16:50:03')

INSERT INTO [book] ([id], [name], [description], [image], [isbn], [price], [original_price], [discount],
                    [quantity],
                    [publication_year], [author], [publisher], [created_at], [updated_at])
VALUES ('1C475A1F-6652-46A0-89F3-E267D2BD2CC7', N'Yêu Những Điều Không Hoàn Hảo',
        N'Đại đức Hae Min sinh ra và lớn lên tại Hàn Quốc. Sau khi hoàn thành bằng Thạc sĩ Tôn giáo học đối chiếu ở Đại học Havard và Tiến sĩ Tôn giáo học ở Đại học Princeton, ông ở lại Mỹ tham gia giảng dạy về tôn giáo ở trường Đại học Hampshire, Massachusetts. Không chỉ dừng lại ở nghiên cứu lý thuyết, mùa xuân năm 2000 ông quyết định xuất gia theo tông phái Tào Khê, một tông phái tiêu biểu của Phật giáo Hàn Quốc. Năm 2015, Đại đức Hae Min trở về Seoul, cùng nhiều chuyên gia mở trường Trị liệu tâm hồn, điều trị miễn phí cho những người gặp bất hạnh trong cuộc sống hay đang mang trong lòng nhiều khổ tâm. Đại đức Haemin là một trong những người rất có ảnh hưởng tới giới trẻ Hàn Quốc, trang Twitter cá nhân (https://twitter.com/haeminsunim) của ông hiện có tới hơn một triệu người theo dõi. Sách cùng tác giả: - Những vỡ lẽ của tuổi trẻ - Yêu lấy những điều không hoàn hảo.',
        'images/books/yeu_nhung_dieu_khong_hoan_hao.jpg', '8935235218130', 139000, 52000, 32, 100, 2018,
        N'Hae Min', N'Thế Giới', '2023-02-28 18:13:08', '2023-02-28 18:13:08')
/* =================== BOOKS =================== */


/* =================== BOOK GENRES =================== */
INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'8AF4B174-BF9D-4278-B5D0-12D2020F11D3', N'969532F0-10EF-4990-92C2-8044F1C88531')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'8AF4B174-BF9D-4278-B5D0-12D2020F11D3', N'17452981-3BB2-44B5-BB91-8D6B223FA316')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'7454C139-01D1-4896-836D-23984A161AB6', N'11B58AF7-34D7-4F36-8110-713CA947F456')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'7454C139-01D1-4896-836D-23984A161AB6', N'555CF4EA-3C56-46BA-B959-79948323B3D5')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'7454C139-01D1-4896-836D-23984A161AB6', N'897E43C8-29B9-4D52-8D3D-81093EF5EC26')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'B5764C8C-E859-476D-85DF-2C50AB256CD8', N'C6FE6BB3-AA46-4FF7-B3D9-04763225BD5B')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'B5764C8C-E859-476D-85DF-2C50AB256CD8', N'8BDB0BDF-C665-4DF4-97D1-66FDCEDFD031')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'B368061D-A94B-4499-8A8A-31CA0B4DDBBD', N'11B58AF7-34D7-4F36-8110-713CA947F456')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'867DB237-80BD-4B85-A4EC-36D0ABF44571', N'8BDB0BDF-C665-4DF4-97D1-66FDCEDFD031')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'867DB237-80BD-4B85-A4EC-36D0ABF44571', N'11B58AF7-34D7-4F36-8110-713CA947F456')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'867DB237-80BD-4B85-A4EC-36D0ABF44571', N'ABDE64C7-594F-4A0E-96EA-6BCE60BB1735')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'83F3665A-7143-48BD-AEEB-3BBADE2AF2D4', N'ABDE64C7-594F-4A0E-96EA-6BCE60BB1735')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'3109ACE1-4718-4799-B37C-3FC01A6ACBA8', N'11B58AF7-34D7-4F36-8110-713CA947F456')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'C55BFBE2-ABE2-4FC9-8522-5B45382BD74B', N'897E43C8-29B9-4D52-8D3D-81093EF5EC26')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'C55BFBE2-ABE2-4FC9-8522-5B45382BD74B', N'14682BF2-C535-48E9-B0E7-C40379C201C6')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'F8351627-F107-4A41-89B0-5BD5BCEAEC01', N'969532F0-10EF-4990-92C2-8044F1C88531')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'49E9AA7C-8F29-46D3-BAF4-5E407D63B731', N'C6FE6BB3-AA46-4FF7-B3D9-04763225BD5B')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'49E9AA7C-8F29-46D3-BAF4-5E407D63B731', N'83C07350-AFA9-46EC-B917-29329497FB50')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'AAD0D43A-5078-49C4-AA48-5F0B53F86AB7', N'C6FE6BB3-AA46-4FF7-B3D9-04763225BD5B')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'AAD0D43A-5078-49C4-AA48-5F0B53F86AB7', N'8A0FA500-7D78-4AFD-8909-57038B6F55AF')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'54E34952-A191-4986-9A62-66D58DC63331', N'83C07350-AFA9-46EC-B917-29329497FB50')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'54E34952-A191-4986-9A62-66D58DC63331', N'ABDE64C7-594F-4A0E-96EA-6BCE60BB1735')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'54E34952-A191-4986-9A62-66D58DC63331', N'897E43C8-29B9-4D52-8D3D-81093EF5EC26')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'19A94085-2256-47A6-9E41-672BB3C3EE08', N'555CF4EA-3C56-46BA-B959-79948323B3D5')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'19A94085-2256-47A6-9E41-672BB3C3EE08', N'897E43C8-29B9-4D52-8D3D-81093EF5EC26')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'E22E0546-2C10-408B-A83C-6C86B385A3AF', N'8A0FA500-7D78-4AFD-8909-57038B6F55AF')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'E22E0546-2C10-408B-A83C-6C86B385A3AF', N'8BDB0BDF-C665-4DF4-97D1-66FDCEDFD031')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'BCE863CB-EFDC-47E1-B6D2-6F03895E86B7', N'897E43C8-29B9-4D52-8D3D-81093EF5EC26')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'BCE863CB-EFDC-47E1-B6D2-6F03895E86B7', N'E79E193C-DF4F-4FC7-9B0D-D5E414F3E576')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'A4B1E239-C985-47D4-95E5-8684802364FB', N'11B58AF7-34D7-4F36-8110-713CA947F456')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'190D0C8E-2929-4EDD-B5D2-88320882E9BD', N'17452981-3BB2-44B5-BB91-8D6B223FA316')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'190D0C8E-2929-4EDD-B5D2-88320882E9BD', N'14682BF2-C535-48E9-B0E7-C40379C201C6')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'D6B469EB-E52A-4007-AC6A-90101CA9EF2C', N'17452981-3BB2-44B5-BB91-8D6B223FA316')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'D6B469EB-E52A-4007-AC6A-90101CA9EF2C', N'2B5B7C99-C386-4FEA-83C5-9C5A82BA3D17')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'D6B469EB-E52A-4007-AC6A-90101CA9EF2C', N'E79E193C-DF4F-4FC7-9B0D-D5E414F3E576')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'2946FE2B-E216-4D66-A9CF-98B47AE88818', N'969532F0-10EF-4990-92C2-8044F1C88531')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'CA082C5B-A0DA-450E-86AD-9DC692990333', N'83C07350-AFA9-46EC-B917-29329497FB50')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'DC2D4386-3C72-4330-8868-B0E14B00981E', N'83C07350-AFA9-46EC-B917-29329497FB50')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'DC2D4386-3C72-4330-8868-B0E14B00981E', N'8A0FA500-7D78-4AFD-8909-57038B6F55AF')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'DC2D4386-3C72-4330-8868-B0E14B00981E', N'571E8426-0EBA-45A2-899A-AFF91E87558C')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'5B14CEAC-29F9-4AF8-9C60-BCDF0EFD4071', N'2B5B7C99-C386-4FEA-83C5-9C5A82BA3D17')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'5B14CEAC-29F9-4AF8-9C60-BCDF0EFD4071', N'571E8426-0EBA-45A2-899A-AFF91E87558C')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'EF3707E8-0295-4E10-AD14-C35E63FD5936', N'969532F0-10EF-4990-92C2-8044F1C88531')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'EF3707E8-0295-4E10-AD14-C35E63FD5936', N'14682BF2-C535-48E9-B0E7-C40379C201C6')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'507C173B-C6F2-4E39-890F-C3A243268D34', N'897E43C8-29B9-4D52-8D3D-81093EF5EC26')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'507C173B-C6F2-4E39-890F-C3A243268D34', N'14682BF2-C535-48E9-B0E7-C40379C201C6')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'507C173B-C6F2-4E39-890F-C3A243268D34', N'E79E193C-DF4F-4FC7-9B0D-D5E414F3E576')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'A17AF6DC-DCAB-4398-B25A-C59F300D0AEA', N'8A0FA500-7D78-4AFD-8909-57038B6F55AF')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'A17AF6DC-DCAB-4398-B25A-C59F300D0AEA', N'2B5B7C99-C386-4FEA-83C5-9C5A82BA3D17')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'A17AF6DC-DCAB-4398-B25A-C59F300D0AEA', N'14682BF2-C535-48E9-B0E7-C40379C201C6')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'58394451-8450-4829-922C-C7AE625F6E38', N'ABDE64C7-594F-4A0E-96EA-6BCE60BB1735')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'46980A5E-2100-44CA-B725-D2A2B0CB43C6', N'8BDB0BDF-C665-4DF4-97D1-66FDCEDFD031')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'46980A5E-2100-44CA-B725-D2A2B0CB43C6', N'ABDE64C7-594F-4A0E-96EA-6BCE60BB1735')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'46980A5E-2100-44CA-B725-D2A2B0CB43C6', N'11B58AF7-34D7-4F36-8110-713CA947F456')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'526A7A16-3B5B-49C0-A135-D2FF8878664D', N'11B58AF7-34D7-4F36-8110-713CA947F456')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'FC8B8BB4-61E0-47E8-840C-DCEA5599B5D7', N'ABDE64C7-594F-4A0E-96EA-6BCE60BB1735')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'FC8B8BB4-61E0-47E8-840C-DCEA5599B5D7', N'969532F0-10EF-4990-92C2-8044F1C88531')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'4B67CC07-156C-47CE-835C-E1E9EF047049', N'897E43C8-29B9-4D52-8D3D-81093EF5EC26')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'1C475A1F-6652-46A0-89F3-E267D2BD2CC7', N'2B5B7C99-C386-4FEA-83C5-9C5A82BA3D17')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'1C475A1F-6652-46A0-89F3-E267D2BD2CC7', N'14682BF2-C535-48E9-B0E7-C40379C201C6')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'D61FB6A3-21B8-43BB-BA96-E780F1236CFD', N'969532F0-10EF-4990-92C2-8044F1C88531')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'D61FB6A3-21B8-43BB-BA96-E780F1236CFD', N'571E8426-0EBA-45A2-899A-AFF91E87558C')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'000D1D44-E0DB-4D4B-B3E8-E89DD2E487A3', N'C6FE6BB3-AA46-4FF7-B3D9-04763225BD5B')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'000D1D44-E0DB-4D4B-B3E8-E89DD2E487A3', N'83C07350-AFA9-46EC-B917-29329497FB50')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'000D1D44-E0DB-4D4B-B3E8-E89DD2E487A3', N'897E43C8-29B9-4D52-8D3D-81093EF5EC26')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'D8214777-7363-434A-9A9F-F32BF2354C8D', N'8BDB0BDF-C665-4DF4-97D1-66FDCEDFD031')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'D8214777-7363-434A-9A9F-F32BF2354C8D', N'14682BF2-C535-48E9-B0E7-C40379C201C6')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'D8214777-7363-434A-9A9F-F32BF2354C8D', N'E79E193C-DF4F-4FC7-9B0D-D5E414F3E576')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'06B8B317-64B6-41C1-B590-F4AD4CCB7A98', N'555CF4EA-3C56-46BA-B959-79948323B3D5')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'06B8B317-64B6-41C1-B590-F4AD4CCB7A98', N'17452981-3BB2-44B5-BB91-8D6B223FA316')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'06B8B317-64B6-41C1-B590-F4AD4CCB7A98', N'E79E193C-DF4F-4FC7-9B0D-D5E414F3E576')


INSERT INTO [book_genre] (book_id, genre_id)
VALUES (N'71575D41-4D9E-4618-9216-F6E4804E0036', N'C6FE6BB3-AA46-4FF7-B3D9-04763225BD5B')
/* =================== BOOK GENRES =================== */

/* =================== ORDERS =================== */
INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'F4E3D9EB-80E9-4094-8390-3606F8F97225', N'delivering', N'35382B92-3B89-4CA5-BEA8-C364DE661C6B', N'Dương Vũ Hà',
        N'36/3E Phan Văn Đối, Bà Điểm, Hóc Môn, Tp.HCM', N'0977686859', N'2023-04-19 06:19:40.000',
        N'2023-04-19 06:19:40.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'86961FF5-7403-4996-9DAA-378803544587', N'processing', N'35382B92-3B89-4CA5-BEA8-C364DE661C6B', N'Dương Vũ Hà',
        N'36/3E Phan Văn Đối, Bà Điểm, Hóc Môn, Tp.HCM', N'0977686859', N'2023-04-20 17:25:22.000',
        N'2023-04-20 17:25:22.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'171EAB76-EDE8-41BE-80BF-AD58CFA8B483', N'processing', N'35382B92-3B89-4CA5-BEA8-C364DE661C6B', N'Dương Vũ Hà',
        N'36/3E Phan Văn Đối, Bà Điểm, Hóc Môn, Tp.HCM', N'0977686859', N'2023-04-27 18:00:08.000',
        N'2023-04-27 18:00:08.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'F2840AE6-103F-49FA-8CA6-B07CC4C927F3', N'delivered', N'35382B92-3B89-4CA5-BEA8-C364DE661C6B', N'Dương Vũ Hà',
        N'36/3E Phan Văn Đối, Bà Điểm, Hóc Môn, Tp.HCM', N'0977686859', N'2023-04-07 04:08:36.000',
        N'2023-04-07 04:08:36.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'67EFB6B1-BD20-494A-B407-C69025ACA4C3', N'canceled', N'35382B92-3B89-4CA5-BEA8-C364DE661C6B', N'Dương Vũ Hà',
        N'36/3E Phan Văn Đối, Bà Điểm, Hóc Môn, Tp.HCM', N'0977686859', N'2023-04-04 22:12:11.000',
        N'2023-04-04 22:12:11.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'1E8D936C-70BE-4E6A-8C32-E6565EC0D71B', N'canceled', N'35382B92-3B89-4CA5-BEA8-C364DE661C6B', N'Dương Vũ Hà',
        N'36/3E Phan Văn Đối, Bà Điểm, Hóc Môn, Tp.HCM', N'0977686859', N'2023-04-28 14:14:56.000',
        N'2023-04-28 14:14:56.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'1FADA767-A7AE-42F6-8B99-E11006B9B2F5', N'processing', N'17817A7B-9240-4911-912D-6C45A3DC87F3',
        N'Huỳnh Huy Đức', N'102 Phan Văn Hớn, Tân Thới Nhất, Quận 12, Tp.HCM', N'0353098127',
        N'2023-04-02 13:58:07.000', N'2023-04-02 13:58:07.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'8D29DDDA-4562-4C85-966F-F4ACFED4BF70', N'delivered', N'17817A7B-9240-4911-912D-6C45A3DC87F3',
        N'Huỳnh Huy Đức', N'102 Phan Văn Hớn, Tân Thới Nhất, Quận 12, Tp.HCM', N'0353098127',
        N'2023-04-03 18:13:19.000', N'2023-04-03 18:13:19.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'95C9761B-8994-482B-BAB3-F7C015FE25AF', N'delivering', N'17817A7B-9240-4911-912D-6C45A3DC87F3',
        N'Huỳnh Huy Đức',
        N'102 Phan Văn Hớn, Tân Thới Nhất, Quận 12, Tp.HCM', N'0353098127', N'2023-04-25 13:48:56.000',
        N'2023-04-25 13:48:56.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'9645281F-AF8B-4771-9F06-A22AA351F777', N'processing', N'17817A7B-9240-4911-912D-6C45A3DC87F3',
        N'Huỳnh Huy Đức', N'102 Phan Văn Hớn, Tân Thới Nhất, Quận 12, Tp.HCM', N'0353098127',
        N'2023-04-17 08:54:02.000', N'2023-04-17 08:54:02.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'5AEBB470-5A92-4076-8588-41E2F8DECA6D', N'delivered', N'17817A7B-9240-4911-912D-6C45A3DC87F3',
        N'Huỳnh Huy Đức', N'102 Phan Văn Hớn, Tân Thới Nhất, Quận 12, Tp.HCM', N'0353098127',
        N'2023-04-11 16:41:21.000', N'2023-04-11 16:41:21.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'6790060A-7E19-42D6-9C4D-6A6A1094F429', N'processing', N'17817A7B-9240-4911-912D-6C45A3DC87F3',
        N'Huỳnh Huy Đức', N'102 Phan Văn Hớn, Tân Thới Nhất, Quận 12, Tp.HCM', N'0353098127',
        N'2023-04-16 04:27:39.000', N'2023-04-16 04:27:39.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'0A81C46A-6C47-425B-9CDB-049F62B5AB0E', N'pending', N'17817A7B-9240-4911-912D-6C45A3DC87F3', N'Huỳnh Huy Đức',
        N'102 Phan Văn Hớn, Tân Thới Nhất, Quận 12, Tp.HCM', N'0353098127', N'2023-04-16 07:37:53.000',
        N'2023-04-16 07:37:53.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'52D935DE-A3E9-41E6-912C-0A3AF09D16A8', N'delivering', N'17817A7B-9240-4911-912D-6C45A3DC87F3',
        N'Huỳnh Huy Đức', N'102 Phan Văn Hớn, Tân Thới Nhất, Quận 12, Tp.HCM', N'0353098127',
        N'2023-04-28 12:35:01.000', N'2023-04-28 12:35:01.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'868E5B55-6508-45A9-8BCF-119A1ECF590A', N'processing', N'17817A7B-9240-4911-912D-6C45A3DC87F3',
        N'Huỳnh Huy Đức', N'102 Phan Văn Hớn, Tân Thới Nhất, Quận 12, Tp.HCM', N'0353098127',
        N'2023-04-12 09:14:07.000', N'2023-04-12 09:14:07.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'C507B877-ABF0-4CB0-936A-1C72E289021C', N'processing', N'F3B007E9-033E-4C42-AB64-866CA3034CA0',
        N'Huỳnh Thị Hiếu Thảo', N'1/45 Đường Nguyễn Văn Quá, Đông Hưng Thuận, Quận 12, Tp.HCM', N'0389709057',
        N'2023-04-24 15:05:13.000', N'2023-04-24 15:05:13.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'1A4CD842-9202-4F88-A5E5-0D93C89D4C7B', N'pending', N'F3B007E9-033E-4C42-AB64-866CA3034CA0',
        N'Huỳnh Thị Hiếu Thảo', N'1/45 Đường Nguyễn Văn Quá, Đông Hưng Thuận, Quận 12, Tp.HCM', N'0389709057',
        N'2023-04-23 07:00:27.000', N'2023-04-23 07:00:27.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'B41F408C-6566-4AE4-B772-44442B7B1FEA', N'delivering', N'F3B007E9-033E-4C42-AB64-866CA3034CA0',
        N'Huỳnh Thị Hiếu Thảo', N'1/45 Đường Nguyễn Văn Quá, Đông Hưng Thuận, Quận 12, Tp.HCM', N'0389709057',
        N'2023-04-28 07:40:58.000', N'2023-04-28 07:40:58.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'C7268AA3-F1FC-4492-BCF5-50352D9D20A9', N'delivering', N'F3B007E9-033E-4C42-AB64-866CA3034CA0',
        N'Huỳnh Thị Hiếu Thảo', N'1/45 Đường Nguyễn Văn Quá, Đông Hưng Thuận, Quận 12, Tp.HCM', N'0389709057',
        N'2023-04-25 08:02:58.000', N'2023-04-25 08:02:58.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'7D639C06-2500-4DAA-990F-B19D7D0AF7A7', N'delivered', N'F3B007E9-033E-4C42-AB64-866CA3034CA0',
        N'Huỳnh Thị Hiếu Thảo', N'1/45 Đường Nguyễn Văn Quá, Đông Hưng Thuận, Quận 12, Tp.HCM', N'0389709057',
        N'2023-04-06 18:03:21.000', N'2023-04-06 18:03:21.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'18705CB2-47BE-4576-96FA-FB19B2BD4DDF', N'pending', N'F3B007E9-033E-4C42-AB64-866CA3034CA0',
        N'Huỳnh Thị Hiếu Thảo', N'1/45 Đường Nguyễn Văn Quá, Đông Hưng Thuận, Quận 12, Tp.HCM', N'0389709057',
        N'2023-04-01 17:43:04.000', N'2023-04-01 17:43:04.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'253EEF85-6F97-4EEF-BE9D-9D21B7588287', N'delivered', N'1FCDD47A-FB91-45C4-B063-583BE3025AD7',
        N'Nguyễn Văn Phong', N'249 Lê Hồng Phong, Phường 4, Quận 5, Tp.HCM', N'0986118119', N'2023-04-21 02:29:22.000',
        N'2023-04-21 02:29:22.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'1CC98E2A-E06D-499A-B995-E7D97EBEDC6B', N'delivered', N'1FCDD47A-FB91-45C4-B063-583BE3025AD7',
        N'Nguyễn Văn Phong', N'249 Lê Hồng Phong, Phường 4, Quận 5, Tp.HCM', N'0986118119', N'2023-04-09 17:52:09.000',
        N'2023-04-09 17:52:09.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'70F68F3F-2E3D-432B-97F8-608C7DC6A7A2', N'delivered', N'1FCDD47A-FB91-45C4-B063-583BE3025AD7',
        N'Nguyễn Văn Phong', N'249 Lê Hồng Phong, Phường 4, Quận 5, Tp.HCM', N'0986118119', N'2023-04-13 04:08:58.000',
        N'2023-04-13 04:08:58.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'AFF5FBDE-700E-4B2E-8516-7648FB477453', N'delivered', N'1FCDD47A-FB91-45C4-B063-583BE3025AD7',
        N'Nguyễn Văn Phong', N'249 Lê Hồng Phong, Phường 4, Quận 5, Tp.HCM', N'0986118119', N'2023-04-16 13:41:24.000',
        N'2023-04-16 13:41:24.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'AABC3062-48A3-496D-8310-0DB01671FAB8', N'delivered', N'1FCDD47A-FB91-45C4-B063-583BE3025AD7',
        N'Nguyễn Văn Phong', N'249 Lê Hồng Phong, Phường 4, Quận 5, Tp.HCM', N'0986118119', N'2023-04-13 10:08:02.000',
        N'2023-04-13 10:08:02.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'A65EAB34-709A-44A3-9D89-284A67B9F101', N'delivered', N'1FCDD47A-FB91-45C4-B063-583BE3025AD7',
        N'Nguyễn Văn Phong', N'249 Lê Hồng Phong, Phường 4, Quận 5, Tp.HCM', N'0986118119', N'2023-04-20 04:27:20.000',
        N'2023-04-20 04:27:20.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'26015D3B-85D3-4F30-A03D-29A1C31D24C5', N'delivered', N'DB316FD5-000C-4FC0-831F-CA28BCBD53C2',
        N'Trần Minh Quốc', N'123 Tôn Đức Thắng, Phường 2, Quận 8, Tp.HCM', N'0987654321', N'2023-04-27 11:29:16.000',
        N'2023-04-27 11:29:16.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'E6429FF1-647C-4550-BC5C-811A965930B8', N'delivered', N'DB316FD5-000C-4FC0-831F-CA28BCBD53C2',
        N'Trần Minh Quốc', N'123 Tôn Đức Thắng, Phường 2, Quận 8, Tp.HCM', N'0987654321', N'2023-04-04 07:02:18.000',
        N'2023-04-04 07:02:18.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'D28F6632-975C-404C-B69E-88C67EBB8B52', N'delivering', N'DB316FD5-000C-4FC0-831F-CA28BCBD53C2',
        N'Trần Minh Quốc', N'123 Tôn Đức Thắng, Phường 2, Quận 8, Tp.HCM', N'0987654321', N'2023-04-21 03:27:50.000',
        N'2023-04-21 03:27:50.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'4274A333-6EC9-45B8-9F59-460DED35CE11', N'delivered', N'DB316FD5-000C-4FC0-831F-CA28BCBD53C2',
        N'Trần Minh Quốc', N'123 Tôn Đức Thắng, Phường 2, Quận 8, Tp.HCM', N'0987654321', N'2023-04-13 05:52:06.000',
        N'2023-04-13 05:52:06.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'717C2DDF-485C-4B2C-9D56-49EB892D199C', N'delivering', N'DB316FD5-000C-4FC0-831F-CA28BCBD53C2',
        N'Trần Minh Quốc', N'123 Tôn Đức Thắng, Phường 2, Quận 8, Tp.HCM', N'0987654321', N'2023-04-25 18:38:03.000',
        N'2023-04-25 18:38:03.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'9DB46716-3A68-4B38-8AD7-A7FF01C6FEDA', N'delivered', N'DB316FD5-000C-4FC0-831F-CA28BCBD53C2',
        N'Trần Minh Quốc', N'123 Tôn Đức Thắng, Phường 2, Quận 8, Tp.HCM', N'0987654321', N'2023-04-18 20:05:01.000',
        N'2023-04-18 20:05:01.000');

INSERT INTO [order] ([id], [status], [customer_id], [recipient_name], [recipient_address],
                     [recipient_phone], [created_at], [updated_at])
VALUES (N'8BA28A76-DEF1-47B2-AA5D-CFD3E752BDED', N'delivered', N'DB316FD5-000C-4FC0-831F-CA28BCBD53C2',
        N'Trần Minh Quốc', N'123 Tôn Đức Thắng, Phường 2, Quận 8, Tp.HCM', N'0987654321', N'2023-04-22 11:55:32.000',
        N'2023-04-22 11:55:32.000');
/* =================== ORDERS =================== */


/* =================== ORDER ITEMS =================== */
INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'0A81C46A-6C47-425B-9CDB-049F62B5AB0E', N'B5764C8C-E859-476D-85DF-2C50AB256CD8', 1, 110400.0000, 82000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'52D935DE-A3E9-41E6-912C-0A3AF09D16A8', N'8AF4B174-BF9D-4278-B5D0-12D2020F11D3', 1, 103200.0000, 67000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'52D935DE-A3E9-41E6-912C-0A3AF09D16A8', N'83F3665A-7143-48BD-AEEB-3BBADE2AF2D4', 1, 81600.0000, 43000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'52D935DE-A3E9-41E6-912C-0A3AF09D16A8', N'54E34952-A191-4986-9A62-66D58DC63331', 1, 88000.0000, 51000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'52D935DE-A3E9-41E6-912C-0A3AF09D16A8', N'CA082C5B-A0DA-450E-86AD-9DC692990333', 1, 78000.0000, 53000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'52D935DE-A3E9-41E6-912C-0A3AF09D16A8', N'D8214777-7363-434A-9A9F-F32BF2354C8D', 1, 41250.0000, 22000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'52D935DE-A3E9-41E6-912C-0A3AF09D16A8', N'06B8B317-64B6-41C1-B590-F4AD4CCB7A98', 1, 209930.0000, 189000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'1A4CD842-9202-4F88-A5E5-0D93C89D4C7B', N'8AF4B174-BF9D-4278-B5D0-12D2020F11D3', 1, 103200.0000, 67000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'1A4CD842-9202-4F88-A5E5-0D93C89D4C7B', N'EF3707E8-0295-4E10-AD14-C35E63FD5936', 1, 95200.0000, 74000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'AABC3062-48A3-496D-8310-0DB01671FAB8', N'867DB237-80BD-4B85-A4EC-36D0ABF44571', 1, 110000.0000, 80000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'AABC3062-48A3-496D-8310-0DB01671FAB8', N'54E34952-A191-4986-9A62-66D58DC63331', 1, 88000.0000, 51000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'AABC3062-48A3-496D-8310-0DB01671FAB8', N'E22E0546-2C10-408B-A83C-6C86B385A3AF', 1, 158760.0000, 115000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'AABC3062-48A3-496D-8310-0DB01671FAB8', N'507C173B-C6F2-4E39-890F-C3A243268D34', 1, 72000.0000, 62000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'AABC3062-48A3-496D-8310-0DB01671FAB8', N'A17AF6DC-DCAB-4398-B25A-C59F300D0AEA', 1, 71100.0000, 33000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'AABC3062-48A3-496D-8310-0DB01671FAB8', N'71575D41-4D9E-4618-9216-F6E4804E0036', 1, 96000.0000, 70000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'868E5B55-6508-45A9-8BCF-119A1ECF590A', N'7454C139-01D1-4896-836D-23984A161AB6', 1, 186000.0000, 127000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'868E5B55-6508-45A9-8BCF-119A1ECF590A', N'2946FE2B-E216-4D66-A9CF-98B47AE88818', 1, 71940.0000, 52000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'868E5B55-6508-45A9-8BCF-119A1ECF590A', N'A17AF6DC-DCAB-4398-B25A-C59F300D0AEA', 1, 71100.0000, 33000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'868E5B55-6508-45A9-8BCF-119A1ECF590A', N'06B8B317-64B6-41C1-B590-F4AD4CCB7A98', 1, 209930.0000, 189000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'C507B877-ABF0-4CB0-936A-1C72E289021C', N'A4B1E239-C985-47D4-95E5-8684802364FB', 1, 87320.0000, 67000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'C507B877-ABF0-4CB0-936A-1C72E289021C', N'507C173B-C6F2-4E39-890F-C3A243268D34', 1, 72000.0000, 62000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'A65EAB34-709A-44A3-9D89-284A67B9F101', N'867DB237-80BD-4B85-A4EC-36D0ABF44571', 1, 110000.0000, 80000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'A65EAB34-709A-44A3-9D89-284A67B9F101', N'4B67CC07-156C-47CE-835C-E1E9EF047049', 1, 68800.0000, 40000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'A65EAB34-709A-44A3-9D89-284A67B9F101', N'000D1D44-E0DB-4D4B-B3E8-E89DD2E487A3', 1, 111200.0000, 74000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'A65EAB34-709A-44A3-9D89-284A67B9F101', N'71575D41-4D9E-4618-9216-F6E4804E0036', 1, 96000.0000, 70000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'26015D3B-85D3-4F30-A03D-29A1C31D24C5', N'B5764C8C-E859-476D-85DF-2C50AB256CD8', 1, 110400.0000, 82000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'26015D3B-85D3-4F30-A03D-29A1C31D24C5', N'E22E0546-2C10-408B-A83C-6C86B385A3AF', 1, 158760.0000, 115000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'26015D3B-85D3-4F30-A03D-29A1C31D24C5', N'2946FE2B-E216-4D66-A9CF-98B47AE88818', 1, 71940.0000, 52000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'26015D3B-85D3-4F30-A03D-29A1C31D24C5', N'507C173B-C6F2-4E39-890F-C3A243268D34', 1, 72000.0000, 62000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'26015D3B-85D3-4F30-A03D-29A1C31D24C5', N'A17AF6DC-DCAB-4398-B25A-C59F300D0AEA', 1, 71100.0000, 33000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'26015D3B-85D3-4F30-A03D-29A1C31D24C5', N'4B67CC07-156C-47CE-835C-E1E9EF047049', 1, 68800.0000, 40000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'F4E3D9EB-80E9-4094-8390-3606F8F97225', N'507C173B-C6F2-4E39-890F-C3A243268D34', 1, 72000.0000, 62000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'F4E3D9EB-80E9-4094-8390-3606F8F97225', N'4B67CC07-156C-47CE-835C-E1E9EF047049', 1, 68800.0000, 40000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'86961FF5-7403-4996-9DAA-378803544587', N'49E9AA7C-8F29-46D3-BAF4-5E407D63B731', 1, 116000.0000, 80000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'86961FF5-7403-4996-9DAA-378803544587', N'D6B469EB-E52A-4007-AC6A-90101CA9EF2C', 1, 147420.0000, 120000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'5AEBB470-5A92-4076-8588-41E2F8DECA6D', N'190D0C8E-2929-4EDD-B5D2-88320882E9BD', 1, 82500.0000, 51000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'5AEBB470-5A92-4076-8588-41E2F8DECA6D', N'CA082C5B-A0DA-450E-86AD-9DC692990333', 1, 78000.0000, 53000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'5AEBB470-5A92-4076-8588-41E2F8DECA6D', N'EF3707E8-0295-4E10-AD14-C35E63FD5936', 1, 95200.0000, 74000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'5AEBB470-5A92-4076-8588-41E2F8DECA6D', N'507C173B-C6F2-4E39-890F-C3A243268D34', 1, 72000.0000, 62000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'5AEBB470-5A92-4076-8588-41E2F8DECA6D', N'D8214777-7363-434A-9A9F-F32BF2354C8D', 1, 41250.0000, 22000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'B41F408C-6566-4AE4-B772-44442B7B1FEA', N'8AF4B174-BF9D-4278-B5D0-12D2020F11D3', 1, 103200.0000, 67000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'B41F408C-6566-4AE4-B772-44442B7B1FEA', N'EF3707E8-0295-4E10-AD14-C35E63FD5936', 1, 95200.0000, 74000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'4274A333-6EC9-45B8-9F59-460DED35CE11', N'BCE863CB-EFDC-47E1-B6D2-6F03895E86B7', 1, 79200.0000, 42000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'4274A333-6EC9-45B8-9F59-460DED35CE11', N'D6B469EB-E52A-4007-AC6A-90101CA9EF2C', 1, 147420.0000, 120000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'4274A333-6EC9-45B8-9F59-460DED35CE11', N'DC2D4386-3C72-4330-8868-B0E14B00981E', 1, 102400.0000, 82000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'717C2DDF-485C-4B2C-9D56-49EB892D199C', N'3109ACE1-4718-4799-B37C-3FC01A6ACBA8', 1, 67200.0000, 60000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'717C2DDF-485C-4B2C-9D56-49EB892D199C', N'4B67CC07-156C-47CE-835C-E1E9EF047049', 1, 68800.0000, 40000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'C7268AA3-F1FC-4492-BCF5-50352D9D20A9', N'8AF4B174-BF9D-4278-B5D0-12D2020F11D3', 1, 103200.0000, 67000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'C7268AA3-F1FC-4492-BCF5-50352D9D20A9', N'867DB237-80BD-4B85-A4EC-36D0ABF44571', 1, 110000.0000, 80000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'C7268AA3-F1FC-4492-BCF5-50352D9D20A9', N'54E34952-A191-4986-9A62-66D58DC63331', 1, 88000.0000, 51000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'C7268AA3-F1FC-4492-BCF5-50352D9D20A9', N'D6B469EB-E52A-4007-AC6A-90101CA9EF2C', 1, 147420.0000, 120000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'C7268AA3-F1FC-4492-BCF5-50352D9D20A9', N'D8214777-7363-434A-9A9F-F32BF2354C8D', 1, 41250.0000, 22000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'70F68F3F-2E3D-432B-97F8-608C7DC6A7A2', N'71575D41-4D9E-4618-9216-F6E4804E0036', 1, 96000.0000, 70000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'6790060A-7E19-42D6-9C4D-6A6A1094F429', N'8AF4B174-BF9D-4278-B5D0-12D2020F11D3', 1, 103200.0000, 67000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'6790060A-7E19-42D6-9C4D-6A6A1094F429', N'867DB237-80BD-4B85-A4EC-36D0ABF44571', 1, 110000.0000, 80000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'6790060A-7E19-42D6-9C4D-6A6A1094F429', N'DC2D4386-3C72-4330-8868-B0E14B00981E', 1, 102400.0000, 82000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'6790060A-7E19-42D6-9C4D-6A6A1094F429', N'507C173B-C6F2-4E39-890F-C3A243268D34', 1, 72000.0000, 62000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'6790060A-7E19-42D6-9C4D-6A6A1094F429', N'58394451-8450-4829-922C-C7AE625F6E38', 1, 96000.0000, 66000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'AFF5FBDE-700E-4B2E-8516-7648FB477453', N'7454C139-01D1-4896-836D-23984A161AB6', 1, 186000.0000, 127000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'AFF5FBDE-700E-4B2E-8516-7648FB477453', N'DC2D4386-3C72-4330-8868-B0E14B00981E', 1, 102400.0000, 82000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'AFF5FBDE-700E-4B2E-8516-7648FB477453', N'4B67CC07-156C-47CE-835C-E1E9EF047049', 1, 68800.0000, 40000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'AFF5FBDE-700E-4B2E-8516-7648FB477453', N'D61FB6A3-21B8-43BB-BA96-E780F1236CFD', 1, 151200.0000, 120000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'AFF5FBDE-700E-4B2E-8516-7648FB477453', N'000D1D44-E0DB-4D4B-B3E8-E89DD2E487A3', 1, 111200.0000, 74000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'AFF5FBDE-700E-4B2E-8516-7648FB477453', N'06B8B317-64B6-41C1-B590-F4AD4CCB7A98', 1, 209930.0000, 189000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'E6429FF1-647C-4550-BC5C-811A965930B8', N'F8351627-F107-4A41-89B0-5BD5BCEAEC01', 1, 71380.0000, 33000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'E6429FF1-647C-4550-BC5C-811A965930B8', N'1C475A1F-6652-46A0-89F3-E267D2BD2CC7', 1, 94520.0000, 52000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'D28F6632-975C-404C-B69E-88C67EBB8B52', N'54E34952-A191-4986-9A62-66D58DC63331', 1, 88000.0000, 51000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'D28F6632-975C-404C-B69E-88C67EBB8B52', N'58394451-8450-4829-922C-C7AE625F6E38', 1, 96000.0000, 66000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'253EEF85-6F97-4EEF-BE9D-9D21B7588287', N'71575D41-4D9E-4618-9216-F6E4804E0036', 1, 96000.0000, 70000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'9645281F-AF8B-4771-9F06-A22AA351F777', N'B368061D-A94B-4499-8A8A-31CA0B4DDBBD', 1, 85500.0000, 62000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'9645281F-AF8B-4771-9F06-A22AA351F777', N'49E9AA7C-8F29-46D3-BAF4-5E407D63B731', 1, 116000.0000, 80000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'9645281F-AF8B-4771-9F06-A22AA351F777', N'CA082C5B-A0DA-450E-86AD-9DC692990333', 1, 78000.0000, 53000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'9645281F-AF8B-4771-9F06-A22AA351F777', N'DC2D4386-3C72-4330-8868-B0E14B00981E', 1, 102400.0000, 82000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'9645281F-AF8B-4771-9F06-A22AA351F777', N'EF3707E8-0295-4E10-AD14-C35E63FD5936', 1, 95200.0000, 74000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'9DB46716-3A68-4B38-8AD7-A7FF01C6FEDA', N'83F3665A-7143-48BD-AEEB-3BBADE2AF2D4', 1, 81600.0000, 43000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'171EAB76-EDE8-41BE-80BF-AD58CFA8B483', N'867DB237-80BD-4B85-A4EC-36D0ABF44571', 1, 110000.0000, 80000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'F2840AE6-103F-49FA-8CA6-B07CC4C927F3', N'E22E0546-2C10-408B-A83C-6C86B385A3AF', 1, 158760.0000, 115000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'7D639C06-2500-4DAA-990F-B19D7D0AF7A7', N'B368061D-A94B-4499-8A8A-31CA0B4DDBBD', 1, 85500.0000, 62000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'7D639C06-2500-4DAA-990F-B19D7D0AF7A7', N'3109ACE1-4718-4799-B37C-3FC01A6ACBA8', 1, 67200.0000, 60000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'7D639C06-2500-4DAA-990F-B19D7D0AF7A7', N'A4B1E239-C985-47D4-95E5-8684802364FB', 1, 87320.0000, 67000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'7D639C06-2500-4DAA-990F-B19D7D0AF7A7', N'507C173B-C6F2-4E39-890F-C3A243268D34', 1, 72000.0000, 62000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'7D639C06-2500-4DAA-990F-B19D7D0AF7A7', N'A17AF6DC-DCAB-4398-B25A-C59F300D0AEA', 1, 71100.0000, 33000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'7D639C06-2500-4DAA-990F-B19D7D0AF7A7', N'1C475A1F-6652-46A0-89F3-E267D2BD2CC7', 1, 94520.0000, 52000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'67EFB6B1-BD20-494A-B407-C69025ACA4C3', N'49E9AA7C-8F29-46D3-BAF4-5E407D63B731', 1, 116000.0000, 80000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'67EFB6B1-BD20-494A-B407-C69025ACA4C3', N'54E34952-A191-4986-9A62-66D58DC63331', 1, 88000.0000, 51000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'67EFB6B1-BD20-494A-B407-C69025ACA4C3', N'58394451-8450-4829-922C-C7AE625F6E38', 1, 96000.0000, 66000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'67EFB6B1-BD20-494A-B407-C69025ACA4C3', N'D8214777-7363-434A-9A9F-F32BF2354C8D', 1, 41250.0000, 22000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'8BA28A76-DEF1-47B2-AA5D-CFD3E752BDED', N'3109ACE1-4718-4799-B37C-3FC01A6ACBA8', 1, 67200.0000, 60000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'8BA28A76-DEF1-47B2-AA5D-CFD3E752BDED', N'AAD0D43A-5078-49C4-AA48-5F0B53F86AB7', 1, 143650.0000, 110000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'8BA28A76-DEF1-47B2-AA5D-CFD3E752BDED', N'2946FE2B-E216-4D66-A9CF-98B47AE88818', 1, 71940.0000, 52000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'8BA28A76-DEF1-47B2-AA5D-CFD3E752BDED', N'000D1D44-E0DB-4D4B-B3E8-E89DD2E487A3', 1, 111200.0000, 74000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'1FADA767-A7AE-42F6-8B99-E11006B9B2F5', N'A4B1E239-C985-47D4-95E5-8684802364FB', 1, 87320.0000, 67000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'1FADA767-A7AE-42F6-8B99-E11006B9B2F5', N'A17AF6DC-DCAB-4398-B25A-C59F300D0AEA', 1, 71100.0000, 33000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'1FADA767-A7AE-42F6-8B99-E11006B9B2F5', N'06B8B317-64B6-41C1-B590-F4AD4CCB7A98', 1, 209930.0000, 189000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'1E8D936C-70BE-4E6A-8C32-E6565EC0D71B', N'B368061D-A94B-4499-8A8A-31CA0B4DDBBD', 1, 85500.0000, 62000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'1E8D936C-70BE-4E6A-8C32-E6565EC0D71B', N'19A94085-2256-47A6-9E41-672BB3C3EE08', 1, 144270.0000, 120000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'1E8D936C-70BE-4E6A-8C32-E6565EC0D71B', N'CA082C5B-A0DA-450E-86AD-9DC692990333', 1, 78000.0000, 53000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'1E8D936C-70BE-4E6A-8C32-E6565EC0D71B', N'000D1D44-E0DB-4D4B-B3E8-E89DD2E487A3', 1, 111200.0000, 74000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'1E8D936C-70BE-4E6A-8C32-E6565EC0D71B', N'D8214777-7363-434A-9A9F-F32BF2354C8D', 1, 41250.0000, 22000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'1CC98E2A-E06D-499A-B995-E7D97EBEDC6B', N'CA082C5B-A0DA-450E-86AD-9DC692990333', 1, 78000.0000, 53000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'1CC98E2A-E06D-499A-B995-E7D97EBEDC6B', N'5B14CEAC-29F9-4AF8-9C60-BCDF0EFD4071', 1, 120000.0000, 86000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'1CC98E2A-E06D-499A-B995-E7D97EBEDC6B', N'46980A5E-2100-44CA-B725-D2A2B0CB43C6', 1, 88500.0000, 67000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'8D29DDDA-4562-4C85-966F-F4ACFED4BF70', N'E22E0546-2C10-408B-A83C-6C86B385A3AF', 1, 158760.0000, 115000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'8D29DDDA-4562-4C85-966F-F4ACFED4BF70', N'000D1D44-E0DB-4D4B-B3E8-E89DD2E487A3', 1, 111200.0000, 74000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'95C9761B-8994-482B-BAB3-F7C015FE25AF', N'3109ACE1-4718-4799-B37C-3FC01A6ACBA8', 1, 67200.0000, 60000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'95C9761B-8994-482B-BAB3-F7C015FE25AF', N'190D0C8E-2929-4EDD-B5D2-88320882E9BD', 1, 82500.0000, 51000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'95C9761B-8994-482B-BAB3-F7C015FE25AF', N'EF3707E8-0295-4E10-AD14-C35E63FD5936', 1, 95200.0000, 74000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'95C9761B-8994-482B-BAB3-F7C015FE25AF', N'000D1D44-E0DB-4D4B-B3E8-E89DD2E487A3', 1, 111200.0000, 74000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'18705CB2-47BE-4576-96FA-FB19B2BD4DDF', N'867DB237-80BD-4B85-A4EC-36D0ABF44571', 1, 110000.0000, 80000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'18705CB2-47BE-4576-96FA-FB19B2BD4DDF', N'83F3665A-7143-48BD-AEEB-3BBADE2AF2D4', 1, 81600.0000, 43000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'18705CB2-47BE-4576-96FA-FB19B2BD4DDF', N'F8351627-F107-4A41-89B0-5BD5BCEAEC01', 1, 71380.0000, 33000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'18705CB2-47BE-4576-96FA-FB19B2BD4DDF', N'D6B469EB-E52A-4007-AC6A-90101CA9EF2C', 1, 147420.0000, 120000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'18705CB2-47BE-4576-96FA-FB19B2BD4DDF', N'DC2D4386-3C72-4330-8868-B0E14B00981E', 1, 102400.0000, 82000.0000);

INSERT INTO [order_item] ([order_id], [book_id], [quantity], [price], [original_price])
VALUES (N'18705CB2-47BE-4576-96FA-FB19B2BD4DDF', N'58394451-8450-4829-922C-C7AE625F6E38', 1, 96000.0000, 66000.0000);
/* =================== ORDER ITEMS =================== */