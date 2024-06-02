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
                                                                20, '1. Yumurtaları bir kasede çırpın.\n2. Soğanı, domatesleri, biberleri ve mantarları doğrayın.\n3. Bir tavada yağ ısıtın ve doğranmış sebzeleri kavurun.\n4. Kavrulmuş sebzelerin üzerine çırpılmış yumurtaları dökün.\n5. Yumurtalar pişene kadar pişirin.\n6. Tuz ve biberle servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (1,1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (1,4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (1,6); --yumurta
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (1,19); --biber
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (1,24); --mantar


-- akdeniz salatası
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (2, 'Akdeniz Salatası', 'Salata', 120,
                                                                    'Akdeniz lezzetlerinden ilham alan ferahlatıcı bir salata.',
                                                                    'https://www.greensalads.com.tr/Upload/urunler/11420232343693akdenizl-salata.jpg',
                                                                                                        15, '1. Salatalıkları, domatesleri ve biberleri doğrayın.\n2. Zeytinleri ve peyniri dilimleyin.\n3. Tüm malzemeleri bir kasede karıştırın.\n4. Taze limon suyu sıkın.\n5. Tuz ekleyin ve zeytinyağıyla gezdirin.\n6. İyice karıştırın ve soğuk servis yapın.');
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
                                                                                                        25, '1. Tavuğu lokma büyüklüğünde parçalara kesin.\n2. Brokoli, havuç, biber, soğan ve sarımsağı doğrayın.\n3. Bir tavada yağ ısıtın ve ezilmiş sarımsağı ekleyin.\n4. Tavuk parçalarını ekleyin ve pişene kadar soteleyin.\n5. Doğranmış sebzeleri ekleyin ve yumuşayana kadar sotelemeye devam edin.\n6. Tuz, biber ve isteğe bağlı baharatlarla tatlandırın.\n7. Pilav veya makarna ile sıcak servis yapın.');
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
                                                                                                        10, '1. Muz, çilek ve portakalı dilimleyin.\n2. Tüm malzemeleri blenderda pürüzsüz bir kıvam alana kadar karıştırın.\n3. İsteğe bağlı olarak buz ekleyin.\n4. Bardaklara dökün ve taze meyve dilimleri ile süsleyerek servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (4, 11); --muz
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (4, 16); --çilek
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (4, 23); --portakal


-- yeşil salata
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (5, 'Yeşil Salata', 'Salata', 120,
                                                                    'Taze yeşil yapraklarla yapılan hafif ve sağlıklı bir salata.',
                                                                    'https://www.diyetkolik.com/site_media/media/foodrecipe_images/yesil-salata.jpg',
                                                                                                        10, '1. Marul ve maydanozu iyice yıkayın ve doğrayın.\n2. Doğranmış yeşil yaprakları bir kaseye alın.\n3. Üzerine limon suyu sıkarak karıştırın.\n4. İsteğe bağlı olarak tuz ve zeytinyağı ekleyin.\n5. Hafifçe karıştırın ve servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (5, 12); --marul
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (5, 15); --maydanoz
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (5, 27); --limon


-- tavuk salatası
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (6, 'Tavuk Salata', 'Salata', 120,
                                                                    'Taze yeşil yapraklarla yapılan hafif ve sağlıklı bir salata.',
                                                                    'https://vicivedi.com/img/691957.webp',
                                                                                                        20, '1. Tavuk dilimlerini bir tavada pişirin.\n2. Marul ve domatesleri yıkayın ve doğrayın.\n3. Doğranmış malzemeleri bir kaseye alın.\n4. Üzerine tavuk dilimlerini yerleştirin.\n5. Zeytinyağı ve isteğe bağlı olarak limon suyu ekleyin.\n6. Hafifçe karıştırın ve servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (6, 4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (6, 27); --marul
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (6, 36); --tavuk


-- et salatası
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (7, 'Et Salatası', 'Salata', 120,
                                                                    'Dana eti ve sebzelerle hazırlanan doyurucu bir salata.',
                                                                    'https://market.amasyaeturunleri.com.tr/wp-content/uploads/evde-lezzetler-hardal-soslu-bonfileli-salata.jpg',
                                                                                                        30, '1. Dana etini küp şeklinde doğrayın ve bir tavada pişirin.\n2. Marul ve domatesleri yıkayın ve doğrayın.\n3. Soğanı ince dilimler halinde kesin.\n4. Pişmiş dana etini, marul, domates ve soğanı bir kasede karıştırın.\n5. Üzerine zeytinyağı gezdirin ve hafifçe karıştırın.\n6. Servis tabağına alın ve dilerseniz üzerine nar taneleri serpiştirin.\n7. Soğuk veya ılık olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (7, 1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (7, 4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (7, 27); --marul
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (7, 0); --kiyma


-- sebze kızartması
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (8, 'Sebze Kızartma', 'Ogun', 120,
                                                                    'Farklı sebzelerin kızartılarak hazırlandığı lezzetli bir sebze yemeği.',
                                                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2015/08/karisik-kizartma-yenionecikan.jpg',
                                                                                                        35, '1. Patatesi ve havucu soyun ve yıkayın, ardından küp şeklinde doğrayın.\n2. Patlıcanı ve kabakları yıkayın ve dilimleyin.\n3. Sarımsakları ince dilimler halinde kesin.\n4. Bir tavada yağ kızdırın.\n5. Hazırladığınız sebzeleri tavaya ekleyin ve kızartın.\n6. Sebzeler kızarana kadar ara sıra karıştırarak pişirin.\n7. Kızaran sebzeleri kağıt havlu üzerine alarak fazla yağını süzün.\n8. Tuz ve isteğe bağlı olarak baharatlar ekleyin.\n9. Sıcak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (8, 2); --patates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (8, 7); --sarımsak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (8, 13); --havuç
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (8, 17); --patlıcan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (8, 18); --kabak


-- Zeytinyağlı Kabak Yemeği
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (9, 'Zeytinyağlı Kabak Yemeği', 'Ogun', 120,
                                                                    'Zeytinyağında pişirilmiş, baharatlarla lezzetlendirilmiş sağlıklı bir kabak yemeği.',
                                                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2019/07/kabak-yemegi-onecikan.jpg',
                                                                                                        40, '1. Kabakları yıkayın ve dilimleyin.\n2. Soğanı doğrayın, domatesleri küp şeklinde doğrayın ve sarımsakları ezin.\n3. Bir tencerede zeytinyağını ısıtın.\n4. Doğranmış soğanları ekleyin ve yumuşayana kadar kavurun.\n5. Üzerine kabak dilimlerini ekleyin ve hafifçe kavurun.\n6. Ezilmiş sarımsakları ve doğranmış domatesleri tencereye ilave edin.\n7. Tuz, karabiber ve isteğe bağlı olarak kırmızı biber ekleyin.\n8. Kabaklar yumuşayana kadar pişirin.\n9. Servis yapmadan önce üzerine maydanoz veya dereotu serpiştirerek servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (9, 1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (9, 4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (9, 7); --sarımsak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (9, 17); --kabak


-- Zeytinyağlı Patlıcan Yemeği
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (10, 'Zeytinyağlı Patlıcan Yemeği', 'Ogun', 120,
                                                                    'Zeytinyağında pişirilmiş, baharatlarla lezzetlendirilmiş sağlıklı bir patlıcan yemeği.',
                                                                    'https://i20.haber7.net/resize/1280x720//haber/haber7/photos/2023/14/zeytinyagli_patlican_yemegi_nasil_yapilir_zeytinyagli_patlican_yemegi_tarifi_1680596072_057.jpg',
                                                                                                        45, '1. Patlıcanları alacalı soyun ve halka şeklinde dilimleyin.\n2. Dilimlenmiş patlıcanları tuzlu suda bekletin.\n3. Bir tavada zeytinyağını ısıtın.\n4. İnce doğranmış soğanları ekleyin ve yumuşayana kadar kavurun.\n5. Soğanların üzerine küp doğranmış domatesleri ekleyin.\n6. Sebzeler biraz kavrulduktan sonra süzülmüş patlıcan dilimlerini ekleyin ve tüm malzemeleri karıştırın.\n7. Tuz, karabiber gibi baharatlar ekleyin ve kısık ateşte patlıcanlar yumuşayana kadar pişirin.\n8. Pişen patlıcan yemeğini servis tabağına alın ve ılık olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (10, 1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (10, 4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (10, 18); --sarımsak


-- Zeytinyağlı Brokoli Yemeği
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (11, 'Zeytinyağlı Brokoli Yemeği', 'Ogun', 120,
                                                                    'Sağlıklı ve lezzetli bir brokoli yemeği zeytinyağı ve baharatlarla hazırlanmıştır.',
                                                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2022/01/zeytinyagli-brokoli-yemegi-one-cikan.jpg',
                                                                                                        30, '1. Brokolileri yıkayın ve küçük parçalara ayırın.\n2. Bir tencerede zeytinyağını ısıtın.\n3. İnce doğranmış soğanları ekleyin ve yumuşayana kadar kavurun.\n4. Sarımsakları ekleyin ve kokusu çıkana kadar soteleyin.\n5. Küçük parçalara ayırdığınız brokolileri tencereye ekleyin.\n6. Biraz su ilave edin ve tencerenin kapağını kapatın.\n7. Brokoliler yumuşayana kadar pişirin.\n8. Tuz ve isteğe bağlı olarak karabiber ekleyin.\n9. Pişen brokoli yemeğini servis tabağına alın ve ılık olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (11, 1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (11, 7); --sarımsak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (11, 14); --brokoli


-- Ispanaklı ve Peynirli Omlet
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (12, 'Ispanaklı ve Peynirli Omlet', 'Ogun', 120,
                                                                    'Ispanak ve peynir ile dolu lezzetli ve besleyici bir omlet.',
                                                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOdQCpKz6_EeVCdnHMD_BDNYMLAEaIfqvqfDuDjxKu1jHHyJCYeKXYAxesQESfzzlHz8o&usqp=CAU',
                                                                                                        14, '1. Orta ateşte yapışmaz bir tavada ısıtın.\n2. Bir kasede yumurtaları çırpın ve tuz ve biberle tatlandırın.\n3. Doğranmış ıspanakları ve rendelenmiş peyniri yumurtalara ekleyin.\n4. Karışımı tavaya dökün ve 2-3 dakika pişene kadar pişirin.\n5. Omleti yarım katlayın ve sıcak olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (12, 6); --yumurta
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (12, 8); --ıspanak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (12, 9); --peynir


-- Domates ve Salatalık Salatası
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (13, 'Domates ve Salatalık Salatası', 'Salata', 120,
                                                                    'Taze domates ve salatalıklarla yapılan hafif ve ferahlatıcı bir salata.',
                                                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2022/10/domates-salatasi-sunum-yemekcom.jpg',
                                                                                                        10, '1. Domatesleri ve salatalıkları ince dilimleyin ve bir kaseye alın.\n2. Üzerlerine zeytinyağı gezdirin ve tuz ve biber serpin.\n3. Nazikçe karıştırın.\n4. Salatanın lezzetinin iyileşmesi için birkaç dakika bekletin.\n5. Yan yemek veya hafif bir öğün olarak soğuk servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (13, 4); --ıspanak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (13, 5); --salatalık


-- Limon Soslu Patates Salatası
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (14, 'Limon Soslu Patates Salatası', 'Salata', 120,
                                                                    'Narince bir limon sosuyla karıştırılmış ferahlatıcı bir patates salatası',
                                                                    'https://cdn.yemek.com/mnresize/940/940/uploads/2020/01/patates-salatasi-yemekcom.jpg', 30,
                                                                                                        '1. Patatesleri haşlayın, sonra soğutun ve doğrayın.\n2. Geniş bir kasede, limon suyunu ve zeytinyağını sos yapmak için karıştırın.\n3. Dilimlenmiş patatesleri kaba ekleyin ve sosla kaplanana kadar karıştırın.\n4. İnce doğranmış maydanozu ekleyin, tuz ve biberle tatlandırın.\n5. İsteğe bağlı olarak taze maydanozla süsleyin ve soğuk servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (14, 2); --patates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (14, 12); --maydanoz
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (14, 15); --limon


-- Mantar Sote
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (15, 'Mantar Sote', 'Ogun', 120,
                                                                    'Hafif baharatlarla lezzetlendirilmiş, kavrulmuş mantarlar.',
                                                                    'https://www.becel.com/tr-tr/-/media/Project/Upfield/Brands/Becel-NL/Becel-TR/Assets/Recipes/sync-images/e2287947-c156-45ac-86e0-7830d4ce963e.jpg?rev=06e4dc765dd04814bac4d75ff9b024bf&w=900',
                                                                                                        20, '1. Mantarları temizleyin ve dilimleyin.\n2. Sarımsakları ince doğrayın.\n3. Bir tavada zeytinyağını ısıtın ve doğranmış sarımsakları ekleyin.\n4. Sarımsaklar hafifçe kavrulduktan sonra mantarları ekleyin.\n5. Mantarlar suyunu salıp çekene kadar pişirin.\n6. Tuz ve isteğe bağlı olarak karabiber ekleyin.\n7. Mantar soteyi sıcak olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (15, 7); --sarımsak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (15, 24); --mantar


-- Kereviz Salatası
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (16, 'Kereviz Salatası', 'Salata', 120,
                                                                    'Kereviz ve limon sosuyla yapılan hafif ve lezzetli bir salata.',
                                                                    'https://cdn.ye-mek.net/App_UI/Img/out/650/2019/09/cig-kereviz-salatasi-resimli-yemek-tarifi(7).jpg',
                                                                                                        20, '1. Kerevizi soyun ve ince dilimleyin.\n2. Limonun suyunu sıkın ve kereviz dilimleriyle karıştırın.\n3. Zeytinyağı ekleyin ve iyice karıştırın.\n4. Kereviz salatasını buzdolabında bir süre dinlendirin.\n5. Soğuk olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (16, 15); --limon
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (16, 30); --kereviz


-- Bezelye Yemeği
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (17, 'Bezelye Yemeği', 'Ogun', 120,
                                                                    'Sağlıklı ve lezzetli bir bezelye yemeği.',
                                                                    'https://i.lezzet.com.tr/images-xxlarge-recipe/konserve-bezelye-yemegi-99995542-b088-4652-aa0f-2512271f295e.jpg',
                                                                                                        60, '1. Bezelyeleri yıkayın ve süzün.\n2. Soğanı ince doğrayın. Patatesi ve havucu küp şeklinde doğrayın.\n3. Bir tencerede zeytinyağını ısıtın ve doğranmış soğanı ekleyin.\n4. Soğanlar şeffaflaşana kadar kavurun.\n5. Kavrulmuş soğanın üzerine doğranmış patates ve havuçları ekleyin.\n6. Biraz su ekleyin ve sebzeler yumuşayana kadar pişirin.\n7. Bezelyeleri ekleyin ve pişirme işlemine devam edin.\n8. Tuz ekleyin ve karıştırın.\n9. Bezelye yemeğini sıcak olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (17, 1); --sogan
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (17, 2); --patates
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (17, 3); --havuç
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (17, 35); --bezelye


-- Pırasa Yemeği
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (18, 'Pırasa Yemeği', 'Ogun', 120,
                                                                    'Sağlıklı ve doyurucu bir pırasa yemeği.',
                                                                    'https://cdn.yemek.com/mnresize/940/940/uploads/2019/12/terbiyeli-pirasa-yemegi-tarifi.jpg',
                                                                                                        35, '1. Pırasaları yıkayın ve ince doğrayın.\n2. Soğanı ince doğrayın. Havucu küp şeklinde doğrayın.\n3. Bir tencerede zeytinyağını ısıtın ve doğranmış soğanı ekleyin.\n4. Soğanlar yumuşayana kadar kavurun.\n5. Kavrulmuş soğanın üzerine doğranmış pırasa ve havuçları ekleyin.\n6. Biraz su ekleyin ve sebzeler yumuşayana kadar pişirin.\n7. Tuz ekleyin ve karıştırın.\n8. Pırasa yemeğini sıcak olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (18, 1); --sogan
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (18, 3); --havuç
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (18, 29); --pırasa


-- Kereviz Yemeği
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (19, 'Kereviz Yemeği', 'Ogun', 120,
                                                                    'Besleyici ve doyurucu bir kereviz yemeği tarifi.',
                                                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2015/10/portakalli-kereviz-yeni-onecikan.jpg',
                                                                                                        45, '1. Kereviz köklerini, patatesi ve havucu soyun ve küp şeklinde doğrayın.\n2. Soğanı ince doğrayın.\n3. Bir tencerede zeytinyağını ısıtın ve doğranmış soğanı ekleyin.\n4. Soğanlar şeffaflaşana kadar kavurun.\n5. Kavrulmuş soğanın üzerine doğranmış kerevizleri, patatesleri ve havuçları ekleyin.\n6. Biraz su ekleyin ve sebzeler yumuşayana kadar pişirin.\n7. Tuz ekleyin ve karıştırın.\n8. Kereviz yemeğini sıcak olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (19, 1); --sogan
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (19, 2); --patates
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (19, 3); --havuç
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (19, 30); --kereviz


-- Elmalı Tart
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (20, 'Elmalı Tart', 'Tatli', 120,
                                                                    'Yumuşak bir hamurun üzerine yerleştirilmiş elma dilimleriyle yapılan nefis bir tatlı tarifi.',
                                                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2020/10/elmali-turta-tarifi-yemekcom.jpg',
                                                                                                        60, '1. Hamur için un, tuz ve suyu birleştirin ve hamur yoğurun.\n2. Hamuru tart kalıbına yayın.\n3. Elma dilimlerini hamurun üzerine düzenleyin.\n4. Üzerine şeker serpin ve fırında pişirin.\n5. Soğuduktan sonra dilimleyip servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (20, 3); --elma


-- Muzlu Smoothie
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (21, 'Muzlu Smoothie', 'Icecek', 120,
                                                                    'Serinletici ve besleyici bir muzlu smoothie tarifi.',
                                                                    'https://www.acibadem.com.tr/hayat/Images/YayinTarifler/muzlu-smoothie_6218_1.jpg',
                                                                                                       10, '1. Muzları dilimleyin.\n2. Blenderde muz dilimleri ve sütü pürüzsüz bir kıvam alana kadar karıştırın.\n3. İsteğe bağlı olarak bal veya tatlandırıcı ekleyin.\n4. Bardaklara dökün ve taze olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (21, 11); --muz


-- Domates Çorbası
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (22, 'Domates Çorbası', 'Corba', 120,
                                                                    'Yemeklerinize eşlik edecek nefis bir domates çorbası tarifi.',
                                                                    'https://iasbh.tmgrup.com.tr/86f9f1/1200/627/0/60/1500/844?u=https://isbh.tmgrup.com.tr/sbh/2019/08/21/domates-corbasi-tarifi-en-guzel-kremali-domates-corbasi-nasil-yapilir-1566386388767.jpg',
                                                                                                        40, '1. Domatesleri rendeleyin.\n2. Soğanı ince doğrayın.\n3. Bir tencerede zeytinyağını ısıtın ve doğranmış soğanı ekleyin.\n4. Soğanlar şeffaflaşana kadar kavurun.\n5. Kavrulmuş soğanın üzerine rendelenmiş domatesleri ekleyin.\n6. Biraz su ekleyin ve domatesler pişene kadar pişirin.\n7. Tuz ve pul biber ekleyin.\n8. Çorbayı blendırdan geçirin ve sıcak olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (22, 1); --sogan
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (22, 4); --domates


-- Elmalı Kek
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (23, 'Elmalı Kek', 'Tatli', 120,
                                                                    'Elma dilimleriyle süslenmiş nefis bir kek tarifi.',
                                                                    'https://cdn.ye-mek.net/App_UI/Img/out/650/2023/06/arasi-elmali-kek-resimli-yemek-tarifi(16).jpg',
                                                                                                        50, '1. Elma dilimlerini hazırlayın.\n2. Hamur için un, tuz, yumurta, süt ve şekerle hamur yoğurun.\n3. Kek kalıbına hamuru dökün.\n4. Üzerine elma dilimlerini yerleştirin.\n5. Fırında pişirin ve soğuduktan sonra dilimleyip servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (23, 3); --elma


-- Tavuk Çorbası
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (24, 'Tavuk Çorbası', 'Corba', 120,
                                                                    'Ev yapımı lezzetli bir tavuk çorbası tarifi.',
                                                                    'https://i.nefisyemektarifleri.com/2020/11/16/5-dakikada-pratik-tavuk-corbasi-sifa-corbasi-2.jpg',
                                                                                                        60, '1. Tavuk etini yıkayın ve küp şeklinde doğrayın.\n2. Soğanı ince doğrayın.\n3. Bir tencerede zeytinyağını ısıtın ve doğranmış soğanı ekleyin.\n4. Soğanlar şeffaflaşana kadar kavurun.\n5. Kavrulmuş soğanın üzerine doğranmış tavuk etlerini ekleyin.\n6. Üzerine su ekleyin ve tavuklar pişene kadar pişirin.\n7. Tuz ve karabiber ekleyin.\n8. Çorbayı sıcak olarak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (24, 1); --sogan
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (24, 36); --tavuk


-- Elmalı Krep
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (25, 'Elmalı Krep', 'Tatli', 120,
                                                                    'Tatlı ve hafif bir atıştırmalık olan elmalı krep tarifi.',
                                                                    'https://i.lezzet.com.tr/images-xxlarge-recipe/elmali_krep_tatlisi-504f96ce-8d24-47c8-8df7-1abe8aaa4814.jpg',
                                                                                                        30, '1. Elmaları soyun ve dilimleyin.\n2. Yumurtaları çırpın ve un ile karıştırın.\n3. Tavada yağı ısıtın ve bir kepçe hamur dökün.\n4. Üzerine elma dilimlerini yerleştirin ve diğer tarafı pişene kadar bekleyin.\n5. Pişen krepleri dilimleyerek servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (25, 3); --elma
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (25, 6); --yumurta


-- Ananaslı Kek
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (26, 'Ananaslı Kek', 'Tatli', 120,
                                                                    'Tropikal bir lezzet olan ananasın ferahlığını kek ile birleştiren nefis bir tatlı tarifi.',
                                                                    'https://hanemdepisenler.com/wp-content/uploads/2012/06/1-sany1500.jpg',
                                                                                                        60, '1. Ananası soyun ve küp şeklinde doğrayın.\n2. Un, yumurta, şeker, süt ve erimiş tereyağını bir kasede karıştırın.\n3. Karışıma doğranmış ananası ekleyin ve karıştırın.\n4. Hazırladığınız hamuru yağlanmış bir kek kalıbına dökün.\n5. Önceden ısıtılmış 180 derece fırında yaklaşık 40-45 dakika pişirin.\n6. Fırından çıkarıp soğuduktan sonra dilimleyerek servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (26, 34); --ananas


-- Köfte Izgara
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (27, 'Köfte Izgara', 'Ogun', 120,
                                                                    'Baharatlarla lezzetlendirilmiş ve ızgarada pişirilmiş nefis bir köfte tarifi.',
                                                                    'https://d17wu0fn6x6rgz.cloudfront.net/img/w/tarif/mgt/izgara-kofte-1.webp',
                                                                                                        30, '1. Kıymayı bir kaba alın.\n2. Tuz ve isteğe bağlı olarak diğer baharatları ekleyin ve iyice yoğurun.\n3. Yoğrulan kıymadan küçük parçalar alıp yuvarlayarak köfte şekli verin.\n4. Izgara tavasını ısıtın ve köfteleri her iki tarafı da iyice pişene kadar pişirin.\n5. Pişen köfteleri sıcak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (27, 0); --kıyma


-- Tavuk Izgara
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (28, 'Tavuk Izgara', 'Ogun', 120,
                                                                    'Baharatlarla marine edilmiş ve ızgarada pişirilmiş nefis bir tavuk tarifi.',
                                                                    'https://www.tavukiyidir.com/img/blog/blog_1108677.jpg',
                                                                                                        40, '1. Tavuk göğüs etlerini yıkayın ve kurulayın.\n2. Tavuk etlerine isteğe bağlı baharatları ve zeytinyağını ekleyin ve marine edin.\n3. Izgara tavasını veya ızgarayı önceden ısıtın.\n4. Tavuk etlerini ızgaraya yerleştirin ve her iki tarafı da altın rengi olana kadar pişirin.\n5. Pişen tavukları sıcak servis yapın.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (28, 36); --tavuk


-- Tavuk Şinitzel
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (29, 'Tavuk Şinitzel', 'Ogun', 120,
                                                                    'Hafifçe pane edilmiş ve kızartılmış tavuk göğsü ile yapılan nefis bir tavuk tarifi.',
                                                                    'https://api.developerkitchen.com/uploads/1599247813170221616.jpg',
                                                                                                        30, '1. Tavuk göğüs etlerini inceltmek için bir dövme tokmak kullanarak yumuşak bir şekilde vurun.\n2. Tavuk göğsü parçalarını una batırın.\n3. Bir tavada yağı ısıtın ve tavuk parçalarını her iki tarafı da altın rengi olana kadar kızartın.\n4. Pişmiş tavukları kağıt havlu ile süzün.\n5. Sıcak servis yapın, isteğe bağlı olarak limon dilimleriyle servis yapabilirsiniz.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (29, 36); --tavuk


-- Et Şinitzel
INSERT INTO recipe (id, name, category, calories, description, image, total_time, instructions) VALUES (30, 'Et Şinitzel', 'Ogun', 120,
                                                                    'Hafifçe pane edilmiş ve kızartılmış dana eti ile yapılan lezzetli bir yemek tarifi.',
                                                                    'https://cdn.yemek.com/mnresize/940/940/uploads/2023/09/dana-sinitzel.jpg',
                                                                                                        40, '1. Dana etini inceltmek için bir dövme tokmak kullanarak yumuşak bir şekilde vurun.\n2. Dana eti parçalarını una batırın.\n3. Bir tavada yağı ısıtın ve et parçalarını her iki tarafı da altın rengi olana kadar kızartın.\n4. Pişmiş etleri kağıt havlu ile süzün.\n5. Sıcak servis yapın, isteğe bağlı olarak limon dilimleriyle servis yapabilirsiniz.');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (30, 0); --kiyma