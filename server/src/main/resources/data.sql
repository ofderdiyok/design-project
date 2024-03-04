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
INSERT INTO ingredient (name) VALUES ('Cucumber');
INSERT INTO ingredient (name) VALUES ('Egg');
INSERT INTO ingredient (name) VALUES ('Tomato Paste');
INSERT INTO ingredient (name) VALUES ('Milk');
INSERT INTO ingredient (name) VALUES ('Garlic');
INSERT INTO ingredient (name) VALUES ('Spinach');
INSERT INTO ingredient (name) VALUES ('Cheese');
INSERT INTO ingredient (name) VALUES ('Rice');
INSERT INTO ingredient (name) VALUES ('Banana');
INSERT INTO ingredient (name) VALUES ('Parsley');
INSERT INTO ingredient (name) VALUES ('Carrot');
INSERT INTO ingredient (name) VALUES ('Broccoli');
INSERT INTO ingredient (name) VALUES ('Butter');
INSERT INTO ingredient (name) VALUES ('Yogurt');
INSERT INTO ingredient (name) VALUES ('Lemon');
INSERT INTO ingredient (name) VALUES ('Strawberry');
INSERT INTO ingredient (name) VALUES ('Zucchini');
INSERT INTO ingredient (name) VALUES ('Aubergine');
INSERT INTO ingredient (name) VALUES ('Pepper');
INSERT INTO ingredient (name) VALUES ('Flour');
INSERT INTO ingredient (name) VALUES ('Olive');
INSERT INTO ingredient (name) VALUES ('Sausage');
INSERT INTO ingredient (name) VALUES ('Biscuit');
INSERT INTO ingredient (name) VALUES ('Chicken');
INSERT INTO ingredient (name) VALUES ('Avocado');
INSERT INTO ingredient (name) VALUES ('Orange');
INSERT INTO ingredient (name) VALUES ('Chocolate');
INSERT INTO ingredient (name) VALUES ('Mushroom');
INSERT INTO ingredient (name) VALUES ('Baking Powder');
INSERT INTO ingredient (name) VALUES ('Walnut');
INSERT INTO ingredient (name) VALUES ('Hazelnut');
INSERT INTO ingredient (name) VALUES ('Corn');
INSERT INTO ingredient (name) VALUES ('Tuna');
INSERT INTO ingredient (name) VALUES ('Lettuce');
INSERT INTO ingredient (name) VALUES ('Cauliflower');
INSERT INTO ingredient (name) VALUES ('Pasta');
INSERT INTO ingredient (name) VALUES ('Cream');
INSERT INTO ingredient (name) VALUES ('Salami');
INSERT INTO ingredient (name) VALUES ('Sausage');
INSERT INTO ingredient (name) VALUES ('Peach');
INSERT INTO ingredient (name) VALUES ('Leek');
INSERT INTO ingredient (name) VALUES ('Celery');
INSERT INTO ingredient (name) VALUES ('Peanut');
INSERT INTO ingredient (name) VALUES ('Cherry');
INSERT INTO ingredient (name) VALUES ('Quince');
INSERT INTO ingredient (name) VALUES ('Pomegranate');
INSERT INTO ingredient (name) VALUES ('Pineapple');
INSERT INTO ingredient (name) VALUES ('Coffee');
INSERT INTO ingredient (name) VALUES ('Spring Onion');
INSERT INTO ingredient (name) VALUES ('Peas');

-- insert recipes
INSERT INTO recipe (calories,description,image,name) VALUES (300, 'Mükemmel Menemenin Sırı Burada', 'https://img.freepik.com/free-photo/fried-tomatoes-with-eggs-table_140725-4724.jpg?t=st=1709576385~exp=1709579985~hmac=00c392a8a8dcb6ee995d17ec7e96b3d6b96d6d78c89b619481186081682ca923&w=1380', 'Menemen');

-- insert recipe - ingredient
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (1,1);
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (1,4);

