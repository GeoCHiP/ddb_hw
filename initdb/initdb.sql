-- СОЗДАНИЕ ТАБЛИЦ

-- Должности
CREATE TABLE jobs (
    j_id NUMERIC(3) PRIMARY KEY,
    j_name VARCHAR(100) NOT NULL UNIQUE,
    j_salary NUMERIC(6) NOT NULL
);

-- Услуги
CREATE TABLE services (
    s_id NUMERIC(4) PRIMARY KEY,
    s_name VARCHAR(100) NOT NULL UNIQUE,
    s_price NUMERIC(5) NOT NULL,
    s_available BOOLEAN NOT NULL
);

-- Филиалы
CREATE TABLE branches (
    b_id NUMERIC(3) PRIMARY KEY,
    b_name VARCHAR(100) NOT NULL UNIQUE,
    b_phone VARCHAR(20) NOT NULL UNIQUE,
    b_addr VARCHAR(100) NOT NULL,
    b_mail VARCHAR(50) NOT NULL UNIQUE,
    b_floors NUMERIC(2) NOT NULL,
    b_open BOOLEAN NOT NULL
);

-- Типы номеров
CREATE TABLE room_types (
    rt_id NUMERIC(2) PRIMARY KEY,
    rt_price NUMERIC(5) NOT NULL,
    rt_capacity NUMERIC(2) NOT NULL,
    rt_area NUMERIC(3) NOT NULL
);

-- Номера
CREATE TABLE rooms (
    r_id NUMERIC(6) PRIMARY KEY,
    r_floor NUMERIC(2) NOT NULL, -- через триггер реализовать ограничение целостности на номер этажа
    -- b_id NUMERIC(3) NOT NULL REFERENCES branches(b_id),
    rt_id NUMERIC(2) NOT NULL,
    UNIQUE(r_id, rt_id)
);

-- Сотрудники
CREATE TABLE employees (
    e_id NUMERIC(6) PRIMARY KEY,
    j_id NUMERIC(3) NOT NULL REFERENCES jobs(j_id),
    b_id NUMERIC(3) NOT NULL REFERENCES branches(b_id),
    e_name VARCHAR(100) NOT NULL,
    e_gender CHAR(1) NOT NULL CHECK(e_gender IN ('м', 'ж')),
    e_born DATE NOT NULL,
    e_hired DATE NOT NULL,
    e_fired DATE CHECK(e_hired <= e_fired),
    e_phone VARCHAR(20) NOT NULL,
    e_addr VARCHAR(100) NOT NULL,
    e_mail VARCHAR(50),
    e_passp CHAR(11) NOT NULL UNIQUE,
    e_inn CHAR(12) NOT NULL,
    e_snils CHAR(11) NOT NULL
);

-- Обслуживание номеров
CREATE TABLE room_services (
    e_id NUMERIC(6) REFERENCES employees(e_id),
    r_id NUMERIC(6) REFERENCES rooms(r_id),
    PRIMARY KEY(e_id, r_id)
);

-- Гости
CREATE TABLE guests (
    g_id NUMERIC(6) PRIMARY KEY,
    g_name VARCHAR(100) NOT NULL,
    g_gender CHAR(1) NOT NULL CHECK(g_gender IN ('м', 'ж')),
    g_born DATE NOT NULL,
    g_phone VARCHAR(20) NOT NULL UNIQUE,
    g_mail VARCHAR(50),
    g_passp CHAR(11) NOT NULL UNIQUE,
    e_id NUMERIC(6) REFERENCES employees(e_id)
);

-- Оказанные услуги
CREATE TABLE provided_services (
    ps_id NUMERIC(10) PRIMARY KEY,
    e_id NUMERIC(6) NOT NULL REFERENCES employees(e_id),
    g_id NUMERIC(6) NOT NULL REFERENCES guests(g_id),
    s_id NUMERIC(4) NOT NULL REFERENCES services(s_id),
    ps_date DATE NOT NULL,
    ps_time TIME NOT NULL
);

-- Занятые номера
CREATE TABLE bookings (
    b_id NUMERIC(10) PRIMARY KEY,
    rt_id NUMERIC(6),
    b_date DATE NOT NULL,
    r_id NUMERIC(6) NOT NULL REFERENCES rooms(r_id),
    g_id NUMERIC(6) NOT NULL REFERENCES guests(g_id),
    b_arrival_date DATE NOT NULL,
    b_arrival_time TIME NOT NULL,
    b_departure_date DATE NOT NULL CHECK(b_departure_date >= b_arrival_date),
    b_departure_time TIME NOT NULL,
    e_id_arrival NUMERIC(6) REFERENCES employees(e_id),
    b_arrival_fact_date DATE,
    e_id_departure NUMERIC(6) REFERENCES employees(e_id),
    b_departure_fact_date DATE CHECK(b_departure_fact_date >= b_arrival_fact_date),
    UNIQUE(b_id, rt_id)
);

-- Проживание
CREATE TABLE residence (
    res_id NUMERIC(6) PRIMARY KEY,
    b_id NUMERIC(6),
    rt_id NUMERIC(6) UNIQUE,
    r_id NUMERIC(6),
    -- g_id NUMERIC(6) REFERENCES guests(g_id),
    FOREIGN KEY(b_id, rt_id)
    REFERENCES bookings(b_id, rt_id),
    FOREIGN KEY(rt_id, r_id)
    REFERENCES rooms(rt_id, r_id)
);

