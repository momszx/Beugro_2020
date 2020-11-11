SELECT name FROM user WHERE  id NOT IN (SELECT user FROM user_car) AND name like 'Kis%';
SELECT name ,COUNT(user_car.user) autók_száma from user INNER join user_car on user.id = user_car.user GROUP BY name HAVING count(user_car.user)>1;
SELECT name ,CONCAT_ws(',',)as car from user INNER join user_car on user.id = user_car.user INNER JOIN car on user_car.car=car.id GROUP BY name HAVING count(user_car.user)>1;
Alter TABLE user ADD nem varchar(64);
Alter TABLE user ADD szemelyi_szam int;
INSERT into car(brand, model) value ('Volkswagen','Arteon');
UPDATE car SET model='Fiesta' WHERE model='Focus';
INSERT INTO user_car(user, car) SELECT id ,8 As car From user WHERE name like '%o%' Or name LIKE '%r%';
Create INDEX user_car_index on user_car(user, car);