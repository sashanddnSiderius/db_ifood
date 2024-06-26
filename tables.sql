create table User (
	id int not null auto_increment primary key,
    date_created date,
    status bool,
    name varchar(50),
    email varchar(50) UNIQUE,
    password varchar(30),
    phone varchar(13),
    cpf varchar(11) UNIQUE
);

create table Restaurant (
	id int not null auto_increment primary key,
    date_created date,
    status bool,
    name varchar(50),
    description varchar(100),
    phone varchar(13),
    rate varchar(10),
    cnpj varchar(11),
    id_restaurant_category int
);

create table Restaurant_category (
	id int not null auto_increment primary key,
    date_created date,
    status bool,
    name varchar(50),
    description varchar(100)
);

create table Address (
	id int not null auto_increment primary key,
    date_created date,
    status bool,
    street varchar(30),
    district varchar(30),
    cep varchar(9),
    number varchar(13),
    complement varchar(30),
    id_user int,
    id_restaurant int
);

create table Product (
	id int not null auto_increment primary key,
    date_created date,
    status bool,
    name varchar(50),
    price int,
    description varchar(100),
    id_product_category int,
    id_restaurant int
);

create table Product_category (
	id int not null auto_increment primary key,
    date_created date,
    status bool,
    name varchar(50),
    description varchar(100)
);

create table Product_add (
	id int not null auto_increment primary key,
    date_created date,
    status bool,
    name varchar(50),
    description varchar(100),
    price int
);

create table Product_add_registry (
	id_product int,
    id_add int
);

create table Order_history (
	id int not null auto_increment primary key,
    id_order int,
    id_status int
);

create table Ordering (
	id int not null auto_increment primary key,
    status bool,
    date_created date,
    delivery_fee int,
    total_price int,
    description varchar(100),
    is_withdraw bool,
    id_address int,
    id_user int,
    id_restaurant int,
    id_cupom int,
    id_status int
);

create table Order_status (
	id int not null auto_increment primary key,
    date_created date,
    status bool,
    name varchar(50),
    description varchar(100)
);

create table Order_production (
	id int not null auto_increment primary key,
    id_order int,
    id_product int
);

create table Order_production_add (
	quantity int,
    id_order_production int,
    id_product_add int
);

create table Business_hours (
	id int not null auto_increment primary key,
    date_created date,
    status bool,
    day varchar(10),
    opening varchar(10),
    closing varchar(10)
);

create table Rating (
	id int not null auto_increment primary key,
    date_created date,
    status bool,
    order_rating int,
    description varchar(100),
    id_order int
);

create table Favorite (
	id int not null auto_increment primary key,
    id_user int,
    id_restaurant int
);

create table Cupom (
	id int not null auto_increment primary key,
    date_created date,
    status bool,
    code varchar(20),
    price int,
    description varchar(100)
);

create table Payment (
	id int not null auto_increment primary key,
    date_created date,
    status bool,
    price int,
    date_hour varchar(10),
    id_order int,
    id_payment_method int,
    id_payment_status int
);

create table Payment_method (
	id int not null auto_increment primary key,
    date_created date,
    status bool,
    name varchar(50),
    description varchar(100)
);

create table Payment_status (
	id int not null auto_increment primary key,
    date_created date,
    status bool,
    name varchar(50),
    description varchar(100)
);

alter table Address
add foreign key (id_user) references User(id),
add foreign key (id_restaurant) references Restaurant(id);

alter table Restaurant
add foreign key (id_restaurant_category) references Restaurant_category(id);

alter table Product
add foreign key (id_product_category) references Product_category(id),
add foreign key (id_restaurant) references Restaurant(id);

alter table Rating
add foreign key (id_order) references Ordering(id);

alter table Order_history
add foreign key (id_order) references Ordering(id),
add foreign key (id_status) references Order_status(id);

alter table Product_add_registry
add foreign key (id_product) references Product(id),
add foreign key (id_add) references Product_add(id);

alter table Favorite
add foreign key (id_user) references User(id),
add foreign key (id_restaurant) references Restaurant(id);

alter table Ordering
add foreign key (id_address) references Address(id),
add foreign key (id_user) references User(id),
add foreign key (id_restaurant) references Restaurant(id),
add foreign key (id_cupom) references Cupom(id),
add foreign key (id_status) references Order_status(id);

alter table Order_production
add foreign key (id_order) references Ordering(id),
add foreign key (id_product) references Product(id);

alter table Order_production_add
add foreign key (id_order_production) references Order_production(id),
add foreign key (id_product_add) references Product_add(id);

alter table Payment
add foreign key (id_order) references Ordering(id),
add foreign key (id_payment_method) references Payment_method(id),
add foreign key (id_payment_status) references Payment_status(id);

INSERT INTO User (status, date_created, name, email, password, phone, cpf) VALUES
(1, NOW(), 'Zidero', 'zidero@google.com', 123456789, 87912345678, 12332111238),
(1, NOW(), 'Sasha', 'shasha@google.com', 123456678, 87912345679, 12332111239),
(1, NOW(), 'Tito', 'tito@google.com', 123456672, 87912345673, 12332111230);

INSERT INTO Restaurant_category (status, date_created, name, description) VALUES
(1, NOW(), 'Pizzariariaria', 'Pizzaria normal'),
(1, NOW(), 'Hamburgueriariaria', 'Humburgueria normal'),
(1, NOW(), 'Japa', 'Japonês');
