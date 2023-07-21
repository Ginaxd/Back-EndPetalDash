use app_delivery;
create table users (
	id int primary  key auto_increment,
    email varchar(180) not null unique,
    name varchar(90) not null,
    lastname varchar(90) not null,
    phone varchar(10) not null unique, 
    image varchar(255) null,
    password varchar(90) not null,
    created_at timestamp(0) not null,
    updated_at timestamp(0) not null  
);

use app_delivery;

CREATE TABLE roles(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(90) NOT NULL UNIQUE, 
image VARCHAR(255) NULL,
route VARCHAR(180) NOT NULL,
created_at TIMESTAMP(0) NOT NULL, 
updated_at TIMESTAMP(0) NOT NULL
);


INSERT INTO roles(
name,
route,
created_at,
updated_at
)
VALUES(
'FLOWERSHOP',
'/flowershop/orders/list',
'2023-07-17',
'2023-07-17'
);

INSERT INTO roles(
name,
route,
created_at,
updated_at
)
VALUES(
'REPARTIDOR',
'/delivery/orders/list',
'2023-07-17',
'2023-07-17'
);

INSERT INTO roles(
name,
route,
created_at,
updated_at
)
VALUES(
'CLIENTE',
'/client/products/list',
'2023-07-17',
'2023-07-17'
);


CREATE TABLE user_has_roles(
id_user INT NOT NULL,
id_rol BIGINT NOT NULL,
created_at TIMESTAMP(0) NOT NULL,
updated_at TIMESTAMP(6) NOT NULL,
FOREIGN KEY (id_user) REFERENCES users (id) ON UPDATE CASCADE ON DELETE CASCADE, 
FOREIGN KEY(id_rol) REFERENCES roles (id) ON UPDATE CASCADE ON DELETE CASCADE, 
PRIMARY KEY(id_user, id_rol)
); 

create table categories(
	id int primary key auto_increment,
    name varchar(180) not null,
    description text not null,
    created_at timestamp (0) not null,
    updated_at timestamp(0) not null
);

create table products(
	id int primary key auto_increment,
    name varchar(180) not null unique,
    description text not null,
    price decimal not null,
    image1 varchar(255) null,
    image2 varchar(255) null,
    image3 varchar(255) null,
    id_category int not null,
    created_at timestamp(0) not null,
    updated_at timestamp(0) not null,
    foreign key(id_category) references categories(id) on update cascade on delete cascade
);

CREATE TABLE address(
	id INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(255) NOT NULL,
    neighborhood VARCHAR(180) NOT NULL,
    lat DOUBLE PRECISION NOT NULL,
    lng DOUBLE PRECISION NOT NULL,
    created_at TIMESTAMP(0) NOT NULL,
    updated_at TIMESTAMP(0) NOT NULL,
    id_user INT NOT NULL,
    FOREIGN KEY(id_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);