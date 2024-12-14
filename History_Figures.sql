DROP DATABASE Historical_Figures ;
CREATE DATABASE Historical_Figures ;

USE Historical_Figures ;

CREATE TABLE HistoricalFigures (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    HistoricalFigures VARCHAR(255),
    Gender VARCHAR(10),
    RealName VARCHAR(255),
    Hometown VARCHAR(255),
    Nationality VARCHAR(100),
    PeriodOfActivity VARCHAR(100),
    Century VARCHAR(30),
    BirthYear VARCHAR(10),
    DeathYear VARCHAR(10),
    ShortIntroduction TEXT
);

CREATE TABLE OtherNames (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    HistoricalFigureID INT,
    OtherName VARCHAR(255),
    FOREIGN KEY (HistoricalFigureID) REFERENCES HistoricalFigures(ID)
);

CREATE TABLE FamilyBackground (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    HistoricalFigureID INT,
    EconomicStatus VARCHAR (100),
    Occupation VARCHAR (100) ,
    OtherInfor VARCHAR (100) ,
    FOREIGN KEY (HistoricalFigureID) REFERENCES HistoricalFigures(ID) 
);

CREATE TABLE Fields (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    HistoricalFigureID INT,
    Field VARCHAR(255),
    FOREIGN KEY (HistoricalFigureID) REFERENCES HistoricalFigures(ID)
);

CREATE TABLE Positions (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    HistoricalFigureID INT,
    Position VARCHAR(255),
    FOREIGN KEY (HistoricalFigureID) REFERENCES HistoricalFigures(ID)
);

CREATE TABLE Achievements (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    HistoricalFigureID INT,
    Achievement TEXT,
    FOREIGN KEY (HistoricalFigureID) REFERENCES HistoricalFigures(ID)
);


CREATE TABLE Works (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    HistoricalFigureID INT,
    Work VARCHAR(255),
    FOREIGN KEY (HistoricalFigureID) REFERENCES HistoricalFigures(ID)
);

CREATE TABLE Quotes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    HistoricalFigureID INT,
    Quote TEXT,
    FOREIGN KEY (HistoricalFigureID) REFERENCES HistoricalFigures(ID)
);

CREATE TABLE Relationships (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Person1_ID INT,
    Person2_ID INT,
    Relationship_Type VARCHAR (50),
    FOREIGN KEY (Person1_ID) REFERENCES HistoricalFigures(ID) ,
    FOREIGN KEY (Person2_ID) REFERENCES HistoricalFigures(ID)
);

CREATE TABLE Spouses (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    HistoricalFigureID INT,
    Name VARCHAR(255),
    OtherInfor TEXT,
    FOREIGN KEY (HistoricalFigureID) REFERENCES HistoricalFigures(ID)
);


-- An Dương Vương --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('An Dương Vương', 'Male', 'Thuc Phan', 'Thanh Hoa', 'Au Lac', 'Thuc Dynasty', '3rd century BC', NULL, '179 BC', 'An Dương Vương was the king of the ancient Âu Lạc kingdom, known for constructing the famous Cổ Loa Citadel. His reign marked an important period in Vietnam’s history, particularly his defense against Zhao Tuo. His tragic fall remains one of the most famous legends in Vietnamese history.') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'An Dương Vương'), 'Politics') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'An Dương Vương'), 'King') ,
((select ID from HistoricalFigures where historicalfigures = 'An Dương Vương'), 'Founder')  ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'An Dương Vương'), 'unify 2 tribes') ,
((select ID from HistoricalFigures where historicalfigures = 'An Dương Vương'), 'resisted the first Chinese invasion') ,
((select ID from HistoricalFigures where historicalfigures = 'An Dương Vương'), 'resistance against the Quin Army') ,
((select ID from HistoricalFigures where historicalfigures = 'An Dương Vương'), 'related to the legend of the magic crossbow and the stody of Mỵ Châu and Trong Thuy')  ,
((select ID from HistoricalFigures where historicalfigures = 'An Dương Vương'), 'key figure in early resistance against Chinese domination') ,
((select ID from HistoricalFigures where historicalfigures = 'An Dương Vương'), 'built the Co Loa Citadel')  ;

INSERT INTO Spouses  (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'An Dương Vương'), 'Thuc Nuong', NULL);

-- An Tư --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('An Tư', 'Female', 'An Tư', 'Thang Long', 'Dai Viet', 'Tran Dynasty', '13th century', '1267', '1285', 'An Tư was a princess of the Trần Dynasty, remembered for her role in delaying the Mongol invasion in 1285 by being offered as a consort to Prince Toghan of the Yuan Dynasty. Her personal sacrifice bought time for Đại Việt to prepare its defenses, and she remains a symbol of selflessness and patriotism in Vietnamese history.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'An Tư'), NULL, 'royal family', NULL) ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'An Tư'), 'Military') ,
((select ID from HistoricalFigures where historicalfigures = 'An Tư'), 'Politics') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'An Tư'), 'Princess') ,
((select ID from HistoricalFigures where historicalfigures = 'An Tư'), 'Espionage agent')  ;

insert into othernames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where historicalfigures = 'An Tư'), 'Thanh Tong Quy muoi') ;


insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'An Tư'), 'had a diplomatic marriage') ,
((select ID from HistoricalFigures where historicalfigures = 'An Tư'), 'using beauty trap to temporarily seek peace with Yuan dynasty') ,
((select ID from HistoricalFigures where historicalfigures = 'An Tư'), 'have the feelings to Yet Kieu') ,
((select ID from HistoricalFigures where historicalfigures = 'An Tư'), 'secreatly report the news to the Tran dynasty') ,
((select ID from HistoricalFigures where historicalfigures = 'An Tư'), 'have the feelings to Yet Kieu') ,
((select ID from HistoricalFigures where historicalfigures = 'An Tư'), 'one of the most famous proncess in her dynasty') ,
((select ID from HistoricalFigures where historicalfigures = 'An Tư'), 'was forgotten after the victory')  ;

INSERT INTO Spouses  (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'An Tư'), 'Tran Nam Vuong Thoat Hoan', 'Yuan Dynasty Prince');

-- Âu Cơ -- 
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction)
VALUES ('Âu Cơ', 'Female', NULL, NULL, 'Vietnam', 'Hong Bang Era', NULL, NULL, NULL, 'Âu Cơ is a legendary figure in Vietnamese mythology, credited with giving birth to the ancestors of the Vietnamese people. Her marriage to Lạc Long Quân and the birth of their 100 children is considered a foundational myth for the Vietnamese nation, symbolizing unity and shared origin. Âu Cơ is highly revered in Vietnamese folklore and is seen as the mother of the Vietnamese people.');

INSERT INTO OtherNames (HistoricalFigureID, OtherName)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Âu Cơ'), 'Mother of Vietnamese Civilization');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Âu Cơ'), NULL, 'Mythological Ancestor', 'Daughter of De Lai');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Âu Cơ'), 'Mythology');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Âu Cơ'), 'Mother Ancestor');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Âu Cơ'), 'Gave birth to 100 eggs, leading to 100 children, the ancestors of the Vietnamese people'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Âu Cơ'), 'Symbol of the origin and unity of the Vietnamese people'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Âu Cơ'), 'Often associated with the highlands and mountains');

INSERT INTO Spouses  (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Âu Cơ'), 'Lạc Long Quân', 'dragon');

-- Ba Den -- 
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction)
VALUES ('Ba Den', 'Female', 'Ly Thi Thien Huong', 'Tay Ninh', 'Dai Viet', NULL, '18th Century', NULL, NULL, 'Bà Đen is a legendary figure associated with Black Virgin Mountain in Tây Ninh. One version of her story claims she helped Nguyễn Ánh during his campaigns, solidifying her place in Vietnamese history and folklore. Revered as a protective spirit, her story is deeply rooted in Vietnamese folklore, and she is worshiped in temples across the region.');

INSERT INTO OtherNames (HistoricalFigureID, OtherName)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Den'), 'Linh Son Thanh Mau');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Den'), 'Noble Family', NULL, NULL);

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Den'), 'Mythology');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Den'), 'Local Deity');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Den'), 'Became a symbol of protection for locals'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Den'), 'worshiped at the Black Virgin Mountain (Núi Bà Đen) in Tây Ninh'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Den'), 'Revered as a protective spirit and honored in temples'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Den'), 'her story deeply rooted in Vietnamese folklore'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Den'), 'Associated with Nguyễn Ánh’s campaigns and Black Virgin Mountain');

-- Bà Huyện Thanh Quan --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction)
VALUES ('Ba Huyen Thanh Quan', 'Female', 'Nguyen Thi Hinh', 'Ha Noi', 'Vietnam', 'Nguyen Dynasty', '19th century', '1805', '1848', 'Bà Huyện Thanh Quan is celebrated as a prominent female poet of the 19th century, known for her sensitive portrayal of Vietnamese landscapes and her cultural contributions. She is also recognized for her work as an educator in the Nguyễn royal court.');

INSERT INTO OtherNames (HistoricalFigureID, OtherName)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Huyen Thanh Quan'), 'Thanh Quan huyen phu nhan');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Huyen Thanh Quan'), 'Noble family', NULL, NULL);

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Huyen Thanh Quan'), 'Literature'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Huyen Thanh Quan'), 'Education');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Huyen Thanh Quan'), 'Poet'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Huyen Thanh Quan'), 'Teacher');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Huyen Thanh Quan'), 'One of the most famous poets of Vietnam in the 19th century'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Huyen Thanh Quan'), 'Important figure in Vietnamese literature'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Huyen Thanh Quan'), 'Played a crucial role in educating the royal family and shaping the intellectual environment of the Nguyễn court'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Huyen Thanh Quan'), 'Most works written in Nom script');

INSERT INTO Works (HistoricalFigureID, Work)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Huyen Thanh Quan'), 'Qua Đèo Ngang');

INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Huyen Thanh Quan'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Luu Nghi'), 'Spouse');

INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Huyen Thanh Quan'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Pham Quy Thich'), 'Student-Teacher');

INSERT INTO Spouses  (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ba Huyen Thanh Quan'), 'Luu Nghi', 'district magistrate');

-- Bà Triệu -- 
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction)
VALUES ('Bà Triệu', 'Female', 'Trieu Thi Trinh', 'Thanh Hoa', 'Giao Chau', 'The Northern colonial period of Vietnam', '3rd Century', '226', '248', 'Bà Triệu is a legendary female warrior of Vietnam who led a revolt against Eastern Wu in the 3rd century. Her courage and determination are remembered as a national symbol of Vietnamese resistance.');

INSERT INTO OtherNames (HistoricalFigureID, OtherName)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bà Triệu'), 'Trieu Trinh Nuong');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bà Triệu'), 'Noble Family', NULL, NULL);

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bà Triệu'), 'Military');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bà Triệu'), 'Rebel Leader');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bà Triệu'), 'Led a rebellion'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bà Triệu'), 'known for her bravery in battle'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bà Triệu'), 'Considered a symbol of resistance and patriotism against foreign domination'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bà Triệu'), 'Famous for the saying "I would rather die standing than live kneeling"');

-- Bằng Việt --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction)
VALUES ('Bằng Việt', 'Male', 'Nguyen Viet Bang', 'Ha Noi, Vietnam', 'Vietnam', 'Modern Period', '20th century', '1941', NULL, 'Bằng Việt is a celebrated Vietnamese poet, widely recognized for his contributions to modern Vietnamese literature. He is known for his poetic expressions of deep cultural reflections and his exploration of national identity. A prominent poet and writer, Bằng Việt is known for reflecting Vietnamese history, culture, and identity through his artistic works.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bằng Việt'), 'Intellectual family', NULL, 'live with his grandmother');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bằng Việt'), 'Literature');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bằng Việt'), 'Poet'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bằng Việt'), 'Chairman of the Poetry Council of the Vietnam Writers Association'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bằng Việt'), 'Editor-in-Chief of Vietnam Literature and Arts Forum Magazine'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bằng Việt'), 'Chairman of the Hanoi Literature and Arts Association');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bằng Việt'), 'Renowned for his contributions to modern Vietnamese poetry and literature'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bằng Việt'), 'One of the most prominent figures in Vietnamese poetry, influencing several generations of writers'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bằng Việt'), 'Known for his deep reflections on Vietnamese culture and history'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bằng Việt'), 'Writing poetry since age 13'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bằng Việt'), 'State Prize for Literature'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bằng Việt'), 'First Prize of Hanoi Literature and Arts'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bằng Việt'), 'International Literary Translation and International Cultural Exchange Award presented by the Soviet Peace Foundation');

INSERT INTO Works (HistoricalFigureID, Work)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bằng Việt'), 'Huong cay - Bep Lua'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bằng Việt'), 'Nem cau tho vao gio'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bằng Việt'), 'Tho tru tinh the gioi the ky XX');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bằng Việt'), 'Expressing many types of blank verse, all forms that have existed in Vietnamese and world poetry'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bằng Việt'), 'Poetry translations of poets around the world');

-- Bảo Đại --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction)
VALUES ('Bảo Đại', 'Male', 'Nguyen Phuc Vinh Thuy', 'Hue', 'Vietnam', 'Modern Period', '20th century', '1913', '1997', 'Bảo Đại was the last emperor of Vietnam, ruling during the French colonial period and through significant political changes that ended with Vietnam’s independence. He was considered a puppet ruler by many, but his legacy continues to provoke interest in Vietnam''s royal history. Bảo Đại’s reign marked the twilight of Vietnam’s monarchy, during which Vietnam was increasingly influenced by colonial powers and his leadership was largely symbolic. After World War II, Bảo Đại shifted into a more modern leadership role, though still under heavy French influence. His reign ended with the declaration of independence of Vietnam.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bảo Đại'), 'Royal Family', NULL, NULL);

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bảo Đại'), 'Politics');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bảo Đại'), 'Emperor'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bảo Đại'), 'Head of State'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bảo Đại'), 'Chief of the National Assembly');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bảo Đại'), 'the last monarch of Vietnam'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bảo Đại'), 'Symbol of Vietnamese monarchy, remained a figure of political influence even after abdication'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bảo Đại'), 'Known for his efforts to modernize Vietnam, though often criticized for his collaboration with the French'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bảo Đại'), 'Under the arrangement of Japanese fascists, he announced the Declaration of Vietnam''s Independence'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bảo Đại'), 'Oversaw political efforts to align Vietnam with France, especially during WWII'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bảo Đại'), 'Noted for being removed after the August Revolution in 1945');

INSERT INTO Quotes (HistoricalFigureID, Quote)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bảo Đại'), 'I would rather be a citizen of a free country than be the King of a slave country');

INSERT INTO Spouses  (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bảo Đại'), 'Empress Nam Phương', 'empress') ,
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bảo Đại'), 'Bui Mong Diep', 'thu phi') ,
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bảo Đại'), 'Ly Le Ha', 'singer') ,
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bảo Đại'), 'Clément', 'singer and smuggle') ,
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bảo Đại'), 'Monique Marie Eugene Baudot', 'French');

-- Bế Văn Đàn --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction)
VALUES ('Bế Văn Đàn', 'Male', 'Bế Văn Đàn', 'Cao Bang', 'Vietnam', 'Modern', '20th century', '1931', '1953', 'Bế Văn Đàn, born in 1931 in Cao Bằng, was a heroic fighter in Vietnam’s resistance against French forces. He is celebrated for his selfless bravery during the Battle of Điện Biên Phủ, where he used his body as a gun support to help his comrades. His sacrifice has made him a symbol of heroism and patriotism. Posthumously honored as "Anh hùng lực lượng vũ trang nhân dân," Bế Văn Đàn''s legacy continues to inspire future generations.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bế Văn Đàn'), 'Poor', 'Revolutionary traditions. Mother died early, father worked as a miner');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bế Văn Đàn'), 'Military');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bế Văn Đàn'), 'Hero of the People''s Armed Forces');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bế Văn Đàn'), 'Fought in the Battle of Điện Biên Phủ'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bế Văn Đàn'), 'Sacrificed his life using his body as gun support'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bế Văn Đàn'), 'Posthumously honored as "Anh hùng lực lượng vũ trang nhân dân"'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bế Văn Đàn'), 'Symbol of bravery in Vietnam’s resistance to French forces');

-- Bùi Thị Xuân --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction)
VALUES ('Bùi Thị Xuân', 'Female', 'Bùi Thị Xuân', 'Binh Dinh', 'Dai Viet', 'Tay Son Dynasty', '18th century', '1771', '1802', 'Bùi Thị Xuân (1771–1802) was a prominent figure in Vietnamese history, known for her valor and military leadership during the Tây Sơn Dynasty. Born into a rich family in Bình Định, she rose to fame for her exceptional martial skills and became one of the key figures in the resistance against Nguyễn forces. As a female warrior, she led troops into battle alongside her husband, Trần Quang Diệu, and played a crucial role in the Tây Sơn''s military campaigns. Her bravery and dedication makes her an enduring symbol of Vietnam’s resistance and women''s strength in history.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Thị Xuân'), 'Rich', NULL, NULL);

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Thị Xuân'), 'Military');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Thị Xuân'), 'Admiral');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Thị Xuân'), 'Played a key role in defending the Tây Sơn dynasty'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Thị Xuân'), 'Fought in several important battles, including those against Nguyễn forces'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Thị Xuân'), 'Defeated 20,000 Siamese troops in the battle of Rạch Gầm-Xoài Mut'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Thị Xuân'), 'Revered as a symbol of bravery and contributed to the victory of the Tây Sơn dynasty'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Thị Xuân'), 'Known for her martial prowess and leadership in the battlefield');

INSERT INTO Quotes (HistoricalFigureID, Quote)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Thị Xuân'), 'I''m not afraid of death, so why should I be humiliated and humble myself before a powerful villain like you?');

INSERT INTO Spouses  (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Thị Xuân'), 'Tran Quang Dieu', 'general');

-- Bùi Văn Dị --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction)
VALUES ('Bùi Văn Dị', 'Male', 'Bùi Văn Dị', 'Ha Nam, Vietnam', 'Dai Nam', 'Nguyen Dynasty', '19th Century', '1833', '1895', 
'Bùi Văn Dị was a distinguished scholar and diplomat of the Nguyễn Dynasty, known for his literary and governmental contributions. He was involved in the Sino-French conflict and played a key role in fostering relations with China. His works remain influential in Vietnamese literature.');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Văn Dị'), 'Education'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Văn Dị'), 'Politics');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Văn Dị'), 'Assistant Doctor (Phó bảng)'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Văn Dị'), 'Minister of the Ministry of Rites (Thượng thư Bộ Lễ)'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Văn Dị'), 'Grand Chancellor (Phụ chính đại thần)');

INSERT INTO achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Văn Dị'), 'Wrote notable works on history, literature, and diplomacy'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Văn Dị'), 'Key figure in establishing diplomatic relations with China, impacted Vietnam-China interactions'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Văn Dị'), 'Played a crucial role in governmental reform and stability in the Nguyễn Dynasty');

INSERT INTO Works (HistoricalFigureID, Work)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Văn Dị'), 'Vạn lý hành ngâm'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Văn Dị'), 'Dụ hiên thi thảo'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Văn Dị'), 'Tốn Am thi sao');

-- Bùi Viện -- 
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES 
('Bùi Viện', 'Male', 'Bùi Viện', 'Gia Dinh', 'Vietnam', 'Pre-modern/Modern', '19th Century', '1839', '1878', 'Bùi Viện is remembered as a key military and political figure during the French colonial period. He is known for his resistance efforts, both on the battlefield and through diplomatic channels.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Viện'), 'Poor', NULL, NULL);

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Viện'), 'Military');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Viện'), 'Commander');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Viện'), 'Led Vietnamese forces in military and diplomatic missions.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Viện'), 'Symbol of patriotism and resistance during the French invasion.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Viện'), 'Known for his patriotic spirit and resistance against foreign invaders.');

-- Cầm Bá Thước
INSERT INTO HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Cầm Bá Thước', 'Male', 'Cầm Bá Thước', 'Ha Tinh', 'Vietnam', 'Nguyen Dynasty', '18th Century', '1700', '1759', 'Cầm Bá Thước was a notable leader and military figure during the early 19th century who fought against French colonial forces. He became a symbol of resistance, contributing greatly to Vietnamese history.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cầm Bá Thước'), 'Local family', 'Scholars and Warriors', NULL);

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cầm Bá Thước'), 'Military');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cầm Bá Thước'), 'Military General'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cầm Bá Thước'), 'Anti-colonial Leader');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cầm Bá Thước'), 'Led resistance against French colonial forces'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cầm Bá Thước'), 'Known for his role in protecting the northern regions of Vietnam'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cầm Bá Thước'), 'Highly respected as a national hero in the fight against colonialism'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cầm Bá Thước'), 'Known for strong leadership and patriotism');

-- Cao Bá Quát --
INSERT INTO HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Cao Bá Quát', 'Male', 'Cao Bá Quát', 'Ha Noi', 'Vietnam', 'Nguyen Dynasty', '19th Century', '1809', '1855', 'Cao Bá Quát was a renowned poet of the Nguyễn dynasty. His works were famous for their vivid imagery, creativity, and deep philosophical meaning, reflecting his views on society and justice. Cao Bá Quát’s calligraphy was highly admired for its elegance and profound symbolism, often reflecting his personal beliefs and intellectual insights. Cao Bá Quát led a rebellion against the Nguyễn Dynasty, demanding better governance and challenging the oppressive rule of the time. Though unsuccessful, the rebellion made him a symbol of resistance and a champion of the people. Cao Bá Quát’s Confucian philosophy emphasized education, moral integrity, and the duty of leaders to serve the people, which helped guide political and societal reforms.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cao Bá Quát'), 'Noble family', 'Doctor', 'twin is a poet');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cao Bá Quát'), 'Literature'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cao Bá Quát'), 'Calligraphy');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cao Bá Quát'), 'Poet'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cao Bá Quát'), 'Scholar'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cao Bá Quát'), 'Military strategist');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cao Bá Quát'), 'Developed a distinct poetic style, contributing significantly to Vietnamese poetry.'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cao Bá Quát'), 'Influential in shaping Vietnamese literary culture.'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cao Bá Quát'), 'Known for sharp critique and expressive language.'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cao Bá Quát'), 'Renowned for his calligraphy, using it as a means to express both artistic and philosophical ideas.'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cao Bá Quát'), 'Skilled in Chinese calligraphy, blending aesthetics with meaning.'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cao Bá Quát'), 'His rebellion, though unsuccessful, became a symbol of resistance against corrupt leadership.'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cao Bá Quát'), 'Education contributions to Confucian teachings and philosophy helped shape the intellectual landscape of Vietnam during his time.');

INSERT INTO Works (HistoricalFigureID, Work) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cao Bá Quát'), 'Lục Vân Tiên'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Cao Bá Quát'), 'Cao Bá Quát’s Poems');

-- Chế Lan Viên
INSERT INTO HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Chế Lan Viên', 'Male', 'Phan Ngoc Hoan', 'Quảng Ngãi, Vietnam', 'Vietnam', 'Modern', '20th century', '1920', '1989', 'Chế Lan Viên (1920–1989), born Phan Ngọc Hoan, was a prominent poet in modern Vietnamese literature. He was known for his philosophical, profound poetry that explored themes of history, culture, and the human condition. His debut poetry collection, "Điêu tàn" (The Destruction, 1937), offered a haunting reflection on the fall of the ancient Champa civilization and marked a turning point in pre-revolutionary Vietnamese poetry. Later, he continued to develop a deeply reflective style, combining personal experiences with the revolutionary and nation-building struggles of Vietnam.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor ) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Chế Lan Viên'), 'Poor family', NULL, NULL);

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Chế Lan Viên'), 'Literature');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Chế Lan Viên'), 'Poet');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Chế Lan Viên'), 'Leading poet of Vietnam'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Chế Lan Viên'), 'famous for revolutionary poems and romanticism during and after the Vietnam War.'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Chế Lan Viên'), 'Influential in the cultural and literary movements of Vietnam.'),
((select ID from HistoricalFigures where historicalfigures = 'Chế lan Viên'), 'one of "Bàn Thành tứ hữu"') ,
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Chế Lan Viên'), 'Known for his romantic and patriotic poetry.'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Chế Lan Viên'), 'Famous works include "Điêu tàn" and "Ánh sáng và phù sa."');

INSERT INTO Works (HistoricalFigureID, Work) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Chế Lan Viên'), 'Điêu tàn'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Chế Lan Viên'), 'Ánh sáng và phù sa');

INSERT INTO Spouses  (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Chế Lan Viên'), 'Nguyen Thi Giao', 'noble family') ,
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Chế Lan Viên'), 'Le Thi Kim Nga', 'journalist') ;

-- Lý Chiêu Hoàng --
INSERT INTO HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES 
('Lý Chiêu Hoàng', 'Female', 'Ly Phat Kim', 'Thang Long', 'Dai Viet', 'Ly Dynasty', '13th Century', '1218', '1278', 
'Lý Chiêu Hoàng was the last princess of the Ly Dynasty and played a vital role in the power transfer between two dynasties. The first and only female emperor in Vietnam, her reign signified the end of the Ly Dynasty and the beginning of the Trần Dynasty. After losing her title as emperor, she continued to play a key role as Empress, bridging the Ly and Trần Dynasties. Following her deposition as Empress, Lý Chiêu Hoàng married general Lê Phụ Trần, continuing her life in the Trần Dynasty with the title of Princess.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Lý Chiêu Hoàng'), NULL, 'Princess', NULL);

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Lý Chiêu Hoàng'), NULL, 'Princess', NULL);

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Lý Chiêu Hoàng'), 'Politics');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Lý Chiêu Hoàng'), 'Princess'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Lý Chiêu Hoàng'), 'Emperor');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Lý Chiêu Hoàng'), 'Last princess of the Ly Dynasty.'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Lý Chiêu Hoàng'), 'Helped to peacefully transition power.'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Lý Chiêu Hoàng'), 'The last emperor of the Ly Dynasty.'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Lý Chiêu Hoàng'), 'The only female emperor in Vietnamese history.'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Lý Chiêu Hoàng'), 'she abdicated in favor of her husband, initiating a new dynasty.'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Lý Chiêu Hoàng'), 'Abdicated at a very young age.'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Lý Chiêu Hoàng'), 'Her husband married her sister.'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Lý Chiêu Hoàng'), 'Not worshiped at Do Temple with other Ly dynasty emperors.'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Lý Chiêu Hoàng'), 'Maintained influence within the court even after becoming Empress.'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Lý Chiêu Hoàng'), 'Reigned for only half a year and then gave the throne to her husband.'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Lý Chiêu Hoàng'), 'Dethroned as empress for not giving birth to a son.'),
((SELECT ID FROM HistoricalFigures WHERE historicalfigures = 'Lý Chiêu Hoàng'), '2 marriages.') ;

INSERT INTO Spouses  (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lý Chiêu Hoàng'), 'Trần Thái Tông', 'emperor') ,
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lý Chiêu Hoàng'), 'Lê Phụ Trần', 'official') ;

-- Chu Văn An --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Chu Văn An', 'Male', 'Chu An', 'Thăng Long', 'Dai Viet', 'Tran Dynasty', '14th century', '1292', '1370', 'Chu Văn An was a Confucian scholar and moral leader, remembered for his honesty and role in shaping Vietnamese education. Served as an official, but resigned due to court corruption; his legacy as an uncompromising moral figure endures. After retirement, continued to write and teach, leaving a lasting intellectual legacy.');

insert into othernames (HistoricalFigureID, OtherName)
values 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Chu Văn An'), 'Linh Triet'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Chu Văn An'), 'Tieu An') ,
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Chu Văn An'), 'Van Trinh') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn An'), 'Education'),
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn An'), 'Politics');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn An'), 'Education Supervisor'),
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn An'), 'Official'),
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn An'), 'Teacher');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn An'), 'Famous Confucian scholar'),
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn An'), 'taught at the imperial academy and educated future leaders'),
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn An'), 'Shaped Vietnam’s educational and moral systems'),
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn An'), 'Known for integrity, resigned in protest of corruption, refused to compromise his principles'),
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn An'), 'Submitted the "Seven Beheadings Petition"'),
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn An'), 'Advocated for reform and fought corruption'),
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn An'), 'viewed as a symbol of integrity in governance'),
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn An'), 'Retired and continued to teach and write'),
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn An'), 'Continued to influence future generations of scholars and leaders with his writings and teachings'),
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn An'), 'retained respect and influence as a scholar');

insert into works (HistoricalFigureID, Work)
values 
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn An'), 'That Tram So (Seven Beheadings Petition)');

-- Chu Văn Tấn --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Chu Văn Tấn', 'Male', 'Chu Văn Tấn', 'Vinh Phuc', 'Vietnam', 'Modern', '20th century', '1909', '1984', 'Chu Văn Tấn was a prominent general and leader in the revolutionary movement, significantly contributing to Vietnam\'s independence efforts. As Minister of Defense, Chu Văn Tấn contributed to building the foundation of Vietnam’s post-revolutionary military and defense systems.');

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn Tấn'), 'Military'),
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn Tấn'), 'Politics');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn Tấn'), 'Senior General'),
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn Tấn'), 'Minister of National Defense');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn Tấn'), 'Commanded armed forces during the August Revolution and First Indochina War'),
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn Tấn'), 'Played a key role in the revolutionary movement'),
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn Tấn'), 'Known for military strategy, leadership, and loyalty to the revolutionary cause'),
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn Tấn'), 'playing a major role in government and military leadership'),
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn Tấn'), 'Helped shape the military strategies and government defense policies during the early years of the Democratic Republic of Vietnam'),
((select ID from HistoricalFigures where historicalfigures = 'Chu Văn Tấn'), 'Loyal to Ho Chi Minh and trusted in key military and political roles during and after the revolution');

-- Cù Chính Lan --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Cù Chính Lan', 'Male', 'Cù Chính Lan', 'Thanh Hoa', 'Vietnam', 'Modern', '20th Century', '1930', '1952', 'Cù Chính Lan was a heroic soldier during the First Indochina War, remembered for his courage in the face of overwhelming odds.');

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Cù Chính Lan'), 'Military');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Cù Chính Lan'), 'Hero of the People\'s Armed Forces');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Cù Chính Lan'), 'Heroic action during the Battle of Ninh Binh'),
((select ID from HistoricalFigures where historicalfigures = 'Cù Chính Lan'), 'Became a symbol of the Vietnamese People\'s Army\'s bravery and determination during the First Indochina War'),
((select ID from HistoricalFigures where historicalfigures = 'Cù Chính Lan'), 'Known for his self-sacrifice and determination') ,
((select ID from HistoricalFigures where historicalfigures = 'Cù Chính Lan'), 'awarded the title Hero of the People\'s Armed Forces posthumously'),
((select ID from HistoricalFigures where historicalfigures = 'Cù Chính Lan'), 'Single-handedly destroying a French tank');

-- Đặng Đình Hổ --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Đặng Đình Hổ', 'Male', 'Đặng Đình Hổ', 'Hanoi', 'Dai Viet', 'Revival le dynasty', '18th-19th Century', '1672', '1743', 'A renowned Confucian teacher, Đặng Đình Hổ’s impact on education during the Le-Trinh era shaped the moral and intellectual landscape. A poet whose works are known for their subtle reflection on the political and social realities of his time. As an official, Đặng Đình Hổ sought to uphold moral standards, while balancing his roles as a teacher and poet.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), NULL, 'Scholar family', NULL);

insert into spouses (HistoricalFigureID, Name, OtherInfor)
values 
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), 'Le Thi', NULL);

insert into othernames (HistoricalFigureID, OtherName)
values 
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), 'Dong Da Tieu'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), 'Chieu Ho Tien Sinh'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), 'Tung Nien');

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), 'Literature'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), 'Education'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), 'Politics');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), 'Poet'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), 'Teacher'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), 'Official');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), 'Wrote classical poetry reflecting his philosophical and social thoughts.'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), 'His poetry became a model of moral reflection and an important part of Vietnamese literary heritage.'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), 'His poetic works combined social critique and cultural reflection.'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), 'Taught Confucianism, helping to train future officials and intellectuals.'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), 'His teachings influenced a generation of scholars and officials, perpetuating Confucian values during his time.'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), 'Known for his strong moral views on society, with a focus on Confucian ethics.'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), 'Served in various government positions, contributing to the administration of the Le dynasty.'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), 'His administrative career allowed him to influence the governance of his time, with a focus on ethics and justice.'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), 'Known for his dedication to maintaining moral integrity in his work.');

insert into works (HistoricalFigureID, Work)
values 
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), 'Vu Trung Tuy But'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Đình Hổ'), 'Tang Thuong Ngau Luc');

-- Đặng Huy Trứ --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Đặng Huy Trứ', 'Male', 'Đặng Huy Trứ', 'Thừa Thiên Huế', 'Dai Nam', 'Nguyen Dynasty', '19th Century', '1825', '1874', 'Đặng Huy Trứ was a leading educator during the Nguyen Dynasty who revolutionized teaching methods, encouraging modern education based on Confucian ideals. A poet who used literary tools to discuss the political and cultural issues of the Nguyen Dynasty. His works remain a valuable source for understanding the era. Đặng Huy Trứ was not only a government official but also a visionary reformer, contributing to the modernization of Vietnam’s government, military, and culture. A visionary who brought photography to Vietnam, significantly influencing cultural documentation and visual history.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), NULL, 'Scholar family', NULL);

insert into othernames (HistoricalFigureID, OtherName)
values 
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Bo Tru - Bo Dang'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Hoang Trung'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Vong Tan Tinh Trai'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Duc Hai');

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Education'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Literature'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Politics'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Artist');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Teacher'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Poet'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Government Official'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Photographer');

-- Insert into Achievements for Đặng Huy Trứ --
insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Known for his innovative approach to Confucian teaching, promoting progressive educational methods, and establishing private schools.'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'His educational philosophy shaped many scholars and promoted modern learning in Vietnam.'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Advocated for practical, open-minded education rather than rigid traditional learning methods.'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Wrote many poems that reflect his patriotism, philosophical beliefs, and observations on society.'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'His poetry resonated with the intellectual and political issues of his time, inspiring future poets and thinkers.'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Combined intellectual depth with personal reflections on his society, blending literature with social critique.'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Held important government roles such as Bien ly Bo Ho (Director of the Ministry of Finance), and was involved in reforms on finance, industry, and military.'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Helped to modernize certain governmental practices.'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'His administrative efforts contributed to national defense strategies, and he advocated for reform in finance and trade.'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Also known for his contributions to military defense during the Franco-Vietnamese conflicts, where he played a role in resisting colonial forces.'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Introduced photography to Vietnam, opening the first photography studio Cam Hieu Duong, marking the country\'s first step into this art form.'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'His introduction of photography revolutionized Vietnamese culture, preserving moments of history in images.'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Pioneered photography in Vietnam, creating the first photo studio and influencing visual culture in the country.');

insert into works (HistoricalFigureID, Work)
values 
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Lời cáo thị Trường tư thục Thanh Lương'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Đặng Hoàng Trung thi sao, "Đặng Hoàng Trung văn sao"'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Từ thụ yếu quy, "Khang Hy canh chức đồ"'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Việt sử thánh huấn diễn nghĩa'),
((select ID from HistoricalFigures where historicalfigures = 'Đặng Huy Trứ'), 'Cảm Hiếu Đường');

-- Đặng Thai Mai --
insert into HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values 
('Đặng Thai Mai', 'Male', 'Đặng Thai Mai', 'Nghe An', 'Vietnam', 'Modern', '20th Century', '1902', '1984', 'Đặng Thai Mai was a prominent educator, contributing significantly to Vietnamese education. He played a key role in shaping modern literary education and worked to modernize Vietnamese teaching practices. Đặng Thai Mai’s Văn học khái luận was one of the first significant Vietnamese texts on literary theory, influencing generations of writers and critics. Đặng Thai Mai was not just a scholar but also a political activist who supported anti-colonial movements and encouraged national identity through literature and education.');

insert into FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thai Mai'), NULL, 'scholar', NULL);

insert into Spouses (HistoricalFigureID, Name, OtherInfor) 
values 
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thai Mai'), 'Hồ Thị Toan', NULL);

insert into OtherNames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thai Mai'), 'Đặng Mai'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thai Mai'), 'Thanh Tuyền'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thai Mai'), 'Thanh Bình');

insert into Fields (HistoricalFigureID, Field)
values 
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thai Mai'), 'Education'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thai Mai'), 'Literature'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thai Mai'), 'Politics');

insert into Positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thai Mai'), 'Teacher'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thai Mai'), 'Literary Theorist'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thai Mai'), 'Political Activist');

insert into Achievements (HistoricalFigureID, Achievement)
values 
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thai Mai'), 'Pioneered educational reforms in Vietnam, particularly in the early 20th century, shaping modern curriculum'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thai Mai'), 'Authored Văn học khái luận (Literary Theory, 1944), a groundbreaking work that laid the foundations for literary criticism in Vietnam.'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thai Mai'), 'The book became a foundational text for literary scholars and writers in Vietnam, influencing literary thought in the 20th century.'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thai Mai'), 'A key figure in the rise of modern Vietnamese literary theory, connecting literature with social and national values.'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thai Mai'), 'Actively participated in the revolutionary movements against French colonial rule, aligning with the broader anti-colonial efforts in Vietnam.'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thai Mai'), 'His political writings and advocacy for cultural reform helped inspire others in the independence movement.'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thai Mai'), 'Also known for his role in educating the public about national and cultural identity during colonialism.');

insert into Works (HistoricalFigureID, Work)
values 
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thai Mai'), 'Cô câm đã lên tiếng'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thai Mai'), 'Chú bé'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thai Mai'), 'Văn học khái luận');

-- Đặng Thùy Trâm --
insert into HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Đặng Thùy Trâm', 'Female', 'Đặng Thùy Trâm', 'Ha Noi, Vietnam', 'Vietnam', 'Modern', '20th Century', '1948', '1970', 'Đặng Thùy Trâm was a young doctor working in a field hospital during the Vietnam War. Her diaries, published posthumously, recount her heroic work and deep compassion. She was also a nurse during the Vietnam War, tending to the wounded with great compassion and bravery, even in the face of danger. Đặng Thùy Trâm\'s military service, though not her primary role, was key to her involvement in both military strategy and field operations during the war.');

insert into FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thùy Trâm'), NULL, 'Daughter of a patriotic family', NULL);

insert into Fields (HistoricalFigureID, Field)
values 
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thùy Trâm'), 'Science'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thùy Trâm'), 'Military');

insert into Positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thùy Trâm'), 'Battlefield Nurse'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thùy Trâm'), 'Field Doctor in War'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thùy Trâm'), 'Officer');

-- Insert into Achievements for Đặng Thùy Trâm --
insert into Achievements (HistoricalFigureID, Achievement)
values 
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thùy Trâm'), 'responsible for providing immediate care to wounded soldiers.'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thùy Trâm'), 'Her compassion and commitment to the wounded soldiers made her a symbol of hope and determination in the war.'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thùy Trâm'), 'Known for her courage in battle and for caring for soldiers with devotion and kindness.'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thùy Trâm'), 'treating wounded soldiers, both Vietnamese and allied, in battle zones.'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thùy Trâm'), 'remembered for her sacrifices and compassionate care.'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thùy Trâm'), 'Known for her selfless dedication, empathy, and bravery under fire.'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thùy Trâm'), 'military operations, including treating and moving wounded soldiers under fire.'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thùy Trâm'), 'participated in organizing the movement of personnel to safer locations during military strikes.'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thùy Trâm'), 'helped strengthen the morale of soldiers, especially those who fought alongside her.'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thùy Trâm'), 'Known for her strong leadership in organizing emergency operations during wartime.');

insert into Works (HistoricalFigureID, Work)
values 
((select ID from HistoricalFigures where HistoricalFigures = 'Đặng Thùy Trâm'), 'Đặng Thùy Trâm diary');

-- Đào Duy Anh --
insert into HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction)
values ('Đào Duy Anh', 'Male', 'Đào Duy Anh', 'Ha Tay', 'Vietnam', 'Modern', '20th Century', '1904', '1988', 
'Đào Duy Anh was a revolutionary historian, pioneering Marxist historiography in Vietnam. He is remembered for his deep contributions to Vietnamese cultural and historical studies. His dictionary became a cornerstone for Vietnamese language learners and helped standardize modern Vietnamese linguistics. As a professor and academic leader, Đào Duy Anh shaped Vietnam\'s post-colonial education system, emphasizing historical and cultural identity. Đào Duy Anh was an important figure in Vietnam\'s intellectual community, using his position to advocate for freedom of expression and academic integrity.');

insert into FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor)
values 
((select ID from HistoricalFigures where HistoricalFigures = 'Đào Duy Anh'), 'Commoner family', NULL, NULL);

insert into OtherNames (HistoricalFigureID, OtherName)
values 
((select ID from HistoricalFigures where HistoricalFigures = 'Đào Duy Anh'), 'Ve Thach');

insert into Fields (HistoricalFigureID, Field)
values 
((select ID from HistoricalFigures where HistoricalFigures = 'Đào Duy Anh'), 'History'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đào Duy Anh'), 'Literature'),
((select ID from HistoricalFigures where HistoricalFigures = 'Đào Duy Anh'), 'Politics');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
    ((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Anh'), 'Historian'),
    ((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Anh'), 'Lexicographer'),
    ((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Anh'), 'Professor');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
    ((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Anh'), 'Pioneered the Marxist interpretation of Vietnamese history and developed modern historical research in Vietnam.'),
    ((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Anh'), 'Trained a generation of Vietnamese historians, contributing to intellectual and political discourse.'),
    ((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Anh'), 'Known for his analytical approach to history using materialist and Marxist methods.'),
    ((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Anh'), 'Published a dictionary.'),
    ((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Anh'), 'Founded the Quan Hai Library, a significant resource for researchers and scholars in Vietnam.'),
    ((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Anh'), 'Taught History at Hanoi University of Science, influencing future generations of historians.'),
    ((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Anh'), 'One of the few Vietnamese figures whose name is recorded in the Larousse dictionary as an encyclopedist of modern times.') ,
    ((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Anh'), 'Influenced the development of modern Vietnamese lexicography and set high academic standards for Vietnamese dictionaries.'),
    ((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Anh'), 'Focused on simplifying language for modern use and introducing Vietnamese readers to scientific concepts through dictionaries.'),
    ((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Anh'), 'Taught at Hanoi University, contributing to the establishment of modern Vietnamese education systems.'),
    ((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Anh'), 'He was a mentor to future generations of Vietnamese intellectuals and influenced educational reforms post-independence.'),
    ((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Anh'), 'His educational philosophy was closely tied to cultural and historical awareness, aiming to create a knowledgeable and patriotic population.');

INSERT INTO Works (HistoricalFigureID, Work)
VALUES 
    ((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Anh'), 'Lịch sử Việt Nam'), 
    ((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Anh'), 'Việt Nam văn hóa sử cương'), 
    ((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Anh'), 'Cultural and Historical Textbooks');

-- Đào Duy Từ --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES 
('Đào Duy Từ', 'Male', 'Đào Duy Từ', 'Binh Dinh', 'Dai Viet', 'Revival Le Dynasty', '17th century', '1571', '1634', 
'Đào Duy Từ was a prominent poet known for blending military strategy with literary skill, offering deep insights into the socio-political landscape of his time. A prominent military strategist, Đào Duy Từ played a crucial role in defending the Nguyen Lords during turbulent times, crafting military strategies that fortified their position. Đào Duy Từ was a high-ranking mandarin whose governance and strategies helped shape the Nguyen Lords’ resistance against external threats. As an architect, Đào Duy Từ was instrumental in building fortifications that enhanced the Nguyen Lords'' military capabilities, playing a key role in the defense of their territory.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 
 'Unknown', 'Professional singer', 'Father died when he was 5'), 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 
 'Unknown', 'Unknown', 'Raised by mother');

INSERT INTO OtherNames (HistoricalFigureID, OtherName) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'Loc Khe');

INSERT INTO Fields (HistoricalFigureID, Field) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'Literature'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'Military'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'Politic'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'Artist');

INSERT INTO Positions (HistoricalFigureID, Position) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'Poet'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'Chief Military Advisor'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'High-ranking Mandarin'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'Architect');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'Renowned for his poetic works reflecting military strategy'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'Influenced Vietnamese literature with his poetic style and military insights'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'Noted for wisdom and strategic thinking; refused to serve under the Trinh'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'Designed and supervised the construction of significant defensive structures'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'Key strategist during the Trinh–Nguyen War, securing Nguyen territory'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'Known for his innovative strategies in warfare; his military insights were well-respected'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'Served as an advisor to the Nguyen lord, providing crucial military strategies'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'His governance and military acumen were instrumental for the Nguyen'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'A respected leader in both military and administrative capacities'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'Designed and constructed defensive fortifications'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'His architectural designs strengthened the Nguyen\'s military defenses'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'Renowned for innovative architectural strategies in fortification');

INSERT INTO Works (HistoricalFigureID, Work) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'Ngoa Long Cuong Van'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Duy Từ'), 'Ho Truong Khu Co');

-- Đào Nguyên Phổ -- 
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES 
('Đào Nguyên Phổ', 'Male', 'Dao The Cung', 'Thai Binh', 'Dai Nam', 'Nguyen Dynasty', '19th century', '1861', '1908', 
'Đào Nguyên Phổ was a significant Vietnamese scholar and journalist who championed modernization and cultural awareness in Vietnam during the late 19th and early 20th centuries, actively participating in the Duy Tan movement and producing notable works that encouraged historical understanding and national pride. A key proponent of educational reform, Đào Nguyên Phổ pushed for the modernization of the educational system, believing in the power of knowledge to transform society. As a journalist, Đào Nguyên Phổ utilized the press as a platform to advocate for social reforms and to raise awareness about the importance of Vietnamese culture and history. Summary of Positions Held.');

INSERT INTO OtherNames (HistoricalFigureID, OtherName) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Nguyên Phổ'), 'Dao Van Mai');

INSERT INTO Fields (HistoricalFigureID, Field) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Nguyên Phổ'), 'Literature'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Nguyên Phổ'), 'Education');

INSERT INTO Positions (HistoricalFigureID, Position) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Nguyên Phổ'), 'Scholar'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Nguyên Phổ'), 'Advocate for Educational Reform'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Nguyên Phổ'), 'Journalist');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Nguyên Phổ'), 'Key figure in the Đông Kinh Nghĩa Thục movement, advocating for educational reform'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Nguyên Phổ'), 'Significant impact on Vietnamese cultural revival, emphasizing history and national identity'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Nguyên Phổ'), 'Prominent in literature, history, and journalism'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Nguyên Phổ'), 'Encouraged the establishment of modern educational systems'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Nguyên Phổ'), 'Fostered a generation of scholars and reformers'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Nguyên Phổ'), 'Strong emphasis on literacy and cultural education'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Nguyên Phổ'), 'Used media to promote modernization and critique colonialism'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Nguyên Phổ'), 'Played a vital role in shaping public opinion'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Nguyên Phổ'), 'Published articles advocating for social change');
 
INSERT INTO Works (HistoricalFigureID, Work) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Nguyên Phổ'), 'Viet Su Yeu Luoc'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Nguyên Phổ'), 'Tay Son Thuy Xuat Mat Khao'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Nguyên Phổ'), 'Various articles in Vietnamese newspapers');

-- Đào Tông Nguyên -- 
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES 
('Đào Tông Nguyên', 'Male', 'Đào Tông Nguyên', 'Dai Viet', 'Dai Viet', 'Ly Dynasty', '11th Century', '1020', '1085', 'Đào Tông Nguyên was an important diplomat and official during the Ly dynasty, known for his contributions to Vietnamese diplomacy and territorial claims during the conflict with the Song Dynasty.');

INSERT INTO Fields (HistoricalFigureID, Field) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Tông Nguyên'), 'Diplomacy'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Tông Nguyên'), 'Politics');

INSERT INTO Positions (HistoricalFigureID, Position) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Tông Nguyên'), 'Diplomat'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Tông Nguyên'), 'Official');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Tông Nguyên'), 'Successfully led diplomatic missions to the Song Dynasty, bringing five elephants as tribute and requesting the return of territories lost during the war.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Tông Nguyên'), 'His diplomatic efforts contributed to stabilizing relations with the Song Dynasty and securing peace following military conflicts.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Tông Nguyên'), 'Played a significant role in the administration under the Lý dynasty, particularly in handling external relations.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Tông Nguyên'), 'Helped maintain the integrity of the Lý dynasty\'s territorial claims and fostered loyalty among the populace.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Tông Nguyên'), 'Respected for his integrity and dedication to the state.');

-- Đào Tử Kỳ -- 
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES 
('Đào Tử Kỳ', 'Male', NULL, 'Dai Viet', 'Dai Viet', 'Tran Dynasty', '13th century', NULL, NULL, 'Đào Tử Kỳ is remembered for his pivotal role in safeguarding Vietnamese independence during Mongol invasions through diplomatic negotiations. As a court official, Đào Tử Kỳ played a critical role in the governance of Đại Việt, providing counsel and supporting efforts to maintain national integrity.');

INSERT INTO Fields (HistoricalFigureID, Field) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Tử Kỳ'), 'Diplomacy'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Tử Kỳ'), 'Politics');

INSERT INTO Positions (HistoricalFigureID, Position) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Tử Kỳ'), 'Diplomat'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Tử Kỳ'), 'Court Official');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Tử Kỳ'), 'Successfully negotiated with the Mongol Empire in 1293 to maintain peace for Đại Việt.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Tử Kỳ'), 'Major impact on diplomatic relations between Đại Việt and the Mongol Empire, preserving Vietnamese sovereignty.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Tử Kỳ'), 'Recognized for his wisdom and persuasive communication.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Tử Kỳ'), 'Served as a high-ranking official under Trần Nhân Tông, contributing to the administrative affairs of the court.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Tử Kỳ'), 'Helped in shaping policies that defended the nation against foreign threats.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đào Tử Kỳ'), 'Esteemed for his loyalty and service to the Trần dynasty.');

-- Đèo Văn Trị --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES 
('Đèo Văn Trị', 'Male', 'Đèo Văn Trị', 'Lai Chau', 'Vietnam', 'Modern', '19th century', '1849', '1908', 'Đèo Văn Trị was a prominent leader of the White Tai ethnic group in Vietnam, known for his fierce resistance against French colonial rule in the late 19th century. He gained notoriety for capturing Luang Prabang in 1887 and leading various uprisings to unite local ethnic groups against colonial oppression. His legacy as a military strategist and political leader has inspired future generations and marked him as a significant figure in Vietnam\'s fight for independence.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đèo Văn Trị'), NULL, 'Son of Đèo Văn Sinh, a leader of the White Tai', 'White Tai');

INSERT INTO OtherNames (HistoricalFigureID, OtherName) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đèo Văn Trị'), 'Kam Oum');

INSERT INTO Fields (HistoricalFigureID, Field) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đèo Văn Trị'), 'Military'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đèo Văn Trị'), 'Politics'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đèo Văn Trị'), 'Culture');

INSERT INTO Positions (HistoricalFigureID, Position) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đèo Văn Trị'), 'Military Leader'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đèo Văn Trị'), 'Political Leader'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đèo Văn Trị'), 'Cultural Impact');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đèo Văn Trị'), 'led revolts against French colonial forces.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đèo Văn Trị'), 'Captured Luang Prabang'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đèo Văn Trị'), 'recognized as a local leader.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đèo Văn Trị'), 'Military strategies during uprisings.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đèo Văn Trị'), 'Appointed chief of Sip Song Chau Tai'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đèo Văn Trị'), 'Established governance and authority during colonial rule.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đèo Văn Trị'), 'Navigated complex relationships with colonial powers.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đèo Văn Trị'), 'Legacy as a symbol of resistance against colonial rule.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đèo Văn Trị'), 'Inspired future generations of leaders in the region.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đèo Văn Trị'), 'Respected figure among the White Tai and other ethnic groups.');

-- Đinh Tiên Hoàng --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES 
('Đinh Tiên Hoàng', 'Male', 'Dinh Bo Linh', 'Ninh Binh, Dai Co Viet', 'Dai Co Viet', 'Dinh Dynasty', '10th century', '924', '979', 'Dinh Tiên Hoàng, originally known as Đinh Bộ Lĩnh, is a pivotal figure in Vietnamese history, celebrated for founding the Đinh Dynasty and being the first emperor of Đại Cồ Việt. Born in 924 AD, he rose to power during a tumultuous time marked by fragmentation and foreign influence. His reign, lasting from 968 to 979, was notable for successfully unifying various warlords, declaring independence from Chinese rule, and implementing significant administrative and military reforms. Known for his legendary origins and strategic prowess, Đinh Tiên Hoàng\'s leadership laid the groundwork for a centralized Vietnamese state and significantly influenced the course of Vietnam\'s national identity.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Tiên Hoàng'), NULL, 'general', 'raised by mother');


INSERT INTO Fields (HistoricalFigureID, Field) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Tiên Hoàng'), 'Military'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Tiên Hoàng'), 'Politics'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Tiên Hoàng'), 'Religious');

INSERT INTO Positions (HistoricalFigureID, Position) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Tiên Hoàng'), 'Military Leader'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Tiên Hoàng'), 'Emperor of Đại Cồ Việt');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Tiên Hoàng'), 'Successfully unified The Anarchy of the 12 Warlords and maintained Vietnam’s sovereignty through military reforms.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Tiên Hoàng'), 'Established a military framework that influenced future leaders.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Tiên Hoàng'), 'Noted for strategic military campaigns against foreign powers.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Tiên Hoàng'), 'Founded the Đinh Dynasty and the kingdom of Đại Cồ Việt.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Tiên Hoàng'), 'First emperor of Vietnam, established the foundations of the Vietnamese state.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Tiên Hoàng'), 'Instituted judicial and administrative reforms to strengthen governance and deter disobedience among local rulers. His reforms laid the foundation for a centralized administrative system that improved governance across the newly unified state.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Tiên Hoàng'), 'Respected for blending indigenous beliefs with governance.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Tiên Hoàng'), 'Enhanced cultural unity through religious practices.');

-- Đinh Công Tráng -- 
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES 
('Đinh Công Tráng', 'Male', 'Đinh Công Tráng', 'Ha Nam', 'Vietnam', 'Nguyen Dynasty', '19th century', '1842', '1887', 'Đinh Công Tráng was a prominent leader in the Cần Vương movement, actively opposing French colonization and fighting for national independence.');

INSERT INTO OtherNames (HistoricalFigureID, OtherName) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Công Tráng'), 'Nga Định Sơn Vương');

INSERT INTO Fields (HistoricalFigureID, Field) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Công Tráng'), 'Military');

INSERT INTO Positions (HistoricalFigureID, Position) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Công Tráng'), 'Military Leader');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Công Tráng'), 'Leader of Ba Dinh uprising.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Công Tráng'), 'in Can Vuong movement against French'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Công Tráng'), 'Played a crucial role in the anti-French movement.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Công Tráng'), 'Used to join the army of Hoang Ke Viem.');

INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES 
('Đinh Liễn', 'Male', 'Đinh Liễn', 'Ninh Binh, Dai Co Viet', 'Dai Co Viet', 'Dinh Dynasty', '10th century', '945', '979', 'Đinh Liễn (925-979) was a prominent historical figure during the 10th century in Vietnam, known as a prince of the Đinh dynasty. Born in Hoa Lư, Ninh Bình, he was the son of Đinh Bộ Lĩnh, the founder of the Đinh dynasty. As a skilled general, Đinh Liễn played a crucial role in military campaigns that helped establish and secure the territory of the newly formed dynasty. His bravery, loyalty, and military contributions were significant in shaping the early history of Vietnam and solidifying the nation’s independence.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Liễn'), NULL, 'Royal', 'Dinh Dynasty');

INSERT INTO Fields (HistoricalFigureID, Field) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Liễn'), 'Military'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Liễn'), 'Politics');

INSERT INTO Positions (HistoricalFigureID, Position) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Liễn'), 'General'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Liễn'), 'Prince');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Liễn'), 'Key role in establishing the Đinh dynasty; led military campaigns to secure the territory.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Liễn'), 'Noted for his loyalty to his father, Đinh Bộ Lĩnh, and his contributions to the formation of the Vietnamese state.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Liễn'), 'In 951, Đinh Bộ Lĩnh controlled Hoa Lư and refused to submit to the Ngô dynasty. He sent Đinh Liễn as a hostage to Cổ Loa. After being captured by the Ngô lords, Đinh Liễn\'s bravery led to his eventual release and return to Hoa Lư.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Liễn'), 'He killed his younger brother, who was made Crown Prince.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Liễn'), 'He and his father were killed by an eunuch.');

-- Đinh Phế Đế --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Đinh Phế Đế', 'Male', 'Dinh Toan', 'Ninh Binh, Dai Co Viet', 'Dai Co Viet', 'Dinh Dynasty', '10th century', '974', '1001', 'Dinh Toan (967-1000) was a historical figure during the 10th century in Vietnam, known as the last emperor of the Dinh dynasty. He was born in Hoa Lu, Ninh Binh, and was the son of Đinh Tiên Hoàng, the founder of the Dinh dynasty. After the death of his father in 979, Dinh Toan ascended to the throne at a very young age, ruling from 979 until 1000. His reign was marked by political instability, and he struggled to maintain control over the kingdom. Despite his royal lineage, his rule was characterized by inexperience, and he faced challenges from rival factions. Ultimately, his reign ended when the Dinh dynasty was overthrown by the Ly dynasty, leading to significant changes in the political landscape of Vietnam.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Phế Đế'), NULL, 'Son of Đinh Tiên Hoàng', 'The youngest child of Đinh Tiên Hoàng, mother is Duong Van Nga');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Phế Đế'), 'Politics');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Phế Đế'), 'Emperor'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Phế Đế'), 'Vệ Vương');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Phế Đế'), 'Became emperor after the death of his father and brother'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Phế Đế'), 'Influenced the stability of the dynasty'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Phế Đế'), 'The second emperor'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Phế Đế'), 'dethroned after only a short reign');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Phế Đế'), 'Prince');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Phế Đế'), 'deposed by his mother and became a prince.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Phế Đế'), 'Political pawn in shifting power'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Phế Đế'), 'After being overthrown , he was given the title of prince and was kept as a subordinate within the court, marking the end of his rule.');

-- Đỗ Hữu Vị
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Đỗ Hữu Vị', 'Male', 'Đỗ Hữu Vị', 'Sai Gon, Vietnam', 'Vietnam', 'Modern', '20th century', '1883', '1916', 'Đỗ Hữu Vị (1883-1916) was a pioneering figure in Vietnamese history, known as the first Vietnamese pilot to serve in the French Air Force during World War I. Born in Saigon into a prominent Vietnamese Catholic family, he was the son of Do Huu Phuong, a wealthy nobleman. Đỗ Hữu Vị inherited the title of prince and used this status to receive an education in France, eventually joining the French military. His career as a pilot and his bravery during the war earned him significant recognition, making him one of the most notable Vietnamese figures in global military history.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Hữu Vị'), 'wealthy', 'landowner', 'father is governor');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Hữu Vị'), 'Military');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Hữu Vị'), 'Pilot'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Hữu Vị'), 'Officer');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Hữu Vị'), 'First Vietnamese pilot in the French Air Force'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Hữu Vị'), 'fought in World War I'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Hữu Vị'), 'A symbol of Vietnamese contribution to global conflict'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Hữu Vị'), 'was one of the first Vietnamese officers in the French military, and his heroism in World War I made him a notable figure.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Hữu Vị'), 'the most famous of the first French pilots from Indochina.');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Hữu Vị'), 'He was promoted to Captain and appointed commander of the 7th Company (7ème compagnie) of the 1st Foreign Legion Regiment, fighting on the Somme River front.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Hữu Vị'), 'He died on the battlefield.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Hữu Vị'), 'The French government printed his image on stamps issued throughout Indochina.');

-- Đỗ Mười -- 
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Đỗ Mười', 'Male', 'Nguyen Duy Cong', 'Ha Dong, Vietnam', 'Vietnam', 'Modern', '20th century', '1917', '2018', 'Đỗ Mười (1917-2018) was a prominent Vietnamese political figure who played a key role in shaping the economic and political landscape of modern Vietnam. Born into a working-class family in Thanh Tri, Ha Noi, he joined the Communist Party of Vietnam in 1939 and became one of the most influential leaders in the country\'s post-war period. As Prime Minister from 1988 to 1991, he led the implementation of the "Doi Moi" economic reforms, which transitioned Vietnam from a centrally planned economy to a market-oriented one. He later served as the General Secretary of the Communist Party from 1991 to 1997, continuing to oversee the country’s economic and diplomatic expansion. His pragmatic leadership left a lasting impact on Vietnam\'s development and its global standing.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Mười'), 'middle-class', 'Politician', 'descendant of Dinh Quoc Cong Nguyen Bac');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Mười'), 'Politics');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Mười'), 'Prime Minister of Vietnam');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Mười'), 'Oversaw economic reforms known as "Doi Moi" that transformed Vietnam\'s economy'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Mười'), 'Significant role in opening Vietnam’s economy to the world'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Mười'), 'Pragmatic, reform-oriented leader');

INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Đỗ Thích', 'Male', 'Đỗ Thích', 'Dai Co Viet', 'Dai Co Viet', 'Dinh Dynasty', '10th century', NULL, '979', 'Đỗ Thích was a court official during the 10th century in Dai Co Viet, who became infamous for assassinating Đinh Tiên Hoàng (the first emperor of the Dinh dynasty) and his son Đinh Liễn in 979. This act of treason, driven by personal ambition, led to a period of political chaos and paved the way for the rise of Le Hoan, who would go on to establish the Early Le dynasty. Đỗ Thích is considered one of the most notorious figures in Vietnamese history due to the repercussions of his actions, which resulted in the collapse of the Dinh dynasty.');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Thích'), 'Politics');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Thích'), 'Court official'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Thích'), 'traitor');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Thích'), 'Assassinated Đinh Tiên Hoàng and his son Đinh Liễn when they were sleeping in their palace'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Thích'), 'Played a pivotal role in the demise of the Dinh dynasty');

INSERT INTO Quotes (HistoricalFigureID, Quote)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Thích'), 'When he was still a mandarin in Dong Quan, he was lying on the bridge at night and suddenly saw a shooting star falling into his mouth. From then on, he had the idea of killing the king. After King Đinh Tiên Hoàng and Nam Viet King Đinh Liễn were murdered, the courtiers searched for the king\'s killer. Đỗ Thích had to climb up and lie in a water trough in the palace for three days straight, suffering from hunger and thirst.');

-- Đỗ Thuận --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Đỗ Thuận', 'Male', 'Do Phap Thuan', 'Dai Co Viet', 'Dai Co Viet', 'Tien Le Dynasty', '10th century', NULL, NULL, 'Đỗ Thuận was a prominent Buddhist monk in the 10th century during the Dinh and Early Le dynasties. Known for his wisdom and moral authority, he played a significant role in both spiritual and political matters, offering guidance to the royal court. His influence extended beyond religious affairs, as his counsel was sought by rulers, including Đinh Tiên Hoàng and Le Hoan, during a crucial period of nation-building in Dai Co Viet. His legacy as a learned and respected monk is integral to the history of Buddhism’s impact on Vietnamese governance and society.');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Thuận'), 'Religious'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Thuận'), 'Politics');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Thuận'), 'Monk'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Thuận'), 'Advisor to the Court');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Thuận'), 'Influential Buddhist monk during 2 dynasties'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Thuận'), 'Played a key role in spiritual and political matters'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Thuận'), 'served as a spiritual advisor to the emperors.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Thuận'), 'his role blending Buddhist teachings with state governance during the formative years.');

-- Đoàn Giỏi -- 
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Đoàn Giỏi', 'Male', 'Đoàn Giỏi', 'Tien Giang, Vietnam', 'Vietnam', 'Modern', '20th century', '1925', '1989', 'Đoàn Giỏi (1925-1989) was a prominent Vietnamese writer, best known for his works that depicted the natural landscapes and rich culture of southern Vietnam, particularly the Mekong Delta. His most famous novel, Dat rung phuong Nam (Southern Land and Forest), has become a classic in Vietnamese literature. His stories often explored the harmony between humans and nature, showcasing the wildlife and people of the southern region. Through his writing, Đoàn Giỏi celebrated the beauty of Vietnam\'s natural environment, bringing attention to the unique aspects of life in the south during a time of great political and social change.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Giỏi'), 'Landlord family', NULL, NULL);

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Giỏi'), 'Literature');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Giỏi'), 'Novelist');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Giỏi'), 'Famous for works depicting the southern region of Vietnam'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Giỏi'), 'Pioneered a genre of nature-themed literature in Vietnam'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Giỏi'), 'Deep understanding of Southern culture and wildlife');

INSERT INTO Works (HistoricalFigureID, Work)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Giỏi'), 'Dat rung phuong Nam'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Giỏi'), 'Ca bong mu');

-- Đoàn Hữu Trưng -- 
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Đoàn Hữu Trưng', 'Male', 'Doan Trung', 'Thua Thien Hue, Vietnam', 'Vietnam', 'Nguyen Dynasty', '19th century', '1844', '1866', 'Đoàn Hữu Trưng (1844–1866) was a Vietnamese revolutionary leader from An Truyen, Hue. Known for his literary talent and intelligence, he led the 1866 “Loan Chay Voi” uprising in an attempt to overthrow Emperor Tu Duc. Despite his close ties to the emperor, his rebellion, which involved workers from the emperor’s tomb construction, failed, and he was captured and executed. His actions remain a significant part of Vietnamese history.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Hữu Trưng'), 'Poor family', NULL, 'Hometown: Thanh Hoa');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Hữu Trưng'), 'Military');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Hữu Trưng'), 'Revolutionary Leader');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Hữu Trưng'), 'Led the "Loan Chay Voi" uprising'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Hữu Trưng'), 'His rebellion marked a key moment in resistance to the Nguyễn dynasty'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Hữu Trưng'), 'Literary talent, influential figure in the court');

-- Đoàn Nhữ Hải --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Đoàn Nhữ Hải', 'Male', 'Đoàn Nhữ Hải', 'Nam Dinh, Dai Viet', 'Dai Viet', 'Tran Dynasty', '13th - 14th century', '1280', '1335', 'Đoàn Nhữ Hải (1280–1335) was a distinguished scholar-official and military leader during the Tran dynasty in Vietnam. Born in Nam Dinh, he served under three emperors, playing a pivotal role in diplomacy and military campaigns, especially against Ai Lao. Known for his intellectual brilliance and strategic leadership, his career ended tragically in 1335 when he was killed in battle.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Nhữ Hải'), 'Scholar-official family', NULL, NULL);

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Nhữ Hải'), 'Politics'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Nhữ Hải'), 'Military');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Nhữ Hải'), 'Advisor'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Nhữ Hải'), 'General');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Nhữ Hải'), 'Diplomatic mission to Chiêm Thành; managed relations with Chiêm Thành'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Nhữ Hải'), 'managed relations with Chiêm Thành'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Nhữ Hải'), 'Influential in the Tran court'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Nhữ Hải'), 'served under three kings'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Nhữ Hải'), 'Led military campaigns against Ai Lao'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Nhữ Hải'), 'Died in the battle against Ai Lao due to miscalculated strategy');

-- Đoàn Thị Điểm -- 
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Đoàn Thị Điểm', 'Female', 'Đoàn Thị Điểm', 'Hung Yen, Dai Viet', 'Dai Viet', 'Revival Le Dynasty', '18th century', '1705', '1748', 'Đoàn Thị Điểm (1705–1748) was a renowned female poet and writer from the 18th century. Born in Hung Yen, she is celebrated for her literary talent and beauty, especially for her translation of Chinh phụ ngâm and her work Truyền kỳ tân phả. Her contributions significantly shaped Vietnamese literature, making her a prominent figure of her time.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Thị Điểm'), NULL, 'mandarin family', NULL);

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Thị Điểm'), 'Literature');

INSERT INTO othernames (HistoricalFigureID, OtherName)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Thị Điểm'), 'Hong Ha nu si');

INSERT INTO spouses (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Thị Điểm'), 'Nguyen Kieu', 'scholar');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Thị Điểm'), 'Poet');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Thị Điểm'), 'Renowned for translating Chinh phụ ngâm and other works'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Thị Điểm'), 'One of the prominent female figures in Vietnamese literature'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Thị Điểm'), 'Celebrated for beauty and literary talent'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Thị Điểm'), 'Recognized as a key contributor to Vietnamese literature');

INSERT INTO works (HistoricalFigureID, Work) 
values
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Thị Điểm'), 'Truyen ky tan pha'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Thị Điểm'), 'Chinh phu ngam');

-- Đốc Ngữ -- 
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES 
('Đốc Ngữ', 'Male', 'Nguyen Duc Ngu', 'Son Tay, Vietnam', 'Dai Nam', 'Nguyen Dynasty', '19th century', NULL, '1892', 'Đốc Ngữ (Nguyen Duc Ngu) was a prominent military leader in the late 19th century, recognized for his fierce resistance against French colonial forces in Vietnam. Born into a poor family in Son Tay, he rose to prominence during the Franco-Vietnamese War, particularly known for his command during key battles such as the Battle of Cầu Giấy in 1883. Despite facing overwhelming odds, Đốc Ngữ’s strategic acumen and leadership inspired local uprisings and united various ethnic groups in their fight against colonization. He was ultimately assassinated in 1892, but his legacy as a courageous and skilled commander remains influential in Vietnamese history.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đốc Ngữ'), 'Poor family', NULL, NULL);

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đốc Ngữ'), 'Military');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đốc Ngữ'), 'Commander');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đốc Ngữ'), 'Commanded troops during the Battle of Cầu Giấy'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đốc Ngữ'), 'Resisted French colonization, inspired local uprisings'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đốc Ngữ'), 'A skilled military leader and tactician'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đốc Ngữ'), 'Streets named after him in various cities');

-- Đồng Khánh --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Đồng Khánh', 'Male', 'Nguyen Phuc Ung Duong', 'Hue, Vietnam', 'Dai Nam', 'Nguyen Dynasty', '19th century', '1864-01-12', '1889-02-26', 'Đồng Khánh, born Nguyen Phuc Bien on January 12, 1864, was the Emperor of Vietnam from 1885 until his death in 1889. He ascended the throne during a tumultuous period characterized by increasing French colonial influence in Vietnam. His reign, although short, was marked by efforts to maintain stability within the monarchy and navigate complex relations with the French. Despite his intelligent and educated demeanor, Đồng Khánh\'s power was limited, as he operated within the constraints imposed by colonial authorities. He passed away at a young age, leaving behind a legacy intertwined with Vietnam\'s struggle against colonialism.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đồng Khánh'), NULL, 'Royal', 'Nguyen Dynasty');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đồng Khánh'), 'Politics');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đồng Khánh'), 'Emperor');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đồng Khánh'), 'Short reign; focused on maintaining stability amidst colonial pressures.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đồng Khánh'), 'focused on maintaining stability amidst colonial pressures.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đồng Khánh'), 'Promoted French interests in Vietnam.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đồng Khánh'), '9th emperor of Nguyen Dynasty'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đồng Khánh'), 'Intelligent and educated, with a passion for reading and writing.');

INSERT INTO othernames (HistoricalFigureID, OtherName)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đồng Khánh'), 'Nguyen Phuc Ung Ky'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đồng Khánh'), 'Nguyen Phuc Bien'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đồng Khánh'), 'Kien Giang Quan Cong'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đồng Khánh'), 'Chanh Mong');

-- Đội Cung -- 
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Đội Cung', 'Male', 'Tran Van Cung', 'Ha Tinh', 'Vietnam', 'Modern', '20th century', '1903', '1941', 'Đội Cung, born Tran Van Cung in 1903, was a key military leader in Vietnam’s anti-colonial struggle against French rule. He is best known for leading the Do Luong uprising on January 13, 1941, where he rallied troops to rise against colonial forces. His leadership exemplified bravery and integrity, inspiring others to join the resistance movement. Despite being captured and executed, Đội Cung\'s legacy continues to resonate in the context of Vietnam\'s fight for independence.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đội Cung'),NULL, 'patriot', 'father killed by French colonial forces');

INSERT INTO othernames (HistoricalFigureID, OtherName)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đội Cung'), 'Nguyen Van Cung');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đội Cung'), 'Military');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đội Cung'), 'Leader of uprising');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đội Cung'), 'Led the Do Luong uprising against French colonial forces.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đội Cung'), 'Inspired local resistance and showcased the potential for organized uprisings.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đội Cung'), 'Known for integrity and solidarity with fellow soldiers.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đội Cung'), 'Captured and executed after the uprising; his actions had a lasting impact on the anti-French movement.');

-- Dục Đức --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Dục Đức', 'Male', 'Nguyen Phuc Ung Ai', 'Thua Thien Hue', 'Dai Nam', '19th century', '19th', '1858', '1883', 'Dục Đức, born Nguyen Phuc Ung Chan in 1858, was the fifth emperor of the Nguyen dynasty in Vietnam, reigning briefly in 1883. His ascension to the throne came immediately after the death of his father, Emperor Tu Duc, but he faced significant political challenges and controversies that led to his deposition just three days later. His reign was marred by accusations of misconduct and manipulation, ultimately resulting in his imprisonment and death under suspicious circumstances. Posthumously, he was honored by his son, Thanh Thai, and recognized as Cung Hue Hoang De, with his legacy reflecting the turbulent times of colonial Vietnam.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dục Đức'), NULL, 'Royal', 'Nguyen Dynasty');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dục Đức'), 'Politics');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dục Đức'), 'Emperor');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dục Đức'), 'Reigned for only three days.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dục Đức'), 'being deposed and imprisoned.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dục Đức'), 'His brief reign illustrated the turbulent period of the Nguyen dynasty during French colonial rule.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dục Đức'), 'Known for his controversial ascension and subsequent downfall.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dục Đức'), 'Posthumously honored as Cung Hue Hoang De. His tomb is located at An Lang.');

INSERT INTO othernames (HistoricalFigureID, OtherName)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dục Đức'), 'Nguyen Phuc Ung Chan'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dục Đức'), 'Hue Hoang De'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dục Đức'), 'Cung Tong'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dục Đức'), 'Thuy Quoc Cong');

-- Dương Đình Nghệ --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Dương Đình Nghệ', 'Male', 'Dương Đình Nghệ', 'Thanh Hoa', 'Van Xuan', '10th century', '10th', 'Unknown', '931', 'Dương Đình Nghệ was a significant military figure in Vietnam during the 10th century. He initially served under Khuc Hao and later Khuc Thua My, contributing to the defense against foreign invasions from the Nam Han dynasty. In 931, he proclaimed himself Tiet Do Su, effectively taking control of Giao Chau. His leadership was pivotal in rallying local resistance against external threats, but his life ended tragically when he was betrayed and killed by a subordinate. His legacy continued through his family, especially his son-in-law Ngo Quyen, who led Vietnam to independence.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Đình Nghệ'), NULL, 'local chief', 'None');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Đình Nghệ'), 'Military');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Đình Nghệ'), 'General');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Đình Nghệ'), 'Defeated Nam Han\'s forces'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Đình Nghệ'), 'declared himself Tiet Do Su.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Đình Nghệ'), 'Major influence in uniting Vietnam against foreign invasions.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Đình Nghệ'), 'Recognized for military strategies and leadership.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Đình Nghệ'), 'Worked under Khuc Hao and Khuc Thua My.');

-- Dương Trực Nguyên --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Dương Trực Nguyên', 'Male', 'Dương Trực Nguyên', 'Thang Long', 'Dai Viet', 'Le Dynasty', '15th century', '1458', '1509', 'Dương Trực Nguyên (1458–1509) was a notable official and poet during the Le dynasty in Vietnam. He played a significant role in the royal court, serving under multiple emperors and earning recognition for his integrity and dedication to governance. A prominent member of the Tao Dan poetry group, Dương Trực Nguyên contributed to the literary landscape of the time, reflecting the political and cultural values of the era through his works.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Trực Nguyên'), 'Not widely recorded', 'None', 'None');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Trực Nguyên'), 'Politics'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Trực Nguyên'), 'Literature');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Trực Nguyên'), 'High-ranking official');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Trực Nguyên'), 'Promoted as an important official under multiple emperors.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Trực Nguyên'), 'Influenced literary and political circles during the Le dynasty.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Trực Nguyên'), 'Renowned for his integrity, patriotism, and dedication to the people.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Trực Nguyên'), 'Contributed poetry as a member of the Tao Dan group.');

-- Dương Vân Nga --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Dương Vân Nga', 'Female', 'Unknown', 'Hoa Lu', 'Dai Co Viet', 'Dinh Dynasty ; Tien Le Dynasty', '10th', '952', '1000', 'Dương Vân Nga was an influential figure in early Vietnamese history, serving as both the Empress Dowager of the Đinh Dynasty and later as Empress of the Early Lê Dynasty. Her beauty was well noted, but she is also remembered for her significant political role during a tumultuous period in Vietnam, especially after the assassination of her husband, Đinh Tiên Hoàng. She played a crucial part in transitioning power to Lê Hoàn, who became the next ruler, thus establishing the Early Lê Dynasty.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Dương Vân Nga'), NULL, 'subordinate of Duong Dinh Nghe', 'Dương Tam Kha') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Dương Vân Nga'), 'Politics') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Dương Vân Nga'), 'Empress Dowager'),
((select ID from HistoricalFigures where historicalfigures = 'Dương Vân Nga'), 'Empress') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Dương Vân Nga'), 'Became Empress Dowager and regent after the assassination of Dinh Tien Hoang'),
((select ID from HistoricalFigures where historicalfigures = 'Dương Vân Nga'), 'leading to the establishment of the Early Le Dynasty'),
((select ID from HistoricalFigures where historicalfigures = 'Dương Vân Nga'), 'Significant role in the transition of power'),
((select ID from HistoricalFigures where historicalfigures = 'Dương Vân Nga'), 'Empress of 2 dynasties'),
((select ID from HistoricalFigures where historicalfigures = 'Dương Vân Nga'), 'The woman who had the most influence on 2 dynasties') ;

INSERT INTO othernames (HistoricalFigureID, OtherName)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Vân Nga'), 'Đại Thằng Minh Hoàng Hậu');

INSERT INTO Spouses  (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Vân Nga'), 'Đinh Tiên Hoàng', 'emperor') ,
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Vân Nga'), 'Lê Đại Hành', 'emperor') ;


-- Duy Tân --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Duy Tân', 'Male', 'Nguyễn Phúc Vĩnh San', 'Hue', 'Vietnam', 'Nguyen Dynasty', '20th', '1900', '1945', 'Duy Tân (1900–1945), born Nguyễn Phúc Vĩnh San, was the 11th emperor of Vietnam, ascending the throne at a young age in 1907. Known for his strong stance against French colonial rule, he supported a rebellion in 1916, leading to his dethronement and exile to the island of Réunion. During World War II, Duy Tân joined the French Resistance, but tragically died in a plane crash in 1945 while returning to assist Vietnam in post-war efforts.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Duy Tân'), NULL, 'Royal family', 'Nguyen dynasty') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Duy Tân'), 'Politics'),
((select ID from HistoricalFigures where historicalfigures = 'Duy Tân'), 'Military') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Duy Tân'), 'Emperor'),
((select ID from HistoricalFigures where historicalfigures = 'Duy Tân'), 'revolutionary activist'),
((select ID from HistoricalFigures where historicalfigures = 'Duy Tân'), 'Lieutenant in the French Resistance') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Duy Tân'), 'Led the 1916 rebellion against French colonial rule'),
((select ID from HistoricalFigures where historicalfigures = 'Duy Tân'), 'Important figure in Vietnam\'s anti-colonial movement'),
((select ID from HistoricalFigures where historicalfigures = 'Duy Tân'), 'Known for his political independence'),
((select ID from HistoricalFigures where historicalfigures = 'Duy Tân'), '11th emperor of Nguyen Dynasty'),
((select ID from HistoricalFigures where historicalfigures = 'Duy Tân'), 'one of the three patriotic kings of Vietnam during the French colonial period') ,
((select ID from HistoricalFigures where historicalfigures = 'Duy Tân'), 'Participated in the French Resistance during World War II'),
((select ID from HistoricalFigures where historicalfigures = 'Duy Tân'), 'fighting against the Nazi occupation'),
((select ID from HistoricalFigures where historicalfigures = 'Duy Tân'), 'died in a plane crash while returning to Vietnam during WWII.'),
((select ID from HistoricalFigures where historicalfigures = 'Duy Tân'), 'Became emperor because of playfulness') ;

INSERT INTO othernames (HistoricalFigureID, OtherName)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Duy Tân'), 'Nguyễn Phúc Hoảng');

INSERT INTO Spouses  (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Duy Tân'), 'Mai Thị Vàng', 'daughter of his teacher') ;

-- Gia Long --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Gia Long', 'Male', 'Nguyễn Phúc Ánh', 'Hue', 'Vietnam', 'Tay Son Dynasty', '18th-19th century', '1762', '1820', 'Gia Long, born Nguyễn Phúc Ánh in 1762, was the founder of the Nguyễn dynasty and the first emperor to unify Vietnam after centuries of division. Following years of conflict with the Tây Sơn rebels, Gia Long reclaimed control over all of Vietnam in 1802, bringing an end to the civil wars. His reign is notable for military strategy, the use of Western technology, and political reforms rooted in Confucianism. Gia Long transformed Vietnam into a unified and stable kingdom, laying the foundation for a centralized monarchy that lasted until 1945.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Gia Long'), NULL, 'Nguyễn Lord family', NULL) ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Gia Long'), 'Military'),
((select ID from HistoricalFigures where historicalfigures = 'Gia Long'), 'Politics') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Gia Long'), 'General'),
((select ID from HistoricalFigures where historicalfigures = 'Gia Long'), 'Founder'),
((select ID from HistoricalFigures where historicalfigures = 'Gia Long'), 'Emperor') ;

INSERT INTO othernames (HistoricalFigureID, OtherName)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Gia Long'), 'Nguyễn Ánh'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Gia Long'), 'Nguyễn Phúc Chủng');

INSERT INTO Spouses  (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Gia Long'), 'Tống Thị Lan', 'Thừa Thiên Cao Hoàng hậu') ,
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Gia Long'), 'Trần Thị Đang', 'mother of Minh Mạng') ,
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Gia Long'), 'Lê Thị Ngọc Bình', 'princess of Revival Le Dynasty') ;


insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Gia Long'), 'Reunified Vietnam'),
((select ID from HistoricalFigures where historicalfigures = 'Gia Long'), 'Known for strategic military alliances, especially with France'),
((select ID from HistoricalFigures where historicalfigures = 'Gia Long'), 'Used Western military technology in his campaigns'),
((select ID from HistoricalFigures where historicalfigures = 'Gia Long'), 'Ask for help from Siam to fight against his enemies'),
((select ID from HistoricalFigures where historicalfigures = 'Gia Long'), 'Established the Nguyễn dynasty'),
((select ID from HistoricalFigures where historicalfigures = 'Gia Long'), 'Brought stability and administrative reforms'),
((select ID from HistoricalFigures where historicalfigures = 'Gia Long'), 'Revived Confucian principles in governance'),
((select ID from HistoricalFigures where historicalfigures = 'Gia Long'), 'The first person to use the national name of Vietnam') ;

-- Giang Nam --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Giang Nam', 'Male', 'Nguyễn Sung', 'Khánh Hòa', 'Vietnam', 'Modern', '20th–21st century', '1929', NULL, 'Giang Nam (real name Nguyễn Sung) is a prominent Vietnamese poet born in 1929 in Khánh Hòa. He is best known for his deeply emotional and patriotic poem "Quê hương" ("Homeland"), which reflects the struggles and sacrifices of Vietnam during wartime. Active in both literature and politics, Giang Nam\'s works are infused with love for his country and the pain caused by conflict. His poetry, influenced by his personal and national experiences, became a symbol of resilience and the spirit of the Vietnamese people. He remains a significant figure in post-war Vietnamese literature.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Giang Nam'), NULL, 'patriotic family', NULL) ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Giang Nam'), 'Literature'),
((select ID from HistoricalFigures where historicalfigures = 'Giang Nam'), 'Politics') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Giang Nam'), 'Poet'),
((select ID from HistoricalFigures where historicalfigures = 'Giang Nam'), 'Writer'),
((select ID from HistoricalFigures where historicalfigures = 'Giang Nam'), 'revolutionary activist'),
((select ID from HistoricalFigures where historicalfigures = 'Giang Nam'), 'Editor-in-Chief of Literature and Arts Newspaper'),
((select ID from HistoricalFigures where historicalfigures = 'Giang Nam'), 'Communist Party Member') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Giang Nam'), 'Symbol of post-war Vietnamese poetry'),
((select ID from HistoricalFigures where historicalfigures = 'Giang Nam'), 'recognized for emotional and patriotic works'),
((select ID from HistoricalFigures where historicalfigures = 'Giang Nam'), 'His works expressed deep love for his homeland'),
((select ID from HistoricalFigures where historicalfigures = 'Giang Nam'), 'His work reflected the nation\'s struggles and sacrifices'),
((select ID from HistoricalFigures where historicalfigures = 'Giang Nam'), 'His works often portray the devastation of war and the emotional resilience of Vietnamese people'),
((select ID from HistoricalFigures where historicalfigures = 'Giang Nam'), 'Engaged in political movements during the Vietnam War'),
((select ID from HistoricalFigures where historicalfigures = 'Giang Nam'), 'Supported Vietnamese independence and post-war reconstruction through his poetry'),
((select ID from HistoricalFigures where historicalfigures = 'Giang Nam'), 'His political involvement influenced his works, intertwining literature and nationalistic ideology') ;

insert into works (HistoricalFigureID, Work) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Giang Nam'), 'Cô bé nhà bên') ,
((select ID from HistoricalFigures where historicalfigures = 'Giang Nam'), 'Quê hương');

INSERT INTO Spouses  (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Giang Nam'), 'Phan Thị Chiều', 'revolutionary activist') ;

-- Giang Văn Minh --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Giang Văn Minh', 'Male', 'Giang Văn Minh', 'Son Tay', 'Dai Viet', 'Revival Le Dynasty', '17th century', '1573', '1638', 'Giang Văn Minh (1573–1638), a prominent figure in Vietnam\'s Later Lê Dynasty, is remembered primarily for his role as a diplomat. He is best known for leading a Vietnamese delegation to the Ming court in 1637, where he courageously opposed the Chinese demand for tribute, based on an erroneous claim related to a debt from the Vietnamese general Liễu Thăng. His diplomatic victory ended the unjust tribute system and significantly improved Vietnam\'s relations with China. Despite the personal cost, as he was executed after the mission, his legacy is celebrated for its intellectual brilliance and diplomatic skill, making him a symbol of national pride and resilience.') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Giang Văn Minh'), 'Politics') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Giang Văn Minh'), 'Diplomat'),
((select ID from HistoricalFigures where historicalfigures = 'Giang Văn Minh'), 'third highest academic title in the old system') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Giang Văn Minh'), 'Led an envoy to the Ming court'),
((select ID from HistoricalFigures where historicalfigures = 'Giang Văn Minh'), 'Not humiliating the king\'s mandate'),
((select ID from HistoricalFigures where historicalfigures = 'Giang Văn Minh'), 'advocated for ending the gold tribute'),
((select ID from HistoricalFigures where historicalfigures = 'Giang Văn Minh'), 'redefine Vietnam-China relations'),
((select ID from HistoricalFigures where historicalfigures = 'Giang Văn Minh'), 'spoke frankly before the Chinese court and was executed'),
((select ID from HistoricalFigures where historicalfigures = 'Giang Văn Minh'), 'His bold response at the Ming court over the "Liễu Thăng debt" issue redefined Vietnam\'s diplomatic stance'),
((select ID from HistoricalFigures where historicalfigures = 'Giang Văn Minh'), 'Represented the Lê dynasty at the Ming court, standing against the tribute demand'),
((select ID from HistoricalFigures where historicalfigures = 'Giang Văn Minh'), 'Noted for his contributions to Vietnamese diplomacy and his stand on national sovereignty'),
((select ID from HistoricalFigures where historicalfigures = 'Giang Văn Minh'), 'his diplomatic career was defined by his fight against unequal tribute demands from China.') ;

INSERT INTO Spouses  (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Giang Van Minh'),'Do Thi', 'revolutionary activist') ;

-- Hai Bà Trưng --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hai Bà Trưng', 'Female', 'Trưng Trắc and Trưng Nhị', 'Me Linh', 'Giao Chi', 'The Northern colonial period of Vietnam', '1st Century', 'Unknown', '43 AD', 'Hai Bà Trưng, also known as Trưng Trắc and Trưng Nhị, were two Vietnamese sisters who led a rebellion against the Han Dynasty in 40 AD. Their uprising, though short-lived, became a powerful symbol of resistance against foreign domination and is still celebrated as a cornerstone of Vietnamese national pride. The Trưng sisters are revered for their military prowess, leadership, and as icons of female strength in Vietnamese history.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hai Bà Trưng'), 'noble family', 'general of Hung King', NULL) ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hai Bà Trưng'), 'Politics') ,
((select ID from HistoricalFigures where historicalfigures = 'Hai Bà Trưng'), 'Military') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hai Bà Trưng'), 'Leaders of the uprising') ,
((select ID from HistoricalFigures where historicalfigures = 'Hai Bà Trưng'), 'Generals') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hai Bà Trưng'), 'Led a rebellion against the Eastern Han Empire.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hai Bà Trưng'), 'Their rebellion is one of the most iconic in Vietnamese history.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hai Bà Trưng'), 'Known for their leadership and courage, especially as female figures leading an armed revolt.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hai Bà Trưng'), 'Their victory in battle was crucial in the brief period of independence from Chinese rule.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hai Bà Trưng'), 'Successfully liberated a large region in northern Vietnam from Chinese rule.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hai Bà Trưng'), 'The first known female leaders.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hai Bà Trưng'), 'Their legacy remains a symbol of national pride.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hai Bà Trưng'), 'The first female king in Vietnamese history.') ;

INSERT INTO Spouses  (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hai Bà Trưng'), 'Thi Sách', 'husband of Trưng Trắc') ;

INSERT INTO othernames (HistoricalFigureID, OtherName)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hai Bà Trưng'), 'Trưng Nữ Vương');

-- Hải Thượng Lãn Ông --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hải Thượng Lãn Ông', 'Male', 'Lê Hữu Trác', 'Hung Yen, Dai Viet', 'Dai Viet', 'Revival Le dynasty', '18th', '1720', '1791', 'Hải Thượng Lãn Ông, also known as Lê Hữu Trác, was an 18th-century Vietnamese physician and medical scholar. His contributions to traditional medicine, particularly through his renowned works like ''Hải Thượng Y Tông Tâm Lĩnh'' and ''Nam Dược thần hiệu'', significantly advanced Vietnamese medical practice. Lê Hữu Trác’s systematization of traditional herbal remedies and dedication to patient care remain a foundation of Vietnamese healthcare traditions, influencing generations of healers and scholars in Vietnam. His legacy continues to be honored annually, showcasing his profound impact on both medicine and Vietnamese culture.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hải Thượng Lãn Ông'), NULL, 'scholarly family', 'his father was a Confucian scholar and physician.') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hải Thượng Lãn Ông'), 'Science') ,
((select ID from HistoricalFigures where historicalfigures = 'Hải Thượng Lãn Ông'), 'Medicine') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hải Thượng Lãn Ông'), 'Renowned herbalist and scholar of Vietnamese medicine') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hải Thượng Lãn Ông'), 'forming the foundation of traditional medical practice for generations.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hải Thượng Lãn Ông'), 'His medical writings are considered among the most important in Vietnamese medicine') ,
((select ID from HistoricalFigures where historicalfigures = 'Hải Thượng Lãn Ông'), 'Known for his dedication to medicine.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hải Thượng Lãn Ông'), 'honored by UNESCO') ,
((select ID from HistoricalFigures where historicalfigures = 'Hải Thượng Lãn Ông'), 'Known for profound knowledge of herbal treatments.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hải Thượng Lãn Ông'), 'Improved and systematized traditional Vietnamese medicine with over 3,000 remedies.') ;

insert into works (HistoricalFigureID, Work)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hải Thượng Lãn Ông'), 'Hải Thượng Y Tông Tâm Lĩnh'),
((select ID from HistoricalFigures where historicalfigures = 'Hải Thượng Lãn Ông'), 'Nam Dược thần hiệu');

insert into othernames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hải Thượng Lãn Ông'), 'cậu Chiêu Bảy'),
((select ID from HistoricalFigures where historicalfigures = 'Hải Thượng Lãn Ông'), 'Cận Như'),
((select ID from HistoricalFigures where historicalfigures = 'Hải Thượng Lãn Ông'), 'Lãn Ông'),
((select ID from HistoricalFigures where historicalfigures = 'Hải Thượng Lãn Ông'), 'Thảo Am'),
((select ID from HistoricalFigures where historicalfigures = 'Hải Thượng Lãn Ông'), 'Quế Hiên'),
((select ID from HistoricalFigures where historicalfigures = 'Hải Thượng Lãn Ông'), 'Huân');

insert into quotes (HistoricalFigureID, Quote) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hải Thượng Lãn Ông'), '"Công danh trước mắt trôi như nước,/Nhân nghĩa trong lòng chẳng đổi phương."');

-- Hàm Nghi --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hàm Nghi', 'Male', 'Nguyễn Phúc Ưng Lịch', 'Hue', 'Vietnam', 'Nguyen Dynasty', '19th century', '1871', '1944', 'Hàm Nghi, born Nguyễn Phúc Hàm Nghi (1871–1944), was the 8th Emperor of the Nguyễn Dynasty. He ascended to the throne in 1884 at the age of 13, but his reign was short-lived. He is best known for leading the Can Vuong Movement (1885–1888), a resistance campaign against French colonial rule. After being captured by the French in 1888, he was exiled to Algeria, where he lived until his death. Hàm Nghi remains an important symbol of Vietnamese nationalism and resistance against colonialism.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hàm Nghi'), NULL, 'royal family', 'Nguyen dynasty') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hàm Nghi'), 'Politics') ,
((select ID from HistoricalFigures where historicalfigures = 'Hàm Nghi'), 'Military') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hàm Nghi'), 'Revolutionary leader ') ,
((select ID from HistoricalFigures where historicalfigures = 'Hàm Nghi'), 'Emperor ') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hàm Nghi'), 'Proclaimed Emperor at the age of 13.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hàm Nghi'), 'one of the three patriotic kings of Vietnam during the French colonial period') ,
((select ID from HistoricalFigures where historicalfigures = 'Hàm Nghi'), 'He issued two Can Vuong edicts') ,
((select ID from HistoricalFigures where historicalfigures = 'Hàm Nghi'), 'captured by the French in 1888 ') ,
((select ID from HistoricalFigures where historicalfigures = 'Hàm Nghi'), 'Leader of the Can Vuong Movement') ,
((select ID from HistoricalFigures where historicalfigures = 'Hàm Nghi'), 'exiled to Algeria until his death in 1944.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hàm Nghi'), 'The 8th emperor of Nguyen Dynasty') ,
((select ID from HistoricalFigures where historicalfigures = 'Hàm Nghi'), 'During the resistance war, King Dong Khanh and the three Queen Mothers continuously sent letters calling for him to return, but he firmly refused.') ;

insert into othernames (HistoricalFigureID, OtherName)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hàm Nghi'), 'Quận công Ưng Lịch') ,
((select ID from HistoricalFigures where historicalfigures = 'Hàm Nghi'), 'Nguyễn Phúc Minh') ;

insert into quotes (HistoricalFigureID, Quote)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hàm Nghi'), 'You\'d better kill me than hand me over to the French.') ;

insert into spouses (HistoricalFigureID, Name, OtherInfor)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hàm Nghi'), 'Marcelle Laloe', 'French') ;

-- Hàn Mặc Tử --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hàn Mặc Tử', 'Male', 'Nguyễn Trọng Tử', 'Quang Binh', 'Dai Nam', 'Modern', '20th', '1912', '1940', 'Hàn Mặc Tử (1912–1940) was a prominent Vietnamese poet, known for his unique style blending symbolism, surrealism, and emotional depth. Despite his short life, he left a significant mark on Vietnamese literature with works that conveyed themes of love, suffering, and the human condition.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hàn Mặc Tử'), 'poor family', 'doctor', NULL) ;

insert into fields (HistoricalFigureID, Field)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hàn Mặc Tử'), 'Literature') ;

insert into positions (HistoricalFigureID, Position) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hàn Mặc Tử'), 'Poet') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hàn Mặc Tử'), 'celebrated for his deep, emotional poetry') ,
((select ID from HistoricalFigures where historicalfigures = 'Hàn Mặc Tử'), 'his works capture his personal suffering due to illness and the tragic aspects of life.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hàn Mặc Tử'), 'had a lasting impact on modern Vietnamese poetry, influencing later generations with his unique, expressive style and poetic forms.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hàn Mặc Tử'), 'Known for his struggle with illness (leprosy), his poetry expressed themes of suffering, love, and the transience of life.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hàn Mặc Tử'), 'he met and was affected by Phan Boi Chau') ,
((select ID from HistoricalFigures where historicalfigures = 'Hàn Mặc Tử'), 'he has leprosy') ,
((select ID from HistoricalFigures where historicalfigures = 'Hàn Mặc Tử'), 'one of "Bàn Thành tứ hữu"') ,
((select ID from HistoricalFigures where historicalfigures = 'Hàn Mặc Tử'), 'He died of dysentery when he was only 28 years old.') ;

insert into Works (HistoricalFigureID, Work) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hàn Mặc Tử'), 'Đây thôn Vĩ Dạ') ,
((select ID from HistoricalFigures where historicalfigures = 'Hàn Mặc Tử'), 'Chân Thành') ,
((select ID from HistoricalFigures where historicalfigures = 'Hàn Mặc Tử'), 'Tuyệt Tình Ca') ;

insert into othernames (HistoricalFigureID, OtherName)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hàn Mặc Tử'), 'Phong Trần') ,
((select ID from HistoricalFigures where historicalfigures = 'Hàn Mặc Tử'), 'Lệ Thanh') ,
((select ID from HistoricalFigures where historicalfigures = 'Hàn Mặc Tử'), 'Hàn Mạc Tử') ;

-- Hiệp Hòa --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hiệp Hòa', 'Male', 'Nguyễn Phúc Hồng Dật', 'Huế, Vietnam', 'Dai Viet', 'Nguyen Dynasty', '19th', '1875', '1883', 'Hiệp Hòa (Nguyễn Phúc Hồng Dật) was the sixth emperor of the Nguyễn dynasty, reigning briefly from July to November 1883. His reign was marked by political instability, including his forced ascension to the throne after the removal of Emperor Dục Đức. He struggled with internal power struggles, particularly with the powerful Phụ chính đại thần. His reign ended tragically when he was poisoned by his political opponents, including Nguyễn Văn Tường and Tôn Thất Thuyết, who feared his growing dissatisfaction with their rule. He died on November 29, 1883.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hiệp Hòa'), 'Born into the Nguyễn Dynasty, youngest son of Emperor Thiệu Trị', NULL, NULL) ;

insert into fields (HistoricalFigureID, Field)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hiệp Hòa'), 'Politics') ;

insert into positions (HistoricalFigureID, Position) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hiệp Hòa'), 'Emperor') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hiệp Hòa'), 'He reigned for a very short time.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hiệp Hòa'), 'He reigned foronly about four months and ten days') ,
((select ID from HistoricalFigures where historicalfigures = 'Hiệp Hòa'), 'He was poisoned after protesting against the power of the officials.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hiệp Hòa'), 'He is the sixth emperor of the Nguyễn Dynasty.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hiệp Hòa'), 'Forced to the throne') ,
((select ID from HistoricalFigures where historicalfigures = 'Hiệp Hòa'), 'Known for court conflicts and resistance to power by high-ranking officials.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hiệp Hòa'), 'was poisoned by powerful officials') ;

insert into othernames (HistoricalFigureID, OtherName)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hiệp Hòa'), 'Nguyễn Phúc Thăng') ,
((select ID from HistoricalFigures where historicalfigures = 'Hiệp Hòa'), ' Văn Lãng Quận vương') ;

-- Hồ Chí Minh --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hồ Chí Minh', 'Male', 'Nguyễn Sinh Cung', 'Nghe An', 'Vietnam', 'modern', '20th century', '1890', '1969', 'Hồ Chí Minh (1890–1969) was a prominent Vietnamese revolutionary, nationalist, and communist leader who founded the Democratic Republic of Vietnam in 1945. He led Vietnam''s struggle for independence from French colonialism and later against American involvement in the Vietnam War. As president of North Vietnam, he was instrumental in shaping the country''s politics and military strategies. In addition to his political achievements, Hồ Chí Minh was also a writer, authoring influential works on revolutionary thought and Marxism-Leninism. His legacy continues to impact Vietnam''s history and ideology today.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'poor', 'scholar', 'Sen village') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'Politics') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'President of Vietnam') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'Declaration of independence in 1945') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'Established the Democratic Republic of Vietnam') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'On June 5, 1911, from Nha Rong Wharf, he set out for France to work as a kitchen assistant on the merchant ship Admiral Latouche-Tréville') ;

insert into othernames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'Nguyễn Ái Quốc'), 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'Nguyễn Tất Thành'),
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'Nguyễn Văn Ba') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'Bác Hồ') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'Founder of the Democratic Republic of Vietnam') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'led Vietnam''s struggle for independence from French and U.S.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'He was the symbol of Vietnamese independence') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'He went to England to work as a snow plow, a stoker, and then a hotel kitchen assistant, learning English') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'passed away but left a profound impact on Vietnam’s independence and the legacy of the Communist Party') ;

insert into fields (HistoricalFigureID, Field)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'Military') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'Commander-in-chief of Viet Minh') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'Leadership in the August Revolution (1945), Vietnam War (1945-1975)') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'Revered as a military and guerrilla warfare strategist in the fight against French and American forces') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'He unified three communist organizations in Indochina into the Communist Party of Vietnam') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'Known for his humble, simple lifestyle, Hồ Chí Minh became a symbol of revolutionary struggle and the father of modern Vietnam') ;

insert into fields (HistoricalFigureID, Field)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'Literature') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'Writer') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'Poet') ;


insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'He is a poet on revolutionary themes') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'author of one of the declaration of independence of the nation') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'Influenced political thought and literature in Vietnam') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'promoting Marxism-Leninism') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'He used to be in China, England, France, Russia') ;

insert into Works (HistoricalFigureID, Work) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'Nhật ký trong tù') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'Đường Kách Mệnh') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Chí Minh'), 'Bản án chế độ Thực dân pháp') ;

-- Hồ Dzếnh --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hồ Dzếnh', 'Male', 'Hà Triệu Anh', 'Thanh Hoa', 'Vietnam', 'Modern', '20th century', '1916', '1991', 'Hồ Dzếnh (1916–1991) was a Vietnamese-Chinese poet and writer known for his nostalgic, lyrical works. His poetry collection Quê Ngoại remains an iconic part of Vietnamese literature, reflecting his deep connection to both Vietnamese and Chinese cultures.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Dzếnh'), NULL, NULL, 'Chinese family') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hồ Dzếnh'), 'Literature') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Dzếnh'), 'Writer') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Dzếnh'), 'Poet') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Dzếnh'), 'His works depict nostalgia and love for humanity') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Dzếnh'), 'Bicultural') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Dzếnh'), 'is a Roman Catholic') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Dzếnh'), 'influenced by both Vietnamese and Chinese cultures') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Dzếnh'), 'His writings contain both artistic and humanistic elements') ;

insert into othernames (HistoricalFigureID, OtherName)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Dzếnh'), 'Hà Anh') ;

INSERT INTO Spouses  (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Dzếnh'), 'Nguyễn Thị Huyền Nhân', NULL) ,
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Dzếnh'), 'Nguyễn Thị Hồng Nhật', NULL ) ;

insert into Works (HistoricalFigureID, Work) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Dzếnh'), 'Chân trời cũ') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Dzếnh'), 'Cô gái Bình Xuyên') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Dzếnh'), 'Quê Ngoại') ;

-- Hồ Hán Thương --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hồ Hán Thương', 'Male', 'Hỏa', 'Thanh Hoa', 'Dai Ngu', 'Ho Dynasty', '15th', NULL, '1407', 'Hồ Hán Thương was the last emperor of the Hồ dynasty (1401–1407) in Vietnam. As the son of Hồ Quý Ly, he took the throne after his father. He led Đại Ngu''s resistance against the Ming invasion but was eventually captured in 1407, marking the end of the Hồ dynasty.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Hán Thương'), NULL, 'royal', 'mother is pricess of Le dynasty') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hồ Hán Thương'), 'Politics') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Hán Thương'), 'An Nam quốc vương') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Hán Thương'), 'emperor') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Hán Thương'), 'Succeeded Hồ Quý Ly, ruling Đại Ngu') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Hán Thương'), 'the 2nd emperor of Ho Dynasty') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Hán Thương'), 'the last emperor of Ho Dynasty') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Hán Thương'), 'made efforts to strengthen the defense of Đại Ngu, but failed due to internal and external challenges.') ;

insert into fields (HistoricalFigureID, Field)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Hán Thương'), 'Military') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Hán Thương'), 'Commander-in-chief') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Hán Thương'), 'Defended Đại Ngu against the Ming invasion') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Hán Thương'), 'failed in battle with the Ming Dynasty') ;

insert into spouses (HistoricalFigureID, Name, OtherInfor) 
values
((select ID from HistoricalFigures where historicalfigures = 'Hồ Hán Thương'), 'Hien Gia empress', NULL) ;

-- Hồ Nguyên Trừng --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hồ Nguyên Trừng', 'Male', 'Lê Trừng', 'Thanh Hoa', 'Dai Ngu', 'Ho Dynasty', '15th century', '1374', '1446', 'Hồ Nguyên Trừng (1374–1446) was a Vietnamese military engineer, strategist, and son of Hồ Quý Ly. Renowned for his military innovations, especially the "thần cơ" cannon, he played a key role in the Hồ dynasty''s defense against the Ming invasion. After being captured, he continued his career in China.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Nguyên Trừng'), NULL, 'royal family', 'Ho dynasty') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hồ Nguyên Trừng'), 'Politics') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Nguyên Trừng'), 'Minister of Public Works') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Nguyên Trừng'), 'prime minister') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Nguyên Trừng'), 'Played a key role in the Hồ dynasty''s defense') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Nguyên Trừng'), 'renowned for his contributions to military technology, especially in cannon development. He was also recognized as a talented engineer in the Ming Dynasty after his capture.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Nguyên Trừng'), 'After the fall of his dynasty, he was taken to China and continued to work as an engineer for the Ming court, where his innovations were appreciated.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Nguyên Trừng'), 'His invention of the "thần cơ" cannons revolutionized warfare during his time.') ;

insert into fields (HistoricalFigureID, Field)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Nguyên Trừng'), 'Military') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Nguyên Trừng'), 'general') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Nguyên Trừng'), 'Led the Hồ forces in resisting Ming aggression') ;

insert into fields (HistoricalFigureID, Field)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Nguyên Trừng'), 'Sciences') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Nguyên Trừng'), 'innovator') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Nguyên Trừng'), 'Invented advanced cannons for warfare, widely recognized for his engineering talents') ;

insert into othernames (HistoricalFigureID, OtherName)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Nguyên Trừng'), 'Nam Ông') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Nguyên Trừng'), 'Mạnh Nguyên') ;

-- Hồ Quý Ly --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hồ Quý Ly', 'Male', 'Le Quy Ly', 'Thanh Hoa, Dai Ngu', 'Dai Ngu', 'Ho Dynasty', '14th century', '1336', '1407', 'Hồ Quý Ly (1336–1407) was a Vietnamese military leader and politician who founded the Hồ dynasty, ruling as emperor from 1400 to 1401. He introduced progressive reforms in administration, land, and currency, but his rule ended with the Ming invasion in 1407, leading to his capture and the fall of the Hồ dynasty.') ;

insert into othernames (HistoricalFigureID, OtherName)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Quý Ly'), 'Lý Nguyên') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Quý Ly'), 'Nhất Nguyên') ;

insert into spouses (HistoricalFigureID, Name, OtherInfor) 
values
((select ID from HistoricalFigures where historicalfigures = 'Hồ Quý Ly'), 'Huy Ninh Princess', NULL) ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hồ Quý Ly'), 'Politics') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Quý Ly'), 'emperor') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Quý Ly'), 'Established the Hồ dynasty') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Quý Ly'), 'attempting to solidify power through reforms') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Quý Ly'), 'Hồ Quý Ly''s reforms were progressive but controversial. His rule marked the end of the Trần dynasty and led to the fall of the Hồ dynasty after the Ming conquest.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Quý Ly'), 'After defeat, he and his family were taken prisoner to China.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Quý Ly'), 'He was a reformer but faced strong opposition from the nobles and the Ming invasion eventually ended his reign.') ;

insert into fields (HistoricalFigureID, Field)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Quý Ly'), 'Military') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Quý Ly'), 'military leader') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Quý Ly'), 'Led the defense against the Ming invasion') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Quý Ly'), 'failed defense against the Ming invasion') ;

insert into fields (HistoricalFigureID, Field)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Quý Ly'), 'Social') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Quý Ly'), 'Instituted reforms like currency changes, land redistribution, and education reforms') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Quý Ly'), 'controversial reforms in economy, administration, and education') ;

-- Hồ Tùng Mậu --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hồ Tùng Mậu', 'Male', 'Hồ Bá Cự', 'Nghe An', 'Vietnam', 'modern', '20th century', '1896', '1946', 'Hồ Tùng Mậu was one of the key architects of the August Revolution in 1945 and an influential figure in the anti-colonial movement in Vietnam. His work helped pave the way for Vietnam’s independence from French colonial rule.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Tùng Mậu'), '', 'Intellectual family', 'father and grandfather were killed by the French') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hồ Tùng Mậu'), 'Military') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Tùng Mậu'), 'Politic') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Tùng Mậu'), 'Chief of General Staff') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Tùng Mậu'), 'Revolutionary Leader') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Tùng Mậu'), 'A key leader of the August Revolution') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Tùng Mậu'), 'a prominent figure in the anti-French resistance') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Tùng Mậu'), 'played a significant role in the Vietnamese independence movement') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Tùng Mậu'), 'played a significant role in organizing military operations during the resistance against the French') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Tùng Mậu'), 'Known for his exceptional leadership skills, dedication to national independence, and military organization') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Tùng Mậu'), 'Political statements, revolutionary writings, and speeches for independence') ;

INSERT INTO othernames (HistoricalFigureID, OtherName)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Tùng Mậu'), 'Lương'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Tùng Mậu'), 'Ích'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Tùng Mậu'), 'Phan Tái'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Tùng Mậu'), 'Hồ Quốc Đống'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Tùng Mậu'), 'Hồ Tùng Tôn'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Tùng Mậu'), 'Ninh Võ'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Tùng Mậu'), 'Hà Quị'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Tùng Mậu'), 'Yên Chính'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Tùng Mậu'), 'Lương Gầy'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Tùng Mậu'), 'Lương Tử Anh');

-- Hồ Xuân Hương --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hồ Xuân Hương', 'Female', 'Hồ Xuân Hương', 'Nghe An, Dai Viet', 'Dai Viet', 'modern', '18th-19th', '1772', '1822', 'Hồ Xuân Hương is often celebrated as one of Vietnam’s greatest poets, known for her bold and rebellious voice against the patriarchal norms of her time. Her poems remain powerful symbols of feminist discourse in Vietnamese literature.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Xuân Hương'), 'educated family', 'Confucian values', NULL) ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hồ Xuân Hương'), 'Literature') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Xuân Hương'), 'Poet') ;

insert into othernames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Xuân Hương'), 'Bà chúa thơ Nôm') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Xuân Hương'), 'Highly regarded for her skill in using Nôm poetry to express her opinions on societal issues and women\'s rights') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Xuân Hương'), 'Her work challenged traditional norms and social structures, particularly regarding gender roles and Confucianism') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Xuân Hương'), 'Known for her use of satire and sensual imagery, often addressing topics like love, desire, and the plight of women in a male-dominated society') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Xuân Hương'), 'honored by UNESCO as "world cultural celebrity"') ;

insert into works (HistoricalFigureID, Work)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hồ Xuân Hương'), 'Quảy') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Xuân Hương'), 'Bánh chưng') ,
((select ID from HistoricalFigures where historicalfigures = 'Hồ Xuân Hương'), 'Bánh trôi nước') ;

insert into spouses (HistoricalFigureID, Name, OtherInfor) 
values
((select ID from HistoricalFigures where historicalfigures = 'Hồ Xuân Hương'), 'Nguyễn Bình Kình', 'Tổng Cóc'),
((select ID from HistoricalFigures where historicalfigures = 'Hồ Xuân Hương'), 'Phạm Viết Ngạn', 'scholar'),
((select ID from HistoricalFigures where historicalfigures = 'Hồ Xuân Hương'), 'Tống Như Mai', 'official') ;

-- Hoài Thanh --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hoài Thanh', 'Male', 'Nguyễn Đức Nguyên', 'Quảng Nam', 'Vietnam', 'modern', '20th', '1910', '1982', 'Hoài Thanh is considered one of the most influential literary critics and poets of 20th-century Vietnam. His works on "Thơ Mới" played a crucial role in the evolution of modern Vietnamese poetry, as he emphasized the importance of both literary innovation and cultural heritage.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoài Thanh'), NULL, 'intellectual family', NULL) ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hoài Thanh'), 'Education') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoài Thanh'), 'Literature') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoài Thanh'), 'Literary Critic') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoài Thanh'), 'Poet') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoài Thanh'), 'Educator') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoài Thanh'), 'join the Dong Du movement') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoài Thanh'), 'A key figure in "Thơ mới"') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoài Thanh'), 'A key figure in Vietnamese modern literature') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoài Thanh'), 'working at Voice of Vietnam') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoài Thanh'), 'Influenced the development of modern Vietnamese literature, especially poetry') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoài Thanh'), 'contributed significantly to the establishment of literary criticism as a field') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoài Thanh'), 'Editor-in-Chief of Literature and Arts Weekly') ;

insert into works (HistoricalFigureID, Work)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoài Thanh'), 'Thi nhân Việt Nam') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoài Thanh'), 'Tuyển tập thơ mới') ;

-- Hoàng Cao Khải --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hoàng Cao Khải', 'Male', 'Hoàng Văn Khải', 'Nghe An', 'Vietnam', 'Nguyen Dynasty', '19th century', '1850', '1933', 'Hoàng Cao Khải (1850–1933) was a significant historian, writer, and collaborator with the French during Vietnam''s colonial period. His role as a collaborator has left a controversial legacy despite his contributions to Vietnamese historiography and literature.') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Cao Khải'), 'Politics') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Cao Khải'), 'Literature') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Cao Khải'), 'History') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Cao Khải'), 'collaborator with French') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Cao Khải'), 'Writer') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Cao Khải'), 'Historian') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Cao Khải'), 'Collaborated with the French colonial administration') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Cao Khải'), 'led to a controversial legacy.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Cao Khải'), 'His contributions to historiography were recognized but came at a cost to his reputation.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Cao Khải'), 'his work influenced French policies') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Cao Khải'), 'his historical records remain a source of information, though his collaboration is still debated.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Cao Khải'), 'Worked alongside the French to produce historical records, which was both a significant contribution to Vietnamese history and a contentious association with the colonial regime.') ;

insert into works (HistoricalFigureID, Work)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Cao Khải'), 'Việt Sử Yếu') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Cao Khải'), 'Nam Sử Diễn Âm') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Cao Khải'), 'Việt Nam Nhân Thần Giám') ;

-- Hoàng Đạo Thúy --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hoàng Đạo Thúy', 'Male', 'Hoàng Đạo Thúy', 'Hanoi, Vietnam', 'Vietnam', 'Modern', '20th', '1900', '1994', 'Hoàng Đạo Thúy was a prominent figure in Vietnam''s scouting movement and youth education, leaving a lasting impact on Vietnamese society. He was honored with several prestigious awards and played a significant role in military and political fields.') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đạo Thúy'), 'Education') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đạo Thúy'), 'Military') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đạo Thúy'), 'Politics') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đạo Thúy'), 'Colonel') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đạo Thúy'), 'General of the Vietnam People''s Army') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đạo Thúy'), 'Director of Political Department') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đạo Thúy'), 'Director of the Department of Information and Communications') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đạo Thúy'), 'Founder of the Vietnam Scout Movement') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đạo Thúy'), 'Founded the first Vietnamese Youth Brigade.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đạo Thúy'), 'Played a key role in promoting educational initiatives and youth organizations in Vietnam.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đạo Thúy'), 'Led significant military campaigns during the resistance against French colonialism and American intervention.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đạo Thúy'), 'Advocated for youth representation and democratic values in the Vietnam Communist Party.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đạo Thúy'), NULL, 'Confucian', NULL) ;

-- Hoàng Đình Kinh --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hoàng Đình Kinh', 'Male', 'Hoang Dinh Kinh', 'Lang Son, Vietnam', 'Vietnam', 'Pre-modern', '19th', '1830', '1888', 'Hoàng Đình Kinh was a leader of the Hữu Lũng uprising against French forces, gaining support from locals and military forces. He is remembered for his resilience and bravery during Vietnam\'s struggle against colonialism.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đình Kinh'), NULL, NULL, 'Tày ethnic group') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đình Kinh'), 'Military') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đình Kinh'), 'Leader of Uprising') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đình Kinh'), 'Led resistance against French forces in 1882–1888') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đình Kinh'), 'Led a strong local resistance and was known for guerrilla tactics') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đình Kinh'), 'Leader of the Hữu Lũng Uprising') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đình Kinh'), 'Hero of the anti-French resistance') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đình Kinh'), 'Led uprisings and battles in Lạng Sơn');

insert into othernames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Đình Kinh'), 'Cai Kinh') ;

-- Hoàng Hoa Thám --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hoàng Hoa Thám', 'Male', 'Trương Văn Nghĩa', 'Hung Yen', 'Vietnam', 'Pre-modern', '19th–20th century', '1858', '1913', 'Hoàng Hoa Thám, known as Đề Thám, was a key leader of the Yên Thế Rebellion, one of the longest and most significant resistance movements against French colonial forces in Vietnam. His use of guerrilla tactics and ability to maintain control of his stronghold for nearly 30 years made him a symbol of Vietnamese resilience.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Hoa Thám'), NULL, 'rural farming family', NULL) ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Hoa Thám'), 'Military') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Hoa Thám'), 'Leader of Rebellion') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Hoa Thám'), 'Led the Yên Thế Rebellion') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Hoa Thám'), 'Symbol of resistance against French colonization') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Hoa Thám'), 'Known for guerrilla warfare and tactical ingenuity') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Hoa Thám'), 'The French could not fully suppress his movement despite multiple treaties');

insert into othernames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Hoa Thám'), 'Đề Dương') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Hoa Thám'), 'Hùm thiêng Yên Thế') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Hoa Thám'), 'Đề Thám') ;

insert into spouses (HistoricalFigureID, Name, OtherInfor) 
values
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Hoa Thám'), 'Đặng Thị Nho ', '3rd wife') ;

-- Hoàng Kế Viêm --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hoàng Kế Viêm', 'Male', 'Hoang Ta Viem', 'Quang Binh', 'Vietnam', 'Nguyen Dynasty', '19th', '1820', '1909', 'Hoàng Kế Viêm (1820 - 1909) was a notable Vietnamese Confucian scholar and military leader. He is best known for leading resistance movements against French colonial forces, particularly in the northern regions of Vietnam. His contributions to Confucian education and military tactics greatly influenced the anti-colonial struggle. Despite his scholarly background, he played a key role in organizing and leading uprisings, leaving a lasting impact on both Vietnamese intellectual and military history.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Kế Viêm'), NULL, 'Governor of Khanh Hoa province', NULL) ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Kế Viêm'), 'Military') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Kế Viêm'), 'Politics') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Kế Viêm'), 'Northern military restraint') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Kế Viêm'), 'General') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Kế Viêm'), 'When the French invaded Dai Nam, he sided with the war party.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Kế Viêm'), 'killed French Navy Captain Francis Garnier') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Kế Viêm'), 'Later he gradually turned to the peace party.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Kế Viêm'), 'He served King Dong Khanh, a pro-French king.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Kế Viêm'), 'was sent to both suppress and persuade the Can Vuong leaders to surrender, but failed.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Kế Viêm'), 'Well-respected for his intellectual and philosophical contributions.');

insert into spouses (HistoricalFigureID, Name, OtherInfor) 
values
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Kế Viêm'), 'Nguyen Phuc Quang Tinh', 'princess of Nguyen dynasty') ;

insert into othernames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Kế Viêm'), 'Nhật Trường') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Kế Viêm'), 'Tùng La') ;

-- Hoàng Minh Giám --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hoàng Minh Giám', 'Male', 'Hoang Minh Giam', 'Hanoi', 'Vietnamese', 'modern', '20th Century', '1904', '1995', 'Hoàng Minh Giám (1904–1995) was a prominent Vietnamese diplomat, politician, and scholar who played a key role in Vietnam\'s early post-independence history. Born in Hà Nội, he became one of the most influential figures in the government after the country gained independence from French colonial rule. As a diplomat, he was involved in negotiating significant treaties, including the French-Vietnamese accords of 1946. In addition to his diplomatic work, he contributed to educational reforms in post-war Vietnam, promoting the growth and modernization of the country’s academic institutions. His legacy includes both his efforts in shaping Vietnam\'s foreign policy and his contributions to the educational landscape.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Minh Giám'), NULL, 'scholars and officials', 'His father was one of the founders of the Dong Kinh Nghia Thuc movement.') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Minh Giám'), 'Politics') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Minh Giám'), 'Education') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Minh Giám'), 'Diplomacy') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Minh Giám'), 'Outstanding Teacher of Vietnam') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Minh Giám'), 'Professor') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Minh Giám'), 'politician') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Minh Giám'), 'diplomat') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Minh Giám'), 'Chairman of the Foreign Affairs Committee') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Minh Giám'), 'Minister of Foreign Affairs') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Minh Giám'), 'Key figure in post-independence Vietnam') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Minh Giám'), 'the negotiations for the French-Vietnamese accords in 1946') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Minh Giám'), 'Held multiple significant government roles, especially in diplomacy') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Minh Giám'), 'Rector of People\'s University') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Minh Giám'), 'Contributed to educational reforms, promoting a modernized and progressive education system in post-independence Vietnam.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Minh Giám'), 'Established institutions and policies to ensure educational growth in Vietnam.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Minh Giám'), 'Supported academic and intellectual development of the country.') ;

-- Hoàng Ngọc Phách --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hoàng Ngọc Phách', 'Male', 'Hoang Ngoc Phach', 'Bac Ninh, Vietnam', 'Vietnam', 'modern', '20th century', '1896', '1973', 'Hoàng Ngọc Phách is considered a pioneer in modern Vietnamese literature, particularly known for his novel Tố Tâm which is widely regarded as the first modern Vietnamese novel. His works reflect social issues, love, and human struggle under colonial rule. An advocate for national language and education reforms, he played a crucial role in shaping modern Vietnamese education in the early 20th century. Hoàng Ngọc Phách was also deeply involved in the cultural and intellectual movements of his time.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), NULL, NULL, 'well-respected by local') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'Literature') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'Education') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'Theater') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'Social Activism') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'Writer') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'Teacher') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'Director/Organizer') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'Activist') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'Leadership in Hội Truyền bá quốc ngữ in Bắc Ninh') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'Leadership in Hội Khuyến học') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'Raised funds for charitable causes through theatrical productions and performances.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'A major contributor to the modern novel form in Vietnamese literature.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'Organized theater productions in Hải Phòng; his plays promoted charity') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'Focused on social and humanist themes, such as love, society, and progress.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'Influenced generations of students with a progressive view on education.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'Educated in Hanoi Pedagogical School') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'taught at several institutions including Nam Định, Hải Phòng, Bắc Ninh') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'Mentor to young artists like Thế Lữ in the field of Vietnamese theater.') ;

insert into works (HistoricalFigureID, Work)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'Tố Tâm') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'Lọ vàng') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'Bạn và vợ') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Ngọc Phách'), 'Ông Tây An Nam') ;

-- Hoàng Trọng Mậu --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hoàng Trọng Mậu', 'Male', 'Nguyen Duc Cong', 'Nghe An', 'Vietnam', 'modern', '19th-20th', '1874', '1916', 'Hoàng Trọng Mậu, whose real name was Nguyễn Đức Công, was a Vietnamese revolutionary, poet, and military leader in the late 19th and early 20th centuries. He actively engaged in the Đông Du Movement, studying in Japan and later moving to China, where he contributed to the struggle for Vietnam’s independence. In 1915, he was captured and executed by the French after an unsuccessful military operation. His legacy includes his writings and his contributions to military strategy during the period of anti-colonial resistance.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Trọng Mậu'), NULL, 'Scholar', 'father actively supported the Cần Vương movement') ;

insert into othernames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Trọng Mậu'), 'Báu Thụ'),
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Trọng Mậu'), 'Trần Báu Thụ') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Trọng Mậu'), 'Military') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Trọng Mậu'), 'Education') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Trọng Mậu'), 'Member of Việt Nam Quang phục hội') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Trọng Mậu'), 'Scholar') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Trọng Mậu'), 'Participated in Đông Du Movement') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Trọng Mậu'), 'ontributed to military strategy against the French') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Trọng Mậu'), 'Influenced by Phan Bội Châu and the Đông Du Movement') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Trọng Mậu'), 'Strong revolutionary spirit, known for his death in 1915') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Trọng Mậu'), 'Studied in Japan and China') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Trọng Mậu'), 'Played a key role in the intellectual and cultural influence on the revolutionaries of his time') ;

insert into works (HistoricalFigureID, Work)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Trọng Mậu'), '"Death" couplet') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Trọng Mậu'), 'Wrote various poems and military documents') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Trọng Mậu'), 'Imprisoned and executed by French forces in 1915') ;

-- Hoàng Văn Thái --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hoàng Văn Thái', 'Male', 'Hoang Van Xiem', 'Son Tay, Vietnam', 'Vietnamese', 'modern', '20th Century', '1915', '1986', 'Hoàng Văn Thái (1915–1986), born Hoàng Văn Xiêm, was a prominent Vietnamese general and a key figure in the formation and development of the People\'s Army of Vietnam. Serving in various military and political roles, he notably commanded critical campaigns during the First Indochina War and the Vietnam War. As the first Chief of General Staff (1945–1953), Thái led the Vietnamese military in pivotal battles such as the famous Battle of Điện Biên Phủ. He also played an essential role in post-war military planning, contributing to the modern structure and strategy of Vietnam’s armed forces. His contributions to both military theory and the practical defense of the nation have cemented his legacy as a national hero.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thái'), 'Poor', 'Farmer', NULL) ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thái'), 'Military') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thái'), 'Chief of General Staff') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thái'), 'Deputy Minister of Defense') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thái'), 'Commanded pivotal battles such as the Battle of Điện Biên Phủ') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thái'), 'is a member of the Vietnam Propaganda Liberation Army') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thái'), 'was sent to study at Liuzhou Military School, China') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thái'), 'Author of the system of symbols for organizing units of the Vietnam People\'s Army according to alphabetical symbols') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thái'), 'commanded a Bac Son guerrilla squad.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thái'), 'The first Chief of the General Staff of the Vietnam People\'s Army') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thái'), 'cIn the battle of Na Ngan fort, he was the one who planted the flag after the victory.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thái'), 'At the founding ceremony of the Vietnam Propaganda Liberation Army, he was the flag bearer.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thái'), 'Contributed to the design and organization of military units') ;

insert into works (HistoricalFigureID, Work)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thái'), 'Military analysis, historical works') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thái'), 'Contributed to post-war military planning and defense strategy') ;

-- Hoàng Văn Thụ --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hoàng Văn Thụ', 'Male', 'Hoang Van Thu', 'Lang Son', 'Vietnam', '1930–1944', '20th century', '1906', '1944', 'Hoàng Văn Thụ (1906–1944) was a key Vietnamese revolutionary leader who played a crucial role in the resistance against French colonial rule. A key figure in the early formation of the Việt Minh, he worked alongside others to rally resistance movements in Northern Vietnam. He was captured by the French in 1943 and eventually executed in 1944 after enduring severe torture in the Hỏa Lò prison. His commitment to independence and his role in the early revolutionary struggles made him a revered figure in Vietnamese history, symbolizing sacrifice and resilience for national liberation.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thụ'), 'Poor', NULL, 'Deeply involved in the independence movement') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thụ'), 'Military') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thụ'), 'Politics') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thụ'), 'General Secretary of Vietnam League for Independence (Việt Minh)') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thụ'), 'Led resistance efforts in Northern Vietnam,') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thụ'), 'in the fight against French colonialism') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thụ'), 'Arrested by French, played a major role in the early revolution') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thụ'), 'establishing the Việt Minh') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thụ'), 'Considered a martyr in the Vietnamese independence movement') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thụ'), 'Played key role in unifying regional forces') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Văn Thụ'), 'remained unyielding in his belief for independence') ;

-- Đề Kiều --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Đề Kiều', 'Male', 'Hoàng Văn Thúy', 'Unknown', 'Vietnamese', 'Nguyen Dynasty', '19th century', 'Unknown', 'After 1893', 'Hoàng Đề Kiều was a key leader of the Cần Vương anti-colonial resistance. Despite eventual surrender to the French, he remains an emblematic figure of resistance, famous for his guerrilla tactics and leadership. His actions contributed significantly to the Vietnamese struggle for independence.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Đề Kiều'), NULL, 'Royal family', 'Duke');

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Đề Kiều'), 'Military') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Đề Kiều'), 'Leader of anti-French resistance') ,
((select ID from HistoricalFigures where historicalfigures = 'Đề Kiều'), 'Led guerrilla forces against French during the Cần Vương movement');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Đề Kiều'), 'Significant figure in the resistance against French colonialism in Northern Vietnam') ,
((select ID from HistoricalFigures where historicalfigures = 'Đề Kiều'), 'one of the early generals to respond to the Can Vuong movement'),
((select ID from HistoricalFigures where historicalfigures = 'Đề Kiều'), 'joined the uprising at the age of 27'),
((select ID from HistoricalFigures where historicalfigures = 'Đề Kiều'), 'contributed to the great victories at Thuong Bang La in Dong Bo, Cao Pha Pass, Gioc Do, Ba Khe'),
((select ID from HistoricalFigures where historicalfigures = 'Đề Kiều'), 'The French had to use despicable tricks to force him to surrender.'),
((select ID from HistoricalFigures where historicalfigures = 'Đề Kiều'), 'The French poisoned him to death.'),
((select ID from HistoricalFigures where historicalfigures = 'Đề Kiều'), 'was awarded the title "Brave General" by Emperor Thanh Thai');

-- Hoàng Xuân Hãn --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hoàng Xuân Hãn', 'Male', 'Hoàng Xuân Hãn', 'Ha Tinh', 'Vietnamese', 'Modern', '20th century', '1908', '1998', 'Hoàng Xuân Hãn was a highly respected scholar and educator, known for his contributions to Vietnamese language and literature. He played an essential role in the preservation of classical Vietnamese scripts and was a pioneer in the study of Nôm (Vietnamese classical script). His work laid the foundation for the modern understanding of Vietnam\'s cultural and literary heritage.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Xuân Hãn'), NULL, 'Confucian family', 'His father was an intellectual');

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Xuân Hãn'), 'education') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Xuân Hãn'), 'science');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Xuân Hãn'), 'professor') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Xuân Hãn'), 'mathematician') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Xuân Hãn'), 'engineer') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Xuân Hãn'), 'scholar');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Xuân Hãn'), 'contributed to the development of Vietnamese education and cultural studies') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Xuân Hãn'), 'student of Chu Văn An Highschool') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Xuân Hãn'), 'As a child, he studied Chinese and Vietnamese at home.') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Xuân Hãn'), 'valedictorian of the baccalaureate exam and received a scholarship from the Indochina government to study in France') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Xuân Hãn'), 'posthumously awarded the Ho Chi Minh Prize for social sciences and humanities') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Xuân Hãn'), 'Participated in Tran Trong Kim\'s cabinet as Minister of Education and Fine Arts') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Xuân Hãn'), 'had a significant impact on Vietnamese education and literature') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Xuân Hãn'), 'expert in classical Vietnamese and Chinese literature');

insert into works (HistoricalFigureID, Work)
values
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Xuân Hãn'), 'Thi vnaw Việt Nam') ,
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Xuân Hãn'), 'Danh từ khoa học');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hoàng Xuân Hãn'), 'he was deeply involved in the preservation and study of classical Vietnamese scripts and literature');

-- Hứa Tam Tỉnh --
-- Hứa Tam Tỉnh --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hứa Tam Tỉnh', 'Male', 'Hứa Tam Tỉnh', 'Bac Ninh', 'Vietnamese', 'Lê - Mạc', '16th century', '1481', NULL, 'Hứa Tam Tỉnh was a Confucian scholar and politician who served during the Lê and Mạc dynasties. He became a bảng nhãn under Lê Uy Mục and later served under the Mạc dynasty. He is remembered for his diplomatic missions to the Ming dynasty and his title as Đôn Giáo bá.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hứa Tam Tỉnh'), NULL, 'Confucian family', 'Scholar and official');

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hứa Tam Tỉnh'), 'politics') ,
((select ID from HistoricalFigures where historicalfigures = 'Hứa Tam Tỉnh'), 'education') ,
((select ID from HistoricalFigures where historicalfigures = 'Hứa Tam Tỉnh'), 'diplomacy');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hứa Tam Tỉnh'), 'first-rank doctorate second laureate') ,
((select ID from HistoricalFigures where historicalfigures = 'Hứa Tam Tỉnh'), 'Minister of Personnel') ,
((select ID from HistoricalFigures where historicalfigures = 'Hứa Tam Tỉnh'), 'Đôn Giáo bá') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hứa Tam Tỉnh'), 'passed the imperial exam as bảng nhãn in 1508 under Lê Uy Mục') ,
((select ID from HistoricalFigures where historicalfigures = 'Hứa Tam Tỉnh'), 'was criticized by the Empress Dowager for being ugly') ,
((select ID from HistoricalFigures where historicalfigures = 'Hứa Tam Tỉnh'), 'didnt get the first doctoral candidate because of the ugliness') ,
((select ID from HistoricalFigures where historicalfigures = 'Hứa Tam Tỉnh'), 'served as a diplomat to the Ming dynasty') ,
((select ID from HistoricalFigures where historicalfigures = 'Hứa Tam Tỉnh'), 'held high-ranking positions in both Lê and Mạc dynasties');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hứa Tam Tỉnh'), 'he was remembered for his diplomatic missions and as a significant political figure during the transition from the Lê to Mạc dynasties.');

insert into othernames (HistoricalFigureID, OtherName)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hứa Tam Tỉnh'), 'Trạng Ngọt');

insert into quotes (HistoricalFigureID, Quote)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hứa Tam Tỉnh'), 'Trạng Me đè Trạng Ngọt');

-- Hùng Vương --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Hùng Vương', 'Male', 'Hùng Vương', 'Phu Tho', 'Van Lang', 'Hung King Dynasty', 'Prehistoric', NULL, NULL, 'Hùng Vương refers to a series of legendary kings who ruled over the early state of Văn Lang, which is considered the first Vietnamese nation. They are venerated as national heroes and ancestors, especially in Vietnamese folklore.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hùng Vương'), NULL, 'legendary monarchs', 'Descendants of Lạc Long Quân and Âu Cơ');

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Hùng Vương'), 'Monarchy') ,
((select ID from HistoricalFigures where historicalfigures = 'Hùng Vương'), 'Leadership');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Hùng Vương'), 'Kings');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hùng Vương'), 'Established the first Vietnamese dynasty, known as the Hồng Bàng dynasty') ,
((select ID from HistoricalFigures where historicalfigures = 'Hùng Vương'), 'Revered as the founding ancestors of Vietnam') ,
((select ID from HistoricalFigures where historicalfigures = 'Hùng Vương'), 'Symbol of Vietnamese unity and sovereignty') ,
((select ID from HistoricalFigures where historicalfigures = 'Hùng Vương'), '18 generations') ,
((select ID from HistoricalFigures where historicalfigures = 'Hùng Vương'), 'associated with many legends') ,
((select ID from HistoricalFigures where historicalfigures = 'Hùng Vương'), 'Fight against the Yin invaders') ,
((select ID from HistoricalFigures where historicalfigures = 'Hùng Vương'), 'Central figure in Vietnamese folklore and origin myth');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hùng Vương'), 'Widely celebrated on the national holiday known as Giỗ Tổ Hùng Vương (Hùng Kings\' Death Anniversary)');

insert into works (HistoricalFigureID, Work) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Hùng Vương'), 'Sơn Tinh - Thủy Tinh') ,
((select ID from HistoricalFigures where historicalfigures = 'Hùng Vương'), 'Bánh chưng bánh giày') ,
((select ID from HistoricalFigures where historicalfigures = 'Hùng Vương'), 'Chử Đồng Tử') ,
((select ID from HistoricalFigures where historicalfigures = 'Hùng Vương'), 'Thánh Gióng') ,
((select ID from HistoricalFigures where historicalfigures = 'Hùng Vương'), 'Dong Son bronze drum') ,
((select ID from HistoricalFigures where historicalfigures = 'Hùng Vương'), 'Mai An Tiêm');

-- Huy Cận --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Huy Cận', 'Male', 'Cù Huy Cận', 'Ân Thổ, Hà Tĩnh, Vietnam', 'Vietnamese', 'modern', '20th century', '1923', '2005', 'Huy Cận was a prominent Vietnamese poet, recognized for his profound poetry that deeply reflects the experience of war and the national identity of the Vietnamese people. His works became an important part of Vietnamese literature in the 20th century.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), NULL, 'Confucian family', 'Father was a scholar');

insert into othernames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), 'Huy Cận');

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), 'Politics'),
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), 'Literature');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), 'Minister of Agriculture'),
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), 'Member of the Government\'s Special Inspectorate'),
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), 'Minister of Culture and Information'),
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), 'Chairman of the Central Committee of the Vietnam Union of Literature and Arts Associations'),
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), 'Poet');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), 'Known for his deep and philosophical poetry, especially in the resistance period') ,
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), 'A key figure in Vietnamese literature, particularly during the resistance wars') ,
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), 'one of the leading names of the New Poetry movement') ,
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), 'Recognized for his nationalistic and emotional poetry') ,
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), 'Contributions to the Vietnamese literary canon');

insert into works (HistoricalFigureID, Work) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), 'Đất nở hoa ') ,
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), 'Đoàn Thuyền Đánh Cá') ,
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), 'Trời mỗi ngàng lại sáng') ,
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), 'Chiến trường gần đến chiến trường xa') ,
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), 'Lửa thiêng');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), 'his poems are known for their humanistic values and often reflect on the suffering and struggle of the Vietnamese people during wartime');

insert into spouses (HistoricalFigureID, Name, OtherInfor) 
values
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), 'Ngô Thị Xuân', 'younger sister of Xuan Dieu') ,
((select ID from HistoricalFigures where historicalfigures = 'Huy Cận'), 'Trần Lệ Thu', 'russian teacher') ;

-- Huyền Trân --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Huyền Trân', 'Female', 'Huyền Trân', 'Annam (Central Vietnam)', 'Dai Viet', 'Tran Dynasty', '14th century', '1280', NULL, 'Huyền Trân was the daughter of King Trần Nhân Tông of the Trần dynasty. She became a princess and was married to the King of Champa as a political move, symbolizing a peaceful and strategic resolution to conflicts between Đại Việt and Champa during the 14th century.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Huyền Trân'), NULL, 'Royal family', 'Tran dynasty');

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Huyền Trân'), 'Politics'),
((select ID from HistoricalFigures where historicalfigures = 'Huyền Trân'), 'Diplomacy');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Huyền Trân'), 'Princess'),
((select ID from HistoricalFigures where historicalfigures = 'Huyền Trân'), 'Empress of Champa');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Huyền Trân'), 'Married King Jaya Sinhavarman III of Champa, contributing to peace between Đại Việt and Champa') ,
((select ID from HistoricalFigures where historicalfigures = 'Huyền Trân'), 'have a political marriage') ,
((select ID from HistoricalFigures where historicalfigures = 'Huyền Trân'), 'Expanding the territory of Dai Viet') ,
((select ID from HistoricalFigures where historicalfigures = 'Huyền Trân'), 'her dowries are 2 districts Ô and Lý') ,
((select ID from HistoricalFigures where historicalfigures = 'Huyền Trân'), 'After her husband died, she returned to her hometown.') ,
((select ID from HistoricalFigures where historicalfigures = 'Huyền Trân'), 'her journey to hometown last 1 year') ,
((select ID from HistoricalFigures where historicalfigures = 'Huyền Trân'), 'ordained at Trau Son mountain') ,
((select ID from HistoricalFigures where historicalfigures = 'Huyền Trân'), 'An important figure in the peaceful diplomatic relations between Đại Việt and Champa') ,
((select ID from HistoricalFigures where historicalfigures = 'Huyền Trân'), 'Symbol of diplomacy and unity between two kingdoms');

insert into othernames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Huyền Trân'), 'Hương Tràng'),
((select ID from HistoricalFigures where historicalfigures = 'Huyền Trân'), 'Thần Mẫu');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Huyền Trân'), 'Her marriage helped cement the diplomatic ties between Đại Việt and Champa during the 14th century.');

insert into spouses (HistoricalFigureID, Name, OtherInfor) 
values
((select ID from HistoricalFigures where historicalfigures = 'Huyền Trân'), 'Chế Mân', 'King of Champa') ;

-- Khải Định --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Khải Định', 'Male', 'Nguyễn Phúc Bửu Đảo', 'Huế, Vietnam', 'Dai Nam', 'Nguyen Dynasty', '19th–20th century', '1885', '1925', 'Khải Định (1885–1925), the 12th emperor of the Nguyễn Dynasty, is known for his collaboration with the French colonial regime. His reign is controversial, with efforts to modernize the court and embrace Western influence, most notably seen in his fusion of Vietnamese and French architecture in the construction of his tomb. Despite these efforts, his reign marked the final submission of Vietnam to French colonial rule.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Khải Định'), NULL, 'royal family', 'Nguyen dynasty');

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Khải Định'), 'Politics');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Khải Định'), 'Emperor');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Khải Định'), '12th Emperor of Nguyễn Dynasty') ,
((select ID from HistoricalFigures where historicalfigures = 'Khải Định'), 'Collaborated with French colonialists') ,
((select ID from HistoricalFigures where historicalfigures = 'Khải Định'), 'modernized the court, and embraced Western influences') ,
((select ID from HistoricalFigures where historicalfigures = 'Khải Định'), 'Phan Chau Trinh sent a long letter blaming him for 7 crimes.') ,
((select ID from HistoricalFigures where historicalfigures = 'Khải Định'), 'fond of makeup, flashy clothes, not following traditional royal dress') ,
((select ID from HistoricalFigures where historicalfigures = 'Khải Định'), 'n France, in the newspaper The Miserable, Nguyen Ai Quoc had a series of articles mocking him.') ,
((select ID from HistoricalFigures where historicalfigures = 'Khải Định'), 'Known for building the Imperial Tomb of Khải Định, a fusion of Vietnamese and French architectural styles') ,
((select ID from HistoricalFigures where historicalfigures = 'Khải Định'), 'The last Vietnamese emperor to fully submit to French authority');

insert into works (HistoricalFigureID, Work) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Khải Định'), 'Imperial Tomb of Khải Định');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Khải Định'), 'His tomb is a symbol of the blending of Eastern and Western influences during his reign.');

insert into othernames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Khải Định'), 'Nguyễn Phúc Tuấn'),
((select ID from HistoricalFigures where historicalfigures = 'Khải Định'), 'Phụng Hóa công'),
((select ID from HistoricalFigures where historicalfigures = 'Khải Định'), 'Hoằng Tông');

-- Khúc Thừa Dụ --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Khúc Thừa Dụ', 'Male', 'Khúc Thừa Dụ', 'Hai Duong', 'An Nam', 'The Northern colonial period of Vietnam', '10th century', '830', '907', 'Khúc Thừa Dụ was a key figure in the early resistance against Chinese occupation of Vietnam. He led a rebellion against the Tang Dynasty, becoming the first Vietnamese leader to declare independence, laying the foundation for a brief but significant period of autonomy for Vietnam.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Khúc Thừa Dụ'), 'noble family', NULL, NULL);

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Khúc Thừa Dụ'), 'Military');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Khúc Thừa Dụ'), 'Tĩnh độ sứ'),
((select ID from HistoricalFigures where historicalfigures = 'Khúc Thừa Dụ'), 'Porcelain');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Khúc Thừa Dụ'), 'Successfully led the rebellion against Chinese rule, establishing autonomy for Vietnam after the collapse of the Tang Dynasty') ,
((select ID from HistoricalFigures where historicalfigures = 'Khúc Thừa Dụ'), 'First Vietnamese leader to declare independence from Chinese domination'),
((select ID from HistoricalFigures where historicalfigures = 'Khúc Thừa Dụ'), 'Founder of the Khúc Dynasty, an early symbol of national resistance');


insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Khúc Thừa Dụ'), 'His rebellion laid the foundation for Vietnamese independence and is seen as the first significant uprising against Chinese domination after the fall of the Tang Dynasty.');

insert into othernames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Khúc Thừa Dụ'), 'Khúc Tiên chúa'),
((select ID from HistoricalFigures where historicalfigures = 'Khúc Thừa Dụ'), 'Khúc Tiên Chủ');

-- Khương Công Phụ --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Khương Công Phụ', 'Male', 'Khương Công Phụ', 'Unknown', 'Vietnamese', 'The Northern colonial period of Vietnam', '3rd century', 'Unknown', 'Unknown', 'Khương Công Phụ (3rd century) was a renowned Vietnamese scholar, historian, and writer, known for his contributions to historical writings. His works played an important role in shaping the understanding of Vietnamese history and early culture. Despite limited surviving details about his life, his influence remains significant in the study of Vietnamese historical traditions, marking him as a key figure in early scholarly thought.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Khương Công Phụ'), 'Unknown', 'None', NULL);

insert into fields (HistoricalFigureID, Field)
values 
((select ID from HistoricalFigures where historicalfigures = 'Khương Công Phụ'), 'Politics'),
((select ID from HistoricalFigures where historicalfigures = 'Khương Công Phụ'), 'Education');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Khương Công Phụ'), 'prime minister'),
((select ID from HistoricalFigures where historicalfigures = 'Khương Công Phụ'), 'first doctoral candidate'),
((select ID from HistoricalFigures where historicalfigures = 'Khương Công Phụ'), 'Scholar');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Khương Công Phụ'), 'Known for his historical writings and contributions to Vietnamese culture during the 3rd century') ,
((select ID from HistoricalFigures where historicalfigures = 'Khương Công Phụ'), 'first doctoral candidate of Tang Dynasty') ,
((select ID from HistoricalFigures where historicalfigures = 'Khương Công Phụ'), 'had the merit of advising the Tang Emperor') ,
((select ID from HistoricalFigures where historicalfigures = 'Khương Công Phụ'), 'commemorated in both China and Vietnam') ,
((select ID from HistoricalFigures where historicalfigures = 'Khương Công Phụ'), 'His writings had a significant influence on the historical understanding of Vietnam\'s early periods'),
((select ID from HistoricalFigures where historicalfigures = 'Khương Công Phụ'), 'Credited for compiling and writing about important Vietnamese historical events');

-- Khương Tăng Hội --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Khương Tăng Hội', 'Male', 'Khương Tăng Hội', 'Unknown', 'Giao Chi', 'The Northern colonial period of Vietnam', '3rd century', 'Unknown', 'Unknown', 'Khương Tăng Hội (3rd century) was a pioneering Buddhist monk and scholar in Vietnam. He played a significant role in introducing Buddhism to Vietnam, making it a key religious and cultural influence in the region. As one of the first Buddhist missionaries in Vietnam, he also contributed to the spread of Buddhist teachings and translated important Buddhist texts. His works helped shape the religious and philosophical landscape of Vietnam, laying the foundation for Buddhism to become a major force in the country’s history.');


insert into fields (HistoricalFigureID, Field)
values 
((select ID from HistoricalFigures where historicalfigures = 'Khương Tăng Hội'), 'Religious');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Khương Tăng Hội'), 'Buddhist Monk');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Khương Tăng Hội'), 'Introduced Buddhism to Vietnam and translated Buddhist texts') ,
((select ID from HistoricalFigures where historicalfigures = 'Khương Tăng Hội'), 'He was the first to establish Buddhism as a major religious influence in Vietnam, making significant contributions to Vietnamese culture and religious history') ,
((select ID from HistoricalFigures where historicalfigures = 'Khương Tăng Hội'), 'Known for his role in promoting Buddhism and spreading religious knowledge through translation');

insert into works (HistoricalFigureID, Work) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Khương Tăng Hội'), 'Tân diệu luận (Text on Buddhist philosophy)');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Khương Tăng Hội'), 'considered the first prominent Buddhist scholar and missionary in Vietnam who made Buddhism accessible to Vietnamese society. His teachings and translations had a profound impact on the spread of Buddhism in Vietnam.');

-- Kiến Phúc --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Kiến Phúc', 'Male', 'Nguyễn Phúc Ưng Đăng', 'Huế, Vietnam', 'Vietnamese', 'Nguyen Dynasty', '19th century', '1869', '1884', 'Kiến Phúc (1869–1884) was the seventh emperor of the Nguyễn dynasty, ruling for a brief period from 1883 until his death in 1884. His reign was marked by political instability and external pressure, especially from French colonial forces. Despite his short time on the throne, Kiến Phúc\'s reign played a key role in the events that led to the eventual downfall of the Nguyễn dynasty. His death in 1884 highlighted the vulnerability of Vietnam during the colonial period, as internal strife and external invasions weakened the monarchy and the country\'s sovereignty.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Kiến Phúc'), NULL, 'Royal family', 'Nguyen Dynasty');

insert into fields (HistoricalFigureID, Field)
values 
((select ID from HistoricalFigures where historicalfigures = 'Kiến Phúc'), 'Politics');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Kiến Phúc'), 'Emperor');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Kiến Phúc'), 'His reign was marked by instability and his quick death led to the downfall of the Nguyễn dynasty\'s final efforts to regain control over Vietnam') ,
((select ID from HistoricalFigures where historicalfigures = 'Kiến Phúc'), 'only reigned for 8 months') ,
((select ID from HistoricalFigures where historicalfigures = 'Kiến Phúc'), 'the most ill-fated emperor of the Nguyen Dynasty') ,
((select ID from HistoricalFigures where historicalfigures = 'Kiến Phúc'), 'when he died he was only 15 years old') ,
((select ID from HistoricalFigures where historicalfigures = 'Kiến Phúc'), 'the blue-eyed boy of his foster father') ,
((select ID from HistoricalFigures where historicalfigures = 'Kiến Phúc'), 'forced to the throne') ,
((select ID from HistoricalFigures where historicalfigures = 'Kiến Phúc'), 'It is rumored that he was poisoned after discovering the extramarital affair between his adoptive mother and the mandarin.') ,
((select ID from HistoricalFigures where historicalfigures = 'Kiến Phúc'), 'His reign was brief and often characterized by the turmoil of internal rebellion and external French invasion');

insert into works (HistoricalFigureID, Work) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Kiến Phúc'), 'None');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Kiến Phúc'), 'The most short-lived king of the Nguyen Dynasty');

insert into othernames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Kiến Phúc'), 'Nguyễn Giản Tông'),
((select ID from HistoricalFigures where historicalfigures = 'Kiến Phúc'), 'Nghị Hoàng Đế'),
((select ID from HistoricalFigures where historicalfigures = 'Kiến Phúc'), 'Nguyễn Phúc Hạo');

-- Kiều Công Tiễn --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Kiều Công Tiễn', 'Male', 'Kiều Công Tiễn', 'Phong Châu, Phú Thọ, Vietnam', 'Vietnamese', 'The Northern colonial period of Vietnam', '10th century', '870', '938', 'Kiều Công Tiễn (870–938) was a Vietnamese military leader who seized power from Dương Đình Nghệ, becoming Tiết độ sứ of Tĩnh Hải quân. He played a crucial role in the region\'s politics before being defeated by Ngô Quyền at the Battle of Bạch Đằng, ending over a millennium of Chinese dominance in Vietnam.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Kiều Công Tiễn'), NULL, 'Chieftain', NULL);

insert into fields (HistoricalFigureID, Field)
values 
((select ID from HistoricalFigures where historicalfigures = 'Kiều Công Tiễn'), 'Military');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Kiều Công Tiễn'), 'Commander-in-Chief'),
((select ID from HistoricalFigures where historicalfigures = 'Kiều Công Tiễn'), 'Tiết độ sứ');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Kiều Công Tiễn'), 'Defeated by Ngô Quyền in the Battle of Bạch Đằng (938), leading to the fall of his rule.') ,
((select ID from HistoricalFigures where historicalfigures = 'Kiều Công Tiễn'), 'His betrayal of Dương Đình Nghệ led to his rise to power') ,
((select ID from HistoricalFigures where historicalfigures = 'Kiều Công Tiễn'), 'once followed Duong Dinh Nghe to march to the North to drive the Southern Han army back to their country.') ,
((select ID from HistoricalFigures where historicalfigures = 'Kiều Công Tiễn'), 'Known for his short-lived but crucial role in Vietnam\'s independence.');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Kiều Công Tiễn'), 'Kiều Công Tiễn was a key figure during the final years of Chinese dominance over Vietnam. After betraying Dương Đình Nghệ, he became the leader of the Tĩnh Hải quân but was eventually overthrown by Ngô Quyền at the Battle of Bạch Đằng, ending the Chinese influence in Vietnam.');

-- Kim Đồng --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Kim Đồng', 'Male', 'Nông Văn Dền', 'Nà Mạ, Trường Hà, Cao Bằng', 'Vietnamese', 'Modern', '20th century', '1929', '1943', 'Kim Đồng was a brave young revolutionary who became a martyr at just 14, remembered for his courage and sacrifice in the Viet Minh resistance against French colonial rule.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Kim Đồng'), 'Peasant background', 'None', 'Tày ethnic');

insert into fields (HistoricalFigureID, Field)
values 
((select ID from HistoricalFigures where historicalfigures = 'Kim Đồng'), 'Military');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Kim Đồng'), 'Messenger');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Kim Đồng'), 'Delivered messages for Viet Minh') ,
((select ID from HistoricalFigures where historicalfigures = 'Kim Đồng'), 'martyred at age 14.') ,
((select ID from HistoricalFigures where historicalfigures = 'Kim Đồng'), 'Symbol of youthful heroism.') ,
((select ID from HistoricalFigures where historicalfigures = 'Kim Đồng'), 'sacrificed right on the bank of Lenin stream in Cao Bang') ,
((select ID from HistoricalFigures where historicalfigures = 'Kim Đồng'), 'Played key role in communications for Viet Minh.');


insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Kim Đồng'), 'Honored as Hero of the People’s Armed Forces.');

-- Kim Lân --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Kim Lân', 'Male', 'Nguyễn Văn Tài', 'Bac Ninh', 'Vietnam', 'Modern', '20th century', '1920', '2007', 'Kim Lân was a celebrated Vietnamese author, recognized for his poignant stories about the lives of rural Vietnamese people, particularly during tough periods like wartime. He was also known for his acting.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Kim Lân'), 'Poor family', 'painter', NULL);

insert into fields (HistoricalFigureID, Field)
values 
((select ID from HistoricalFigures where historicalfigures = 'Kim Lân'), 'Art'),
((select ID from HistoricalFigures where historicalfigures = 'Kim Lân'), 'Literature');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Kim Lân'), 'Writer'),
((select ID from HistoricalFigures where historicalfigures = 'Kim Lân'), 'Actor');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Kim Lân'), 'known for his role as Lao Hac in the film Vu Dai Village of the Past') ,
((select ID from HistoricalFigures where historicalfigures = 'Kim Lân'), 'only finished primary school') ,
((select ID from HistoricalFigures where historicalfigures = 'Kim Lân'), 'His works reflect the hardship and beauty of rural Vietnam, especially during the French resistance period.') ,
((select ID from HistoricalFigures where historicalfigures = 'Kim Lân'), 'Known for his deep understanding of rural life and human nature.');

insert into works (HistoricalFigureID, Work) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Kim Lân'), 'Vợ nhặt'),
((select ID from HistoricalFigures where historicalfigures = 'Kim Lân'), 'Làng'),
((select ID from HistoricalFigures where historicalfigures = 'Kim Lân'), 'Con chó xấu xí');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Kim Lân'), 'Won the State Prize in Literature (2001).');

-- Kinh Dương Vương --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Kinh Dương Vương', 'Male', 'Lộc Tục', NULL, 'Mythical', 'Hồng Bàng era', NULL, NULL, NULL, 'Kinh Dương Vương is a legendary figure in Vietnamese mythology, known as the first king of Vietnam and the ancestor of the Hồng Bàng dynasty. He is the father of Lạc Long Quân, making him the progenitor of Vietnamese civilization in folklore.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Kinh Dương Vương'), NULL, 'descendant of King Shennong', 'son of De Minh');

insert into fields (HistoricalFigureID, Field)
values 
((select ID from HistoricalFigures where historicalfigures = 'Kinh Dương Vương'), 'Mythology');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Kinh Dương Vương'), 'King');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Kinh Dương Vương'), 'Established the Hồng Bàng dynasty'),
((select ID from HistoricalFigures where historicalfigures = 'Kinh Dương Vương'), 'ancestor of the Baiyue people'),
((select ID from HistoricalFigures where historicalfigures = 'Kinh Dương Vương'), 'Considered the founder of the Vietnamese nation');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Kinh Dương Vương'), 'Mythical figure in Vietnam\'s ancient history');

-- La Văn Cầu --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('La Văn Cầu', 'Male', 'Sầm Phúc Hướng', 'Cao Bang', 'Vietnam', 'Modern', '20th', 1927, 'Alive', 'La Văn Cầu is a revered Vietnamese war hero, known for his bravery during the First Indochina War. He became famous after a significant battle where he lost an arm but continued the mission. He was awarded the title "Hero of the People\'s Armed Forces" in 1952.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'La Văn Cầu'), 'Common family', 'N/A', 'Tày ethnic');

insert into fields (HistoricalFigureID, Field)
values 
((select ID from HistoricalFigures where historicalfigures = 'La Văn Cầu'), 'Military');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'La Văn Cầu'), 'Colonel');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'La Văn Cầu'), 'Asked his teammates to cut off his arm to continue the mission'),
((select ID from HistoricalFigures where historicalfigures = 'La Văn Cầu'), 'participated in 29 battles in the Indochina War'),
((select ID from HistoricalFigures where historicalfigures = 'La Văn Cầu'), 'One of seven people awarded the title of Hero of the People\'s Armed Forces by President Ho Chi Minh at the First National Emulation Congress'),
((select ID from HistoricalFigures where historicalfigures = 'La Văn Cầu'), 'Hero of the People\'s Armed Forces (1952)'),
((select ID from HistoricalFigures where historicalfigures = 'La Văn Cầu'), 'Lie about age to join the army');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'La Văn Cầu'), 'Street named after him in Hanoi and various cities in Vietnam');

-- Lạc Long Quân --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Lạc Long Quân', 'Male', 'Lạc Long Quân', 'Vietnam (Mythological figure)', 'Vietnamese', 'Legendary period', 'Unknown', NULL, NULL, 'Lạc Long Quân is one of the most revered mythological figures in Vietnamese history, considered the legendary father of the Hùng Kings and the progenitor of the Vietnamese people. He is the son of Kinh Dương Vương and Thần Long Nữ and is known for his marriage to Âu Cơ, which symbolizes the unity of mountain and sea tribes. Together, they are said to have birthed a hundred children, from whom the Vietnamese people descend. Lạc Long Quân played a key role in shaping the culture and early civilization of Vietnam, teaching agricultural techniques and leadership to unite various tribes.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lạc Long Quân'), NULL, 'Mythological', 'Son of Kinh Dương Vương and Thần Long Nữ') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Lạc Long Quân'), 'Mythological stories') ,
((select ID from HistoricalFigures where historicalfigures = 'Lạc Long Quân'), 'Legends') ,
((select ID from HistoricalFigures where historicalfigures = 'Lạc Long Quân'), 'Oral Traditions') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Lạc Long Quân'), 'King of the ancient Vietnamese people') ,
((select ID from HistoricalFigures where historicalfigures = 'Lạc Long Quân'), 'Mythological')  ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lạc Long Quân'), 'United tribes and fathered the Hùng Kings') ,
((select ID from HistoricalFigures where historicalfigures = 'Lạc Long Quân'), 'Considered the progenitor of the Vietnamese people') ,
((select ID from HistoricalFigures where historicalfigures = 'Lạc Long Quân'), 'Regarded as the legendary ancestor of all Vietnamese') ;

INSERT INTO Spouses  (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lạc Long Quân'), 'Âu Cơ', NULL);

-- Lâm Đức Thụ --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Lâm Đức Thụ', 'Male', 'Nguyễn Công Viễn', 'Bac Ninh', 'Vietnamese', 'Early 20th century', '20th', '1890', '1947', 'Lâm Đức Thụ was a complex figure in Vietnamese history, remembered for his role as an informant who collaborated with the French colonial forces. Although initially involved in revolutionary movements with figures like Phan Bội Châu, his later betrayal earned him a negative reputation in Vietnamese history.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lâm Đức Thụ'), NULL, 'Confusion family', NULL) ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Lâm Đức Thụ'), 'Politics');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Lâm Đức Thụ'), 'Founder'),
((select ID from HistoricalFigures where historicalfigures = 'Lâm Đức Thụ'), 'revolutionary activist'),
((select ID from HistoricalFigures where historicalfigures = 'Lâm Đức Thụ'), 'Collaborator'),
((select ID from HistoricalFigures where historicalfigures = 'Lâm Đức Thụ'), 'Informant') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lâm Đức Thụ'), 'Known for collaboration with French colonial forces'),
((select ID from HistoricalFigures where historicalfigures = 'Lâm Đức Thụ'), 'was a member of the Vietnam Restoration Association'),
((select ID from HistoricalFigures where historicalfigures = 'Lâm Đức Thụ'), 'Participated in founding Tam Tam Xa'),
((select ID from HistoricalFigures where historicalfigures = 'Lâm Đức Thụ'), 'Founder of Vietnam Revolutionary Youth Association'),
((select ID from HistoricalFigures where historicalfigures = 'Lâm Đức Thụ'), 'assassinated by militia in his hometown'),
((select ID from HistoricalFigures where historicalfigures = 'Lâm Đức Thụ'), 'Instrumental in the French discovery and suppression of many Vietnamese revolutionaries, including Phan Bội Châu'),
((select ID from HistoricalFigures where historicalfigures = 'Lâm Đức Thụ'), 'Controversial figure due to his actions during French colonization') ,
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lâm Đức Thụ'), 'is said to have introduced Tang Tuyet Minh to Nguyen Ai Quoc');

insert into othernames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lâm Đức Thụ'), 'Hoàng Chấn Đông'),
((select ID from HistoricalFigures where historicalfigures = 'Lâm Đức Thụ'), 'Trương Béo'),
((select ID from HistoricalFigures where historicalfigures = 'Lâm Đức Thụ'), 'Đầu xứ Viễn');

INSERT INTO Spouses  (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lâm Đức Thụ'), 'Lý Huệ Quần', 'Chinese');

-- Lang Liêu --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Lang Liêu', 'Male', NULL, 'Ancient Vietnam', 'Vietnamese', 'Mythological era', '~28th Century BC', NULL, NULL, 'Lang Liêu is a legendary prince in Vietnamese mythology, renowned for his role in the creation of two iconic rice cakes: Bánh Chưng (representing the Earth) and Bánh Dày (symbolizing the Sky). As the youngest son of King Hùng Vương VI, he won his father\'s favor by inventing these cakes, which reflected his deep understanding of agriculture and respect for Vietnamese traditions. His story is commemorated during the Vietnamese Lunar New Year (Tết) and symbolizes filial piety, simplicity, and the central role of rice in Vietnamese culture and history.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lang Liêu'), NULL, 'Son of King Hùng Vương VI', 'N/A') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Lang Liêu'), 'Mythology') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Lang Liêu'), 'Inventor'),
((select ID from HistoricalFigures where historicalfigures = 'Lang Liêu'), 'Prince') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lang Liêu'), 'Invented Bánh Chưng and Bánh Dày'),
((select ID from HistoricalFigures where historicalfigures = 'Lang Liêu'), 'Symbol of filial piety, agricultural innovation, and loyalty to Vietnamese traditions'),
((select ID from HistoricalFigures where historicalfigures = 'Lang Liêu'), 'Associated with the Lunar New Year (Tết)') ;

INSERT INTO Spouses  (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lang Liêu'), NULL, 'Legend represents the importance of agriculture and respect for tradition in Vietnamese culture');

-- Lê Anh Tông --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Lê Anh Tông', 'Male', 'Lê Duy Bang', 'Đông Kinh', 'Dai Viet', 'Lê-Mạc War period', '16th century', '1532', '1573', 'Lê Anh Tông (1532–1573), born Lê Duy Bang, was the 16th Emperor of the Lê Dynasty in Vietnam. His reign occurred during the Lê-Mạc wars, a period of conflict between the Lê loyalists and the Mạc Dynasty. Although a symbolic figurehead of the Lê Dynasty, his real power was overshadowed by the Trịnh Lords, who held the actual control of the court. He was eventually deposed by Trịnh Tùng and forced into exile, marking the end of his reign. His life exemplifies the challenges the Lê emperors faced in maintaining authority amidst internal political fragmentation and external threats.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Anh Tông'), NULL, 'royal family', 'descended from Le Tru (Le Loi\'s brother)') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Lê Anh Tông'), 'Politics') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Anh Tông'), 'Emperor') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Anh Tông'), 'Emperor of the Lê Dynasty'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Anh Tông'), 'Maintained power during the turbulent Lê-Mạc wars'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Anh Tông'), 'Fled to exile due to internal conflicts with Trịnh Lords'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Anh Tông'), 'plotted to kill Lord Trinh but failed'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Anh Tông'), '14th king of the Later Lê dynasty'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Anh Tông'), 'forced to hang himself by Lord Trinh'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Anh Tông'), 'Struggled to assert Lê authority during the period dominated by the Trịnh Lords') ,
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Anh Tông'), 'the 3rd emperor of the Lê Revival Dynasty');

-- Lê Chân --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Lê Chân', 'Female', 'Lê Chân', 'Quang Ninh', 'Vietnamese', 'The Northern colonial period of Vietnam', '1st century', NULL, NULL, 'Lê Chân, a prominent female general during the 1st-century uprising led by the Trưng Sisters, is remembered as one of Vietnam\'s earliest heroines. She hailed from Đông Triều in Quảng Ninh province and played a significant role in resisting Han Chinese domination. A skilled military leader, Lê Chân contributed greatly to the success of several battles, particularly in the Hải Phòng region, which she helped establish. Her legacy is honored in Vietnamese history as a symbol of resistance and empowerment, particularly for women in military and political roles. Today, she is celebrated as the founding mother of Hải Phòng city, where temples and streets bear her name.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Chân'), 'Noble family', 'Father is a doctor', NULL) ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Lê Chân'), 'Military'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chân'), 'Politics') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Chân'), 'General'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chân'), 'Resistance leader'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chân'), 'Princess') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Chân'), 'General under the Trưng Sisters'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chân'), 'Led successful campaigns against Han Chinese forces'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chân'), 'Known for military leadership in Hải Phòng'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chân'), 'Honored as the founding mother of Hải Phòng city'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chân'), 'Played a major role in the rebellion against Han Chinese rule'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chân'), 'One of the earliest heroines in Vietnamese history'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chân'), 'Contributed to Vietnam\'s fight for independence') ,
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Chân'), 'Famous for her beauty, the governor asked her to marry him but she refused, so he killed her parents');

insert into othernames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Chân'), 'Thánh Chân Princess');

-- Lê Chân Tông --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Lê Chân Tông', 'Male', 'Lê Duy Hựu', 'Đại Việt (modern-day Vietnam)', 'Vietnamese', 'Later Lê dynasty reign', '17th century', '1607', '1643', 'Lê Chân Tông (1630–1649) was the seventh emperor of the Later Lê dynasty and the 18th in Vietnam\'s history. His reign was short and largely symbolic, as real power was wielded by the Trịnh Lords. He ascended the throne in October 1643 after his father, Lê Thần Tông, abdicated, and ruled until his death in 1649 at the age of 20. Without male heirs, his father resumed the throne. Despite being a monarch, Lê Chân Tông\'s reign saw limited influence, as governance was dominated by the Trịnh family.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Chân Tông'), NULL, 'royal family', 'Revival Le Dynasty') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Lê Chân Tông'), 'Politics') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Chân Tông'), 'Emperor') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Chân Tông'), 'Ascended the throne after his father abdicated in 1643, reigned until 1649'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chân Tông'), 'Reigned for 6 years before dying young'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chân Tông'), 'Power largely in the hands of the Trịnh Lords') ,
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Chân Tông'), 'The 7th emperor of the Le Revival Dynasty'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Chân Tông'), 'After his death, his father became emperor for the second time'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Chân Tông'), 'The 18th emperor of Later Le Dynasty.');

-- Lê Chiêu Thống --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Lê Chiêu Thống', 'Male', 'Lê Duy Kỳ', 'Đại Việt (modern-day Vietnam)', 'Vietnamese', '1786–1789', '18th century', '1741', '1793', 'Lê Chiêu Thống (1741–1793) was the last emperor of the Later Lê Dynasty, ruling from 1786 to 1789. He is most well-known for his ineffective rule during the turbulent period of the Tây Sơn Rebellion. Unable to defend his throne, he was forced to flee to China after being defeated by the Tây Sơn forces in 1789. His reign marked the end of the Later Lê Dynasty and the rise of the Tây Sơn dynasty, which later contributed to the formation of the Nguyễn dynasty. Despite his royal status, Lê Chiêu Thống is often remembered for his betrayal and his alliance with Tây Sơn, which earned him the infamous reputation as a traitor. His role in Vietnamese history is often summed up by the phrase "cõng rắn cắn gà nhà," symbolizing his betrayal.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Chiêu Thống'), NULL, 'royal family', 'Revival Le dynasty') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Lê Chiêu Thống'), 'Politics'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chiêu Thống'), 'Military') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Chiêu Thống'), 'Emperor'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chiêu Thống'), 'Traitor') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Chiêu Thống'), 'Became emperor at the age of 45'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chiêu Thống'), 'last emperor of Revival Le Dynasty'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chiêu Thống'), '16th emperor of Revival Le Dynasty'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chiêu Thống'), '27th emperor of Later Le Dynasty'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chiêu Thống'), 'his reign was marked by the turmoil of the Tây Sơn rebellion and his subsequent fleeing to China'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chiêu Thống'), 'His reign saw the collapse of the Later Lê Dynasty and the rise of the Tây Sơn dynasty'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chiêu Thống'), 'Noted for being largely ineffective as a ruler'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chiêu Thống'), 'Lost the support of the military and had to flee from Tây Sơn forces'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chiêu Thống'), 'His rule was brief, and he failed to defend the country'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Chiêu Thống'), 'Deposed by Tây Sơn and lived in exile in China until his death') ,
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Chiêu Thống'), 'His alliance with the Tây Sơn rebels against his own family marked him as a betrayer in Vietnamese history.');

-- Lê Công Hành --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Lê Công Hành', 'Male', 'Trần Quốc Khái', 'Hanoi', 'Vietnam', 'Revival Le dynasty', '17th century', '1606', '1661', 'Lê Công Hành (1606–1661) was a prominent figure in the Hậu Lê era, known for his political role and major influence on traditional Vietnamese embroidery. He is honored as the founder of the embroidery craft, advancing techniques and spreading the practice, especially in Quất Động, Hà Nội. He held high-ranking titles including "Thượng thư" (Minister), "Đại phu" (Senior Official), and "Tả thị lang bộ Công" (Deputy Minister of Public Works).');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Công Hành'), NULL, NULL, 'descendant of Mac royal family') ;

insert into othernames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Công Hành'), 'Bùi Quốc Khái') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Lê Công Hành'), 'Diplomacy'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Công Hành'), 'Politics'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Công Hành'), 'Art') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Công Hành'), 'Minister'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Công Hành'), 'Senior Official'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Công Hành'), 'Founder'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Công Hành'), 'Deputy Minister of the Ministry of Public Works') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Công Hành'), 'Founder of the traditional embroidery craft, introduced advancements in embroidery and umbrella-making techniques'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Công Hành'), 'Regarded as the founder of the embroidery craft in Vietnam, having a profound influence on the traditional embroidery industry in Vietnamese craft villages'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Công Hành'), 'Founder of the embroidery profession in many Vietnamese craft villages. Revered in various temples and shrines dedicated to the craft') ;

insert into works (HistoricalFigureID, Work) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Công Hành'), 'No specific famous works, but a significant influence in embroidery') ;

insert into othernames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Công Hành'), 'Ông tổ nghề thêu');

-- Lê Cung Hoàng --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Lê Cung Hoàng', 'Male', 'Lê Xuân', 'Thanh Hoa', 'Dai Viet', 'Later Le dynasty', '16th century', '1507', '1527', 'Lê Cung Hoàng (1507–1527) was the final emperor of the Lê dynasty during the 16th century. His reign lasted from 1522 to 1527, but he was essentially a puppet emperor controlled by the powerful Mạc Đăng Dung. His reign ended tragically when he was deposed and forced to commit suicide after Mạc Đăng Dung claimed the throne, establishing the Mạc dynasty.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Cung Hoàng'), NULL, NULL, 'Grandson of Lê Thánh Tông, son of Cẩm Giang vương Lê Sùng, younger brother of Lê Chiêu Tông') ;

insert into othernames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Cung Hoàng'), 'Thống Nguyên Đế') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Lê Cung Hoàng'), 'Politics') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Cung Hoàng'), 'Cung vương') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Cung Hoàng'), 'Emperor') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Cung Hoàng'), '11th Emperor of the Hậu Lê Dynasty') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Cung Hoàng'), 'Final emperor of the Lê sơ dynasty'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Cung Hoàng'), 'controlled by Mạc Đăng Dung who used him as a puppet'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Cung Hoàng'), 'deposed and killed by Mạc Đăng Dung'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Cung Hoàng'), 'reigned as emperor for five years'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Cung Hoàng'), 'his downfall marked the beginning of a new dynasty'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Cung Hoàng'), 'his reign marked the decline of the Lê dynasty and the rise of the Mạc dynasty, as he was manipulated and eventually killed by Mạc Đăng Dung. His death contributed to the end of the Lê dynasty, with the Mạc dynasty taking control of the throne.') ;

-- Lê Duy Phường --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Lê Duy Phường', 'Male', 'Lê Duy Phường', 'Dai Viet', 'Vietnamese', 'modern', '18th century', '1709', '1735', 'Lê Duy Phường (1709–1735), also known as Vĩnh Khánh Đế, was the last puppet emperor of the Lê Dynasty under the Trịnh Lords. He had no real power and was eventually dethroned and executed by Trịnh Giang, who sought to maintain control over the dynasty. After his death, the Trịnh Lords continued to exert their influence, even after his death in 1735.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Duy Phường'), NULL, NULL, 'Son of Lê Dụ Tông and Queen Trịnh Thị Ngọc Trang, grandson of Trịnh Lan') ;

insert into othernames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Duy Phường'), 'Vĩnh Khánh Đế'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Duy Phường'), 'Hôn Đức công') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Lê Duy Phường'), 'Politics') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Duy Phường'), 'Emperor') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Duy Phường'), '23th Emperor of the Later Lê Dynasty'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Duy Phường'), '12th Emperor of the Revival Lê Dynasty'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Duy Phường'), 'His reign was symbolic, as he had little real power, controlled by the Trịnh Lords. He was eventually deposed and killed by Trịnh Giang.'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Duy Phường'), 'falsely accused of having an affair with Lord Trinh\'s wife'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Duy Phường'), 'His short reign marked the continuing control of the Trịnh Lords over the Lê dynasty. His demise allowed Trịnh Giang to consolidate more power.'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Duy Phường'), 'Known for being manipulated by the Trịnh Lords, particularly Trịnh Giang. His reign lasted for 6 years and ended in his assassination.') ;

insert into othernames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Duy Phường'), 'Vĩnh Khánh') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Duy Phường'), 'Lê Phế Đế') ;

INSERT INTO Spouses  (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Duy Phường'), 'Trịnh Thị Ngọc', 'Daughter of Trịnh Cương');


-- Lê Dụ Tông --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Lê Dụ Tông', 'Male', 'Lê Duy Đường', 'Kinh Bắc', 'Dai Viet', 'Reviva Le Dynasty', '18th Century', '1679', '1731', 'Lê Dụ Tông (1679–1731) was the 11th emperor of the Lê Trung Hưng Dynasty, known for his peaceful but largely ceremonial rule. His reign was dominated by the influence of the Trịnh Lords, and he was eventually forced to abdicate and lived his final years in seclusion.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Dụ Tông'), NULL, 'Royal Family', 'Revival Le Dynasty') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Lê Dụ Tông'), 'Politics') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Dụ Tông'), 'Emperor') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Dụ Tông'), 'Reigned from 1705 to 1729; later abdicated under pressure from Chúa Trịnh.'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Dụ Tông'), '11th emperor of Revival Le Dynasty'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Dụ Tông'), '22nd emperor of later Le Dynasty'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Dụ Tông'), 'His reign marked by peace and stability, but real power rested with the Trịnh Lords.'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Dụ Tông'), 'Known for a peaceful and prosperous era, but his reign was largely symbolic.') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Dụ Tông'), 'His era marked by Trịnh Lords\' dominance.') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Dụ Tông'), 'Died under house arrest after being forced to abdicate.');

-- Lê Duẩn --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Lê Duẩn', 'Male', 'Lê Duẩn', 'Quang Binh', 'Vietnamese', 'modern', '20th Century', '1907', '1986', 'Lê Duẩn (1907–1986) was a prominent Vietnamese political and military leader who played a pivotal role in the country\'s struggle for independence and reunification. As the General Secretary of the Communist Party of Vietnam, he directed the country\'s efforts during the Vietnam War, shaping its policies and guiding it through the post-war reconstruction. Lê Duẩn\'s leadership in military campaigns contributed to the victory of North Vietnam and the eventual reunification of the country in 1975. He was also a key figure in implementing economic and social reforms in the years following the war, leaving a lasting influence on modern Vietnam.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Duẩn'), 'peasant family', 'carpenter, farmer', NULL) ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Lê Duẩn'), 'Politics') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Duẩn'), 'Military') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Duẩn'), 'revotionary activist') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Duẩn'), 'General Secretary of the Communist Party of Vietnam') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Duẩn'), 'Commander-in-Chief of the Armed Forces of North Vietnam')  ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Duẩn'), 'Oversaw Vietnam’s leadership during the war and after reunification') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Duẩn'), 'imprisoned in Hoa Lo, Son La and Con Dao prisons') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Duẩn'), 'Instrumental in implementing Đổi Mới policies after his death') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Duẩn'), 'is the General Secretary with the longest tenure of 25 years, 303 days') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Duẩn'), 'led the communists in the South during the Indochina War') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Duẩn'), 'led Vietnam during the two border wars in the Southwest and the North.') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Duẩn'), 'First Secretary of the Vietnam Workers\' Party') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Duẩn'), 'imprisoned in Con Dao prison twice') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Duẩn'), 'Led military strategies during the Vietnam War, especially during the final push for reunification') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Duẩn'), 'His leadership in key military campaigns contributed directly to the victory over South Vietnam and reunification')  ;


insert into quotes (HistoricalFigureID, Quote)
values
((select ID from HistoricalFigures where historicalfigures = 'Lê Duẩn'), 'Lê Duẩn was a military strategist who shaped the North Vietnamese war effort and ensured victory over U.S.-backed forces') ;

insert into othernames (HistoricalFigureID, OtherName)
values
((select ID from HistoricalFigures where historicalfigures = 'Lê Duẩn'), 'Anh Ba') ;

insert into works (HistoricalFigureID, Work)
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Duẩn'), 'Đề cương cách mạng miền Nam') ;

-- Lê Đức Thọ --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Lê Đức Thọ', 'Male', 'Phan Đình Khải', 'Nam Dinh', 'Vietnam', '1930s – 1986', '20th', '1911', '1990', 'Lê Đức Thọ (1911–1990) was a prominent Vietnamese politician and diplomat, best known for his role in negotiating the Paris Peace Accords that ended U.S. involvement in the Vietnam War. A key figure in the Communist Party of Vietnam, he held various leadership positions, including Senior Adviser to the Central Committee and Head of the Party’s Organization Department. Despite being awarded the Nobel Peace Prize in 1973 alongside Henry Kissinger, he refused it, citing that peace had not yet been fully achieved in Vietnam. His legacy is marked by his steadfast commitment to Vietnam’s sovereignty and independence.') ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Lê Đức Thọ'), 'Politics') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Đức Thọ'), 'Diplomacy') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Đức Thọ'), 'Senior Adviser to the Central Committee of the Communist Party of Vietnam') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Đức Thọ'), 'Head of the Party’s Organization Department')  ;

insert into othernames (HistoricalFigureID, OtherName) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Đức Thọ'), 'Sáu Búa') ;

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Đức Thọ'), 'Negotiated the Paris Peace Accords in 1973, sharing the Nobel Peace Prize with Henry Kissinger (though he declined it)') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Đức Thọ'), 'Major figure in Vietnamese politics, especially during the Vietnam War era') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Đức Thọ'), 'A key person in post-war policy development') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Đức Thọ'), 'Played a large role in political purges and internal party control') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Đức Thọ'), 'One of the most influential diplomats in Vietnam’s history')  ;

insert into works (HistoricalFigureID, Work)
values
((select ID from HistoricalFigures where historicalfigures = 'Lê Đức Thọ'), 'Trên những nẻo đường (1956)'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Đức Thọ'), 'Đường ngàn dặm (1977)'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Đức Thọ'), 'Nhật ký đường ra tiền tuyến (1978)'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Đức Thọ'), 'Thơ Lê Đức Thọ (1983)') ;

insert into achievements (HistoricalFigureID, Achievement)
values
((select ID from HistoricalFigures where historicalfigures = 'Lê Đức Thọ'), 'was the first Asian to receive the Nobel Peace Prize in 1973 but declined it due to the ongoing war at the time. His diplomatic efforts were key to Vietnam’s success in the peace talks.') ;

-- Lê Gia Tông --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Lê Gia Tông', 'Male', 'Lê Duy Cối', 'Thanh Hoa', 'Dai Viet', 'revival Le dynasty', '17th century', '1661', '1675', 'Lê Gia Tông became emperor at a young age, only 10 years old, but his reign was short-lived due to illness. He ascended to the throne in 1671 after his older brother, Lê Huyền Tông, passed away without an heir. Despite his short life and reign, he is remembered as a figure of grace and kindness. His death at the young age of 15 left no direct successor, which led to his younger brother, Lê Duy Hiệp, becoming the next emperor. Although his reign was brief, Lê Gia Tông left a mark as a symbol of youthful promise and hope.') ;

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Gia Tông'), NULL, 'Son of Lê Thần Tông, mother was Chiêu Nghi Lê Thị Ngọc Hoàn', NULL) ;

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Lê Gia Tông'), 'Politics') ;

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Gia Tông'), 'Emperor of the Lê Dynasty (Trung Hưng)')  ;


insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Gia Tông'), 'Ascended the throne in 1671 at age 10, ruled for 4 years') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Gia Tông'), 'Known for his magnanimous and gentle nature, became a symbol of youthful royalty') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Gia Tông'), 'Well known for his appearance and his peaceful demeanor')  ;

insert into quotes (HistoricalFigureID, Quote)
values
((select ID from HistoricalFigures where historicalfigures = 'Lê Gia Tông'), 'Buried at Phúc An Mausoleum') ;

-- Lê Hiến Tông --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Lê Hiến Tông', 'Male', 'Lê Tranh', 'Dong Kinh', 'Dai Viet', 'Le Dynasty', '15th-16th century', '1461', '1504', 'Lê Hiến Tông, born Lê Tranh in 1461, was the sixth emperor of the Lê Dynasty of Đại Việt, ruling from 1497 until his death in 1504. Known for maintaining the legal reforms and prosperous state of Đại Việt initiated by his father, Lê Thánh Tông, he preserved order, protected agriculture, and promoted education. Despite later health issues, his reign is remembered for stability, justice, and compassion.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Hiến Tông' and RealName = 'Lê Tranh'), NULL, 'royal family', 'Later Le Dynasty');

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Lê Hiến Tông' and RealName = 'Lê Tranh'), 'Politics');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Hiến Tông' and RealName = 'Lê Tranh'), 'Emperor');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Hiến Tông' and RealName = 'Lê Tranh'), 'Emperor of Dai Viet (6th emperor of Le Dynasty)'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Hiến Tông' and RealName = 'Lê Tranh'), 'Ascended the throne in 1497; maintained the prosperity and legal reforms initiated by his father, Le Thanh Tong.'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Hiến Tông' and RealName = 'Lê Tranh'), 'Known for his fair governance, love for literature, and promoting social welfare policies.'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Hiến Tông' and RealName = 'Lê Tranh'), 'Maintained stability and prosperity of the Le Dynasty during his reign.'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Hiến Tông' and RealName = 'Lê Tranh'), 'Known for his fair and lenient leadership style, prioritizing the welfare of his people.'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Hiến Tông' and RealName = 'Lê Tranh'), 'Focused on education, civil reforms, and ensuring agricultural productivity.');

-- Lê Hiển Tông --
insert into HistoricalFigures (historicalfigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
values ('Lê Hiển Tông', 'Male', 'Lê Duy Diêu', 'Hanoi', 'Dai Viet', 'Revival Le Dynasty', '18th Century', '1717', '1786', 'Lê Hiển Tông was the last symbolic figurehead of the Later Lê dynasty. He reigned for 47 years but was largely controlled by the Trịnh family. Though his reign saw minimal political power, he was highly respected for his role in maintaining the Lê lineage. His connection to Nguyễn Huệ and Nguyễn Ánh (Quang Trung and Gia Long) added significant historical importance.');

insert into familybackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Hiển Tông' and RealName = 'Lê Duy Diêu'), NULL, 'royal family', 'Revival Le Dynasty');

insert into fields (HistoricalFigureID, Field)
values
((select ID from HistoricalFigures where historicalfigures = 'Lê Hiển Tông' and RealName = 'Lê Duy Diêu'), 'Politics');

insert into positions (HistoricalFigureID, Position)
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Hiển Tông' and RealName = 'Lê Duy Diêu'), 'Emperor');

insert into achievements (HistoricalFigureID, Achievement) 
values 
((select ID from HistoricalFigures where historicalfigures = 'Lê Hiển Tông' and RealName = 'Lê Duy Diêu'), '26th emperor of Le Dynasty'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Hiển Tông' and RealName = 'Lê Duy Diêu'), 'Was the longest reigning king and the longest-lived king of the Later Le Dynasty.'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Hiển Tông' and RealName = 'Lê Duy Diêu'), 'Symbol of continuity in the Le dynasty, though real power was held by the Trinh lords.'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Hiển Tông' and RealName = 'Lê Duy Diêu'), 'Longest-reigning monarch of the Later Le dynasty, but largely a puppet under the Trinh family.');

-- Lê Đại Hành --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction)
VALUES ('Lê Đại Hành', 'Male', 'Lê Hoàn', 'Not clearly determined', 'Đại Cồ Việt', 'Previous Le Dynasty', '10th Century', '941', '1005', 'Lê Đại Hành, born Lê Hoàn (941-1005), was a prominent Vietnamese emperor and military leader who founded the Early Lê Dynasty (Tiền Lê) in 980. He played a key role in unifying Vietnam after the chaotic period of the 12 Warlords and successfully repelled the invading Song Dynasty in 981, securing the nation’s independence. His reign is remembered for establishing a strong, centralized government and military power, marking the beginning of Vietnam\'s consolidation and expansion during the 10th century.');

INSERT INTO Spouses (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), 'Dương Vân Nga', NULL);

INSERT INTO OtherNames (HistoricalFigureID, OtherName)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), 'Đại Hành Hoàng Đế'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), 'Minh Càn Ứng Vận Thần Vũ Thăng Bình Chí Nhân Quảng Hiếu Hoàng Đế');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), 'Politics'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), 'Military');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), 'Emperor'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), 'Military Commander'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), 'Military Leader');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), 'founding of the Tiền Lê Dynasty'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), 'His mother dreamed of a lotus flower and gave birth to him.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), 'Consolidated independence and developed Đại Cồ Việt’s culture'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), 'Skilled in both military and administration, strong foundation for the nation'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), 'Defeated the 12 Warlords, unified the country, set the foundation for Đại Cồ Việt'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), 'Built a strong military foundation, established a central government, ended the period of decentralized power'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), 'Defeated the Song army, preserving Đại Cồ Việt\'s independence'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), 'Strengthened the nation, protected its safety from foreign threats'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), 'Brought Đại Cồ Việt to its peak in military power and national independence');

-- Lê Hồng Phong --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Lê Hồng Phong', 'Male', 'Lê Huy Doãn', 'Nghệ An, Vietnam', 'Vietnamese', 'modern', '20th century', '1902', '1942', 'Lê Hồng Phong (1902–1942) was a prominent Vietnamese communist revolutionary and leader of the Indochinese Communist Party. He served as General Secretary from 1935 to 1936 and played a key role in the anti-colonial struggle against French rule. Despite facing multiple imprisonments, including his final years in Con Dao, Lê Hồng Phong remained committed to the cause of Vietnamese independence. He is remembered for his resilience, leadership, and dedication to the revolution. His legacy continues to inspire Vietnam today.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), 'poor family', NULL, 'father died');

INSERT INTO OtherNames (HistoricalFigureID, OtherName)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), 'Lê Văn Duyện'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), 'Vương Nhật Dân'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), 'La Anh'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), 'Litvinov');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), 'Politics');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), 'General Secretary of the Indochinese Communist Party');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), 'General Secretary of the Indochinese Communist Party, leader of the revolution against French colonial rule.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), 'Major influence on the development of the Indochinese Communist Party and Vietnam’s revolutionary movement.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), 'A resilient leader, unwavering loyalty to the revolution.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), 'Honored with numerous streets and places named after him.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), 'Attended the 7th Congress of the Communist International, expanded international relations for the Indochinese Communist Party.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), 'Close collaboration with the Comintern and other international communist parties.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), 'Led efforts to restore and develop the Party organization within Vietnam.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), 'Major influence on the development of the Indochinese Communist Party and Vietnam’s revolutionary movement.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), 'Close collaboration with the Comintern and other international communist parties.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), 'His wife was also a prominent revolutionary leader.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), 'He and General Võ Nguyên Giáp were close comrades, with Giáp’s wife being his sister-in-law.');

INSERT INTO Spouses (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), 'Nguyễn Thị Minh Khai', NULL);

-- Lê Hồng Sơn --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Lê Hồng Sơn', 'Male', 'Lê Văn Phan', 'Xuân Hồ, Nam Đàn, Nghệ An', 'Việt Nam', 'modern', '20th', '1899', '1933', 'Lê Hồng Sơn was a revolutionary leader who contributed significantly to the Vietnamese communist movement. He played an instrumental role in the unification of communist groups and the creation of the Communist Party of Vietnam. His efforts in the assassination attempt of Martial Merlin and his later activities reflect his dedication to Vietnamese independence. Despite his capture and death by the French, he is remembered as a martyr for the cause.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Sơn'), 'Poor family from Nghệ An', NULL, NULL);

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Sơn'), 'Politics');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Sơn'), 'Member of Việt Nam Quang Phục Hội');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Sơn'), 'Supported Phạm Hồng Thái in the assassination attempt of French Governor-General Martial Merlin.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Sơn'), 'Strong connection with communist movements in both Vietnam and China.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Sơn'), 'Persistent revolutionary spirit despite being captured and executed by French authorities.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Sơn'), 'Arrested by French police in Shanghai, and executed by firing squad in his hometown.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Sơn'), 'Co-founder of An Nam Cộng sản Đảng.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Sơn'), 'Co-founder of the Việt Nam Thanh niên Cách mạng Đồng chí Hội.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Sơn'), 'Played a major role in the foundation of the Communist Party of Vietnam.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Sơn'), 'Known for his resistance against French colonialism and dedication to the communist movement.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Sơn'), 'Key figure in the creation of An Nam Cộng sản Đảng and the unification of communist organizations.');

INSERT INTO OtherNames (HistoricalFigureID, OtherName) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Sơn'), 'Lê Hưng Quốc'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Sơn'), 'Lê Tản Anh'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Sơn'), 'Võ Hồng Anh');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Sơn'), 'Known for his collaboration with key communist figures in the region.');

-- Lê Huyền Tông --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Lê Huyền Tông', 'Male', 'Lê Duy Vũ', 'Thanh Hóa', 'Đại Việt', 'Later Le Dynasty', '17th', '1654', '1671', 'Lê Huyền Tông was the eighth emperor of the Lê Trung Hưng dynasty and the nineteenth of the Lê dynasty. Despite being a monarch, his reign was marked by the strong influence of the Trịnh lords who held the real power. His reign was short, lasting only 9 years, and he died young without leaving an heir.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Huyền Tông'), NULL, 'royal family', 'Revival Le Dynasty');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Huyền Tông'), 'Politics');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Huyền Tông'), 'Emperor');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Huyền Tông'), '8th Emperor of the Lê Trung Hưng, 19th Emperor of the Lê Dynasty'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Huyền Tông'), 'Attempted to strengthen relations with the Qing dynasty and banned Christianity.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Huyền Tông'), 'Ascended the throne in 1662 at the age of 8 after the death of his father.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Huyền Tông'), 'Ruled under Trịnh Tạc\'s guidance, leading to a puppet-like reign.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Huyền Tông'), 'Became king at a very young age and had a very short reign.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Huyền Tông'), 'His reign marked continued dominance of the Trịnh Lords, who held the real power.');

INSERT INTO OtherNames (HistoricalFigureID, OtherName) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Huyền Tông'), 'Lê Duy Hi'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Huyền Tông'), 'Lê Duy Vũ');

INSERT INTO Spouses (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Huyền Tông'), 'Trịnh Thị Ngọc Áng', 'Daughter of Trịnh Tạc');

-- Lê Hy Tông --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Lê Hy Tông', 'Male', 'Lê Duy Cáp / Lê Duy Hiệp', 'Đông Khối, Gia Định (now Gia Bình)', 'Đại Việt', 'Later Le Dynasty', '17th–18th', '1663', '1716', 'Lê Hy Tông was the tenth emperor of the Lê Trung Hưng dynasty and the twenty-first of the Lê dynasty. He was well-regarded for his wisdom and justice, ensuring a prosperous era in the north of Vietnam during his reign. After 30 years on the throne, he abdicated in favor of his son Lê Duy Đường (Lê Dụ Tông) and later lived as Thái thượng hoàng until his death in 1716.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hy Tông'), NULL, 'Royal family', 'Revival Le Dynasty');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hy Tông'), 'Politics');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hy Tông'), 'Emperor');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hy Tông'), '10th Emperor of the Lê Trung Hưng Dynasty, 21st Emperor of the Lê Dynasty.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hy Tông'), 'His reign is considered one of the most prosperous periods during the Lê Trung Hưng dynasty.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hy Tông'), 'Renowned for his just rule and for ushering in a period of stability after the wars with the Nguyễn Lords.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hy Tông'), 'His reign was known for stability and prosperity during the period known as Chính Hòa chi trị.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hy Tông'), 'Regarded for good governance, though the real power was held by the Trịnh Lords, particularly Trịnh Tạc and Trịnh Căn.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hy Tông'), 'Known for being a just and wise ruler, praised for maintaining peace and prosperity in the northern regions of Vietnam.');

INSERT INTO OtherNames (HistoricalFigureID, OtherName) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hy Tông'), 'Lê Duy Cáp'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hy Tông'), 'Lê Duy Hiệp');

-- Lê Kính Tông --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Lê Kính Tông', 'Male', 'Lê Duy Tân', 'Thọ Xuân, Thanh Hóa', 'Đại Việt', 'Later Le Dynasty', '16th–17th', '1588', '1619', 'Lê Kính Tông was the 5th emperor of the Lê Trung Hưng dynasty and the 16th of the Lê dynasty. His reign was largely controlled by Trịnh Tùng, with the monarch having little power. In 1619, after an attempt to assassinate Trịnh Tùng failed, Lê Kính Tông was forced to commit suicide, marking the end of his reign at the young age of 31.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Kính Tông'), NULL, 'royal family', 'Revival Le Dynasty');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Kính Tông'), 'Politics');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Kính Tông'), 'Emperor');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Kính Tông'), '5th Emperor of the Lê Trung Hưng Dynasty, 16th Emperor of the Lê Dynasty.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Kính Tông'), 'His reign marked the consolidation of the power of the Trịnh Lords, which would dominate the Lê dynasty for the next two centuries.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Kính Tông'), 'Known for his attempted assassination of Trịnh Tùng, which resulted in his own demise.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Kính Tông'), 'Became a puppet monarch with little actual power as Trịnh Tùng’s control over the court expanded.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Kính Tông'), 'In 1619, attempted to assassinate Trịnh Tùng but failed, leading to his forced suicide.');

-- Lê Lai --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Lê Lai', 'Male', 'Lê Lai', 'Thanh Hoa', 'Đại Việt', 'Later Le Dynasty', '15th Century', NULL, '1418', 'Lê Lai, a key general in the Lam Sơn uprising, is famous for his heroic act of impersonating Lê Lợi during a critical battle with the Ming forces, sacrificing his life to save his army.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Lai'), NULL, NULL, 'His father was a local official. His older brother also participated in the Lam Sơn uprising.');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Lai'), 'Military');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Lai'), 'Quan Nội Hầu'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Lai'), 'Tổng Quản phủ Đô Tổng Quản');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Lai'), 'Volunteered to impersonate Lê Lợi during a critical battle against the Ming, sacrificed his life for the cause.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Lai'), 'A national hero of the Lam Sơn uprising, symbol of loyalty and self-sacrifice.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Lai'), 'Brave, loyal, selfless in serving the nation.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Lai'), 'Lê Lai sacrificed his life for Lê Lợi and the Lam Sơn forces, and was later posthumously honored with several titles for his contributions.');

-- Lê Thái Tổ --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Lê Thái Tổ', 'Male', 'Lê Lợi', 'Lam Sơn, Thanh Hóa', 'Đại Việt', 'Later Le Dynasty', '15th Century', '1385', '1433', 'Lê Lợi (1385–1433) was a Vietnamese military leader and the founder of the Lê dynasty. He is best known for leading the Lam Sơn uprising, which successfully expelled the Ming Dynasty\'s occupying forces from Vietnam. After his victory, he established the Lê dynasty, marking a new era of independence and prosperity for Vietnam. Revered for his strategic brilliance and political acumen, Lê Lợi became the first king of the Lê dynasty, known as Lê Thái Tổ, and left a lasting legacy in Vietnamese history.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thái Tổ'), 'Noble family', NULL, 'His father was a local official.');

INSERT INTO Spouses (HistoricalFigureID, Name, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thái Tổ'), 'Phạm Thị', 'Empress of the Lê dynasty.');

INSERT INTO OtherNames (HistoricalFigureID, OtherName) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thái Tổ'), 'Bình Định Vương'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thái Tổ'), 'Đại Việt Quốc Vương');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thái Tổ'), 'Military'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thái Tổ'), 'Politics');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thái Tổ'), 'Leader'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thái Tổ'), 'Emperor');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thái Tổ'), 'Led the Lam Sơn uprising against the Ming Empire and founded the Lê dynasty.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thái Tổ'), 'Renowned for his leadership, strategic brilliance, and commitment to Vietnamese independence.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thái Tổ'), 'was helped by the Divine Turtle to defeat the Ming army'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thái Tổ'), 'Founder of the Lê dynasty and the first King after Vietnam\'s independence from the Ming.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thái Tổ'), 'As a ruler, Lê Lợi worked to consolidate power, promote the rule of law, and defend Vietnam\'s sovereignty.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thái Tổ'), 'Helped rebuild the country and strengthen its borders after a period of turmoil.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thái Tổ'), 'Enacted laws, helped organize post-war Vietnam, and strengthened the central government.');

-- Lê Ngọa Triều Đế --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Lê Ngọa Triều Đế', 'Male', 'Lê Long Đĩnh', 'Hoa Lư', 'Đại Cồ Việt', 'Tien Le Dynasty', '10th century', '986', '1009', 'Lê Long Đĩnh, also known as Lê Ngọa Triều, was the last king of the early Lê Dynasty (1005–1009). He is often depicted as a controversial and brutal monarch. Despite being labeled a tyrant, some aspects of his reign remain clouded in mystery and contradiction. Historians debate his actions, motivations, and the circumstances surrounding his death.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), NULL, NULL, 'Son of Lê Đại Hành and Cảm Thánh Empress.');

INSERT INTO OtherNames (HistoricalFigureID, OtherName) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), 'Lê Ngọa Triều'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), 'Ngọa Triều Hoàng Đế');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), 'Politics'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), 'Military'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), 'Religious'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), 'Diplomacy');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), 'Emperor'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), 'Leader');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), 'Led troops to fight and suppress rebellions in various lands 5 times.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), 'Stabilized the country after 8 months of turmoil.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), 'Revised the official system and court uniforms of civil and military officials, monks, and priests, modeled after the Song Dynasty.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), 'Requested and received the Nine Classics and the Tripitaka from the Song Dynasty.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), 'Carried out a foreign policy similar to his father\'s, with frequent exchanges with the Song Dynasty.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), 'Our country continued to receive recognition of independence from the Song Dynasty.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), 'Brutal and cruel'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), 'Innovative in governance reforms.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), 'Physically impaired (he suffered from hemorrhoids).'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), 'For the first time, our country received Confucian educational books from China through official channels.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), 'Established policies for stabilizing the country after prolonged periods of instability.'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), 'His reign remains a subject of debate due to contradictory accounts about his rule and actions.');

-- Lê Ngọc Hân --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Lê Ngọc Hân', 'Female', 'Lê Ngọc Hân', 'Thăng Long (Hà Nội), Vietnam', 'Dai Viet', 'Revival Le, Tay Son dynasty', '18th', '1770', '1799', 'Lê Ngọc Hân (1770–1799) was a Vietnamese princess, the daughter of Emperor Lê Hiển Tông of the Later Lê dynasty, and the wife of Emperor Quang Trung (Nguyễn Huệ) of the Tây Sơn dynasty. Her marriage was a strategic political alliance between the rival Lê and Tây Sơn dynasties. In addition to her political role, she was a talented poet, known for her famous work "Ai Tư Vãn", which mourned the death of Quang Trung and reflected her personal grief and patriotism. Lê Ngọc Hân\'s contributions to both politics and literature have left a lasting impact on Vietnamese history.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), NULL, 'royal family', 'Later Le Dynasty');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), 'Politics'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), 'Literature');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), 'Princess'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), 'Poet'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), 'Empress');

INSERT INTO OtherNames (HistoricalFigureID, OtherName) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), 'Công Chúa Ngọc Hân');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), 'had a political marriage'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), 'played a significant role in strengthening the unity between the Lê and Tây Sơn dynasties'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), 'known for her political marriage and contributions to the Tây Sơn rebellion'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), 'her wedding was to strengthen the relationship between the Later Lê dynasty and the Tây Sơn army'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), 'gave her husband advice on the successor of the Later Lê dynasty'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), 'helped stabilize relations between the two rival dynasties'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), 'often mistaken for her sister'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), 'influenced Vietnamese literature through emotional and personal writings, especially in the patriotic spirit'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), 'known for her eloquent poetry that reflected sorrow and patriotism'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), 'her literary works expressed her grief and political insight, particularly mourning the passing of Quang Trung');

INSERT INTO Spouses (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), 'Quang Trung', 'strengthen the relationship between the Later Lê dynasty and the Tây Sơn army.');

INSERT INTO Works (HistoricalFigureID, Work)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), 'Ai Tư Vãn');

INSERT INTO Achievements (HistoricalFigureID, Achievement)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), 'her famous poem "Ai Tư Vãn" mourns the death of Emperor Quang Trung');

-- Lê Nhân Tông --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Lê Nhân Tông', 'Male', 'Lê Bang Cơ', 'Đông Kinh (Hà Nội), Vietnam', 'Dai Viet', 'Later Lê Dynasty', '15th', '1441', '1459', 'Lê Nhân Tông (1441–1459) was the fourth emperor of the Later Lê dynasty. He was known for his efforts in consolidating power and stabilizing the realm following his father Lê Thái Tổ\'s reign. Despite his young age, he successfully managed state affairs, promoted Confucian ideals, and encouraged scholarly pursuits. Lê Nhân Tông was also a patron of literature, composing several poems that reflected his deep appreciation for arts and culture. His reign, though short, was marked by peace and prosperity, with notable contributions to the development of the Later Lê dynasty.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), NULL, 'royal family', 'Later le Dynasty');

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), 'Politics'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), 'Military'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), 'Literature');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), 'Emperor'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), 'Poet');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), 'unifying the country, stabilizing the reign, and establishing a legal system'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), 'a monarch with significant contributions to the nation\'s stability and the development of the Later Lê dynasty'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), 'known for effective governance and social stability'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), 'virtuous, respects Confucianism, is not addicted to alcohol and sex, and knows how to listen to advice'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), 'enthroned at 1 year old'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), 'personally took power at the age of 12'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), 'his mother took the power'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), 'murdered by his half-blood brother to usurp the throne'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), 'defeated and subdued Champa'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), 'territorially expanded: merged Bon Man'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), 'writes many poems, reflecting the literary style of his time'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), 'created poetry, highly interested in literature, especially poetry'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), 'recognized as a literary-minded ruler of the Later Lê dynasty, remembered for his famous poems'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), 'a lover of poetry and learning'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), 'an accomplished emperor not only in politics but also in literature, creating renowned works that are still celebrated today');

-- Lê Ninh --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Lê Ninh', 'Male', 'Lê Ninh', 'Trung Lễ, Đức Thọ, Hà Tĩnh, Vietnam', 'Vietnamese', 'modern', '19th', '1857', '1887', 'Lê Ninh was the first to respond to the Cần Vương edict in Nghệ-Tĩnh, organizing resistance against French forces. His leadership in battles like the capture of Hà Tĩnh and the defense of Trung Lễ earned him recognition. His efforts laid the foundation for further resistance, even though his life was short.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ninh'), NULL, 'His father was Bố Chính Bình Định', NULL);

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ninh'), 'Military');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ninh'), 'Leader');

INSERT INTO OtherNames (HistoricalFigureID, OtherName) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ninh'), 'Mạnh Khang');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ninh'), 'led the first uprising in Nghệ-Tĩnh region against French colonial forces following the Cần Vương edict'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ninh'), 'captured Hà Tĩnh'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ninh'), 'known for his leadership and resistance against French occupation in Nghệ-Tĩnh'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ninh'), 'his efforts inspired other uprisings'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ninh'), 'skilled in literature and poetry, left several written works'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ninh'), 'numerous war strategies and leadership during the Cần Vương movement') ;

INSERT INTO Works (HistoricalFigureID, Work)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ninh'), 'Poem: "Tự vịnh"');

-- Lê Phụ Trần --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Lê Phụ Trần', 'Male', 'Lê Tần', 'Ái Châu, Vietnam', 'Dai Viet', 'Tran Dynasty', '13th', NULL, NULL, 'Lê Phụ Trần (c. 13th century), a distinguished general and diplomat during the early Trần dynasty, played a pivotal role in defending Đại Việt against Mongol invasions in 1257-1258. Known for his courage and military strategy, he was highly trusted by Trần Thái Tông. As a skilled envoy, he also helped secure diplomatic relations with the Mongol Empire, negotiating tribute agreements that maintained Đại Việt\'s independence. Despite his military prowess, his literary talents earned him the admiration of contemporaries, and his legacy lived on through his contributions in both warfare and diplomacy.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), NULL, 'noble', NULL);

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), 'Military'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), 'Politics');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), 'General'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), 'Advisor to the Trần dynasty'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), 'Envoy'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), 'Diplomat to the Yuan dynasty');

INSERT INTO OtherNames (HistoricalFigureID, OtherName) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), 'Lê Tần');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), 'defended Đại Việt during Mongol invasions of 1257-1258'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), 'key strategist in major battles, including Đông Bộ Đầu'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), 'protected Trần Thái Tông during combat'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), 'sent as an envoy to the Mongol Empire; negotiated regular tribute agreements, establishing stable relations between Đại Việt and Yuan'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), 'played a key role in diplomacy with Yuan, securing peace and economic stability for Đại Việt'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), 'given the royal family name by the emperor'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), 'participated in key battles and helped lead the defense against Mongol invaders under Trần Thái Tông');

INSERT INTO Works (HistoricalFigureID, Work)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), 'Poetic works and military writings (although largely lost)'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), 'Diplomatic writings and agreements with the Mongol Empire');

INSERT INTO Spouses (HistoricalFigureID, Name, OtherInfor)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), 'Lý Chiêu Hoàng', NULL);

-- Lê Phụng Hiểu --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Lê Phụng Hiểu', 'Male', 'Lê Phụng Hiểu', 'Băng Sơn, Thanh Hóa', 'Dai Viet', 'Lý Dynasty', '11th Century', '982', '1059?', 'Lê Phụng Hiểu was a military hero during the Lý Dynasty, known for his strength and bravery. He played a crucial role in quelling internal revolts and defending the nation against external threats, such as the Champa. His loyalty to the Lý dynasty helped stabilize the rule of King Lý Thái Tông. Revered for his martial skills, he remains a symbol of patriotism and military excellence in Vietnam.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụng Hiểu'), 'Poor', 'Farmer, Soldier', NULL);

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụng Hiểu'), 'Military');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụng Hiểu'), 'Đô thống Thượng tướng quân');

INSERT INTO OtherNames (HistoricalFigureID, OtherName) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụng Hiểu'), 'Đô Bưng (Băng)');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụng Hiểu'), 'defeated the Tam Vương revolt'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụng Hiểu'), 'famous for his strength, famous wrestler'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụng Hiểu'), 'didnt go to school'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụng Hiểu'), 'led the defense against Champa'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụng Hiểu'), 'helped secure the Lý dynasty\'s rule'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụng Hiểu'), 'supported Lý Thái Tông\'s rise to power'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụng Hiểu'), 'influential in maintaining peace and order in Đại Việt'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụng Hiểu'), 'honored by local deities');

-- Lê Quang Bí --
INSERT INTO HistoricalFigures (HistoricalFigures, Gender, RealName, Hometown, Nationality, PeriodOfActivity, Century, BirthYear, DeathYear, ShortIntroduction) 
VALUES ('Lê Quang Bí', 'Male', 'Lê Quang Bí', 'Mộ Trạch, Hải Dương', 'Đại Việt', 'Mạc Dynasty', '16th Century', '1506', 'Unknown', 'Lê Quang Bí was a Vietnamese poet and diplomat during the Mạc Dynasty. He is most notable for his diplomatic mission to China where he was detained for 18 years. Despite the hardships, he maintained his honor and integrity, and he was admired for his dedication to his country and literary achievements. His poems, especially "Tô Công Phụng Sứ," reflect his personal experiences and the trials of his mission.');

INSERT INTO FamilyBackground (HistoricalFigureID, EconomicStatus, Occupation, OtherInfor) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Quang Bí'), NULL, 'None', NULL);

INSERT INTO Fields (HistoricalFigureID, Field)
VALUES
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Quang Bí'), 'Literature'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Quang Bí'), 'Diplomacy');

INSERT INTO Positions (HistoricalFigureID, Position)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Quang Bí'), 'Royal official'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Quang Bí'), 'Poet'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Quang Bí'), 'Envoy');

INSERT INTO OtherNames (HistoricalFigureID, OtherName) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Quang Bí'), 'Hối Trai');

INSERT INTO Achievements (HistoricalFigureID, Achievement) 
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Quang Bí'), 'Diplomatic mission to the Ming Dynasty; detained in China for 18 years'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Quang Bí'), 'Known for loyalty to the Mạc dynasty; wrote poetry during his captivity'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Quang Bí'), 'Famous for maintaining honor and integrity during long imprisonment, likened to Tô Vũ of the Han Dynasty');

INSERT INTO Works (HistoricalFigureID, Work)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Quang Bí'), 'Tô Công Phụng Sứ'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Quang Bí'), 'Tư Lương Vận Lục');











































-- Relationship between historical figures -- 

-- An Dương Vương --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'An Dương Vương'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Mỵ Châu'), 'Father-Daughter');

-- An Tư --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'An Tư'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Thánh Tông'), 'Sister - Brother') ,
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'An Tư'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Nhân Tông'), 'Aunt - Nephew') ,
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'An Tư'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Thái Tông'), 'Daughter - Father');

-- Âu Cơ --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Âu Cơ'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lạc Long Quân'), 'Spouse') ;

-- Bà Triệu --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bà Triệu'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hai Bà Trưng'), 'Servant - Master');

-- Bảo Đại -- 
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bảo Đại'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Empress Nam Phương'), 'Spouse'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bảo Đại'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đồng Khánh'), 'grandson - grandfather'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bảo Đại'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Emperor Khải Định'), 'Son - Father') ;

-- Bằng Việt --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bằng Việt'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lưu Quang Vũ'), 'cooperators');

-- Lý Chiêu Hoàng --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lý Chiêu Hoàng'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Thái Tông'), 'spouse'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lý Chiêu Hoàng'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), 'spouse'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lý Chiêu Hoàng'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Thuận Thiên'), 'Sister'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lý Chiêu Hoàng'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Thị Dung'), 'Mother - Daughter'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lý Chiêu Hoàng'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lý Huệ Tông'), 'Father - Daughter'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lý Chiêu Hoàng'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Bình Trọng'), 'Son - Mother'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lý Chiêu Hoàng'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Thiên Thành'), 'Daughter - Mother');

-- Đinh Tiên Hoàng --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Tiên Hoàng'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Phế Đế'), 'Father - Son'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Tiên Hoàng'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Thích'), 'Enemies'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Tiên Hoàng'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Liễn'), 'Father-Son'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Tiên Hoàng'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Thuận'), 'Master - Servant'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Tiên Hoàng'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Vân Nga'), 'Husband - Wife');

-- Bùi Thị Xuân --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Thị Xuân'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Quang Trung'), 'Servant - Master'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bùi Thị Xuân'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Quang Diệu'), 'Spouse') ;

-- Đặng Thai Mai -- 
insert into Relationships (Person1_ID, Person2_ID, Relationship_Type)
values 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đặng Thai Mai'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Võ Nguyên Giáp'), 'father in law - son in law'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đặng Thai Mai'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đặng Hồng Sơn'), 'father in law - son in law');

-- Đinh Liễn -- 
insert into Relationships (Person1_ID, Person2_ID, Relationship_Type)
values 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Liễn'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Phế Đế'), 'brother') ,
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Liễn'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đỗ Thích'), 'Enemies');

-- Đinh Phế Đế --
insert into Relationships (Person1_ID, Person2_ID, Relationship_Type)
values 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Phế Đế'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Vân Nga'), 'son - mother') ;

-- Đoàn Hữu Trưng --
insert into Relationships (Person1_ID, Person2_ID, Relationship_Type)
values 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Hữu Trưng'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Tự Đức'), 'enemies') ;

-- Đoàn Nhữ Hải --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Nhữ Hải'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Anh Tông'), 'Servant - Master'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Nhữ Hải'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Nhân Tông'), 'Servant - Master'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đoàn Nhữ Hải'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Hiến Tông'), 'Servant - Master');

-- Đốc Ngữ --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đốc Ngữ'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Nguyễn Văn Giáp'), 'companions'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đốc Ngữ'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Nguyễn Quang Bích'), 'companions');

-- Đồng Khánh -- 
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đồng Khánh'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Tự Đức'), 'Adopted child - foster father'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đồng Khánh'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Khải Định'), 'Father - Son'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đồng Khánh'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Kiến Phúc'), 'Brothers'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đồng Khánh'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hàm Nghi'), 'Brothers');

-- Dục Đức -- 
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dục Đức'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Tự Đức'), 'Adopted child - foster father'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dục Đức'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Nguyễn Văn Tường'), 'enemies'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dục Đức'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Duy Tân'), 'grandfather - grandson'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dục Đức'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Tôn Thất Thuyết'), 'enemies'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dục Đức'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Thành Thái'), 'Father - Son');

-- Dương Đình Nghệ --
insert into Relationships (Person1_ID, Person2_ID, Relationship_Type)
values 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Đình Nghệ'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ngô Quyền'), 'father in law - son in law') ;

-- Dương Trực Nguyên --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Trực Nguyên'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thánh Tông'), 'Servant - Master'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Trực Nguyên'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hiến Tông' and RealName = 'Lê Tranh'), 'Servant - Master'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Trực Nguyên'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Uy Mục'), 'Servant - Master');

-- Dương Vân Nga --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Vân Nga'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), 'Spouse'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Vân Nga'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thị Phất Ngân'), 'Mother - Daughter'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Vân Nga'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lý Thái Tông'), 'Grandmother - grandson'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Trực Nguyên'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lý Thái Tổ'), 'Mother in law - Son in law');

-- Duy Tan --
insert into relationships (Person1_ID, Person2_ID, Relationship_Type)
values 
((select ID from HistoricalFigures where historicalfigures = 'Thành Thái'), (select ID from HistoricalFigures where historicalfigures = 'Duy Tân'), 'father - son'),
((select ID from HistoricalFigures where historicalfigures = 'Duy Tân'), (select ID from HistoricalFigures where historicalfigures = 'Trần Cao Vân'), 'ally'),
((select ID from HistoricalFigures where historicalfigures = 'Duy Tân'), (select ID from HistoricalFigures where historicalfigures = 'Thái Phiên'), 'ally');

-- Gia Long --
insert into relationships (Person1_ID, Person2_ID, Relationship_Type)
values 
((select ID from HistoricalFigures where historicalfigures = 'Gia Long'), (select ID from HistoricalFigures where historicalfigures = 'Quang Trung'), 'enemies'),
((select ID from HistoricalFigures where historicalfigures = 'Gia Long'), (select ID from HistoricalFigures where historicalfigures = 'Nguyễn Quang Toản'), 'enemies'),
((select ID from HistoricalFigures where historicalfigures = 'Gia Long'), (select ID from HistoricalFigures where historicalfigures = 'Lê Thị Ngọc Bình'), 'Spouse'),
((select ID from HistoricalFigures where historicalfigures = 'Gia Long'), (select ID from HistoricalFigures where historicalfigures = 'Lê Ngọc Hân'), 'sister in law - brother in law'),
((select ID from HistoricalFigures where historicalfigures = 'Gia Long'), (select ID from HistoricalFigures where historicalfigures = 'Lê Hiển Tông' and RealName = 'Lê Duy Diêu'), 'Son-in-law'),
((select ID from HistoricalFigures where historicalfigures = 'Gia Long'), (select ID from HistoricalFigures where historicalfigures = 'Quang Trung'), 'Co-brother-in-law') ;

-- Giang Văn Minh --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Giang Văn Minh'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thần Tông'), 'servant - master');

-- Hàm Nghi --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hàm Nghi'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Kiến Phúc'), 'Brothers'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hàm Nghi'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Tôn Thất Thuyết'), 'Master - Servant'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hàm Nghi'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Nguyễn Văn Tường'), 'Master - Servant'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hàm Nghi'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trương Quang Ngọc'), 'enemies');

-- Hàn Mặc Tử --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hàn Mặc Tử'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Chế Lan Viên'), 'friends');

-- Hiệp Hòa --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hiệp Hòa'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Thiệu Trị'), 'son - father'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hiệp Hòa'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Tôn Thất Thuyết'), 'enemies'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hiệp Hòa'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Nguyễn Văn Tường'), 'enemies');

-- Hồ Hán Thương --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Hán Thương'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Quý Ly'), 'son - father'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Hán Thương'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Minh Tông'), 'grandson - grandfather'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Hán Thương'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Nguyên Trừng'), 'brothers'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Hán Thương'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Nghệ Tông'), 'nephew - uncle');

-- Hồ Nguyên Trừng --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Nguyên Trừng'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Quý Ly'), 'son - father'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Nguyên Trừng'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Nghệ Tông'), 'servant - master'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Hán Thương'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Phế Đế'), 'servant - master'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Hán Thương'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Thuận Tông'), 'servant - master');

-- Hồ Quý Ly --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Quý Ly'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = ' Trần Minh Tông'), 'nephew in law - uncle in law'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Quý Ly'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Nghệ Tông'), 'cousins'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Quý Ly'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Duệ Tông'), 'cousins'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Quý Ly'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Minh Tông'), 'son in law - father in law');

-- Hồ Tùng Mậu -- 
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Tùng Mậu'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đặng Xuân Thanh'), 'Comrade'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Tùng Mậu'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Chí Minh'), 'Comrade'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Tùng Mậu'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = ' Lê Hồng Phong'), 'Comrade'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Tùng Mậu'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Phạm Hồng Thái'), 'Comrade'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Tùng Mậu'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Sơn'), 'Comrade');

-- Hồ Xuân Hương --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Xuân Hương'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Phạm Đình Hổ'), 'lovers'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Xuân Hương'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Phạm Thái'), 'lovers'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Xuân Hương'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Nguyễn Du'), 'lovers'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Xuân Hương'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Phạm Quý Thích'), 'lovers');

-- Hoàng Cao Khải --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Cao Khải'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đồng Khánh'), 'serveur - master');

-- Hoàng Đạo Thúy --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Đạo Thúy'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Duy Hưng'), 'Comrade'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Đạo Thúy'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Tạ Quang Bửu'), 'Comrade'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Đạo Thúy'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Văn Thụ'), 'Comrade'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Đạo Thúy'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Đăng Ninh'), 'Comrade'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Đạo Thúy'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trường Chinh'), 'Comrade');


-- Hoàng Hoa Thám --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Hoa Thám'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Phan Bội Châu'), 'Ally'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Hoa Thám'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đề Kiều'), 'Companions'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Hoa Thám'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Phan Châu Trinh'), 'Ally');

-- Hoàng Kế Viêm --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Kế Viêm'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Minh Mạng'), 'Son in law - Father in law'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Kế Viêm'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Tự Đức'), 'Serveur - Master'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Kế Viêm'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đồng Khánh'), 'Serveur - Master'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Kế Viêm'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Tôn Thất Thuyết'), 'coworkers'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Kế Viêm'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Triệu Trị'), 'Serveur - Master');

-- Hoàng Minh Giám --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Minh Giám'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Tăng Bí'), 'son - father');

-- Hoàng Trọng Mậu --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Trọng Mậu'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Duy Tân'), 'servant - master'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Trọng Mậu'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Phan Bội Châu'), 'companions');

-- Hoàng Văn Thái --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Văn Thái'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Đăng Ninh'), 'Student - Teacher'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Văn Thái'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Quốc Việt'), 'Student - Teacher'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Văn Thái'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Đạo Thúy'), 'companions');

-- Hứa Tam Tỉnh --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hứa Tam Tỉnh'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Uy Mục'), 'Serveur - Master'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hứa Tam Tỉnh'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Nguyễn Giản Thanh'), 'passed the royal examination in the same year'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hứa Tam Tỉnh'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Mạc Đăng Dung'), 'Serveur - Master');

-- Hùng Vương --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hùng Vương'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lạc Long Quân'), 'Son - Father'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hùng Vương'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Âu Cơ'), 'Son - Mother'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hùng Vương'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lang Liêu'), 'Father - Son'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hùng Vương'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Chử Đồng Tử'), 'Father in law - Son in law'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hùng Vương'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Thánh Gióng'), 'Master - Serveur'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hùng Vương'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Sơn Tinh'), 'Father in law - Son in law'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hùng Vương'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Mai An Tiêm'), 'Foster Father - Adopted son');

-- Huy Cận -- 
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Huy Cận'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Xuân Diệu'), 'brothers in law'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Huy Cận'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Xuân Diệu'), 'housemate'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Huy Cận'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Xuân Diệu'), 'friends');

-- Huyền Trân --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Huyền Trân'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Nhân Tông'), 'Daughter - Father'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Huyền Trân'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Anh Tông'), 'Younger sister - Older Brother'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Huyền Trân'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Bảo Thánh empress'), 'Daughter - Mother'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Huyền Trân'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Hưng Đạo'), 'Granddaughter - Grandfather');

-- Khải Định --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Khải Định'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Phan Chu Trinh'), 'enemies'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Khải Định'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Chí Minh'), 'enemies');

-- Kiến Phúc -- 
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Kiến Phúc'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Tự Đức'), 'Adopted child - foster father'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Kiến Phúc'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dục Đức'), 'adopted brothers'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Kiến Phúc'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Nguyễn Văn Tường'), 'enemies');

-- Kiều Công Tiễn --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Kiều Công Tiễn'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Đình Nghệ'), 'serveur - master'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Kiều Công Tiễn'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Ngô Quyền'), 'enemies'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Kiều Công Tiễn'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Công Trứ'), 'enemies'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Kiều Công Tiễn'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Đình Nghệ'), 'enemies');

-- Kinh Dương Vương -- 
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Kinh Dương Vương'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lạc Long Quân'), 'Father - Son');

-- Lâm Đức Thụ -- 
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lâm Đức Thụ'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), 'Comrade'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lâm Đức Thụ'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Tùng Mậu'), 'Comrade'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lâm Đức Thụ'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Phạm Hồng Thái'), 'Comrade'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lâm Đức Thụ'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Phan Bội Châu'), 'Comrade'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lâm Đức Thụ'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Phan Bội Châu'), 'traitor - victim'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lâm Đức Thụ'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Chí Minh'), 'Comrade');

-- Lê Anh Tông --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Anh Tông'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thế Tông'), 'father - son');

-- Lê Chân --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Chân'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hai Bà Trưng'), 'Servant - Master');

-- Lê Chân Tông --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Chân Tông'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thần Tông'), 'father - son');

-- Lê Chiêu Thống --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Chiêu Thống'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hiển Tông' and RealName = 'Lê Duy Diêu'), 'Grandson - Grandfather'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Chiêu Thống'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), 'nephew - aunt'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Chiêu Thống'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thị Ngọc Bình'), 'nephew - aunt'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Chiêu Thống'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Quang Trung'), 'nephew in law - uncle in law'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Chiêu Thống'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Gia Long'), 'nephew in law - uncle in law'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Chiêu Thống'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Quang Trung'), 'enemies');

-- Lê Công Hành --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Công Hành'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Mạc Đăng Dung'), 'Descendant - Ancestor'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Công Hành'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thần Tông'), 'Serveur - Master'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Công Hành'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Chân Tông'), 'Serveur - Master'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Công Hành'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Mạc Hiến Tông'), 'Descendant - Ancestor');

-- Lê Cung Hoàng --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Cung Hoàng'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Chiêu Tông'), 'brothers'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Cung Hoàng'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Mạc Đăng Dung'), 'Master - Serveur'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Cung Hoàng'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Mạc Đăng Dung'), 'enemies');

-- Lê Duy Phường --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Duy Phường'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Dụ Tông'), 'son - father'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Duy Phường'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thuần Tông'), 'brothers'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Duy Phường'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Duy Mật'), 'brothers'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Duy Phường'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ý Tông'), 'brothers');

-- Lê Dụ Tông  --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Dụ Tông'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hy Tông'), 'son - father'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Dụ Tông'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thuần Tông'), 'father - son'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Dụ Tông'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Duy Mật'), 'father - son'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Dụ Tông'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ý Tông'), 'father - son');

-- Lê Duẩn -- 
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Duẩn'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Nguyễn Văn Linh'), 'Comrade'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Duẩn'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Phạm Văn Đồng'), 'Comrade'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Duẩn'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đức Thọ'), 'Comrade'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Duẩn'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hoàng Văn Thái'), 'Comrade'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Duẩn'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Trọng Tấn'), 'Comrade'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Duẩn'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Chí Minh'), 'Comrade');

-- Lê Hiến Tông  --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hiến Tông' and RealName = 'Lê Tranh'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Túc Tông'), 'son - father'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hiến Tông' and RealName = 'Lê Tranh'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thánh Tông'), 'father - son'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hiến Tông' and RealName = 'Lê Tranh'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Uy Mục'), 'father - son');

-- Lê Hiển Tông -- 
insert into relationships (Person1_ID, Person2_ID, Relationship_Type) 
values 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hiến Tông' and RealName = 'Lê Duy Diêu'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thuần Tông'), 'son - father'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hiến Tông' and RealName = 'Lê Duy Diêu'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ý Tông'), 'brothers'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hiến Tông' and RealName = 'Lê Duy Diêu'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Chiêu Thống'), 'grandfather - grandson'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hiến Tông' and RealName = 'Lê Duy Diêu'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thị Ngọc Bình'), 'father - daughter'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hiến Tông' and RealName = 'Lê Duy Diêu'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), 'father - daughter'),
((select ID from HistoricalFigures where historicalfigures = 'Lê Hiển Tông' and RealName = 'Lê Duy Diêu'), (select ID from HistoricalFigures where historicalfigures = 'Quang Trung'), 'Father in law - son in law') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Hiển Tông' and RealName = 'Lê Duy Diêu'), (select ID from HistoricalFigures where historicalfigures = 'Quang Toản'), 'Father in law - son in law') ,
((select ID from HistoricalFigures where historicalfigures = 'Lê Hiển Tông' and RealName = 'Lê Duy Diêu'), (select ID from HistoricalFigures where historicalfigures = 'Gia Long'), 'Father in law - son in law') ;

-- Lê Đại Hành --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Liễn'), 'Servant - Master'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Đinh Tiên Hoàng'), 'Servant - Master'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), 'Father - son'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Dương Vân Nga'), 'Spouse'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Trung Tông'), 'Father - son'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thị Phất Ngân'), 'Father - Daughter'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lý Thái Tông'), 'Grandfather - grandson'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lý Thái Tổ'), 'father in law - son in law');

-- Lê Hồng Phong -- 
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Nguyễn Thị Minh Khai'), 'spouse'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Phạm Hồng Thái'), 'compatriot'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Võ Nguyên Giáp'), 'Co-brother-in-law'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hà Huy Tập'), 'companions');

-- Lê Hồng Sơn -- 
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Sơn'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Phong'), 'companions'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Sơn'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Phạm Hồng Thái'), 'companions'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Sơn'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hồ Tùng Mậu'), 'companions'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hồng Sơn'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Nguyễn Ái Quốc'), 'companions');

-- Lê Huyền Tông --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Huyền Tông'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thần Tông'), 'son - father'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Huyền Tông'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hy Tông'), 'brothers'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Huyền Tông'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Chân Tông'), 'brothers');

-- Lê Hy Tông --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hy Tông'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thần Tông'), 'son - father'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Hy Tông'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Dụ Tông'), 'father - son');

-- Lê Kính Tông --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Kính Tông'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thế Tông'), 'son - father'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Kính Tông'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thần Tông'), 'father - son');

-- Lê Lai --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Lai'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thái Tổ'), 'Servant - Master'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Lai'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Nguyễn Trãi'), 'companions'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Lai'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Sát'), 'companions');

-- Lê Thái Tổ --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thái Tổ'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Sát'), 'Master - Servant'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thái Tổ'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Nguyễn Trãi'), 'Master - Servant'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thái Tổ'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thái Tông'), 'father - son');

-- Lê Ngọa Triều Đế --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Trung Tông'), 'brothers'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thị Phất Ngân'), 'siblings'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọa Triều Đế'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lý Thái Tổ'), 'brothers-in-law');

-- Lê Ngọc Hân --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thị Ngọc Bình'), 'sisters'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Quang Trung'), 'spouses'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ngọc Hân'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Chiêu Thống'), 'aunt - nephew');

-- Lê Nhân Tông --
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thái Tông'), 'son - father'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nghi Dân'), 'brothers'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Nhân Tông'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Thánh Tông'), 'brothers');

-- Lê Ninh -- 
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ninh'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Hàm Nghi'), 'servant - master'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ninh'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Tôn Thất Thuyết'), 'companions'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Ninh'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Trực'), 'brother');

-- Lê Phụ Trần -- 
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Thái Tông'), 'servant - master'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Đại Hành'), 'descendant - ancestor'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụ Trần'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Trần Bình Trọng'), 'father - son');

-- Lê Phụng Hiểu -- 
INSERT INTO Relationships (Person1_ID, Person2_ID, Relationship_Type)
VALUES 
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụng Hiểu'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lý Thái Tổ'), 'servant - master'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụng Hiểu'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lý Thái Tông'), 'servant - master'),
((SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lê Phụng Hiểu'), (SELECT ID FROM HistoricalFigures WHERE HistoricalFigures = 'Lý Thánh Tông'), 'servant - master');























































-- joint data -- 
SELECT 
    h.ID AS HistoricalFigureID,
    h.HistoricalFigures AS Name,
    h.Gender,
    h.RealName,
    h.Hometown,
    h.Nationality,
    h.PeriodOfActivity,
    h.Century,
    h.BirthYear,
    h.DeathYear,
    h.ShortIntroduction,
    fb.EconomicStatus,
    fb.Occupation,
    fb.OtherInfor AS FamilyInfo,
    f.Field,
    p.Position,
    a.Achievement,
    w.Work,
    s.Name AS SpouseName,
    s.OtherInfor AS SpouseInfo,
    r.Relationship_Type,
    r.Person2_ID
FROM HistoricalFigures h
LEFT JOIN FamilyBackground fb ON h.ID = fb.HistoricalFigureID
LEFT JOIN Fields f ON h.ID = f.HistoricalFigureID
LEFT JOIN Positions p ON h.ID = p.HistoricalFigureID
LEFT JOIN Achievements a ON h.ID = a.HistoricalFigureID
LEFT JOIN Works w ON h.ID = w.HistoricalFigureID
LEFT JOIN Spouses s ON h.ID = s.HistoricalFigureID
LEFT JOIN Relationships r ON h.ID = r.Person1_ID
ORDER BY h.ID;