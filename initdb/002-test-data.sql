INSERT INTO filials VALUES
(101, 'Филиал Москва', '84951234567', 'ул. Пушкина, 1', 'moscow@company.com', TRUE),
(102, 'Филиал Санкт-Петербург', '88121234567', 'наб. Реки Фонтанки, 2', 'spb@company.com', TRUE),
(103, 'Филиал Новосибирск', '83831234567', 'просп. Ленина, 3', 'nsk@company.com', FALSE);

INSERT INTO employees VALUES
(100001, 'Иванов Иван Иванович', 'м', '1985-04-15', '89031234567', 'ул. Советская, 10', 'ivanov@mail.com', '4510 123456', '771122334455', '12345678901'),
(100002, 'Петрова Мария Сергеевна', 'ж', '1990-07-22', '89061234568', 'ул. Юности, 15', 'petrova@mail.com', '4511 234567', '772233445566', '98765432101'),
(100003, 'Сидоров Алексей Николаевич', 'м', '1982-01-30', '89091234569', 'ул. Лесная, 20', 'sidorov@mail.com', '4512 345678', '773344556677', '23456789012');

INSERT INTO jobs VALUES
(1, 'Менеджер', 60000),
(2, 'Администратор', 50000),
(3, 'Уборщик', 30000);

INSERT INTO work VALUES
(1000001, 100001, 101, 1, '2023-01-01', NULL),
(1000002, 100002, 102, 2, '2023-02-01', '2023-12-31'),
(1000003, 100003, 103, 3, '2023-03-01', NULL);

INSERT INTO guests VALUES
(200001, 'Андреев Дмитрий Владимирович', 'м', '1995-05-05', '89031234570', 'andreev@mail.com', '4513 456789', NULL),
(200002, 'Васильева Екатерина Михайловна', 'ж', '1988-08-08', '89061234571', NULL, '4514 567890', 1000001),
(200003, 'Николаев Игорь Петрович', 'м', '1979-09-09', '89091234572', 'nikolaev@mail.com', '4515 678901', 1000002);

INSERT INTO room_types_names VALUES
(101, 'Стандарт'),
(102, 'Люкс'),
(103, 'Апартаменты');

INSERT INTO room_types VALUES
(1, 101, 3000, 2, 20, 101),
(2, 102, 5000, 4, 35, 102),
(3, 103, 7000, 3, 50, 103);

INSERT INTO rooms VALUES
(300001, 1, 01, 101),
(300002, 2, 02, 102),
(300003, 3, 03, 103);

INSERT INTO statuses VALUES
(1, 'Забронировано'),
(2, 'Оплачено'),
(3, 'Отменено');

INSERT INTO bookings VALUES
(4000000001, '2023-11-01 12:00:00', 1, 200001, '2023-11-05', '2023-11-10', 1),
(4000000002, '2023-11-02 13:00:00', 2, 200002, '2023-11-06', '2023-11-11', 2),
(4000000003, '2023-11-03 14:00:00', 3, 200003, '2023-11-07', '2023-11-12', 3);

INSERT INTO livings VALUES
(5000000001, 4000000001, 1, 300001, 200001, 1000001, '2023-11-05 15:00:00', 1000002, '2023-11-10 11:00:00'),
(5000000002, 4000000002, 2, 300002, 200002, NULL, '2023-11-06 16:00:00', NULL, '2023-11-11 12:00:00'),
(5000000003, NULL, 3, 300003, 200003, NULL, '2023-11-07 17:00:00', NULL, NULL);
