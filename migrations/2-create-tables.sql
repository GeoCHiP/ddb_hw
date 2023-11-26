-- Филиалы
CREATE TABLE filials (
    f_id NUMERIC(3) PRIMARY KEY,
    f_name VARCHAR(100) NOT NULL UNIQUE,
    f_phone VARCHAR(20) NOT NULL UNIQUE,
    f_addr VARCHAR(100) NOT NULL,
    f_mail VARCHAR(50) NOT NULL UNIQUE,
    f_open BOOLEAN NOT NULL
);

-- Сотрудники
CREATE TABLE employees (
    e_id NUMERIC(6) PRIMARY KEY,
    e_name VARCHAR(100) NOT NULL,
    e_gender CHAR(1) NOT NULL CHECK(e_gender IN ('м', 'ж')),
    e_born DATE NOT NULL,
    e_phone VARCHAR(20) NOT NULL,
    e_addr VARCHAR(100) NOT NULL,
    e_mail VARCHAR(50) UNIQUE,
    e_passp CHAR(11) NOT NULL UNIQUE,
    e_inn CHAR(12) NOT NULL UNIQUE,
    e_snils CHAR(11) NOT NULL UNIQUE
);

-- Должности
CREATE TABLE jobs (
    j_id NUMERIC(3) PRIMARY KEY,
    j_name VARCHAR(100) NOT NULL UNIQUE,
    j_salary NUMERIC(6) NOT NULL
);

-- Работа в филиале
CREATE TABLE work (
    w_id NUMERIC(7) PRIMARY KEY,
    e_id NUMERIC(6) NOT NULL REFERENCES employees(e_id),
    f_id NUMERIC(3) NOT NULL REFERENCES filials(f_id),
    j_id NUMERIC(3) NOT NULL REFERENCES jobs(j_id),
    e_hired DATE NOT NULL,
    e_fired DATE CHECK (e_fired >= e_hired)
);

-- Гости
CREATE TABLE guests (
    g_id NUMERIC(6) PRIMARY KEY,
    g_name VARCHAR(100) NOT NULL,
    g_gender CHAR(1) NOT NULL CHECK(g_gender IN ('м', 'ж')),
    g_born DATE NOT NULL,
    g_phone VARCHAR(20) NOT NULL,
    g_mail VARCHAR(50),
    g_passp CHAR(11) UNIQUE,
    w_id NUMERIC(7) REFERENCES work(w_id)
);

-- Справочник типов номеров
CREATE TABLE room_types_names (
    rtn_id NUMERIC(3) PRIMARY KEY,
    rtn_name VARCHAR(100) NOT NULL UNIQUE
);

-- Типы номеров
CREATE TABLE room_types (
    rt_id NUMERIC(2) PRIMARY KEY,
    rtn_id NUMERIC(3) NOT NULL REFERENCES room_types_names(rtn_id),
    rt_price NUMERIC(5) NOT NULL,
    rt_capacity NUMERIC(2) NOT NULL,
    rt_area NUMERIC(3) NOT NULL,
    f_id NUMERIC(3) NOT NULL REFERENCES filials(f_id),
    UNIQUE (rt_id, f_id)
);

-- Номера
CREATE TABLE rooms (
    r_id NUMERIC(6) PRIMARY KEY,
    r_floor NUMERIC(2) NOT NULL,
    rt_id NUMERIC(2) NOT NULL,
    f_id NUMERIC(3) NOT NULL,
    FOREIGN KEY (rt_id, f_id) REFERENCES room_types(rt_id, f_id),
    UNIQUE (r_id, rt_id)
);

-- Статусы бронирований
CREATE TABLE statuses (
    st_id NUMERIC(2) PRIMARY KEY,
    st_name VARCHAR(50) NOT NULL UNIQUE
);

-- Бронирования
CREATE TABLE bookings (
    b_id NUMERIC(10) PRIMARY KEY,
    b_book_date TIMESTAMP NOT NULL,
    rt_id NUMERIC(2) NOT NULL REFERENCES room_types(rt_id),
    g_id NUMERIC(6) NOT NULL REFERENCES guests(g_id),
    b_arr_date DATE NOT NULL CHECK (b_arr_date <= b_dep_date),
    b_dep_date DATE NOT NULL CHECK(b_dep_date >= b_arr_date),
    st_id NUMERIC(2) NOT NULL REFERENCES statuses(st_id),
    UNIQUE (b_id, rt_id)
);

-- Проживания
CREATE TABLE livings (
    l_id NUMERIC(10) PRIMARY KEY,
    b_id NUMERIC(10),
    rt_id NUMERIC(2) NOT NULL,
    r_id NUMERIC(6),
    g_id NUMERIC(6) NOT NULL REFERENCES guests(g_id),
    w_id_arr NUMERIC(7) REFERENCES work(w_id),
    l_arr_date TIMESTAMP,
    w_id_dep NUMERIC(7) REFERENCES work(w_id),
    l_dep_date TIMESTAMP CHECK(l_dep_date >= l_arr_date),
    FOREIGN KEY (b_id, rt_id) REFERENCES bookings(b_id, rt_id),
    FOREIGN KEY(r_id, rt_id) REFERENCES rooms(r_id, rt_id)
);
