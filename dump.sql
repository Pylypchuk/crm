CREATE TABLE client
(
    id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    status ENUM('active', 'inactive', 'blacklisted') NOT NULL,
    country VARCHAR(2) NOT NULL,
    note TEXT
)ENGINE=INNODB;

CREATE TABLE countries
(
    country_code VARCHAR(2) PRIMARY KEY NOT NULL,
    country_name VARCHAR(100) NOT NULL
)ENGINE=INNODB;

CREATE TABLE user
(
    id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    subscription_type ENUM('company', 'individual') NOT NULL,
    company VARCHAR(255),
    country VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    auth_key VARCHAR(32) NOT NULL
)ENGINE=INNODB;

CREATE TABLE payment_type
(
    id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
)ENGINE=INNODB;

CREATE TABLE payments
(
    id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    type INT(11) NOT NULL,
    description TEXT NOT NULL,
    created_by INT(11) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    client_id INT(11) NOT NULL
)ENGINE=INNODB;

ALTER TABLE client ADD FOREIGN KEY (country) REFERENCES countries (country_code);
CREATE INDEX client_country_fk ON client (country);

CREATE UNIQUE INDEX client_name_uindex ON client (name);
CREATE UNIQUE INDEX user_auth_key_uindex ON user (auth_key);
CREATE UNIQUE INDEX user_email_uindex ON user (email);
CREATE UNIQUE INDEX user_username_uindex ON user (username);
CREATE UNIQUE INDEX payment_type_name_uindex ON payment_type (name);

ALTER TABLE payments ADD FOREIGN KEY (type) REFERENCES payment_type (id);
ALTER TABLE payments ADD FOREIGN KEY (created_by) REFERENCES user (id);
ALTER TABLE payments ADD FOREIGN KEY (client_id) REFERENCES client (id) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE INDEX payments_client_id_fk ON payments (client_id);
CREATE INDEX payments_created_by_fk ON payments (created_by);
CREATE INDEX payments_type_fk ON payments (type);

INSERT INTO crm.countries (country_code, country_name) VALUES ('AD', 'Andorra');
INSERT INTO crm.countries (country_code, country_name) VALUES ('AE', 'United Arab Emirates');
INSERT INTO crm.countries (country_code, country_name) VALUES ('AF', 'Afghanistan');
INSERT INTO crm.countries (country_code, country_name) VALUES ('AG', 'Antigua and Barbuda');
INSERT INTO crm.countries (country_code, country_name) VALUES ('AI', 'Anguilla');
INSERT INTO crm.countries (country_code, country_name) VALUES ('AL', 'Albania');
INSERT INTO crm.countries (country_code, country_name) VALUES ('AM', 'Armenia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('AN', 'Netherlands Antilles');
INSERT INTO crm.countries (country_code, country_name) VALUES ('AO', 'Angola');
INSERT INTO crm.countries (country_code, country_name) VALUES ('AQ', 'Antarctica');
INSERT INTO crm.countries (country_code, country_name) VALUES ('AR', 'Argentina');
INSERT INTO crm.countries (country_code, country_name) VALUES ('AT', 'Austria');
INSERT INTO crm.countries (country_code, country_name) VALUES ('AU', 'Australia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('AW', 'Aruba');
INSERT INTO crm.countries (country_code, country_name) VALUES ('AZ', 'Azerbaijan');
INSERT INTO crm.countries (country_code, country_name) VALUES ('BA', 'Bosnia and Herzegovina');
INSERT INTO crm.countries (country_code, country_name) VALUES ('BB', 'Barbados');
INSERT INTO crm.countries (country_code, country_name) VALUES ('BD', 'Bangladesh');
INSERT INTO crm.countries (country_code, country_name) VALUES ('BE', 'Belgium');
INSERT INTO crm.countries (country_code, country_name) VALUES ('BF', 'Burkina Faso');
INSERT INTO crm.countries (country_code, country_name) VALUES ('BG', 'Bulgaria');
INSERT INTO crm.countries (country_code, country_name) VALUES ('BH', 'Bahrain');
INSERT INTO crm.countries (country_code, country_name) VALUES ('BI', 'Burundi');
INSERT INTO crm.countries (country_code, country_name) VALUES ('BJ', 'Benin');
INSERT INTO crm.countries (country_code, country_name) VALUES ('BM', 'Bermuda');
INSERT INTO crm.countries (country_code, country_name) VALUES ('BN', 'Brunei Darussalam');
INSERT INTO crm.countries (country_code, country_name) VALUES ('BO', 'Bolivia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('BR', 'Brazil');
INSERT INTO crm.countries (country_code, country_name) VALUES ('BS', 'Bahamas');
INSERT INTO crm.countries (country_code, country_name) VALUES ('BT', 'Bhutan');
INSERT INTO crm.countries (country_code, country_name) VALUES ('BV', 'Bouvet Island');
INSERT INTO crm.countries (country_code, country_name) VALUES ('BW', 'Botswana');
INSERT INTO crm.countries (country_code, country_name) VALUES ('BY', 'Belarus');
INSERT INTO crm.countries (country_code, country_name) VALUES ('BZ', 'Belize');
INSERT INTO crm.countries (country_code, country_name) VALUES ('CA', 'Canada');
INSERT INTO crm.countries (country_code, country_name) VALUES ('CC', 'Cocos (Keeling) Islands');
INSERT INTO crm.countries (country_code, country_name) VALUES ('CF', 'Central African Republic');
INSERT INTO crm.countries (country_code, country_name) VALUES ('CG', 'Congo');
INSERT INTO crm.countries (country_code, country_name) VALUES ('CH', 'Switzerland');
INSERT INTO crm.countries (country_code, country_name) VALUES ('CI', 'Ivory Coast');
INSERT INTO crm.countries (country_code, country_name) VALUES ('CK', 'Cook Islands');
INSERT INTO crm.countries (country_code, country_name) VALUES ('CL', 'Chile');
INSERT INTO crm.countries (country_code, country_name) VALUES ('CM', 'Cameroon');
INSERT INTO crm.countries (country_code, country_name) VALUES ('CN', 'China');
INSERT INTO crm.countries (country_code, country_name) VALUES ('CO', 'Colombia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('CR', 'Costa Rica');
INSERT INTO crm.countries (country_code, country_name) VALUES ('CU', 'Cuba');
INSERT INTO crm.countries (country_code, country_name) VALUES ('CV', 'Cape Verde');
INSERT INTO crm.countries (country_code, country_name) VALUES ('CX', 'Christmas Island');
INSERT INTO crm.countries (country_code, country_name) VALUES ('CY', 'Cyprus');
INSERT INTO crm.countries (country_code, country_name) VALUES ('CZ', 'Czech Republic');
INSERT INTO crm.countries (country_code, country_name) VALUES ('DE', 'Germany');
INSERT INTO crm.countries (country_code, country_name) VALUES ('DJ', 'Djibouti');
INSERT INTO crm.countries (country_code, country_name) VALUES ('DK', 'Denmark');
INSERT INTO crm.countries (country_code, country_name) VALUES ('DM', 'Dominica');
INSERT INTO crm.countries (country_code, country_name) VALUES ('DO', 'Dominican Republic');
INSERT INTO crm.countries (country_code, country_name) VALUES ('DS', 'American Samoa');
INSERT INTO crm.countries (country_code, country_name) VALUES ('DZ', 'Algeria');
INSERT INTO crm.countries (country_code, country_name) VALUES ('EC', 'Ecuador');
INSERT INTO crm.countries (country_code, country_name) VALUES ('EE', 'Estonia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('EG', 'Egypt');
INSERT INTO crm.countries (country_code, country_name) VALUES ('EH', 'Western Sahara');
INSERT INTO crm.countries (country_code, country_name) VALUES ('ER', 'Eritrea');
INSERT INTO crm.countries (country_code, country_name) VALUES ('ES', 'Spain');
INSERT INTO crm.countries (country_code, country_name) VALUES ('ET', 'Ethiopia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('FI', 'Finland');
INSERT INTO crm.countries (country_code, country_name) VALUES ('FJ', 'Fiji');
INSERT INTO crm.countries (country_code, country_name) VALUES ('FK', 'Falkland Islands (Malvinas)');
INSERT INTO crm.countries (country_code, country_name) VALUES ('FM', 'Micronesia, Federated States of');
INSERT INTO crm.countries (country_code, country_name) VALUES ('FO', 'Faroe Islands');
INSERT INTO crm.countries (country_code, country_name) VALUES ('FR', 'France');
INSERT INTO crm.countries (country_code, country_name) VALUES ('FX', 'France, Metropolitan');
INSERT INTO crm.countries (country_code, country_name) VALUES ('GA', 'Gabon');
INSERT INTO crm.countries (country_code, country_name) VALUES ('GB', 'United Kingdom');
INSERT INTO crm.countries (country_code, country_name) VALUES ('GD', 'Grenada');
INSERT INTO crm.countries (country_code, country_name) VALUES ('GE', 'Georgia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('GF', 'French Guiana');
INSERT INTO crm.countries (country_code, country_name) VALUES ('GH', 'Ghana');
INSERT INTO crm.countries (country_code, country_name) VALUES ('GI', 'Gibraltar');
INSERT INTO crm.countries (country_code, country_name) VALUES ('GK', 'Guernsey');
INSERT INTO crm.countries (country_code, country_name) VALUES ('GL', 'Greenland');
INSERT INTO crm.countries (country_code, country_name) VALUES ('GM', 'Gambia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('GN', 'Guinea');
INSERT INTO crm.countries (country_code, country_name) VALUES ('GP', 'Guadeloupe');
INSERT INTO crm.countries (country_code, country_name) VALUES ('GQ', 'Equatorial Guinea');
INSERT INTO crm.countries (country_code, country_name) VALUES ('GR', 'Greece');
INSERT INTO crm.countries (country_code, country_name) VALUES ('GS', 'South Georgia South Sandwich Islands');
INSERT INTO crm.countries (country_code, country_name) VALUES ('GT', 'Guatemala');
INSERT INTO crm.countries (country_code, country_name) VALUES ('GU', 'Guam');
INSERT INTO crm.countries (country_code, country_name) VALUES ('GW', 'Guinea-Bissau');
INSERT INTO crm.countries (country_code, country_name) VALUES ('GY', 'Guyana');
INSERT INTO crm.countries (country_code, country_name) VALUES ('HK', 'Hong Kong');
INSERT INTO crm.countries (country_code, country_name) VALUES ('HM', 'Heard and Mc Donald Islands');
INSERT INTO crm.countries (country_code, country_name) VALUES ('HN', 'Honduras');
INSERT INTO crm.countries (country_code, country_name) VALUES ('HR', 'Croatia (Hrvatska)');
INSERT INTO crm.countries (country_code, country_name) VALUES ('HT', 'Haiti');
INSERT INTO crm.countries (country_code, country_name) VALUES ('HU', 'Hungary');
INSERT INTO crm.countries (country_code, country_name) VALUES ('ID', 'Indonesia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('IE', 'Ireland');
INSERT INTO crm.countries (country_code, country_name) VALUES ('IL', 'Israel');
INSERT INTO crm.countries (country_code, country_name) VALUES ('IM', 'Isle of Man');
INSERT INTO crm.countries (country_code, country_name) VALUES ('IN', 'India');
INSERT INTO crm.countries (country_code, country_name) VALUES ('IO', 'British Indian Ocean Territory');
INSERT INTO crm.countries (country_code, country_name) VALUES ('IQ', 'Iraq');
INSERT INTO crm.countries (country_code, country_name) VALUES ('IR', 'Iran (Islamic Republic of)');
INSERT INTO crm.countries (country_code, country_name) VALUES ('IS', 'Iceland');
INSERT INTO crm.countries (country_code, country_name) VALUES ('IT', 'Italy');
INSERT INTO crm.countries (country_code, country_name) VALUES ('JE', 'Jersey');
INSERT INTO crm.countries (country_code, country_name) VALUES ('JM', 'Jamaica');
INSERT INTO crm.countries (country_code, country_name) VALUES ('JO', 'Jordan');
INSERT INTO crm.countries (country_code, country_name) VALUES ('JP', 'Japan');
INSERT INTO crm.countries (country_code, country_name) VALUES ('KE', 'Kenya');
INSERT INTO crm.countries (country_code, country_name) VALUES ('KG', 'Kyrgyzstan');
INSERT INTO crm.countries (country_code, country_name) VALUES ('KH', 'Cambodia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('KI', 'Kiribati');
INSERT INTO crm.countries (country_code, country_name) VALUES ('KM', 'Comoros');
INSERT INTO crm.countries (country_code, country_name) VALUES ('KN', 'Saint Kitts and Nevis');
INSERT INTO crm.countries (country_code, country_name) VALUES ('KP', 'Korea, Democratic People''s Republic of');
INSERT INTO crm.countries (country_code, country_name) VALUES ('KR', 'Korea, Republic of');
INSERT INTO crm.countries (country_code, country_name) VALUES ('KW', 'Kuwait');
INSERT INTO crm.countries (country_code, country_name) VALUES ('KY', 'Cayman Islands');
INSERT INTO crm.countries (country_code, country_name) VALUES ('KZ', 'Kazakhstan');
INSERT INTO crm.countries (country_code, country_name) VALUES ('LA', 'Lao People''s Democratic Republic');
INSERT INTO crm.countries (country_code, country_name) VALUES ('LB', 'Lebanon');
INSERT INTO crm.countries (country_code, country_name) VALUES ('LC', 'Saint Lucia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('LI', 'Liechtenstein');
INSERT INTO crm.countries (country_code, country_name) VALUES ('LK', 'Sri Lanka');
INSERT INTO crm.countries (country_code, country_name) VALUES ('LR', 'Liberia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('LS', 'Lesotho');
INSERT INTO crm.countries (country_code, country_name) VALUES ('LT', 'Lithuania');
INSERT INTO crm.countries (country_code, country_name) VALUES ('LU', 'Luxembourg');
INSERT INTO crm.countries (country_code, country_name) VALUES ('LV', 'Latvia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('LY', 'Libyan Arab Jamahiriya');
INSERT INTO crm.countries (country_code, country_name) VALUES ('MA', 'Morocco');
INSERT INTO crm.countries (country_code, country_name) VALUES ('MC', 'Monaco');
INSERT INTO crm.countries (country_code, country_name) VALUES ('MD', 'Moldova, Republic of');
INSERT INTO crm.countries (country_code, country_name) VALUES ('ME', 'Montenegro');
INSERT INTO crm.countries (country_code, country_name) VALUES ('MG', 'Madagascar');
INSERT INTO crm.countries (country_code, country_name) VALUES ('MH', 'Marshall Islands');
INSERT INTO crm.countries (country_code, country_name) VALUES ('MK', 'Macedonia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('ML', 'Mali');
INSERT INTO crm.countries (country_code, country_name) VALUES ('MM', 'Myanmar');
INSERT INTO crm.countries (country_code, country_name) VALUES ('MN', 'Mongolia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('MO', 'Macau');
INSERT INTO crm.countries (country_code, country_name) VALUES ('MP', 'Northern Mariana Islands');
INSERT INTO crm.countries (country_code, country_name) VALUES ('MQ', 'Martinique');
INSERT INTO crm.countries (country_code, country_name) VALUES ('MR', 'Mauritania');
INSERT INTO crm.countries (country_code, country_name) VALUES ('MS', 'Montserrat');
INSERT INTO crm.countries (country_code, country_name) VALUES ('MT', 'Malta');
INSERT INTO crm.countries (country_code, country_name) VALUES ('MU', 'Mauritius');
INSERT INTO crm.countries (country_code, country_name) VALUES ('MV', 'Maldives');
INSERT INTO crm.countries (country_code, country_name) VALUES ('MW', 'Malawi');
INSERT INTO crm.countries (country_code, country_name) VALUES ('MX', 'Mexico');
INSERT INTO crm.countries (country_code, country_name) VALUES ('MY', 'Malaysia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('MZ', 'Mozambique');
INSERT INTO crm.countries (country_code, country_name) VALUES ('NA', 'Namibia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('NC', 'New Caledonia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('NE', 'Niger');
INSERT INTO crm.countries (country_code, country_name) VALUES ('NF', 'Norfolk Island');
INSERT INTO crm.countries (country_code, country_name) VALUES ('NG', 'Nigeria');
INSERT INTO crm.countries (country_code, country_name) VALUES ('NI', 'Nicaragua');
INSERT INTO crm.countries (country_code, country_name) VALUES ('NL', 'Netherlands');
INSERT INTO crm.countries (country_code, country_name) VALUES ('NO', 'Norway');
INSERT INTO crm.countries (country_code, country_name) VALUES ('NP', 'Nepal');
INSERT INTO crm.countries (country_code, country_name) VALUES ('NR', 'Nauru');
INSERT INTO crm.countries (country_code, country_name) VALUES ('NU', 'Niue');
INSERT INTO crm.countries (country_code, country_name) VALUES ('NZ', 'New Zealand');
INSERT INTO crm.countries (country_code, country_name) VALUES ('OM', 'Oman');
INSERT INTO crm.countries (country_code, country_name) VALUES ('PA', 'Panama');
INSERT INTO crm.countries (country_code, country_name) VALUES ('PE', 'Peru');
INSERT INTO crm.countries (country_code, country_name) VALUES ('PF', 'French Polynesia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('PG', 'Papua New Guinea');
INSERT INTO crm.countries (country_code, country_name) VALUES ('PH', 'Philippines');
INSERT INTO crm.countries (country_code, country_name) VALUES ('PK', 'Pakistan');
INSERT INTO crm.countries (country_code, country_name) VALUES ('PL', 'Poland');
INSERT INTO crm.countries (country_code, country_name) VALUES ('PM', 'St. Pierre and Miquelon');
INSERT INTO crm.countries (country_code, country_name) VALUES ('PN', 'Pitcairn');
INSERT INTO crm.countries (country_code, country_name) VALUES ('PR', 'Puerto Rico');
INSERT INTO crm.countries (country_code, country_name) VALUES ('PS', 'Palestine');
INSERT INTO crm.countries (country_code, country_name) VALUES ('PT', 'Portugal');
INSERT INTO crm.countries (country_code, country_name) VALUES ('PW', 'Palau');
INSERT INTO crm.countries (country_code, country_name) VALUES ('PY', 'Paraguay');
INSERT INTO crm.countries (country_code, country_name) VALUES ('QA', 'Qatar');
INSERT INTO crm.countries (country_code, country_name) VALUES ('RE', 'Reunion');
INSERT INTO crm.countries (country_code, country_name) VALUES ('RO', 'Romania');
INSERT INTO crm.countries (country_code, country_name) VALUES ('RS', 'Serbia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('RU', 'Russian Federation');
INSERT INTO crm.countries (country_code, country_name) VALUES ('RW', 'Rwanda');
INSERT INTO crm.countries (country_code, country_name) VALUES ('SA', 'Saudi Arabia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('SB', 'Solomon Islands');
INSERT INTO crm.countries (country_code, country_name) VALUES ('SC', 'Seychelles');
INSERT INTO crm.countries (country_code, country_name) VALUES ('SD', 'Sudan');
INSERT INTO crm.countries (country_code, country_name) VALUES ('SE', 'Sweden');
INSERT INTO crm.countries (country_code, country_name) VALUES ('SG', 'Singapore');
INSERT INTO crm.countries (country_code, country_name) VALUES ('SH', 'St. Helena');
INSERT INTO crm.countries (country_code, country_name) VALUES ('SI', 'Slovenia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('SJ', 'Svalbard and Jan Mayen Islands');
INSERT INTO crm.countries (country_code, country_name) VALUES ('SK', 'Slovakia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('SL', 'Sierra Leone');
INSERT INTO crm.countries (country_code, country_name) VALUES ('SM', 'San Marino');
INSERT INTO crm.countries (country_code, country_name) VALUES ('SN', 'Senegal');
INSERT INTO crm.countries (country_code, country_name) VALUES ('SO', 'Somalia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('SR', 'Suriname');
INSERT INTO crm.countries (country_code, country_name) VALUES ('ST', 'Sao Tome and Principe');
INSERT INTO crm.countries (country_code, country_name) VALUES ('SV', 'El Salvador');
INSERT INTO crm.countries (country_code, country_name) VALUES ('SY', 'Syrian Arab Republic');
INSERT INTO crm.countries (country_code, country_name) VALUES ('SZ', 'Swaziland');
INSERT INTO crm.countries (country_code, country_name) VALUES ('TC', 'Turks and Caicos Islands');
INSERT INTO crm.countries (country_code, country_name) VALUES ('TD', 'Chad');
INSERT INTO crm.countries (country_code, country_name) VALUES ('TF', 'French Southern Territories');
INSERT INTO crm.countries (country_code, country_name) VALUES ('TG', 'Togo');
INSERT INTO crm.countries (country_code, country_name) VALUES ('TH', 'Thailand');
INSERT INTO crm.countries (country_code, country_name) VALUES ('TJ', 'Tajikistan');
INSERT INTO crm.countries (country_code, country_name) VALUES ('TK', 'Tokelau');
INSERT INTO crm.countries (country_code, country_name) VALUES ('TM', 'Turkmenistan');
INSERT INTO crm.countries (country_code, country_name) VALUES ('TN', 'Tunisia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('TO', 'Tonga');
INSERT INTO crm.countries (country_code, country_name) VALUES ('TP', 'East Timor');
INSERT INTO crm.countries (country_code, country_name) VALUES ('TR', 'Turkey');
INSERT INTO crm.countries (country_code, country_name) VALUES ('TT', 'Trinidad and Tobago');
INSERT INTO crm.countries (country_code, country_name) VALUES ('TV', 'Tuvalu');
INSERT INTO crm.countries (country_code, country_name) VALUES ('TW', 'Taiwan');
INSERT INTO crm.countries (country_code, country_name) VALUES ('TY', 'Mayotte');
INSERT INTO crm.countries (country_code, country_name) VALUES ('TZ', 'Tanzania, United Republic of');
INSERT INTO crm.countries (country_code, country_name) VALUES ('UA', 'Ukraine');
INSERT INTO crm.countries (country_code, country_name) VALUES ('UG', 'Uganda');
INSERT INTO crm.countries (country_code, country_name) VALUES ('UM', 'United States minor outlying islands');
INSERT INTO crm.countries (country_code, country_name) VALUES ('US', 'United States');
INSERT INTO crm.countries (country_code, country_name) VALUES ('UY', 'Uruguay');
INSERT INTO crm.countries (country_code, country_name) VALUES ('UZ', 'Uzbekistan');
INSERT INTO crm.countries (country_code, country_name) VALUES ('VA', 'Vatican City State');
INSERT INTO crm.countries (country_code, country_name) VALUES ('VC', 'Saint Vincent and the Grenadines');
INSERT INTO crm.countries (country_code, country_name) VALUES ('VE', 'Venezuela');
INSERT INTO crm.countries (country_code, country_name) VALUES ('VG', 'Virgin Islands (British)');
INSERT INTO crm.countries (country_code, country_name) VALUES ('VI', 'Virgin Islands (U.S.)');
INSERT INTO crm.countries (country_code, country_name) VALUES ('VN', 'Vietnam');
INSERT INTO crm.countries (country_code, country_name) VALUES ('VU', 'Vanuatu');
INSERT INTO crm.countries (country_code, country_name) VALUES ('WF', 'Wallis and Futuna Islands');
INSERT INTO crm.countries (country_code, country_name) VALUES ('WS', 'Samoa');
INSERT INTO crm.countries (country_code, country_name) VALUES ('XK', 'Kosovo');
INSERT INTO crm.countries (country_code, country_name) VALUES ('YE', 'Yemen');
INSERT INTO crm.countries (country_code, country_name) VALUES ('ZA', 'South Africa');
INSERT INTO crm.countries (country_code, country_name) VALUES ('ZM', 'Zambia');
INSERT INTO crm.countries (country_code, country_name) VALUES ('ZR', 'Zaire');
INSERT INTO crm.countries (country_code, country_name) VALUES ('ZW', 'Zimbabwe');

INSERT INTO crm.payment_type (name) VALUES ('Bank transfer');
INSERT INTO crm.payment_type (name) VALUES ('PayPal');
INSERT INTO crm.payment_type (name) VALUES ('Skrill');