create database testdb;
create TABLE PRODUCT (
ID int(11),
nameProduct char(100),
priceProduct int (10),
brandProduct char(100),
descriptionProduct char(255),
imageProduct char(255)
);

insert into PRODUCT(nameProduct, priceProduct, brandProduct, descriptionProduct, imageProduct)
values 
('Acer Nitro 5',23490000,'Acer','RAM: 100GB','images/product/acer-nitro-5.jpg'),
('Acer Swift 3',17490000,'Acer','RAM: 100GB','images/product/acer-swift-3.jpg'),
('LG Gram',50000000,'LG','RAM: 100GB','images/product/lg-gram.jpg')