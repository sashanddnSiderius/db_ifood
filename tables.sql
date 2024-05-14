create table User (
	id int not null auto_increment primary key,
    date_created date(10),
    date time,
    status int,
    name varchar(50) not null,
    email varchar(50) not null,
    password varchar(30) not null,
    phone varchar(13) not null,
    cpf varchar(11) not null
);

create table Restaurant (
	id int not null auto_increment primary key,
    date_created date(10),
    date time,
    status int,
    name varchar(50) not null,
    description varchar(100),
    phone varchar(13) not null,
    rate varchar(10),
    cnpj varchar(11) not null,
    id_restaurant_category int
);

create table Restaurant_category (
	id int not null auto_increment primary key,
    date_created date(10),
    date time,
    status int,
    name varchar(50) not null,
    description varchar(100)
);

create table Address (
	id int not null auto_increment primary key,
    date_created date(10),
    date time,
    status int,
    street varchar(30) not null,
    district varchar(30) not null,
    cep varchar(9) not null,
    number varchar(13) not null,
    complement varchar(30),
    id_user int,
    id_restaurant int
);

create table Product (
	id int not null auto_increment primary key,
    date_created date(10),
    date time,
    status int,
    name varchar(50) not null,
    price double not null,
    description varchar(100),
    id_prduct_category int,
    id_restaurant int
);

create table Product_category (
	id int not null auto_increment primary key,
    date_created date(10),
    date time,
    status int,
    name varchar(50) not null,
    description varchar(100)
);

create table Product_add (
	id int not null auto_increment primary key,
    date_created date(10),
    date time,
    status int,
    name varchar(50) not null,
    description varchar(100),
    price double
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
    delivery_fee int,
    total_price double,
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
    date_created date(10),
    date time,
    status int,
    name varchar(50) not null,
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
    date_created date(10),
    date time,
    status int,
    day varchar(10),
    opening varchar(10),
    closing varchar(10)
);

create table Rating (
	id int not null auto_increment primary key,
    date_created date(10),
    date time,
    status int,
    order_rating int,
    description varchar(100) not null,
    id_order int
);

create table Favorite (
	id int not null auto_increment primary key,
    id_user int,
    id_restaurant int
);

create table Cupom (
	id int not null auto_increment primary key,
    date_created date(10),
    date time,
    status int,
    code varchar(20) not null,
    price double,
    description varchar(100)
);

create table Payment (
	id int not null auto_increment primary key,
    date_created date(10),
    date time,
    status int,
    price double,
    date_hour date,
    id_order int,
    id_payment_method int,
    id_payment_status int
);

create table Payment_method (
	id int not null auto_increment primary key,
    date_created date(10),
    date time,
    status int,
    name varchar(50) not null,
    description varchar(100)
);

create table Payment_status (
	id int not null auto_increment primary key,
    date_created date(10),
    date time,
    status int,
    name varchar(50) not null,
    description varchar(100)
);

alter table Address
add foreign key (id_user) references User(id),
add foreign key (id_restaurant) references Restaurant(id);

alter table Restaurant
add foreign key (id_restaurant_category) references Restaurant_category(id);

alter table Product
add foreign key (id_prduct_category) references Product_category(id),
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
