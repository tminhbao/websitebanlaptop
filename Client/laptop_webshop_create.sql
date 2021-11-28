create database if not exists laptop_webshop;

use laptop_webshop;

-- drop database laptop_webshop;

create table if not exists actor
(
	actor_id varchar(20) unique not null,
    actor_name varchar(255) character set utf8mb4 not null,
    age tinyint,
    gender varchar(10),
    phone char(10) not null,
    address varchar(255) character set utf8mb4 not null,
    email varchar(30) not null,
    actor_username varchar(20) not null unique,
    actor_password varchar(20) not null,
    created datetime,
    is_admin boolean not null,
    
    constraint PK_actor primary key (actor_id),
    constraint Chk_actor check (age between 0 and 100)
);

create table if not exists manufacture
(
	manufacture_id varchar(20) unique not null,
    manufacture_name varchar(255) not null,
    manufacture_description text,
    
    constraint PK_manufacture primary key (manufacture_id)
);

create table if not exists model
(
	model_id varchar(20) unique not null,
    model_name varchar(255) not null,
    manufacture_id varchar(20),
    model_description text,
    
    constraint PK_model primary key (model_id)
);

create table if not exists laptop
(
	laptop_id varchar(20) unique not null,
    manufacture varchar(20) not null,
    model varchar(20) not null,
    laptop_name varchar(255) character set utf8mb4 not null,
    laptop_description text,
    laptop_cpu varchar(255),
    laptop_ram varchar(255),
    laptop_vga varchar(255),
    laptop_disk varchar(255),
    image varchar(255),
    cost bigint unsigned,
    price bigint unsigned,
    inventory mediumint unsigned,
    
    constraint PK_product primary key (laptop_id)
);

create table if not exists discount
(
	discount_id varchar(20) unique not null,
    laptop_id varchar(20) not null,
    discount_percent tinyint not null,
    start_at datetime not null,
    end_at datetime not null,
    
    constraint Chk_discount check ((discount_percent between 0 and 100) and (start_at <= end_at)),
    constraint PK_discount primary key (discount_id)
);

create table if not exists cart
(
	cart_id varchar(20) unique not null,
    actor_id varchar(20),
    cart_status varchar(50) character set utf8mb4 not null,
    total_money bigint unsigned,
    updated_at datetime,
    
    constraint PK_cart primary key (cart_id)
);

create table if not exists cartDetail
(
	detail_id varchar(20) unique not null,
    cart_id varchar(20) not null,
    laptop_id varchar(20) not null,
    quantity mediumint unsigned not null,
    
    constraint PK_cartDetail primary key (detail_id, cart_id)
);

create table if not exists purchaseOrder
(
	order_id varchar(20) unique not null,
    cart_id varchar(20) not null,
    created_at datetime,
    order_status varchar(50) character set utf8mb4 not null,
    
    constraint PK_order primary key (order_id)
);

create table if not exists receiptInvoice
(
	receipt_id varchar(20) unique not null,
    admin_id varchar(20),
    created_at datetime,
    total_money bigint unsigned,
    
    constraint PK_receipt primary key (receipt_id)
);

create table if not exists receiptInvoiceDetail
(
	detail_id varchar(20) unique not null,
    invoice_id varchar(20) not null,
    laptop_id varchar(20) not null,
    quantity mediumint unsigned not null,
    money bigint unsigned,
    
    constraint PK_receiptDetail primary key (detail_id, invoice_id)
);

create table if not exists salesInvoice
(
	sales_id varchar(20) unique not null,
    customer_id varchar(20),
    created_at datetime,
    total_money bigint unsigned,
    
    constraint PK_sakes primary key (sales_id)
);

create table if not exists salesInvoiceDetail
(
	detail_id varchar(20) unique not null,
    invoice_id varchar(20) not null,
    laptop_id varchar(20) not null,
    quantity mediumint unsigned not null,
    money bigint unsigned,
    
    constraint PK_salesDetail primary key (detail_id, invoice_id)
);

create table if not exists feedback
(
	feedback_id varchar(20) unique not null,
    laptop_id varchar(20) not null,
    customer_name varchar(100) character set utf8mb4 not null,
    created_at datetime,
    content text,
    
    constraint PK_feedback primary key (feedback_id, laptop_id)
);

alter table model
add constraint FK_model_manufacture
foreign key (manufacture_id) references manufacture(manufacture_id);

alter table laptop
add constraint FK_laptop_model
foreign key (model) references model(model_id);

alter table discount
add constraint FK_discount_laptop
foreign key (laptop_id) references laptop(laptop_id);
--
alter table cart
add constraint FK_cart_actor
foreign key (actor_id) references actor(actor_id);

alter table cartDetail
add constraint FK_cartDetail_cart
foreign key (cart_id) references cart(cart_id);

alter table cartDetail
add constraint FK_cartDetail_laptop
foreign key (laptop_id) references laptop(laptop_id);

alter table purchaseOrder
add constraint FK_order_cart
foreign key (cart_id) references cart(cart_id);

alter table receiptInvoice
add constraint FK_receipt_actor
foreign key (admin_id) references actor(actor_id);

alter table receiptInvoiceDetail
add constraint FK_receiptDetail_receiptInvoice
foreign key (invoice_id) references receiptInvoice(receipt_id);

alter table receiptInvoiceDetail
add constraint FK_receiptDetail_laptop
foreign key (laptop_id) references laptop(laptop_id);

alter table salesInvoice
add constraint FK_sales_actor
foreign key (customer_id) references actor(actor_id);

alter table salesInvoiceDetail
add constraint FK_salesDetail_salesInvoice
foreign key (invoice_id) references salesInvoice(sales_id);

alter table salesInvoiceDetail
add constraint FK_salesDetail_laptop
foreign key (laptop_id) references laptop(laptop_id);

alter table feedback
add constraint FK_feedback_laptop
foreign key (laptop_id) references laptop(laptop_id);