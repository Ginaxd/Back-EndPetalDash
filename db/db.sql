use app_delivery;
create table users (
	id int primary  key auto_increment,
    email varchar(180) not null unique,
    nombre varchar(90) not null,
    lastname varchar(90) not null,
    phone varchar(10) not null unique, 
    image varchar(255) null,
    password varchar(90) not null,
    created_at timestamp(0) not null,
    updated_at timestamp(0) not null  
);