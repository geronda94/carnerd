

CREATE DATABASE carnerd TEMPLATE template0 ENCODING 'UTF8' LC_COLLATE 'en_US.utf8' LC_CTYPE 'en_US.utf8';
CREATE USER washer WITH PASSWORD 'detailing';
ALTER USER washer WITH SUPERUSER;
GRANT ALL PRIVILEGES ON DATABASE carnerd TO washer;


CREATE TABLE booking(
    id SERIAL PRIMARY KEY,
    session_id TEXT,
    ip_address inet,
    booking_date DATE,
    booking_time TIME,
    client_phone TEXT,
    client_name TEXT,
    client_lang TEXT,
    service_name TEXT,
    service_link  TEXT,
    service_price DECIMAL,
    car_type TEXT,
    order_posted TIMESTAMP,
    order_status TEXT
);

CREATE TABLE start_clients(
    id SERIAL PRIMARY KEY,
    session_id TEXT,
    ip_address inet,
    booking_date DATE,
    client_phone TEXT,
    service_name TEXT,
    service_link  TEXT,
    order_posted TIMESTAMP
);


CREATE TABLE services (
    id SERIAL PRIMARY KEY,
    order_num INT,
    service_link TEXT,
    service_name_ro TEXT,
    service_name_en TEXT,
    service_name_ua TEXT,
    avatar_link TEXT,
    service_li_ro TEXT,
    service_li_en TEXT,
    service_li_ua TEXT,
    time_need INT,
    service_description_ro TEXT,
    service_description_en TEXT,
    service_description_ua TEXT,
    type_1_name_ro TEXT,
    type_1_name_en TEXT,
    type_1_name_ua TEXT,
    type_1_price DECIMAL,
    type_2_name_ro TEXT,
    type_2_name_en TEXT,
    type_2_name_ua TEXT,
    type_2_price DECIMAL,
    type_3_name_ro TEXT,
    type_3_name_en TEXT,
    type_3_name_ua TEXT,
    type_3_price DECIMAL,
    type_4_name_ro TEXT,
    type_4_name_en TEXT,
    type_4_name_ua TEXT,
    type_4_price DECIMAL
);


CREATE TABLE slider(
    id SERIAL PRIMARY KEY,
    photo_link TEXT,
    photo_name TEXT,
    order_by INT,
    title_ro TEXT,
    title_en TEXT,
    title_ua TEXT,
    desc_ro TEXT,
    desc_en TEXT,
    desc_ua TEXT,
    color_title TEXT,
    color_desc TEXT
);



CREATE TABLE users (
    id  SERIAL PRIMARY KEY,
    login TEXT,
    name TEXT,
    permission TEXT,
    psw TEXT,
    last_login TIMESTAMP
);

INSERT INTO users(login, name, permission, psw) 
VALUES ('goga94', 'Igor' , 'full', 'sha256:600000$LIovlBUCsNJppTzG$0b0cecd82cb81520acec85e4bbfe6b41f104d420793a30f049896111b891a0e8'),-- fulladmin
('owner', 'Alexander' , 'full', 'sha256:600000$oDUS6w0yuofs0AjI$74d0c0d57f40b6601be917290244b8cddf08627dee7b3c301a13598a3cf7695d');-- ownerlogin





































INSERT INTO slider(photo_link, photo_name, order_by, title_ro, title_en, title_ua, desc_ro, desc_en, desc_ua, color_title, color_desc) 
VALUES ('slide1.jpg','1-slide', '1', 'Photo title example', 'Photo title example', 'Пример заголовка для фото','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Autem, expedita.','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Autem, expedita.','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Autem, expedita.','#fff','#fff'),
('slide2.jpg','2-slide', '2','Photo title example', 'Photo title example', 'Пример заголовка для фото','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Autem, expedita.','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Autem, expedita.','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Autem, expedita.','#fff','#fff'),
('slide3.jpg','3-slide', '3','Photo title example', 'Photo title example', 'Пример заголовка для фото','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Autem, expedita.','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Autem, expedita.','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Autem, expedita.','#fff','#fff'),
('slide4.jpg','4-slide', '4','Photo title example', 'Photo title example', 'Пример заголовка для фото','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Autem, expedita.','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Autem, expedita.','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Autem, expedita.','#fff','#fff');
















INSERT INTO services(
    order_num,
    time_need,
    service_link,
    service_name_ro,
    service_name_en,
    service_name_ua,
    avatar_link,
    service_li_ro,
    service_li_en,
    service_li_ua,
    service_description_ro,
    service_description_en,
    service_description_ua,
    type_1_name_ro,
    type_1_name_en,
    type_1_name_ua,
    type_1_price,
    type_2_name_ro,
    type_2_name_en,
    type_2_name_ua,
    type_2_price
    ) VALUES (
        1,
        30,        
        'body-wash',  
        'Body wash',  
        'Body wash',  
        'Мойка кузова',
        'body_wash.jpg',
        'Thorough body wash, Car interior cleaning, Interior refresh',
        'Thorough body wash, Car interior cleaning, Interior refresh',
        'Thorough body wash, Car interior cleaning, Interior refresh',
        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iste, optio enim. Voluptate sunt, natus voluptatum consequuntur, impedit nesciunt ipsum ipsam doloribus iure ut neque explicabo. Et atque magnam voluptates delectus! Natus in incidunt dolores',
        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iste, optio enim. Voluptate sunt, natus voluptatum consequuntur, impedit nesciunt ipsum ipsam doloribus iure ut neque explicabo. Et atque magnam voluptates delectus! Natus in incidunt dolores',
        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iste, optio enim. Voluptate sunt, natus voluptatum consequuntur, impedit nesciunt ipsum ipsam doloribus iure ut neque explicabo. Et atque magnam voluptates delectus! Natus in incidunt dolores',
        'Autotusrism - Sedan, Hatchback',
        'Autotusrism - Sedan, Hatchback',
        'Autotusrism - Sedan, Hatchback',
        '100',
        'SUV - Crossover, SUV',
        'SUV - Crossover, SUV',
        'SUV - Crossover, SUV',
        '110'        
    ),(
        2,
        45,       
        'complex-wash',  
        'Complex wash',  
        'Complex wash',  
        'Комплексная мойка',
        'complex.jpeg',
        'Thorough body wash, Car interior cleaning, Interior refresh',
        'Thorough body wash, Car interior cleaning, Interior refresh',
        'Thorough body wash, Car interior cleaning, Interior refresh',
        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iste, optio enim. Voluptate sunt, natus voluptatum consequuntur, impedit nesciunt ipsum ipsam doloribus iure ut neque explicabo. Et atque magnam voluptates delectus! Natus in incidunt dolores',
        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iste, optio enim. Voluptate sunt, natus voluptatum consequuntur, impedit nesciunt ipsum ipsam doloribus iure ut neque explicabo. Et atque magnam voluptates delectus! Natus in incidunt dolores',
        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iste, optio enim. Voluptate sunt, natus voluptatum consequuntur, impedit nesciunt ipsum ipsam doloribus iure ut neque explicabo. Et atque magnam voluptates delectus! Natus in incidunt dolores',
        'Autotusrism - Sedan, Hatchback',
        'Autotusrism - Sedan, Hatchback',
        'Autotusrism - Sedan, Hatchback',
        '110',
        'SUV - Crossover, SUV',
        'SUV - Crossover, SUV',
        'SUV - Crossover, SUV',
        '120'        
    ),(
        3,
        50,    
        'premium-wash',  
        'Premium wash',  
        'Premium wash',  
        'Премиальная мойка',
        'premium_wash.jpg',
        'Thorough body wash, Car interior cleaning, Interior refresh',
        'Thorough body wash, Car interior cleaning, Interior refresh',
        'Thorough body wash, Car interior cleaning, Interior refresh',
        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iste, optio enim. Voluptate sunt, natus voluptatum consequuntur, impedit nesciunt ipsum ipsam doloribus iure ut neque explicabo. Et atque magnam voluptates delectus! Natus in incidunt dolores',
        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iste, optio enim. Voluptate sunt, natus voluptatum consequuntur, impedit nesciunt ipsum ipsam doloribus iure ut neque explicabo. Et atque magnam voluptates delectus! Natus in incidunt dolores',
        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iste, optio enim. Voluptate sunt, natus voluptatum consequuntur, impedit nesciunt ipsum ipsam doloribus iure ut neque explicabo. Et atque magnam voluptates delectus! Natus in incidunt dolores',
        'Autotusrism - Sedan, Hatchback',
        'Autotusrism - Sedan, Hatchback',
        'Autotusrism - Sedan, Hatchback',
        '120',
        'SUV - Crossover, SUV',
        'SUV - Crossover, SUV',
        'SUV - Crossover, SUV',
        '130'        
    ),(
        4,
        Null,          
        'interior-cleaning',  
        'Interior cleaning',  
        'Interior cleaning',  
        'Химчистка салона',
        'himchistka.jpg',
        'Thorough body wash, Car interior cleaning, Interior refresh',
        'Thorough body wash, Car interior cleaning, Interior refresh',
        'Thorough body wash, Car interior cleaning, Interior refresh',
        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iste, optio enim. Voluptate sunt, natus voluptatum consequuntur, impedit nesciunt ipsum ipsam doloribus iure ut neque explicabo. Et atque magnam voluptates delectus! Natus in incidunt dolores',
        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iste, optio enim. Voluptate sunt, natus voluptatum consequuntur, impedit nesciunt ipsum ipsam doloribus iure ut neque explicabo. Et atque magnam voluptates delectus! Natus in incidunt dolores',
        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iste, optio enim. Voluptate sunt, natus voluptatum consequuntur, impedit nesciunt ipsum ipsam doloribus iure ut neque explicabo. Et atque magnam voluptates delectus! Natus in incidunt dolores',
        'Autotusrism - Sedan, Hatchback',
        'Autotusrism - Sedan, Hatchback',
        'Autotusrism - Sedan, Hatchback',
        '1000',
        'SUV - Crossover, SUV',
        'SUV - Crossover, SUV',
        'SUV - Crossover, SUV',
        '1000'        
    ),(
        5,
        Null,          
        'body-polishing',  
        'Body polishing',  
        'Body polishing',  
        'Полировка кузова',
        'premium_wash.jpg',
        'Thorough body wash, Car interior cleaning, Interior refresh',
        'Thorough body wash, Car interior cleaning, Interior refresh',
        'Thorough body wash, Car interior cleaning, Interior refresh',
        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iste, optio enim. Voluptate sunt, natus voluptatum consequuntur, impedit nesciunt ipsum ipsam doloribus iure ut neque explicabo. Et atque magnam voluptates delectus! Natus in incidunt dolores',
        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iste, optio enim. Voluptate sunt, natus voluptatum consequuntur, impedit nesciunt ipsum ipsam doloribus iure ut neque explicabo. Et atque magnam voluptates delectus! Natus in incidunt dolores',
        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iste, optio enim. Voluptate sunt, natus voluptatum consequuntur, impedit nesciunt ipsum ipsam doloribus iure ut neque explicabo. Et atque magnam voluptates delectus! Natus in incidunt dolores',
        'Autotusrism - Sedan, Hatchback',
        'Autotusrism - Sedan, Hatchback',
        'Autotusrism - Sedan, Hatchback',
        '1200',
        'SUV - Crossover, SUV',
        'SUV - Crossover, SUV',
        'SUV - Crossover, SUV',
        '1200'        
    );