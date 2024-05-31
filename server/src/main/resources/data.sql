-- başlangıç öncesi tüm tabloları kaldır. önce birbiri ile connectionları olanları
DROP TABLE IF EXISTS c_recipeingredient;
DROP TABLE IF EXISTS recipe;
DROP TABLE IF EXISTS ingredient;
DROP TABLE IF EXISTS imagestorage;

-- tabloları yeniden oluştur. daha sonra foreign kay varsa onları ekle
CREATE TABLE recipe (id BIGSERIAL NOT NULL, calories FLOAT, description VARCHAR(255), category VARCHAR(255), image VARCHAR(255), name VARCHAR(255), PRIMARY KEY (id));
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
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (1, 'Sebzeli Omlet', 'Öğün', 188,
                                                                'Taze sebzelerle dolu lezzetli ve besleyici bir omlet.',
                                                                'https://i2.nefisyemektarifleri.com/user-photos/2021/01/24/nyt-up-2480400_recipe-2021-01-24-13-36-01.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (1,1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (1,4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (1,6); --yumurta
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (1,19); --biber
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (1,24); --mantar


-- akdeniz salatası
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (2, 'Akdeniz Salatası', 'Salata', 120,
                                                                    'Akdeniz lezzetlerinden ilham alan ferahlatıcı bir salata.',
                                                                    'https://www.greensalads.com.tr/Upload/urunler/11420232343693akdenizl-salata.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (2, 4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (2, 5); --salatalık
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (2, 9); --peynir
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (2, 15); --limon
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (2, 19); --biber
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (2, 20); --zeytin

-- tavuk sote
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (3, 'Tavuk Sote', 'Öğün', 169,
                                                                    'Çeşitli sebzelerle hızlı ve lezzetli bir tavuk sote.',
                                                                    'https://i.ytimg.com/vi/SOlm4nkd-J4/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLDN4cC5RLM7CSuGSwyMTAumhBvqAA');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (3, 1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (3, 7); --sarımsak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (3, 13); --havuç
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (3, 14); --brokoli
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (3, 19); --biber
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (3, 36); --tavuk


-- meyve smoothie
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (4, 'Meyve Smoothie', 'İçecek', 229,
                                                                    'Taze meyvelerle yapılan serinletici ve besleyici bir smoothie.',
                                                                    'https://www.tarifinisevdim.com/uploads/others/cc15e350-0b93-4fb0-82fe-a465bb86792a.Jpeg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (4, 11); --muz
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (4, 16); --çilek
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (4, 23); --portakal


-- yeşil salata
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (5, 'Yeşil Salata', 'Salata', 120,
                                                                    'Taze yeşil yapraklarla yapılan hafif ve sağlıklı bir salata.',
                                                                    'https://www.diyetkolik.com/site_media/media/foodrecipe_images/yesil-salata.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (5, 12); --marul
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (5, 15); --maydanoz
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (5, 27); --limon


-- tavuk salatası
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (6, 'Tavuk Salata', 'Salata', 120,
                                                                    'Taze yeşil yapraklarla yapılan hafif ve sağlıklı bir salata.',
                                                                    'https://vicivedi.com/img/691957.webp');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (6, 4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (6, 27); --marul
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (6, 36); --tavuk


-- et salatası
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (7, 'Et Salatası', 'Salata', 120,
                                                                    'Dana eti ve sebzelerle hazırlanan doyurucu bir salata.',
                                                                    'https://market.amasyaeturunleri.com.tr/wp-content/uploads/evde-lezzetler-hardal-soslu-bonfileli-salata.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (7, 1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (7, 4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (7, 27); --marul
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (7, 0); --kiyma


-- sebze kızartması
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (8, 'Sebze Kızartma', 'Öğün', 120,
                                                                    'Farklı sebzelerin kızartılarak hazırlandığı lezzetli bir sebze yemeği.',
                                                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2015/08/karisik-kizartma-yenionecikan.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (8, 2); --patates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (8, 7); --sarımsak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (8, 13); --havuç
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (8, 17); --patlıcan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (8, 18); --kabak


-- Zeytinyağlı Kabak Yemeği
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (9, 'Zeytinyağlı Kabak Yemeği', 'Öğün', 120,
                                                                    'Zeytinyağında pişirilmiş, baharatlarla lezzetlendirilmiş sağlıklı bir kabak yemeği.',
                                                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2019/07/kabak-yemegi-onecikan.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (9, 1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (9, 4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (9, 7); --sarımsak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (9, 17); --kabak


-- Zeytinyağlı Patlıcan Yemeği
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (10, 'Zeytinyağlı Patlıcan Yemeği', 'Öğün', 120,
                                                                    'Zeytinyağında pişirilmiş, baharatlarla lezzetlendirilmiş sağlıklı bir patlıcan yemeği.',
                                                                    'https://i20.haber7.net/resize/1280x720//haber/haber7/photos/2023/14/zeytinyagli_patlican_yemegi_nasil_yapilir_zeytinyagli_patlican_yemegi_tarifi_1680596072_057.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (10, 1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (10, 4); --domates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (10, 18); --sarımsak


-- Zeytinyağlı Brokoli Yemeği
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (11, 'Zeytinyağlı Brokoli Yemeği', 'Öğün', 120,
                                                                    'Sağlıklı ve lezzetli bir brokoli yemeği zeytinyağı ve baharatlarla hazırlanmıştır.',
                                                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2022/01/zeytinyagli-brokoli-yemegi-one-cikan.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (11, 1); --soğan
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (11, 7); --sarımsak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (11, 14); --brokoli


-- Ispanaklı ve Peynirli Omlet
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (12, 'Ispanaklı ve Peynirli Omlet', 'Öğün', 120,
                                                                    'Ispanak ve peynir ile dolu lezzetli ve besleyici bir omlet.',
                                                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOdQCpKz6_EeVCdnHMD_BDNYMLAEaIfqvqfDuDjxKu1jHHyJCYeKXYAxesQESfzzlHz8o&usqp=CAU');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (12, 6); --yumurta
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (12, 8); --ıspanak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (12, 9); --peynir


-- Domates ve Salatalık Salatası
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (13, 'Domates ve Salatalık Salatası', 'Salata', 120,
                                                                    'Taze domates ve salatalıklarla yapılan hafif ve ferahlatıcı bir salata.',
                                                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2022/10/domates-salatasi-sunum-yemekcom.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (13, 4); --ıspanak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (13, 5); --salatalık


-- Limon Soslu Patates Salatası
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (14, 'Limon Soslu Patates Salatası', 'Salata', 120,
                                                                    'Narince bir limon sosuyla karıştırılmış ferahlatıcı bir patates salatası',
                                                                    'https://cdn.yemek.com/mnresize/940/940/uploads/2020/01/patates-salatasi-yemekcom.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (14, 2); --patates
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (14, 12); --maydanoz
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (14, 15); --limon


-- Mantar Sote
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (15, 'Mantar Sote', 'Öğün', 120,
                                                                    'Hafif baharatlarla lezzetlendirilmiş, kavrulmuş mantarlar.',
                                                                    'https://www.becel.com/tr-tr/-/media/Project/Upfield/Brands/Becel-NL/Becel-TR/Assets/Recipes/sync-images/e2287947-c156-45ac-86e0-7830d4ce963e.jpg?rev=06e4dc765dd04814bac4d75ff9b024bf&w=900');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (15, 7); --sarımsak
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (15, 24); --mantar


-- Kereviz Salatası
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (16, 'Kereviz Salatası', 'Salata', 120,
                                                                    'Kereviz ve limon sosuyla yapılan hafif ve lezzetli bir salata.',
                                                                    'https://cdn.ye-mek.net/App_UI/Img/out/650/2019/09/cig-kereviz-salatasi-resimli-yemek-tarifi(7).jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (16, 15); --limon
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (16, 30); --kereviz


-- Bezelye Yemeği
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (17, 'Bezelye Yemeği', 'Öğün', 120,
                                                                    'Sağlıklı ve lezzetli bir bezelye yemeği.',
                                                                    'https://i.lezzet.com.tr/images-xxlarge-recipe/konserve-bezelye-yemegi-99995542-b088-4652-aa0f-2512271f295e.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (17, 1); --sogan
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (17, 2); --patates
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (17, 3); --havuç
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (17, 35); --bezelye


-- Pırasa Yemeği
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (18, 'Pırasa Yemeği', 'Öğün', 120,
                                                                    'Sağlıklı ve doyurucu bir pırasa yemeği.',
                                                                    'https://cdn.yemek.com/mnresize/940/940/uploads/2019/12/terbiyeli-pirasa-yemegi-tarifi.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (18, 1); --sogan
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (18, 3); --havuç
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (18, 29); --pırasa


-- Kereviz Yemeği
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (19, 'Kereviz Yemeği', 'Öğün', 120,
                                                                    'Besleyici ve doyurucu bir kereviz yemeği tarifi.',
                                                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2015/10/portakalli-kereviz-yeni-onecikan.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (19, 1); --sogan
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (19, 2); --patates
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (19, 3); --havuç
INSERT INTO c_recipeingredient (recipe_id, ingredient_id) VALUES (19, 30); --kereviz


-- Elmalı Tart
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (20, 'Elmalı Tart', 'Tatlı', 120,
                                                                    'Yumuşak bir hamurun üzerine yerleştirilmiş elma dilimleriyle yapılan nefis bir tatlı tarifi.',
                                                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2020/10/elmali-turta-tarifi-yemekcom.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (20, 3); --elma


-- Muzlu Smoothie
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (21, 'Muzlu Smoothie', 'İçecek', 120,
                                                                    'Serinletici ve besleyici bir muzlu smoothie tarifi.',
                                                                    'https://www.acibadem.com.tr/hayat/Images/YayinTarifler/muzlu-smoothie_6218_1.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (21, 11); --muz


-- Domates Çorbası
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (22, 'Domates Çorbası', 'Çorba', 120,
                                                                    'Yemeklerinize eşlik edecek nefis bir domates çorbası tarifi.',
                                                                    'https://iasbh.tmgrup.com.tr/86f9f1/1200/627/0/60/1500/844?u=https://isbh.tmgrup.com.tr/sbh/2019/08/21/domates-corbasi-tarifi-en-guzel-kremali-domates-corbasi-nasil-yapilir-1566386388767.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (22, 1); --sogan
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (22, 4); --domates


-- Elmalı Kek
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (23, 'Elmalı Kek', 'Tatlı', 120,
                                                                    'Elma dilimleriyle süslenmiş nefis bir kek tarifi.',
                                                                    'https://cdn.ye-mek.net/App_UI/Img/out/650/2023/06/arasi-elmali-kek-resimli-yemek-tarifi(16).jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (23, 3); --elma


-- Tavuk Çorbası
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (24, 'Tavuk Çorbası', 'Çorba', 120,
                                                                    'Ev yapımı lezzetli bir tavuk çorbası tarifi.',
                                                                    'https://i.nefisyemektarifleri.com/2020/11/16/5-dakikada-pratik-tavuk-corbasi-sifa-corbasi-2.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (24, 1); --sogan
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (24, 36); --tavuk


-- Elmalı Krep
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (25, 'Elmalı Krep', 'Tatlı', 120,
                                                                    'Tatlı ve hafif bir atıştırmalık olan elmalı krep tarifi.',
                                                                    'https://i.lezzet.com.tr/images-xxlarge-recipe/elmali_krep_tatlisi-504f96ce-8d24-47c8-8df7-1abe8aaa4814.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (25, 3); --elma
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (25, 6); --yumurta


-- Ananaslı Kek
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (26, 'Ananaslı Kek', 'Tatlı', 120,
                                                                    'Tropikal bir lezzet olan ananasın ferahlığını kek ile birleştiren nefis bir tatlı tarifi.',
                                                                    'https://hanemdepisenler.com/wp-content/uploads/2012/06/1-sany1500.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (26, 34); --ananas


-- Köfte Izgara
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (27, 'Köfte Izgara', 'Öğün', 120,
                                                                    'Baharatlarla lezzetlendirilmiş ve ızgarada pişirilmiş nefis bir köfte tarifi.',
                                                                    'https://d17wu0fn6x6rgz.cloudfront.net/img/w/tarif/mgt/izgara-kofte-1.webp');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (27, 0); --kıyma


-- Tavuk Izgara
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (28, 'Tavuk Izgara', 'Öğün', 120,
                                                                    'Baharatlarla marine edilmiş ve ızgarada pişirilmiş nefis bir tavuk tarifi.',
                                                                    'https://www.tavukiyidir.com/img/blog/blog_1108677.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (28, 36); --tavuk


-- Tavuk Şinitzel
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (29, 'Tavuk Şinitzel', 'Öğün', 120,
                                                                    'Hafifçe pane edilmiş ve kızartılmış tavuk göğsü ile yapılan nefis bir tavuk tarifi.',
                                                                    'https://api.developerkitchen.com/uploads/1599247813170221616.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (29, 36); --tavuk


-- Et Şinitzel
INSERT INTO recipe (id, name, category, calories, description, image) VALUES (30, 'Et Şinitzel', 'Öğün', 120,
                                                                    'Hafifçe pane edilmiş ve kızartılmış dana eti ile yapılan lezzetli bir yemek tarifi.',
                                                                    'https://cdn.yemek.com/mnresize/940/940/uploads/2023/09/dana-sinitzel.jpg');
INSERT INTO c_recipeingredient (recipe_id,ingredient_id) VALUES (30, 0); --kiyma