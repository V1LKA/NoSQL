CREATE TABLE orders_by_courier (
    courier_id text,
    order_date date,
    order_id text,
    customer_name text,
    delivery_address text,
    zone_id text,
    current_status text,
    PRIMARY KEY ((courier_id), order_date, order_id)
) WITH CLUSTERING ORDER BY (order_date DESC, order_id ASC);


CREATE TABLE events_by_order (
    order_id text,
    event_time timestamp,
    event_id text,
    event_type text,
    location text,
    details text,
    PRIMARY KEY ((order_id), event_time, event_id)
) WITH CLUSTERING ORDER BY (event_time ASC, event_id ASC);


CREATE TABLE orders_by_zone (
    zone_id text,
    status text,
    order_id text,
    courier_id text,
    delivery_address text,
    PRIMARY KEY ((zone_id), status, order_id)
) WITH CLUSTERING ORDER BY (status ASC, order_id ASC);


INSERT INTO orders_by_courier (courier_id, order_date, order_id, customer_name, delivery_address, zone_id, current_status) VALUES ('CUR-101', '2026-10-08', 'ORD-5001', 'Алексей С.', 'ул. Абая 150', 'ZONE-CENTER', 'DELIVERED');
INSERT INTO orders_by_courier (courier_id, order_date, order_id, customer_name, delivery_address, zone_id, current_status) VALUES ('CUR-101', '2026-10-08', 'ORD-5002', 'Мария П.', 'пр. Достык 45', 'ZONE-CENTER', 'IN_TRANSIT');
INSERT INTO orders_by_courier (courier_id, order_date, order_id, customer_name, delivery_address, zone_id, current_status) VALUES ('CUR-101', '2026-10-07', 'ORD-4990', 'Иван К.', 'ул. Гоголя 88', 'ZONE-NORTH', 'DELIVERED');
INSERT INTO orders_by_courier (courier_id, order_date, order_id, customer_name, delivery_address, zone_id, current_status) VALUES ('CUR-101', '2026-10-06', 'ORD-4950', 'Ольга В.', 'ул. Сейфуллина 12', 'ZONE-NORTH', 'DELIVERED');
INSERT INTO orders_by_courier (courier_id, order_date, order_id, customer_name, delivery_address, zone_id, current_status) VALUES ('CUR-102', '2026-10-08', 'ORD-5003', 'Дмитрий М.', 'ул. Жандосова 20', 'ZONE-WEST', 'PICKED_UP');
INSERT INTO orders_by_courier (courier_id, order_date, order_id, customer_name, delivery_address, zone_id, current_status) VALUES ('CUR-102', '2026-10-08', 'ORD-5004', 'Елена Т.', 'ул. Алтынсарина 5', 'ZONE-WEST', 'CREATED');
INSERT INTO orders_by_courier (courier_id, order_date, order_id, customer_name, delivery_address, zone_id, current_status) VALUES ('CUR-102', '2026-10-07', 'ORD-4988', 'Арман Б.', 'ул. Саина 102', 'ZONE-WEST', 'DELIVERED');
INSERT INTO orders_by_courier (courier_id, order_date, order_id, customer_name, delivery_address, zone_id, current_status) VALUES ('CUR-103', '2026-10-08', 'ORD-5005', 'Данияр К.', 'пр. Аль-Фараби 77', 'ZONE-SOUTH', 'IN_TRANSIT');


INSERT INTO events_by_order (order_id, event_time, event_id, event_type, location, details) VALUES ('ORD-5002', '2026-10-08 10:00:00+0000', 'EV-01', 'CREATED', 'Ресторан Тай', 'Заказ зарегистрирован');
INSERT INTO events_by_order (order_id, event_time, event_id, event_type, location, details) VALUES ('ORD-5002', '2026-10-08 10:15:00+0000', 'EV-02', 'PICKED_UP', 'Ресторан Тай', 'Курьер забрал заказ');
INSERT INTO events_by_order (order_id, event_time, event_id, event_type, location, details) VALUES ('ORD-5002', '2026-10-08 10:30:00+0000', 'EV-03', 'IN_TRANSIT', 'ул. Байтурсынова', 'Курьер в пути');
INSERT INTO events_by_order (order_id, event_time, event_id, event_type, location, details) VALUES ('ORD-5001', '2026-10-08 08:30:00+0000', 'EV-01', 'CREATED', 'Склад 1', 'Сформирован');
INSERT INTO events_by_order (order_id, event_time, event_id, event_type, location, details) VALUES ('ORD-5001', '2026-10-08 08:45:00+0000', 'EV-02', 'PICKED_UP', 'Склад 1', 'Забран курьером');
INSERT INTO events_by_order (order_id, event_time, event_id, event_type, location, details) VALUES ('ORD-5001', '2026-10-08 09:20:00+0000', 'EV-03', 'DELIVERED', 'ул. Абая 150', 'Успешно вручен');
INSERT INTO events_by_order (order_id, event_time, event_id, event_type, location, details) VALUES ('ORD-5003', '2026-10-08 11:00:00+0000', 'EV-01', 'CREATED', 'Пиццерия 3', 'Ожидает курьера');
INSERT INTO events_by_order (order_id, event_time, event_id, event_type, location, details) VALUES ('ORD-5003', '2026-10-08 11:10:00+0000', 'EV-02', 'PICKED_UP', 'Пиццерия 3', 'Забран курьером');
INSERT INTO events_by_order (order_id, event_time, event_id, event_type, location, details) VALUES ('ORD-5005', '2026-10-08 11:00:00+0000', 'EV-01', 'CREATED', 'Суши-Бар', 'Принят курьером');


INSERT INTO orders_by_zone (zone_id, status, order_id, courier_id, delivery_address) VALUES ('ZONE-CENTER', 'IN_TRANSIT', 'ORD-5002', 'CUR-101', 'пр. Достык 45');
INSERT INTO orders_by_zone (zone_id, status, order_id, courier_id, delivery_address) VALUES ('ZONE-CENTER', 'DELIVERED', 'ORD-5001', 'CUR-101', 'ул. Абая 150');
INSERT INTO orders_by_zone (zone_id, status, order_id, courier_id, delivery_address) VALUES ('ZONE-WEST', 'PICKED_UP', 'ORD-5003', 'CUR-102', 'ул. Жандосова 20');
INSERT INTO orders_by_zone (zone_id, status, order_id, courier_id, delivery_address) VALUES ('ZONE-WEST', 'CREATED', 'ORD-5004', 'CUR-102', 'ул. Алтынсарина 5');
INSERT INTO orders_by_zone (zone_id, status, order_id, courier_id, delivery_address) VALUES ('ZONE-SOUTH', 'IN_TRANSIT', 'ORD-5005', 'CUR-103', 'пр. Аль-Фараби 77');
INSERT INTO orders_by_zone (zone_id, status, order_id, courier_id, delivery_address) VALUES ('ZONE-NORTH', 'DELIVERED', 'ORD-4990', 'CUR-101', 'ул. Гоголя 88');



SELECT * FROM orders_by_courier WHERE courier_id = 'CUR-101' AND order_date = '2026-10-08';


SELECT * FROM events_by_order WHERE order_id = 'ORD-5002';


SELECT * FROM orders_by_zone WHERE zone_id = 'ZONE-CENTER' AND status = 'IN_TRANSIT';


SELECT * FROM events_by_order WHERE order_id = 'ORD-5002' AND event_time >= '2026-10-08 10:00:00+0000' AND event_time <= '2026-10-08 10:20:00+0000';


SELECT order_date, order_id, current_status, delivery_address FROM orders_by_courier WHERE courier_id = 'CUR-101';


UPDATE orders_by_courier SET current_status = 'DELIVERED' WHERE courier_id = 'CUR-101' AND order_date = '2026-10-08' AND order_id = 'ORD-5002';


SELECT * FROM orders_by_courier WHERE courier_id = 'CUR-101' AND order_date = '2026-10-08';


DELETE FROM events_by_order WHERE order_id = 'ORD-5002' AND event_time = '2026-10-08 10:30:00+0000' AND event_id = 'EV-03';


SELECT * FROM events_by_order WHERE order_id = 'ORD-5002';