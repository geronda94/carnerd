CREATE DATABASE carnerd;
CREATE USER washer WITH PASSWORD 'detailing';
ALTER USER washer WITH SUPERUSER;
GRANT ALL PRIVILEGES ON DATABASE carnerd TO washer;


CREATE TABLE booking(
    id SERIAL PRIMARY KEY,
    session_id TEXT,
    ip_address inet,
    booking_date DATE,
    booking_time TIME,
    client_phone VARCHAR(15),
    client_name VARCHAR(30),
    client_lang VARCHAR(5),
    service_name VARCHAR(35),
    service_link  VARCHAR(30),
    service_price DECIMAL,
    car_type VARCHAR(30),
    order_posted TIMESTAMP,
    order_status VARCHAR(15)
);

CREATE TABLE start_clients(
    id SERIAL PRIMARY KEY,
    session_id TEXT,
    ip_address inet,
    booking_date DATE,
    client_phone VARCHAR(15),
    service_name VARCHAR(35),
    service_link  VARCHAR(30),
    order_posted TIMESTAMP
)


CREATE TABLE services (
    id SERIAL PRIMARY KEY,
    order_num INT,
    service_link VARCHAR(30),
    service_name_ro VARCHAR(35),
    service_name_en VARCHAR(35),
    service_name_ua VARCHAR(35),
    avatar_link TEXT,
    service_li_ro TEXT,
    service_li_en TEXT,
    service_li_ua TEXT,
    time_need INT,
    service_description_ro TEXT,
    service_description_en TEXT,
    service_description_ua TEXT,
    type_1_name_ro VARCHAR(30),
    type_1_name_en VARCHAR(30),
    type_1_name_ua VARCHAR(30),
    type_1_price DECIMAL,
    type_2_name_ro VARCHAR(30),
    type_2_name_en VARCHAR(30),
    type_2_name_ua VARCHAR(30),
    type_2_price DECIMAL,
    type_3_name_ro VARCHAR(30),
    type_3_name_en VARCHAR(30),
    type_3_name_ua VARCHAR(30),
    type_3_price DECIMAL,
    type_4_name_ro VARCHAR(30),
    type_4_name_en VARCHAR(30),
    type_4_name_ua VARCHAR(30),
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
    color_title VARCHAR(15),
    color_desc VARCHAR(15)
);

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
        'service1.jpg',
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
        'service1.jpg',
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
        'service1.jpg',
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
        'service1.jpg',
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
        'service1.jpg',
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