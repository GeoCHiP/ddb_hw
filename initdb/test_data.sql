-- ТЕСТОВЫЕ ДАННЫЕ

INSERT INTO jobs(j_id, j_name, j_salary) VALUES
(1, 'Начальник всего и вся', 666666),
(2, 'Рецепционист', 70000),
(3, 'Уборщик', 50000),
(4, 'Мастер на все руки', 100000);

INSERT INTO rooms(r_id, r_floor, rt_id) VALUES
(1, 4, 1),
(2, 3, 5),
(3, 2, 5),
(4, 1, 1),
(11, 23, 32),
(11111, 34, 22);

INSERT INTO residence(res_id, b_id, rt_id, r_id) VALUES
(1, NULL, NULL, NULL),
(2, 1, NULL, NULL),
(3, NULL, 11, NULL),
(4, NULL, NULL, 111),
-- (5, 1, 1, NULL),
(6, NULL, 32, 11);
-- (7, 1, NULL, 1),
-- (8, 1, 1, 1),
