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
INSERT INTO ingredient (id, name) VALUES (1, 'Soğan');
INSERT INTO ingredient (id, name) VALUES (2, 'Patates');
INSERT INTO ingredient (id, name) VALUES (3, 'Elma');
INSERT INTO ingredient (id, name) VALUES (4, 'Domates');
INSERT INTO ingredient (id, name) VALUES (5, 'Salatalık');
INSERT INTO ingredient (id, name) VALUES (6, 'Yumurta');
INSERT INTO ingredient (id, name) VALUES (7, 'Sarımsak');
INSERT INTO ingredient (id, name) VALUES (8, 'Ispanak');
INSERT INTO ingredient (id, name) VALUES (9, 'Peynir');
INSERT INTO ingredient (id, name) VALUES (10, 'Pirinç');
INSERT INTO ingredient (id, name) VALUES (11, 'Muz');
INSERT INTO ingredient (id, name) VALUES (12, 'Maydanoz');
INSERT INTO ingredient (id, name) VALUES (13, 'Havuç');
INSERT INTO ingredient (id, name) VALUES (14, 'Brokoli');
INSERT INTO ingredient (id, name) VALUES (15, 'Limon');
INSERT INTO ingredient (id, name) VALUES (16, 'Çilek');
INSERT INTO ingredient (id, name) VALUES (17, 'Kabak');
INSERT INTO ingredient (id, name) VALUES (18, 'Patlıcan');
INSERT INTO ingredient (id, name) VALUES (19, 'Biber');
INSERT INTO ingredient (id, name) VALUES (20, 'Zeytin');
INSERT INTO ingredient (id, name) VALUES (21, 'Sucuk');
INSERT INTO ingredient (id, name) VALUES (22, 'Avokado');
INSERT INTO ingredient (id, name) VALUES (23, 'Portakal');
INSERT INTO ingredient (id, name) VALUES (24, 'Mantar');
INSERT INTO ingredient (id, name) VALUES (25, 'Ceviz');
INSERT INTO ingredient (id, name) VALUES (26, 'Fındık');
INSERT INTO ingredient (id, name) VALUES (27, 'Marul');
INSERT INTO ingredient (id, name) VALUES (28, 'Karnabahar');
INSERT INTO ingredient (id, name) VALUES (29, 'Pırasa');
INSERT INTO ingredient (id, name) VALUES (30, 'Kereviz');
INSERT INTO ingredient (id, name) VALUES (31, 'Vişne');
INSERT INTO ingredient (id, name) VALUES (32, 'Ayva');
INSERT INTO ingredient (id, name) VALUES (33, 'Nar');
INSERT INTO ingredient (id, name) VALUES (34, 'Ananas');
INSERT INTO ingredient (id, name) VALUES (35, 'Bezelye');
INSERT INTO ingredient (id, name) VALUES (36, 'Tavuk');
INSERT INTO ingredient (id, name) VALUES (37, 'Et');
INSERT INTO ingredient (id, name) VALUES (38, 'Kıyma');


-- menemen
INSERT INTO recipe (id, name, calories, description, image) VALUES (1, 'Sebzeli Omlet', 188,
                                                                'Taze sebzelerle dolu lezzetli ve besleyici bir omlet.',
                                                                'https://i2.nefisyemektarifleri.com/user-photos/2021/01/24/nyt-up-2480400_recipe-2021-01-24-13-36-01.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (1,1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (1,4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (1,6); --yumurta
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (1,19); --biber
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (1,24); --mantar


-- akdeniz salatası
INSERT INTO recipe (id, name, calories, description, image) VALUES (2, 'Akdeniz Salatası', 120,
                                                                    'Akdeniz lezzetlerinden ilham alan ferahlatıcı bir salata.',
                                                                    'https://www.greensalads.com.tr/Upload/urunler/11420232343693akdenizl-salata.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (2, 4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (2, 5); --salatalık
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (2, 9); --peynir
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (2, 15); --limon
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (2, 19); --biber
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (2, 20); --zeytin

-- tavuk sote
INSERT INTO recipe (id, name, calories, description, image) VALUES (3, 'Tavuk Sote', 169,
                                                                    'Çeşitli sebzelerle hızlı ve lezzetli bir tavuk sote.',
                                                                    'https://i.ytimg.com/vi/SOlm4nkd-J4/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLDN4cC5RLM7CSuGSwyMTAumhBvqAA');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (3, 1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (3, 7); --sarımsak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (3, 13); --havuç
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (3, 14); --brokoli
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (3, 19); --biber
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (3, 36); --tavuk


-- meyve smoothie
INSERT INTO recipe (id, name, calories, description, image) VALUES (4, 'Meyve Smoothie', 229,
                                                                    'Taze meyvelerle yapılan serinletici ve besleyici bir smoothie.',
                                                                    'https://www.tarifinisevdim.com/uploads/others/cc15e350-0b93-4fb0-82fe-a465bb86792a.Jpeg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (4, 11); --muz
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (4, 16); --çilek
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (4, 23); --portakal


-- yeşil salata
INSERT INTO recipe (id, name, calories, description, image) VALUES (5, 'Yeşil Salata', 120,
                                                                    'Taze yeşil yapraklarla yapılan hafif ve sağlıklı bir salata.',
                                                                    'https://www.diyetkolik.com/site_media/media/foodrecipe_images/yesil-salata.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (5, 12); --marul
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (5, 15); --maydanoz
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (5, 27); --limon


-- tavuk salatası
INSERT INTO recipe (id, name, calories, description, image) VALUES (6, 'Tavuk Salata', 120,
                                                                    'Taze yeşil yapraklarla yapılan hafif ve sağlıklı bir salata.',
                                                                    'https://vicivedi.com/img/691957.webp');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (6, 4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (6, 27); --marul
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (6, 36); --tavuk


-- et salatası
INSERT INTO recipe (id, name, calories, description, image) VALUES (7, 'Et Salatası', 120,
                                                                    'Dana eti ve sebzelerle hazırlanan doyurucu bir salata.',
                                                                    'https://market.amasyaeturunleri.com.tr/wp-content/uploads/evde-lezzetler-hardal-soslu-bonfileli-salata.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (7, 1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (7, 4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (7, 27); --marul
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (7, 37); --et


-- sebze kızartması
INSERT INTO recipe (id, name, calories, description, image) VALUES (8, 'Sebze Kızartma', 120,
                                                                    'Farklı sebzelerin kızartılarak hazırlandığı lezzetli bir sebze yemeği.',
                                                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2015/08/karisik-kizartma-yenionecikan.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (8, 2); --patates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (8, 7); --sarımsak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (8, 13); --havuç
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (8, 17); --patlıcan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (8, 18); --kabak


-- Zeytinyağlı Kabak Yemeği
INSERT INTO recipe (id, name, calories, description, image) VALUES (9, 'Zeytinyağlı Kabak Yemeği', 120,
                                                                    'Zeytinyağında pişirilmiş, baharatlarla lezzetlendirilmiş sağlıklı bir kabak yemeği.',
                                                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2019/07/kabak-yemegi-onecikan.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (9, 1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (9, 4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (9, 7); --sarımsak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (9, 17); --kabak


-- Zeytinyağlı Patlıcan Yemeği
INSERT INTO recipe (id, name, calories, description, image) VALUES (10, 'Zeytinyağlı Patlıcan Yemeği', 120,
                                                                    'Zeytinyağında pişirilmiş, baharatlarla lezzetlendirilmiş sağlıklı bir patlıcan yemeği.',
                                                                    'https://i20.haber7.net/resize/1280x720//haber/haber7/photos/2023/14/zeytinyagli_patlican_yemegi_nasil_yapilir_zeytinyagli_patlican_yemegi_tarifi_1680596072_057.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (10, 1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (10, 4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (10, 18); --sarımsak


-- Zeytinyağlı Brokoli Yemeği
INSERT INTO recipe (id, name, calories, description, image) VALUES (11, 'Zeytinyağlı Brokoli Yemeği', 120,
                                                                    'Sağlıklı ve lezzetli bir brokoli yemeği zeytinyağı ve baharatlarla hazırlanmıştır.',
                                                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2022/01/zeytinyagli-brokoli-yemegi-one-cikan.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (11, 1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (11, 7); --sarımsak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (11, 14); --brokoli