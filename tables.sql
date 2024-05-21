create table User (
	id int not null auto_increment primary key,
    date_created varchar(10),
    status int,
    name varchar(50),
    email varchar(50),
    password varchar(30),
    phone varchar(13),
    cpf varchar(11)
);

create table Restaurant (
	id int not null auto_increment primary key,
    date_created varchar(10),
    status int,
    name varchar(50),
    description varchar(100),
    phone varchar(13),
    rate varchar(10),
    cnpj varchar(11),
    id_restaurant_category int
);

create table Restaurant_category (
	id int not null auto_increment primary key,
    data_created varchar(10),
    status int,
    name varchar(50),
    description varchar(100)
);

create table Address (
	id int not null auto_increment primary key,
    date_created varchar(10),
    status int,
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
    date_created varchar(10),
    status int,
    name varchar(50),
    price int,
    description varchar(100),
    id_product_category int,
    id_restaurant int
);

create table Product_category (
	id int not null auto_increment primary key,
    data_created varchar(10),
    status int,
    name varchar(50),
    description varchar(100)
);

create table Product_add (
	id int not null auto_increment primary key,
    data_created varchar(10),
    status int,
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
    data_created varchar(10),
    status int,
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
    data_created varchar(10),
    status int,
    day varchar(10),
    opening varchar(10),
    closing varchar(10)
);

create table Rating (
	id int not null auto_increment primary key,
    data_created varchar(10),
    status int,
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
    data_created varchar(10),
    status int,
    code varchar(20),
    price int,
    description varchar(100)
);

create table Payment (
	id int not null auto_increment primary key,
    data_created varchar(10),
    status int,
    price int,
    date_hour varchar(10),
    id_order int,
    id_payment_method int,
    id_payment_status int
);

create table Payment_method (
	id int not null auto_increment primary key,
    data_created varchar(10),
    status int,
    name varchar(50),
    description varchar(100)
);

create table Payment_status (
	id int not null auto_increment primary key,
    data_created varchar(10),
    status int,
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

INSERT INTO User (name, email, password, phone, cpf) VALUES
('Alice Santos', 'alice.santos@example.com', 'password123', '11987654321', '12345678901'),
('Bruno Lima', 'bruno.lima@example.com', 'password123', '21987654321', '23456789012'),
('Carla Silva', 'carla.silva@example.com', 'password123', '31987654321', '34567890123'),
('Daniel Costa', 'daniel.costa@example.com', 'password123', '41987654321', '45678901234'),
('Elena Souza', 'elena.souza@example.com', 'password123', '51987654321', '56789012345'),
('Fernando Almeida', 'fernando.almeida@example.com', 'password123', '61987654321', '67890123456'),
('Gabriela Mendes', 'gabriela.mendes@example.com', 'password123', '71987654321', '78901234567'),
('Henrique Oliveira', 'henrique.oliveira@example.com', 'password123', '81987654321', '89012345678'),
('Isabela Ferreira', 'isabela.ferreira@example.com', 'password123', '91987654321', '90123456789'),
('João Pedro', 'joao.pedro@example.com', 'password123', '11987654322', '01234567890');

INSERT INTO Restaurant_category (name, description) VALUES
('Comida Caseira', 'Monte sua marmita'),
('Pizzarias', 'Pizzas de diversos sabores'),
('Hamburguerias', 'Hambúrgueres gourmet com acompanhamentos especiais'),
('Japonês', 'Culinária japonesa'),
('Churrascarias', 'Cortes de carnes assadas na brasa');

INSERT INTO Restaurant (name, description, phone, cnpj, id_restaurant_category) VALUES
('Sabor da Casa', 'Comida caseira e aconchegante', '11912345678', '12345678001', 1),
('Pizzaria Bella', 'Pizzas artesanais com ingredientes frescos', '11923456789', '12345678002', 4),
('Hamburgueria Top', 'Hambúrgueres gourmet e suculentos', '11934567890', '12345678003', 2),
('Sushi Master', 'O melhor sushi da cidade', '11945678901', '12345678004', 5),
('Churrascaria Fogo de Chão', 'Churrasco brasileiro de alta qualidade', '11956789012', '12345678005', 3),
('Veggie Delight', 'Delícias vegetarianas e veganas', '11967890123', '12345678006', 1),
('Italiano Original', 'Massas e pizzas italianas autênticas', '11978901234', '12345678007', 4),
('Doces & Bolos', 'Doces artesanais e bolos de festa', '11989012345', '12345678008', 1),
('Burger King', 'Hambúrgueres de fama mundial', '11990123456', '12345678009', 2),
('Sushi Express', 'Sushis rápidos e frescos', '11901234567', '12345678010', 5);


INSERT INTO Address (street, district, cep, number, complement, id_user) VALUES
('Rua das Cerejeiras', 'Jardim das Acácias', '12345-678', '101', 'Apto 201', 1),
('Avenida Portuguesa', 'Centro', '23456-789', '202', 'Bloco B', 2),
('Rua dos Macaos', 'Vila Mariana', '34567-890', '303', 'Casa', 3),
('Avenida Djair', 'Bela Vista', '45678-901', '404', 'Cobertura', 4),
('Rua das Lagoas', 'Jardim América', '56789-012', '505', 'Casa', 5),
('Avenida Jão de Siqueira', 'Copacabana', '67890-123', '606', 'Apto 102', 6),
('Rua do Solário', 'Leblon', '78901-234', '707', 'Apto 301', 7),
('Avenida do Negão', 'Centro', '89012-345', '808', 'Apto 401', 8),
('Rua dos Paratis', 'Jardim Europa', '90123-456', '909', 'Bloco A', 9),
('Avenida Bernardino', 'Centro', '01234-567', '1010', 'Bloco A', 10);

INSERT INTO Address (street, district, cep, number, complement, id_restaurant) VALUES
('Rua das Flores', 'Centro', '12345-678', '101', 'Loja 1', 1),
('Avenida Brasil', 'Jardim América', '23456-789', '202', 'Sala 2', 2),
('Rua dos Lírios', 'Vila Mariana', '34567-890', '303', 'Loja 3', 3),
('Avenida Paulista', 'Bela Vista', '45678-901', '404', 'Sala 4', 4),
('Rua da Paz', 'Copacabana', '56789-012', '505', 'Loja 5', 5),
('Avenida Atlântica', 'Leblon', '67890-123', '606', 'Sala 6', 6),
('Rua do Sol', 'Ipanema', '78901-234', '707', 'Loja 7', 7),
('Avenida das Nações', 'Barra da Tijuca', '89012-345', '808', 'Sala 8', 8),
('Rua das Palmeiras', 'Botafogo', '90123-456', '909', 'Loja 9', 9),
('Avenida Rio Branco', 'Laranjeiras', '01234-567', '1010', 'Sala 10', 10);

INSERT INTO Product_category (name, description) VALUES
('Pizza', 'Pizzas variadas para todos os gostos'),
('Japonês', 'Comidas regionais orientais'),
('Churrasco', 'Cortes de carnes'),
('Comida caseira', 'Comidas tradicionais brasileiras'),
('Lanche', 'Lanches em geral');

INSERT INTO Product (name, price, description, id_product_category, id_restaurant) VALUES
('Pizza Calabresa', 40, 'Tradicional de calabresa', 1, 2),
('Pizza Marguerita', 50, 'Tradicional de marguerita', 1, 7),
('Marmita P', 20, 'Marmita 1 carne', 4, 1),
('Salandância de Pepinância', 25, 'Salada de pepino', 4, 6),
('Picanha', 90, 'Peça de picanha', 3, 5),
('Maminha', 80, 'Peça de maminha', 3, 5),
('Sushi Salmão 20 peças', 40, 'Sushi Salmão Tradicional', 2, 4),
('Hot Roll Skin 20 peças', 40, 'Hot Roll Skin', 2, 10),
('Americano', 25, 'Americano tradicional', 5, 9),
('X-burguer', 40, 'Cheese Burguer Tradicional', 5, 3),
('Cheesecake', 40, 'Cheesecake Tradicional', 5, 8);

INSERT INTO Product_add (name, description, price) VALUES
('Cebola', 'Rodelas de cebola', 2),
('Azeitona', 'Azeitona sem caroço', 3),
('Canela', 'Canela em pó', 4);

INSERT INTO Order_status (name, description) VALUES
('Em análise', 'Analisando o pedido'),
('Em produção', 'Seu pedido está sendo feito'),
('Saiu para entrega', 'Seu produto está em roda de entrega'),
('Entregue', 'Seu produto foi entregue');

