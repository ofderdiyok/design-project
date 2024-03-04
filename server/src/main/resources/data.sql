-- başlangıç öncesi tüm tabloları kaldır. önce birbiri ile connectionları olanları
DROP TABLE IF EXISTS c_recipeingredient;
DROP TABLE IF EXISTS recipe;
DROP TABLE IF EXISTS ingredient;
DROP TABLE IF EXISTS imagestorage;

-- tabloları yeniden oluştur. daha sonra foreign kay varsa onları ekle
CREATE TABLE recipe (id BIGSERIAL NOT NULL, calories FLOAT, description VARCHAR(255), image VARCHAR(255), name VARCHAR(255), PRIMARY KEY (id));
CREATE TABLE ingredient ( id BIGSERIAL NOT NULL, name VARCHAR(255), PRIMARY KEY (id));
CREATE TABLE imagestorage (id bigserial NOT NULL, imagedata oid, name VARCHAR(255), type VARCHAR(255), PRIMARY KEY (id));
CREATE TABLE c_recipeingredient (id bigserial NOT NULL, ingredient_id bigint, recipe_id bigint, PRIMARY KEY (id));
ALTER TABLE if EXISTS c_recipeingredient ADD CONSTRAINT FK1y2it0upytd6c59fave8aj9rl FOREIGN KEY (ingredient_id) REFERENCES ingredient;
ALTER TABLE if EXISTS c_recipeingredient ADD CONSTRAINT FKbmrm3umi1x7oucc519kxmjt9g FOREIGN KEY (recipe_id) REFERENCES recipe;

-- insert ingredients
INSERT INTO ingredient (name) VALUES ('Onion');
INSERT INTO ingredient (name) VALUES ('Patato');
INSERT INTO ingredient (name) VALUES ('Apple');
INSERT INTO ingredient (name) VALUES ('Tomato');

-- insert recipes
INSERT INTO recipe (calories,description,image,name) VALUES (300, 'Mükemmel Menemenin Sırı Burada', 'https://img.freepik.com/free-photo/fried-tomatoes-with-eggs-table_140725-4724.jpg?t=st=1709576385~exp=1709579985~hmac=00c392a8a8dcb6ee995d17ec7e96b3d6b96d6d78c89b619481186081682ca923&w=1380', 'Menemen');

-- insert recipe - ingredient
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (1,1);
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (1,4);

