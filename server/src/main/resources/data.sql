-- başlangıç öncesi tüm tabloları kaldır. önce birbiri ile connectionları olanları
DROP TABLE IF EXISTS c_recipeingredient;
DROP TABLE IF EXISTS recipe;
DROP TABLE IF EXISTS ingredient;
DROP TABLE IF EXISTS imagestorage;

-- tabloları yeniden oluştur. daha sonra foreign kay varsa onları ekle
CREATE TABLE recipe (id BIGSERIAL NOT NULL, calories FLOAT, description VARCHAR(255), category VARCHAR(255), image VARCHAR(255), name VARCHAR(255), total_time INTEGER, instructions VARCHAR(1000), PRIMARY KEY (id));
CREATE TABLE ingredient ( id BIGSERIAL NOT NULL, name VARCHAR(255), PRIMARY KEY (id));
CREATE TABLE imagestorage (id bigserial NOT NULL, imagedata oid, name VARCHAR(255), type VARCHAR(255), PRIMARY KEY (id));
CREATE TABLE c_recipeingredient (id bigserial NOT NULL, ingredient_id bigint, recipe_id bigint, PRIMARY KEY (id));
ALTER TABLE if EXISTS c_recipeingredient ADD CONSTRAINT FK1y2it0upytd6c59fave8aj9rl FOREIGN KEY (ingredient_id) REFERENCES ingredient;
ALTER TABLE if EXISTS c_recipeingredient ADD CONSTRAINT FKbmrm3umi1x7oucc519kxmjt9g FOREIGN KEY (recipe_id) REFERENCES recipe;

-- insert ingredients
INSERT INTO ingredient (id, name) VALUES (0, 'Kiyma');
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


-- menemen
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (1, 'Sebzeli Omlet', 'Ogun', 188,
                                                                'Taze sebzelerle dolu lezzetli ve besleyici bir omlet.',
                                                                'https://i2.nefisyemektarifleri.com/user-photos/2021/01/24/nyt-up-2480400_recipe-2021-01-24-13-36-01.jpg',
                                                                20, '1. Yumurtaları bir kasede çırpın. ' ||
                                                                    '2. Soğanı, domatesleri, biberleri ve mantarları doğrayın. ' ||
                                                                    '3. Bir tavada yağ ısıtın ve doğranmış sebzeleri kavurun. ' ||
                                                                    '4. Kavrulmuş sebzelerin üzerine çırpılmış yumurtaları dökün. ' ||
                                                                    '5. Yumurtalar pişene kadar pişirin. ' ||
                                                                    '6. Tuz ve biberle servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (1,1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (1,4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (1,6); --yumurta
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (1,19); --biber
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (1,24); --mantar


-- akdeniz salatası
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (2, 'Akdeniz Salatası', 'Salata', 120,
                                                                    'Akdeniz lezzetlerinden ilham alan ferahlatıcı bir salata.',
                                                                    'https://cdn.yemek.com/mncrop/600/315/uploads/2019/03/akdeniz-salatasi4.jpg',
                                                                                                        15, '1. Salatalıkları, domatesleri ve biberleri doğrayın. ' ||
                                                                                                            '2. Zeytinleri ve peyniri dilimleyin.' ||
                                                                                                            '3. Tüm malzemeleri bir kasede karıştırın.' ||
                                                                                                            '4. Taze limon suyu sıkın.' ||
                                                                                                            '5. Tuz ekleyin ve zeytinyağıyla gezdirin.' ||
                                                                                                            '6. İyice karıştırın ve soğuk servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (2, 4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (2, 5); --salatalık
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (2, 9); --peynir
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (2, 15); --limon
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (2, 19); --biber
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (2, 20); --zeytin

-- tavuk sote
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (3, 'Tavuk Sote', 'Ogun', 169,
                                                                    'Çeşitli sebzelerle hızlı ve lezzetli bir tavuk sote.',
                                                                    'https://i.ytimg.com/vi/SOlm4nkd-J4/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLDN4cC5RLM7CSuGSwyMTAumhBvqAA',
                                                                                                        25, '1. Tavuğu lokma büyüklüğünde parçalara kesin. ' ||
                                                                                                            '2. Brokoli, havuç, biber, soğan ve sarımsağı doğrayın. ' ||
                                                                                                            '3. Bir tavada yağ ısıtın ve ezilmiş sarımsağı ekleyin. ' ||
                                                                                                            '4. Tavuk parçalarını ekleyin ve pişene kadar soteleyin. ' ||
                                                                                                            '5. Doğranmış sebzeleri ekleyin ve yumuşayana kadar sotelemeye devam edin.' ||
                                                                                                            '6. Tuz, biber ve isteğe bağlı baharatlarla tatlandırın. ' ||
                                                                                                            '7. Pilav veya makarna ile sıcak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (3, 1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (3, 7); --sarımsak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (3, 13); --havuç
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (3, 14); --brokoli
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (3, 19); --biber
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (3, 36); --tavuk


-- meyve smoothie
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (4, 'Meyve Smoothie', 'Icecek', 229,
                                                                    'Taze meyvelerle yapılan serinletici ve besleyici bir smoothie.',
                                                                    'https://www.tarifinisevdim.com/uploads/others/cc15e350-0b93-4fb0-82fe-a465bb86792a.Jpeg',
                                                                                                        10, '1. Muz, çilek ve portakalı dilimleyin. ' ||
                                                                                                            '2. Tüm malzemeleri blenderda pürüzsüz bir kıvam alana kadar karıştırın. ' ||
                                                                                                            '3. İsteğe bağlı olarak buz ekleyin. ' ||
                                                                                                            '4. Bardaklara dökün ve taze meyve dilimleri ile süsleyerek servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (4, 11); --muz
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (4, 16); --çilek
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (4, 23); --portakal


-- yeşil salata
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (5, 'Yeşil Salata', 'Salata', 120,
                                                                    'Taze yeşil yapraklarla yapılan hafif ve sağlıklı bir salata.',
                                                                    'https://www.diyetkolik.com/site_media/media/foodrecipe_images/yesil-salata.jpg',
                                                                                                        10, '1. Marul ve maydanozu iyice yıkayın ve doğrayın. ' ||
                                                                                                            '2. Doğranmış yeşil yaprakları bir kaseye alın. ' ||
                                                                                                            '3. Üzerine limon suyu sıkarak karıştırın. ' ||
                                                                                                            '4. İsteğe bağlı olarak tuz ve zeytinyağı ekleyin. ' ||
                                                                                                            '5. Hafifçe karıştırın ve servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (5, 12); --marul
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (5, 15); --maydanoz
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (5, 27); --limon


-- tavuk salatası
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (6, 'Tavuk Salata', 'Salata', 120,
                                                                    'Taze yeşil yapraklarla yapılan hafif ve sağlıklı bir salata.',
                                                                    'https://vicivedi.com/img/691957.webp',
                                                                                                        20, '1. Tavuk dilimlerini bir tavada pişirin. ' ||
                                                                                                            '2. Marul ve domatesleri yıkayın ve doğrayın. ' ||
                                                                                                            '3. Doğranmış malzemeleri bir kaseye alın. ' ||
                                                                                                            '4. Üzerine tavuk dilimlerini yerleştirin. ' ||
                                                                                                            '5. Zeytinyağı ve isteğe bağlı olarak limon suyu ekleyin. ' ||
                                                                                                            '6. Hafifçe karıştırın ve servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (6, 4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (6, 27); --marul
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (6, 36); --tavuk


-- et salatası
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (7, 'Et Salatası', 'Salata', 120,
                                                                    'Dana eti ve sebzelerle hazırlanan doyurucu bir salata.',
                                                                    'https://market.amasyaeturunleri.com.tr/wp-content/uploads/evde-lezzetler-hardal-soslu-bonfileli-salata.jpg',
                                                                                                        30, '1. Dana etini küp şeklinde doğrayın ve bir tavada pişirin. ' ||
                                                                                                            '2. Marul ve domatesleri yıkayın ve doğrayın. ' ||
                                                                                                            '3. Soğanı ince dilimler halinde kesin. ' ||
                                                                                                            '4. Pişmiş dana etini, marul, domates ve soğanı bir kasede karıştırın. ' ||
                                                                                                            '5. Üzerine zeytinyağı gezdirin ve hafifçe karıştırın. ' ||
                                                                                                            '6. Servis tabağına alın ve dilerseniz üzerine nar taneleri serpiştirin. ' ||
                                                                                                            '7. Soğuk veya ılık olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (7, 1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (7, 4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (7, 27); --marul
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (7, 0); --kiyma


-- sebze kızartması
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (8, 'Sebze Kızartma', 'Ogun', 120,
                                                                    'Farklı sebzelerin kızartılarak hazırlandığı lezzetli bir sebze yemeği.',
                                                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2015/08/karisik-kizartma-yenionecikan.jpg',
                                                                                                        35, '1. Patatesi ve havucu soyun ve yıkayın, ardından küp şeklinde doğrayın. ' ||
                                                                                                            '2. Patlıcanı ve kabakları yıkayın ve dilimleyin. ' ||
                                                                                                            '3. Sarımsakları ince dilimler halinde kesin. ' ||
                                                                                                            '4. Bir tavada yağ kızdırın. ' ||
                                                                                                            '5. Hazırladığınız sebzeleri tavaya ekleyin ve kızartın. ' ||
                                                                                                            '6. Sebzeler kızarana kadar ara sıra karıştırarak pişirin. ' ||
                                                                                                            '7. Kızaran sebzeleri kağıt havlu üzerine alarak fazla yağını süzün. ' ||
                                                                                                            '8. Tuz ve isteğe bağlı olarak baharatlar ekleyin. ' ||
                                                                                                            '9. Sıcak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (8, 2); --patates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (8, 7); --sarımsak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (8, 13); --havuç
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (8, 17); --patlıcan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (8, 18); --kabak


-- Zeytinyağlı Kabak Yemeği
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (9, 'Zeytinyağlı Kabak Yemeği', 'Ogun', 120,
                                                                    'Zeytinyağında pişirilmiş, baharatlarla lezzetlendirilmiş sağlıklı bir kabak yemeği.',
                                                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2019/07/kabak-yemegi-onecikan.jpg',
                                                                                                        40, '1. Kabakları yıkayın ve dilimleyin. ' ||
                                                                                                            '2. Soğanı doğrayın, domatesleri küp şeklinde doğrayın ve sarımsakları ezin. ' ||
                                                                                                            '3. Bir tencerede zeytinyağını ısıtın. ' ||
                                                                                                            '4. Doğranmış soğanları ekleyin ve yumuşayana kadar kavurun. ' ||
                                                                                                            '5. Üzerine kabak dilimlerini ekleyin ve hafifçe kavurun. ' ||
                                                                                                            '6. Ezilmiş sarımsakları ve doğranmış domatesleri tencereye ilave edin. ' ||
                                                                                                            '7. Tuz, karabiber ve isteğe bağlı olarak kırmızı biber ekleyin. ' ||
                                                                                                            '8. Kabaklar yumuşayana kadar pişirin. ' ||
                                                                                                            '9. Servis yapmadan önce üzerine maydanoz veya dereotu serpiştirerek servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (9, 1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (9, 4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (9, 7); --sarımsak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (9, 17); --kabak


-- Zeytinyağlı Patlıcan Yemeği
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (10, 'Zeytinyağlı Patlıcan Yemeği', 'Ogun', 120,
                                                                    'Zeytinyağında pişirilmiş, baharatlarla lezzetlendirilmiş sağlıklı bir patlıcan yemeği.',
                                                                    'https://i20.haber7.net/resize/1280x720//haber/haber7/photos/2023/14/zeytinyagli_patlican_yemegi_nasil_yapilir_zeytinyagli_patlican_yemegi_tarifi_1680596072_057.jpg',
                                                                                                        45, '1. Patlıcanları alacalı soyun ve halka şeklinde dilimleyin. ' ||
                                                                                                            '2. Dilimlenmiş patlıcanları tuzlu suda bekletin. ' ||
                                                                                                            '3. Bir tavada zeytinyağını ısıtın. ' ||
                                                                                                            '4. İnce doğranmış soğanları ekleyin ve yumuşayana kadar kavurun. ' ||
                                                                                                            '5. Soğanların üzerine küp doğranmış domatesleri ekleyin. ' ||
                                                                                                            '6. Sebzeler biraz kavrulduktan sonra süzülmüş patlıcan dilimlerini ekleyin ve tüm malzemeleri karıştırın. ' ||
                                                                                                            '7. Tuz, karabiber gibi baharatlar ekleyin ve kısık ateşte patlıcanlar yumuşayana kadar pişirin. ' ||
                                                                                                            '8. Pişen patlıcan yemeğini servis tabağına alın ve ılık olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (10, 1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (10, 4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (10, 18); --sarımsak


-- Zeytinyağlı Brokoli Yemeği
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (11, 'Zeytinyağlı Brokoli Yemeği', 'Ogun', 120,
                                                                    'Sağlıklı ve lezzetli bir brokoli yemeği zeytinyağı ve baharatlarla hazırlanmıştır.',
                                                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2022/01/zeytinyagli-brokoli-yemegi-one-cikan.jpg',
                                                                                                        30, '1. Brokolileri yıkayın ve küçük parçalara ayırın. ' ||
                                                                                                            '2. Bir tencerede zeytinyağını ısıtın. ' ||
                                                                                                            '3. İnce doğranmış soğanları ekleyin ve yumuşayana kadar kavurun. ' ||
                                                                                                            '4. Sarımsakları ekleyin ve kokusu çıkana kadar soteleyin. ' ||
                                                                                                            '5. Küçük parçalara ayırdığınız brokolileri tencereye ekleyin. ' ||
                                                                                                            '6. Biraz su ilave edin ve tencerenin kapağını kapatın. ' ||
                                                                                                            '7. Brokoliler yumuşayana kadar pişirin. ' ||
                                                                                                            '8. Tuz ve isteğe bağlı olarak karabiber ekleyin. ' ||
                                                                                                            '9. Pişen brokoli yemeğini servis tabağına alın ve ılık olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (11, 1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (11, 7); --sarımsak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (11, 14); --brokoli


-- Ispanaklı ve Peynirli Omlet
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (12, 'Ispanaklı ve Peynirli Omlet', 'Ogun', 120,
                                                                    'Ispanak ve peynir ile dolu lezzetli ve besleyici bir omlet.',
                                                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOdQCpKz6_EeVCdnHMD_BDNYMLAEaIfqvqfDuDjxKu1jHHyJCYeKXYAxesQESfzzlHz8o&usqp=CAU',
                                                                                                        14, '1. Orta ateşte yapışmaz bir tavada ısıtın. ' ||
                                                                                                            '2. Bir kasede yumurtaları çırpın ve tuz ve biberle tatlandırın. ' ||
                                                                                                            '3. Doğranmış ıspanakları ve rendelenmiş peyniri yumurtalara ekleyin. ' ||
                                                                                                            '4. Karışımı tavaya dökün ve 2-3 dakika pişene kadar pişirin. ' ||
                                                                                                            '5. Omleti yarım katlayın ve sıcak olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (12, 6); --yumurta
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (12, 8); --ıspanak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (12, 9); --peynir


-- Domates ve Salatalık Salatası
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (13, 'Domates ve Salatalık Salatası', 'Salata', 120,
                                                                    'Taze domates ve salatalıklarla yapılan hafif ve ferahlatıcı bir salata.',
                                                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2022/10/domates-salatasi-sunum-yemekcom.jpg',
                                                                                                        10, '1. Domatesleri ve salatalıkları ince dilimleyin ve bir kaseye alın. ' ||
                                                                                                            '2. Üzerlerine zeytinyağı gezdirin ve tuz ve biber serpin. ' ||
                                                                                                            '3. Nazikçe karıştırın. ' ||
                                                                                                            '4. Salatanın lezzetinin iyileşmesi için birkaç dakika bekletin. ' ||
                                                                                                            '5. Yan yemek veya hafif bir öğün olarak soğuk servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (13, 4); --ıspanak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (13, 5); --salatalık


-- Limon Soslu Patates Salatası
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (14, 'Limon Soslu Patates Salatası', 'Salata', 120,
                                                                    'Narince bir limon sosuyla karıştırılmış ferahlatıcı bir patates salatası',
                                                                    'https://cdn.yemek.com/mnresize/940/940/uploads/2020/01/patates-salatasi-yemekcom.jpg', 30,
                                                                                                        '1. Patatesleri haşlayın, sonra soğutun ve doğrayın. ' ||
                                                                                                        '2. Geniş bir kasede, limon suyunu ve zeytinyağını sos yapmak için karıştırın. ' ||
                                                                                                        '3. Dilimlenmiş patatesleri kaba ekleyin ve sosla kaplanana kadar karıştırın. ' ||
                                                                                                        '4. İnce doğranmış maydanozu ekleyin, tuz ve biberle tatlandırın. ' ||
                                                                                                        '5. İsteğe bağlı olarak taze maydanozla süsleyin ve soğuk servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (14, 2); --patates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (14, 12); --maydanoz
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (14, 15); --limon


-- Mantar Sote
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (15, 'Mantar Sote', 'Ogun', 120,
                                                                    'Hafif baharatlarla lezzetlendirilmiş, kavrulmuş mantarlar.',
                                                                    'https://www.becel.com/tr-tr/-/media/Project/Upfield/Brands/Becel-NL/Becel-TR/Assets/Recipes/sync-images/e2287947-c156-45ac-86e0-7830d4ce963e.jpg?rev=06e4dc765dd04814bac4d75ff9b024bf&w=900',
                                                                                                        20, '1. Mantarları temizleyin ve dilimleyin.' ||
                                                                                                            '2. Sarımsakları ince doğrayın.' ||
                                                                                                            '3. Bir tavada zeytinyağını ısıtın ve doğranmış sarımsakları ekleyin.' ||
                                                                                                            '4. Sarımsaklar hafifçe kavrulduktan sonra mantarları ekleyin.' ||
                                                                                                            '5. Mantarlar suyunu salıp çekene kadar pişirin.' ||
                                                                                                            '6. Tuz ve isteğe bağlı olarak karabiber ekleyin.' ||
                                                                                                            '7. Mantar soteyi sıcak olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (15, 7); --sarımsak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (15, 24); --mantar


-- Kereviz Salatası
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (16, 'Kereviz Salatası', 'Salata', 120,
                                                                    'Kereviz ve limon sosuyla yapılan hafif ve lezzetli bir salata.',
                                                                    'https://cdn.ye-mek.net/App_UI/Img/out/650/2019/09/cig-kereviz-salatasi-resimli-yemek-tarifi(7).jpg',
                                                                                                        20, '1. Kerevizi soyun ve ince dilimleyin. ' ||
                                                                                                            '2. Limonun suyunu sıkın ve kereviz dilimleriyle karıştırın. ' ||
                                                                                                            '3. Zeytinyağı ekleyin ve iyice karıştırın. ' ||
                                                                                                            '4. Kereviz salatasını buzdolabında bir süre dinlendirin. ' ||
                                                                                                            '5. Soğuk olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (16, 15); --limon
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (16, 30); --kereviz


-- Bezelye Yemeği
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (17, 'Bezelye Yemeği', 'Ogun', 120,
                                                                    'Sağlıklı ve lezzetli bir bezelye yemeği.',
                                                                    'https://i.lezzet.com.tr/images-xxlarge-recipe/konserve-bezelye-yemegi-99995542-b088-4652-aa0f-2512271f295e.jpg',
                                                                                                        60, '1. Bezelyeleri yıkayın ve süzün. ' ||
                                                                                                            '2. Soğanı ince doğrayın. Patatesi ve havucu küp şeklinde doğrayın. ' ||
                                                                                                            '3. Bir tencerede zeytinyağını ısıtın ve doğranmış soğanı ekleyin. ' ||
                                                                                                            '4. Soğanlar şeffaflaşana kadar kavurun. ' ||
                                                                                                            '5. Kavrulmuş soğanın üzerine doğranmış patates ve havuçları ekleyin. ' ||
                                                                                                            '6. Biraz su ekleyin ve sebzeler yumuşayana kadar pişirin. ' ||
                                                                                                            '7. Bezelyeleri ekleyin ve pişirme işlemine devam edin. ' ||
                                                                                                            '8. Tuz ekleyin ve karıştırın. ' ||
                                                                                                            '9. Bezelye yemeğini sıcak olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (17, 1); --sogan
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (17, 2); --patates
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (17,7); --sarimsak
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (17, 13); --havuç
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (17, 35); --bezelye


-- Pırasa Yemeği
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (18, 'Pırasa Yemeği', 'Ogun', 120,
                                                                    'Sağlıklı ve doyurucu bir pırasa yemeği.',
                                                                    'https://cdn.yemek.com/mnresize/940/940/uploads/2019/12/terbiyeli-pirasa-yemegi-tarifi.jpg',
                                                                                                        35, '1. Pırasaları yıkayın ve ince doğrayın. ' ||
                                                                                                            '2. Soğanı ince doğrayın. Havucu küp şeklinde doğrayın. ' ||
                                                                                                            '3. Bir tencerede zeytinyağını ısıtın ve doğranmış soğanı ekleyin. ' ||
                                                                                                            '4. Soğanlar yumuşayana kadar kavurun. ' ||
                                                                                                            '5. Kavrulmuş soğanın üzerine doğranmış pırasa ve havuçları ekleyin. ' ||
                                                                                                            '6. Biraz su ekleyin ve sebzeler yumuşayana kadar pişirin. ' ||
                                                                                                            '7. Tuz ekleyin ve karıştırın. ' ||
                                                                                                            '8. Pırasa yemeğini sıcak olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (18, 1); --sogan
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (18, 13); --havuç
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (18, 29); --pırasa


-- Kereviz Yemeği
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (19, 'Kereviz Yemeği', 'Ogun', 120,
                                                                    'Besleyici ve doyurucu bir kereviz yemeği tarifi.',
                                                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2015/10/portakalli-kereviz-yeni-onecikan.jpg',
                                                                                                        45, '1. Kereviz köklerini, patatesi ve havucu soyun ve küp şeklinde doğrayın. ' ||
                                                                                                            '2. Soğanı ince doğrayın. ' ||
                                                                                                            '3. Bir tencerede zeytinyağını ısıtın ve doğranmış soğanı ekleyin. ' ||
                                                                                                            '4. Soğanlar şeffaflaşana kadar kavurun. ' ||
                                                                                                            '5. Kavrulmuş soğanın üzerine doğranmış kerevizleri, patatesleri ve havuçları ekleyin. ' ||
                                                                                                            '6. Biraz su ekleyin ve sebzeler yumuşayana kadar pişirin. ' ||
                                                                                                            '7. Tuz ekleyin ve karıştırın. ' ||
                                                                                                            '8. Kereviz yemeğini sıcak olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (19, 1); --sogan
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (19, 2); --patates
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (19, 13); --havuç
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (19, 30); --kereviz


-- Elmalı Tart
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (20, 'Elmalı Tart', 'Tatli', 120,
                                                                    'Yumuşak bir hamurun üzerine yerleştirilmiş elma dilimleriyle yapılan nefis bir tatlı tarifi.',
                                                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2020/10/elmali-turta-tarifi-yemekcom.jpg',
                                                                                                        60, '1. Hamur için un, tuz ve suyu birleştirin ve hamur yoğurun. ' ||
                                                                                                            '2. Hamuru tart kalıbına yayın. ' ||
                                                                                                            '3. Elma dilimlerini hamurun üzerine düzenleyin. ' ||
                                                                                                            '4. Üzerine şeker serpin ve fırında pişirin. ' ||
                                                                                                            '5. Soğuduktan sonra dilimleyip servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (20, 3); --elma


-- Muzlu Smoothie
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (21, 'Muzlu Smoothie', 'Icecek', 120,
                                                                    'Serinletici ve besleyici bir muzlu smoothie tarifi.',
                                                                    'https://www.acibadem.com.tr/hayat/Images/YayinTarifler/muzlu-smoothie_6218_1.jpg',
                                                                                                       10, '1. Muzları dilimleyin. ' ||
                                                                                                           '2. Blenderde muz dilimleri ve sütü pürüzsüz bir kıvam alana kadar karıştırın. ' ||
                                                                                                           '3. İsteğe bağlı olarak bal veya tatlandırıcı ekleyin. ' ||
                                                                                                           '4. Bardaklara dökün ve taze olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (21, 11); --muz


-- Domates Çorbası
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (22, 'Domates Çorbası', 'Corba', 120,
                                                                    'Yemeklerinize eşlik edecek nefis bir domates çorbası tarifi.',
                                                                    'https://iasbh.tmgrup.com.tr/86f9f1/1200/627/0/60/1500/844?u=https://isbh.tmgrup.com.tr/sbh/2019/08/21/domates-corbasi-tarifi-en-guzel-kremali-domates-corbasi-nasil-yapilir-1566386388767.jpg',
                                                                                                        40, '1. Domatesleri rendeleyin. ' ||
                                                                                                            '2. Soğanı ince doğrayın. ' ||
                                                                                                            '3. Bir tencerede zeytinyağını ısıtın ve doğranmış soğanı ekleyin. ' ||
                                                                                                            '4. Soğanlar şeffaflaşana kadar kavurun. ' ||
                                                                                                            '5. Kavrulmuş soğanın üzerine rendelenmiş domatesleri ekleyin. ' ||
                                                                                                            '6. Biraz su ekleyin ve domatesler pişene kadar pişirin. ' ||
                                                                                                            '7. Tuz ve pul biber ekleyin. ' ||
                                                                                                            '8. Çorbayı blendırdan geçirin ve sıcak olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (22, 1); --sogan
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (22, 4); --domates


-- Elmalı Kek
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (23, 'Elmalı Kek', 'Tatli', 120,
                                                                    'Elma dilimleriyle süslenmiş nefis bir kek tarifi.',
                                                                    'https://cdn.ye-mek.net/App_UI/Img/out/650/2023/06/arasi-elmali-kek-resimli-yemek-tarifi(16).jpg',
                                                                                                        50, '1. Elma dilimlerini hazırlayın. ' ||
                                                                                                            '2. Hamur için un, tuz, yumurta, süt ve şekerle hamur yoğurun. ' ||
                                                                                                            '3. Kek kalıbına hamuru dökün. ' ||
                                                                                                            '4. Üzerine elma dilimlerini yerleştirin. ' ||
                                                                                                            '5. Fırında pişirin ve soğuduktan sonra dilimleyip servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (23, 3); --elma


-- Tavuk Çorbası
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (24, 'Tavuk Çorbası', 'Corba', 120,
                                                                    'Ev yapımı lezzetli bir tavuk çorbası tarifi.',
                                                                    'https://i.nefisyemektarifleri.com/2020/11/16/5-dakikada-pratik-tavuk-corbasi-sifa-corbasi-2.jpg',
                                                                                                        60, '1. Tavuk etini yıkayın ve küp şeklinde doğrayın. ' ||
                                                                                                            '2. Soğanı ince doğrayın. ' ||
                                                                                                            '3. Bir tencerede zeytinyağını ısıtın ve doğranmış soğanı ekleyin. ' ||
                                                                                                            '4. Soğanlar şeffaflaşana kadar kavurun. ' ||
                                                                                                            '5. Kavrulmuş soğanın üzerine doğranmış tavuk etlerini ekleyin. ' ||
                                                                                                            '6. Üzerine su ekleyin ve tavuklar pişene kadar pişirin. ' ||
                                                                                                            '7. Tuz ve karabiber ekleyin.8. Çorbayı sıcak olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (24, 1); --sogan
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (24, 36); --tavuk


-- Elmalı Krep
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (25, 'Elmalı Krep', 'Tatli', 120,
                                                                    'Tatlı ve hafif bir atıştırmalık olan elmalı krep tarifi.',
                                                                    'https://i.lezzet.com.tr/images-xxlarge-recipe/elmali_krep_tatlisi-504f96ce-8d24-47c8-8df7-1abe8aaa4814.jpg',
                                                                                                        30, '1. Elmaları soyun ve dilimleyin. ' ||
                                                                                                            '2. Yumurtaları çırpın ve un ile karıştırın. ' ||
                                                                                                            '3. Tavada yağı ısıtın ve bir kepçe hamur dökün. ' ||
                                                                                                            '4. Üzerine elma dilimlerini yerleştirin ve diğer tarafı pişene kadar bekleyin. ' ||
                                                                                                            '5. Pişen krepleri dilimleyerek servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (25, 3); --elma
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (25, 6); --yumurta


-- Ananaslı Kek
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (26, 'Ananaslı Kek', 'Tatli', 120,
                                                                    'Tropikal bir lezzet olan ananasın ferahlığını kek ile birleştiren nefis bir tatlı tarifi.',
                                                                    'https://hanemdepisenler.com/wp-content/uploads/2012/06/1-sany1500.jpg',
                                                                                                        60, '1. Ananası soyun ve küp şeklinde doğrayın. ' ||
                                                                                                            '2. Un, yumurta, şeker, süt ve erimiş tereyağını bir kasede karıştırın. ' ||
                                                                                                            '3. Karışıma doğranmış ananası ekleyin ve karıştırın. ' ||
                                                                                                            '4. Hazırladığınız hamuru yağlanmış bir kek kalıbına dökün. ' ||
                                                                                                            '5. Önceden ısıtılmış 180 derece fırında yaklaşık 40-45 dakika pişirin. ' ||
                                                                                                            '6. Fırından çıkarıp soğuduktan sonra dilimleyerek servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (26, 34); --ananas


-- Köfte Izgara
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (27, 'Köfte Izgara', 'Ogun', 120,
                                                                    'Baharatlarla lezzetlendirilmiş ve ızgarada pişirilmiş nefis bir köfte tarifi.',
                                                                    'https://d17wu0fn6x6rgz.cloudfront.net/img/w/tarif/mgt/izgara-kofte-1.webp',
                                                                                                        30, '1. Kıymayı bir kaba alın. ' ||
                                                                                                            '2. Tuz ve isteğe bağlı olarak diğer baharatları ekleyin ve iyice yoğurun. ' ||
                                                                                                            '3. Yoğrulan kıymadan küçük parçalar alıp yuvarlayarak köfte şekli verin. ' ||
                                                                                                            '4. Izgara tavasını ısıtın ve köfteleri her iki tarafı da iyice pişene kadar pişirin. ' ||
                                                                                                            '5. Pişen köfteleri sıcak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (27, 0); --kıyma


-- Tavuk Izgara
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (28, 'Tavuk Izgara', 'Ogun', 120,
                                                                    'Baharatlarla marine edilmiş ve ızgarada pişirilmiş nefis bir tavuk tarifi.',
                                                                    'https://www.tavukiyidir.com/img/blog/blog_1108677.jpg',
                                                                                                        40, '1. Tavuk göğüs etlerini yıkayın ve kurulayın. ' ||
                                                                                                            '2. Tavuk etlerine isteğe bağlı baharatları ve zeytinyağını ekleyin ve marine edin. ' ||
                                                                                                            '3. Izgara tavasını veya ızgarayı önceden ısıtın. ' ||
                                                                                                            '4. Tavuk etlerini ızgaraya yerleştirin ve her iki tarafı da altın rengi olana kadar pişirin. ' ||
                                                                                                            '5. Pişen tavukları sıcak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (28, 36); --tavuk


-- Tavuk Şinitzel
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (29, 'Tavuk Şinitzel', 'Ogun', 120,
                                                                    'Hafifçe pane edilmiş ve kızartılmış tavuk göğsü ile yapılan nefis bir tavuk tarifi.',
                                                                    'https://api.developerkitchen.com/uploads/1599247813170221616.jpg',
                                                                                                        30, '1. Tavuk göğüs etlerini inceltmek için bir dövme tokmak kullanarak yumuşak bir şekilde vurun. ' ||
                                                                                                            '2. Tavuk göğsü parçalarını una batırın. ' ||
                                                                                                            '3. Bir tavada yağı ısıtın ve tavuk parçalarını her iki tarafı da altın rengi olana kadar kızartın. ' ||
                                                                                                            '4. Pişmiş tavukları kağıt havlu ile süzün.5. Sıcak servis yapın, isteğe bağlı olarak limon dilimleriyle servis yapabilirsiniz.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (29, 36); --tavuk


-- Et Şinitzel
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (30, 'Et Şinitzel', 'Ogun', 120,
                                                                    'Hafifçe pane edilmiş ve kızartılmış dana eti ile yapılan lezzetli bir yemek tarifi.',
                                                                    'https://cdn.yemek.com/mnresize/940/940/uploads/2023/09/dana-sinitzel.jpg',
                                                                                                        40, '1. Dana etini inceltmek için bir dövme tokmak kullanarak yumuşak bir şekilde vurun. ' ||
                                                                                                            '2. Dana eti parçalarını una batırın. ' ||
                                                                                                            '3. Bir tavada yağı ısıtın ve et parçalarını her iki tarafı da altın rengi olana kadar kızartın. ' ||
                                                                                                            '4. Pişmiş etleri kağıt havlu ile süzün.5. Sıcak servis yapın, isteğe bağlı olarak limon dilimleriyle servis yapabilirsiniz.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (30, 0); --kiyma


-- Sarımsaklı,Soğanlı,Patates Tava
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (31, 'Sarımsaklı, Soğanlı, Patates Tava', 'Ogun', 120,
                                                                                                        'Sarımsak soğan ve patates ile yapılan enfes bir yemek tarifi.',
                                                                                                        'https://i.nefisyemektarifleri.com/2017/03/15/sarimsaklisoganlipatates-tava.jpg',
                                                                                                        35, '1.Tavaya tereyağını koyup eritiyoruz. Üzerine sıvı yağı ekleyip yan yan doğranmış soğanları ilave ediyoruz. ' ||
                                                                                                            '2-3 dakika kavuruyoruz. 2.Hafif rengi dönünce küp küp doğranmış patatesleri ilave ediyoruz. ' ||
                                                                                                            ' 3.Hafif tuz serpip soğan ve patatesi renkleri dönene kadar kızartıyoruz.' ||
                                                                                                            '4.Daha sonra tavanın kapağını kapatıp altını kısıyoruz. Patatesler ve soğanlar bu şekilde yumuşayıp pişiyor.' ||
                                                                                                            '5.Daha sonra sarımsaklarını soyup bütün halde içine ekliyoruz ve diğer baharatlarını ekleyip bir süre daha kızartıyoruz. Ara ara karıştırıyoruz.' ||
                                                                                                            '6.Piştikten sonra üzerine taze maydanoz ekleyip Sıcak olarak servis edebilirsiniz. Et yemeklerinin yanında, veya tek başına bile gayet güzel oluyor.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (31, 1); --sogan
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (31, 2); --patates
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (31, 7); --sarimsak


-- Soğanlı Patates Püresi
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (32, 'Soğanlı Patates Püresi', 'Ogun', 120,
                                                                                                        'Masaların gizli golcüsü enfes soğanlı patates kavurması tarifi.',
                                                                                                        'https://i.nefisyemektarifleri.com/2022/08/22/soganli-salcali-patates-puresi.jpg',
                                                                                                        40, '1.Patateslerin kabuklarını soyup haşlayarak ön pişirme yapın. ' ||
                                                                                                              '2.Ayrı bir tavada yağ ve piyazlık doğranmış soğanları kavurun. ' ||
                                                                                                              '3.Ardından patatesleri küp doğrayıp soğanlara ilave edin. Baharatlarını ekleyip servis yapabilirsiniz. ' ||
                                                                                                              '4.Soğanlı patates kavurması tarifiniz hazır. Afiyet olsun!');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (32, 1); --sogan
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (32, 2); --patates


-- Elmalı Fresh İçecek
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (33, 'Elmalı Fresh İçecek', 'Icecek', 120,
                                                                                                        'Ferahlatıcı elmalı fresh bir içecek.',
                                                                                                        'https://i.nefisyemektarifleri.com/2015/05/09/elmali-fresh-icecek.jpg',
                                                                                                        30, 'Suyun içine elma hariç diğer malzemeleri koyun. Elmayı robottan çekip yada rendeleyip ekleyin. ' ||
                                                                                                            'Yarım saat dinlendirip tülbentten süzün. Buzla servis edebilirsiniz.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (33, 3); --elma


-- Elmalı Smoothie
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (34, 'Elmalı Smoothie', 'Icecek', 120,
                                                                                                        'Elmalı smoothie, hazırlaması pratik ve bir o kadar da sağlıklı bir içecek tarifi.',
                                                                                                        'https://static.daktilo.com/sites/302/uploads/2023/06/10/whatsapp-image-2023-06-10-at-161934.jpeg',
                                                                                                        25, '1. Dört eşit parçaya bölüp çekirdekli kısımlarını çıkardığınız kırmızı elmanın kabuklarını soyun. ' ||
                                                                                                            '2. Soğuk sütü blendera alın. ' ||
                                                                                                            '3.Yoğurt, elma dilimleri, badem içi, bal ve tarçını süte ekleyin. ' ||
                                                                                                            '4.Tüm malzemeleri blenderda püre haline gelene kadar karıştırdıktan sonra bekletmeden soğuk olarak servis edin.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (34, 3); --elma


-- Vişneli Buzlu Çay
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (35, 'Vişneli Buzlu Çay', 'Icecek', 120,
                                                                                                        'Siyah çayın sertliğini alan vişne nektarı ve taneleri ile buluşan çay kırmızı sevdirir, iç açar, gününüzü tatlı kılar.',
                                                                                                        'https://www.superbiyemek.com/documents/visgneli-sogauk-cgay.jpeg',
                                                                                                        30, '1. Suyu derin bir tencerede kaynatın. Kaynayan suya poşet siyah çayları salın ve demini vermesi için 15 dakika kadar bekletin. ' ||
                                                                                                            '2.Demini veren poşet siyah çayları bir kenara alın. Demlenen çaya esmer şekeri katın ve karıştırın. ' ||
                                                                                                            '3.Çaya lezzetini verecek ve kıvamını arttıracak olan vişne nektarını ilave edin. ' ||
                                                                                                            '4.Vişne taneleri ve kırık buzları katıp, son bir kez karıştırdıktan sonra doğal ve ev yapımı buzlu çayın ferahlığını sevdiklerinizle birlikte paylaşarak hissedin.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (35, 31); --visne


-- Domates Salatası
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (36, 'Domates Salatası', 'Salata', 120,
                                                                                                        'Domatesin her halini sevenler için kaçırılmayacak bir lezzet.',
                                                                                                        'https://i.nefisyemektarifleri.com/2012/12/domates-salatasi.jpg',
                                                                                                        30, '1.Domatesler ince ince doğranır (istenirse kabukları soyulur). ' ||
                                                                                                            '2.Biberler, salatalık, maydanoz ve soğanlar da ince ince doğranıp harmanlanır. ' ||
                                                                                                            '3.Zeytinyağı, limon suyu ve tuz da eklenip karıştırılır. Afiyet olsun…');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (36, 1); --sogan
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (36, 4); --domates
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (36, 15); --limon


-- Elmalı Avokado Salatası
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (37, 'Elmalı Avokado Salatası', 'Salata', 120,
                                                                                                        'Yapımı 10 dakikada tamamlanacak bu salata, anında fotoğraflanıp sosyal medyada boy göstermeye hazır cinsten.',
                                                                                                        'https://cdn.yemek.com/mnresize/940/940/uploads/2015/12/elmali-avokado-salatasi1.jpg',
                                                                                                        10, '1.Ortadan ikiye kesip çekirdeklerini çıkardığınız avokadoların kabuklarını soyun. ' ||
                                                                                                            '2.Küp şeklinde doğradığınız avokadoları kararmaması için limon suyuyla buluşturun. ' ||
                                                                                                            '3.Bol suda yıkayıp fazla suyunu süzdürdüğünüz taze soğanları yeşil yapraklarıyla birlikte incecik doğrayın. ' ||
                                                                                                            '4.Kabuklarını soyduğunuz ekşi yeşil elmaları küp şeklinde kesin. Dört eşit parçaya bölüp çekirdekli kısımlarını temizlediğiniz kırmızı elmaları da yeşillerle uyumlu olacak şekilde dilimleyin. ' ||
                                                                                                            '5.Doğradığınız tüm salata malzemelerini geniş bir kaseye alıp tuz, ayıklanmış kabak çekirdeği ve sumak ilavesiyle karıştırın. ' ||
                                                                                                            '6.Servis tabağına aldığınız salatayı zeytinyağı ve arzuya göre son anda eklediğiniz nar taneleri eşliğinde sevdiklerinizle paylaşın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (37, 3); --elma
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (37, 22); --avakado


-- Elmalı Muzlu İkramlık
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (38, 'Elmalı Muzlu İkramlık', 'Tatli', 120,
                                                                                                        'Kolay ve lezzetli bir tarif',
                                                                                                        'https://i.nefisyemektarifleri.com/2020/04/25/elmali-muzlu-cok-kolay-ikramliklar.jpg',
                                                                                                        15, '1.Derin bir kabın içerisine elmaların kabuklarını soyup, rendenin iri tarafıyla rendeleyelim. ' ||
                                                                                                            '2.Muzun kabuğunu soyup, çatalla eziyoruz,. ' ||
                                                                                                            '3.Bisküvileri elimizle iyice kırıyoruz, kakao sunuda ekleyip eze eze karıştıralım. ' ||
                                                                                                            '4.Beş, on dakika dolapta dinlendirelim. ' ||
                                                                                                            '5.Bu arada sos malzemelerini, (çikolata hariç)bir cezvede karıştırarak pişiriyoruz,. ' ||
                                                                                                            '6.Çikolatayı ekleyip ılıyana kadar karıştıralım. ' ||
                                                                                                            '7.Dolaptaki karışımı elimizi ıslatarak ceviz büyüklüğünde toplar elde edelim. ' ||
                                                                                                            '8.Servis tabağına alıp, üzerine çikolata sosundan dökerek işlemimizi bitiriyoruz,. ' ||
                                                                                                            '9.Buzdolabında üç dört saat bekletiyoruz ( hatta bir gece bekletelim).');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (38, 3); --elma
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (38, 11); --muz


-- Kızarmış Muz Ve Elma Tatlısı
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (39, 'Kızarmış Muz Ve Elma Tatlısı', 'Tatli', 120,
                                                                                                        'Muz Ve Elma ile yapılacak hızlı bir tatlı tarifi',
                                                                                                        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjZb9nQ28lUYCpmJMgRGvj26eSjXlzQIkUhR1kPUbsqaH7BajtXYk8z41lL2k46PIOM7YJkJ0LRBAH49_CONzNQmo11zGfyg7MXcg2PtEsLhJ5jUzfH2D8u-mIt-0eZwv7Pe3uFpSs5dA/s1600/k%C4%B1zarm%C4%B1s-muz.JPG',
                                                                                                        15, '1.Un süt vanilya toz şeker, kabartma tozu bir kasede çırpılarak karıştırılır muzlar 2 parmak kalınlığında kesilir, elmalar elma dilimi veya daire şeklinde kesilir eğer daire olarak kesiyorsanız ortasındaki çekirdekleri çıkılarak simit şeklinde kesilir ' ||
                                                                                                            '2.Kesilen muz ve elmalar nişastaya bulanarak unlu karışıma batırılır kızdırılmış sıvı yağda önlü arkalı kızartılır soğuyunca üzerine bal dekor şekeri ve ceviz serperek servis yapabilirsiniz veya pudra şekeri, çikolata sosu yada yanında dondurma ile tüketebilirsiniz.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (39, 3); --elma
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (39, 11); --muz


-- Muz, Armut ve Elma Lapası
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (40, 'Muz ve Elma Lapası', 'Tatli', 120,
                                                                                                        'Lezzetli ve sağlıklı bir atıştırmalık',
                                                                                                        'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/0F57F1BD-F69B-4762-8DDC-C6B8CD06C3E8/Derivates/CDF7F91A-DC07-4735-8EFD-580FE6E4F078.jpg',
                                                                                                        10, 'Elma ve muzu rondoya alıp çalıştıralım. Karışımı ufak bir tavaya alıp içine tarçın ve hindistan cevizi yağı ekleyelim. ' ||
                                                                                                            'Cezvede kaynattığımız 1 su bardağı sütü ilave edip kısık ateşte kıvam alana dek pişirelim. ' ||
                                                                                                            'Lapayı tabağınıza aldıktan sonra isterseniz benim gibi ya da dilediğiniz şekilde süsleyin.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (40, 3); --elma
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (40, 11); --muz
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (40, 32); --armut


-- Brokoli Salatası
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (41, 'Brokoli Salatası', 'Tatli', 120,
                                                                                                        'Sağlıklı brokoli salatası tarifi',
                                                                                                        'https://i.nefisyemektarifleri.com/2021/12/16/brokoli-salatasi-nasil-yapilir-videosu-7.jpg',
                                                                                                        10, '1.Öncelikle brokolinin sap kısımlarını keselim ve ayırarak buhar tenceresinin içerisine alalım. ' ||
                                                                                                            '2.Ardından diğer malzemelerimizi hazırlayalım. Bunun için közlenmiş biber ve salatalık turşusunu doğrayalım. ' ||
                                                                                                            '3.Yeşil soğanı da ince ince doğrayalım. Malzemelerin miktarlarını sizler kişi sayınıza ya da damak zevkinize göre arttırabilirsiniz. ' ||
                                                                                                            '4.Brokolilerimizi buhar tenceresine alalım ve içerisine sıcak su koyduğumuz ocaktaki tencerenin üzerine yerleştirerek kapağını kapatalım ve 5 dakika kadar buharda haşlayalım. ' ||
                                                                                                            '5.Haşlanan brokolileri küçük parçalara ayırarak derin bir kap içerisine alalım. ' ||
                                                                                                            '6.Üzerine konserve mısır, doğranmış salatalık turşusu, kırmızı biber, yeşil soğanlar, ezilmiş ya da rendelenmiş sarımsak, tuz, limon suyu ve zeytinyağını alarak tüm malzemeler güzelce karışana kadar karıştıralım.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (41, 1); --sogan
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (41, 14); --brokoli
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (41, 19); --biber


-- Atom Meyve Suyu
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (42, 'Atom Meyve Suyu', 'Icecek', 50,
                                                                                                        'Serinletici ve besleyici bir meyve suyu tarifi.',
                                                                                                        'https://i.pinimg.com/736x/96/6f/f8/966ff8a656f82f51ccc1309ea5dedd48.jpg',
                                                                                                        12, '1.Taneciksiz ve homojen, koyu bir sıvı elde edene kadar tüm malzemeleri bir karıştırıcıya koyun. ' ||
                                                                                                            '2.Elma organikse, yani pestisit içermiyorsa, tüm kabukla birlikte kullanılması tavsiye edilir, çünkü ikincisi vitamin ve minerallerin çoğunu içerir. ' ||
                                                                                                            '3.Daha sonra sıvıyı bir cam veya cam kavanoza dökün, birkaç buz küpü ekleyin ve için.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (42, 3); --elma
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (42, 11); --muz
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (42, 23); --portakal