-- -----------------------------------------------------
-- DROP DATABASE
-- -----------------------------------------------------
DROP DATABASE IF EXISTS filmsDB ;

-- -----------------------------------------------------
-- CREATE DATABASE
-- -----------------------------------------------------
CREATE DATABASE filmsDB DEFAULT CHARACTER SET utf8;
USE filmsDB ;

-- -----------------------------------------------------
-- TABLE countries
-- -----------------------------------------------------
CREATE TABLE countries(
	id INT NOT NULL AUTO_INCREMENT,
	iso CHAR( 2 ) NOT NULL,
	country VARCHAR( 80 ) NOT NULL,

	-- KEYS
	PRIMARY KEY ( id )
)ENGINE = InnoDB CHARSET = utf8 AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- TABLE users
-- -----------------------------------------------------
CREATE TABLE users(
	id BIGINT NOT NULL AUTO_INCREMENT,
	username VARCHAR(250) NOT NULL,
	email VARCHAR(250) NOT NULL,
	name VARCHAR(250) NOT NULL,
	lastname1 VARCHAR(250) NOT NULL,
	lastname2 VARCHAR(250) NOT NULL,
	birthdate DATE NOT NULL,
	idCountry INT,
	city VARCHAR(250) NOT NULL,
	password VARCHAR(52) NOT NULL,
	salt VARCHAR(10) NOT NULL,
	active BOOLEAN NOT NULL,

	-- KEYS
	PRIMARY KEY( id ),
	FOREIGN KEY( idCountry ) REFERENCES countries( id )
		ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET = utf8 AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- TABLE films
-- -----------------------------------------------------
CREATE TABLE films(
	id BIGINT NOT NULL AUTO_INCREMENT,
	name VARCHAR(250) NOT NULL,
	releaseDate DATE,
	duration INT,
	idCountry INT,
	series BOOLEAN NOT NULL DEFAULT 0,
	synopsis TEXT,

	-- KEYS
	PRIMARY KEY( id ),
	FOREIGN KEY( idCountry ) REFERENCES countries( id )
		ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET = utf8 AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- TABLE chapters
-- -----------------------------------------------------
CREATE TABLE chapters(
	id BIGINT NOT NULL AUTO_INCREMENT,
	idFilm BIGINT NOT NULL,
	name VARCHAR(250) NOT NULL,
	season INT NOT NULL,
	chapter INT NOT NULL,
	releaseDate DATE,
	duration INT,
	synopsis TEXT,

	-- KEYS
	PRIMARY KEY( id ),
	FOREIGN KEY( idFilm ) REFERENCES films( id )
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET = utf8 AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- TABLE directors
-- -----------------------------------------------------
CREATE TABLE directors(
	id BIGINT NOT NULL AUTO_INCREMENT,
	name VARCHAR(250) NOT NULL,
	idCountry INT,
	birthdate DATE,

	-- KEYS
	PRIMARY KEY( id ),
	FOREIGN KEY( idCountry ) REFERENCES countries( id )
		ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET = utf8 AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- TABLE films_directors
-- -----------------------------------------------------
CREATE TABLE films_directors(
	id BIGINT NOT NULL AUTO_INCREMENT,
	idFilm BIGINT NOT NULL,
	idDirector BIGINT NOT NULL,

	-- KEYS
	PRIMARY KEY( id ),
	FOREIGN KEY( idFilm ) REFERENCES films( id )
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY( idDirector ) REFERENCES directors( id )
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET = utf8 AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- TABLE producers
-- -----------------------------------------------------
CREATE TABLE producers(
	id BIGINT NOT NULL AUTO_INCREMENT,
	name VARCHAR(250) NOT NULL,
	idCountry INT,

	-- KEYS
	PRIMARY KEY( id ),
	FOREIGN KEY( idCountry ) REFERENCES countries( id )
		ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET = utf8 AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- TABLE producers_directors
-- -----------------------------------------------------
CREATE TABLE producers_directors(
	id BIGINT NOT NULL AUTO_INCREMENT,
	idFilm BIGINT NOT NULL,
	idProducer BIGINT NOT NULL,

	-- KEYS
	PRIMARY KEY( id ),
	FOREIGN KEY( idFilm ) REFERENCES films( id )
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY( idProducer ) REFERENCES producers( id )
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET = utf8 AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- TABLE actors
-- -----------------------------------------------------
CREATE TABLE actors(
	id BIGINT NOT NULL AUTO_INCREMENT,
	name VARCHAR(250) NOT NULL,
	idCountry INT,
	birthdate DATE,

	-- KEYS
	PRIMARY KEY( id ),
	FOREIGN KEY( idCountry ) REFERENCES countries( id )
		ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET = utf8 AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- TABLE actors_directors
-- -----------------------------------------------------
CREATE TABLE actors_directors(
	id BIGINT NOT NULL AUTO_INCREMENT,
	idFilm BIGINT NOT NULL,
	idActor BIGINT NOT NULL,

	-- KEYS
	PRIMARY KEY( id ),
	FOREIGN KEY( idFilm ) REFERENCES films( id )
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY( idActor ) REFERENCES actors( id )
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET = utf8 AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- TABLE photographers
-- -----------------------------------------------------
CREATE TABLE photographers(
	id BIGINT NOT NULL AUTO_INCREMENT,
	name VARCHAR(250) NOT NULL,
	idCountry INT,
	birthdate DATE,

	-- KEYS
	PRIMARY KEY( id ),
	FOREIGN KEY( idCountry ) REFERENCES countries( id )
		ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET = utf8 AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- TABLE photographers_directors
-- -----------------------------------------------------
CREATE TABLE photographers_directors(
	id BIGINT NOT NULL AUTO_INCREMENT,
	idFilm BIGINT NOT NULL,
	idPhotographer BIGINT NOT NULL,

	-- KEYS
	PRIMARY KEY( id ),
	FOREIGN KEY( idFilm ) REFERENCES films( id )
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY( idPhotographer ) REFERENCES photographers( id )
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET = utf8 AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- TABLE musicians
-- -----------------------------------------------------
CREATE TABLE musicians(
	id BIGINT NOT NULL AUTO_INCREMENT,
	name VARCHAR(250) NOT NULL,
	idCountry INT,
	birthdate DATE,

	-- KEYS
	PRIMARY KEY( id ),
	FOREIGN KEY( idCountry ) REFERENCES countries( id )
		ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET = utf8 AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- TABLE musicians_directors
-- -----------------------------------------------------
CREATE TABLE musicians_directors(
	id BIGINT NOT NULL AUTO_INCREMENT,
	idFilm BIGINT NOT NULL,
	idMusician BIGINT NOT NULL,

	-- KEYS
	PRIMARY KEY( id ),
	FOREIGN KEY( idFilm ) REFERENCES films( id )
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY( idMusician ) REFERENCES musicians( id )
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET = utf8 AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- TABLE screenwriters
-- -----------------------------------------------------
CREATE TABLE screenwriters(
	id BIGINT NOT NULL AUTO_INCREMENT,
	name VARCHAR(250) NOT NULL,
	idCountry INT,
	birthdate DATE,

	-- KEYS
	PRIMARY KEY( id ),
	FOREIGN KEY( idCountry ) REFERENCES countries( id )
		ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET = utf8 AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- TABLE screenwriters_directors
-- -----------------------------------------------------
CREATE TABLE screenwriters_directors(
	id BIGINT NOT NULL AUTO_INCREMENT,
	idFilm BIGINT NOT NULL,
	idScreenwriter BIGINT NOT NULL,

	-- KEYS
	PRIMARY KEY( id ),
	FOREIGN KEY( idFilm ) REFERENCES films( id )
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY( idScreenwriter ) REFERENCES screenwriters( id )
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET = utf8 AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- TABLE genres
-- -----------------------------------------------------
CREATE TABLE genres(
	id BIGINT NOT NULL AUTO_INCREMENT,
	genre VARCHAR(250) NOT NULL,

	-- KEYS
	PRIMARY KEY( id )
) ENGINE = InnoDB CHARSET = utf8 AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- TABLE genres_directors
-- -----------------------------------------------------
CREATE TABLE genres_directors(
	id BIGINT NOT NULL AUTO_INCREMENT,
	idFilm BIGINT NOT NULL,
	idGenre BIGINT NOT NULL,

	-- KEYS
	PRIMARY KEY( id ),
	FOREIGN KEY( idFilm ) REFERENCES films( id )
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY( idGenre ) REFERENCES genres( id )
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET = utf8 AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- TABLE punctuations
-- -----------------------------------------------------
CREATE TABLE punctuations(
	id BIGINT NOT NULL AUTO_INCREMENT,
	idFilm BIGINT NOT NULL,
	idUser BIGINT NOT NULL,
	photography INT,
	script INT,
	cast INT,
	entertainment INT,
	general INT,

	-- KEYS
	PRIMARY KEY( id ),
	FOREIGN KEY( idFilm ) REFERENCES films( id )
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY( idUser ) REFERENCES users( id )
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET = utf8 AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- TABLE critics
-- -----------------------------------------------------
CREATE TABLE critics(
	id BIGINT NOT NULL AUTO_INCREMENT,
	idUser BIGINT NOT NULL,
	critic TEXT NOT NULL,

	-- KEYS
	PRIMARY KEY( id ),
	FOREIGN KEY( idUser ) REFERENCES users( id )
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET = utf8 AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- TABLE trailers
-- -----------------------------------------------------
CREATE TABLE trailers(
	id BIGINT NOT NULL AUTO_INCREMENT,
	idFilm BIGINT NOT NULL,
	trailer VARCHAR(250) NOT NULL,

	-- KEYS
	PRIMARY KEY( id ),
	FOREIGN KEY( idFilm ) REFERENCES films( id )
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET = utf8 AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- INSERT COUNTRIES
-- -----------------------------------------------------
INSERT INTO countries( iso, country ) VALUES
	( 'AF', 'Afganistán' ),
	( 'AX', 'Islas Gland' ),
	( 'AL', 'Albania' ),
	( 'DE', 'Alemania' ),
	( 'AD', 'Andorra' ),
	( 'AO', 'Angola' ),
	( 'AI', 'Anguilla' ),
	( 'AQ', 'Antártida' ),
	( 'AG', 'Antigua y Barbuda' ),
	( 'AN', 'Antillas Holandesas' ),
	( 'SA', 'Arabia Saudí' ),
	( 'DZ', 'Argelia' ),
	( 'AR', 'Argentina' ),
	( 'AM', 'Armenia' ),
	( 'AW', 'Aruba' ),
	( 'AU', 'Australia' ),
	( 'AT', 'Austria' ),
	( 'AZ', 'Azerbaiyán' ),
	( 'BS', 'Bahamas' ),
	( 'BH', 'Bahréin' ),
	( 'BD', 'Bangladesh' ),
	( 'BB', 'Barbados' ),
	( 'BY', 'Bielorrusia' ),
	( 'BE', 'Bélgica' ),
	( 'BZ', 'Belice' ),
	( 'BJ', 'Benin' ),
	( 'BM', 'Bermudas' ),
	( 'BT', 'Bhután' ),
	( 'BO', 'Bolivia' ),
	( 'BA', 'Bosnia y Herzegovina' ),
	( 'BW', 'Botsuana' ),
	( 'BV', 'Isla Bouvet' ),
	( 'BR', 'Brasil' ),
	( 'BN', 'Brunéi' ),
	( 'BG', 'Bulgaria' ),
	( 'BF', 'Burkina Faso' ),
	( 'BI', 'Burundi' ),
	( 'CV', 'Cabo Verde' ),
	( 'KY', 'Islas Caimán' ),
	( 'KH', 'Camboya' ),
	( 'CM', 'Camerún' ),
	( 'CA', 'Canadá' ),
	( 'CF', 'República Centroafricana' ),
	( 'TD', 'Chad' ),
	( 'CZ', 'República Checa' ),
	( 'CL', 'Chile' ),
	( 'CN', 'China' ),
	( 'CY', 'Chipre' ),
	( 'CX', 'Isla de Navidad' ),
	( 'VA', 'Ciudad del Vaticano' ),
	( 'CC', 'Islas Cocos' ),
	( 'CO', 'Colombia' ),
	( 'KM', 'Comoras' ),
	( 'CD', 'República Democrática del Congo' ),
	( 'CG', 'Congo' ),
	( 'CK', 'Islas Cook' ),
	( 'KP', 'Corea del Norte' ),
	( 'KR', 'Corea del Sur' ),
	( 'CI', 'Costa de Marfil' ),
	( 'CR', 'Costa Rica' ),
	( 'HR', 'Croacia' ),
	( 'CU', 'Cuba' ),
	( 'DK', 'Dinamarca' ),
	( 'DM', 'Dominica' ),
	( 'DO', 'República Dominicana' ),
	( 'EC', 'Ecuador' ),
	( 'EG', 'Egipto' ),
	( 'SV', 'El Salvador' ),
	( 'AE', 'Emiratos Árabes Unidos' ),
	( 'ER', 'Eritrea' ),
	( 'SK', 'Eslovaquia' ),
	( 'SI', 'Eslovenia' ),
	( 'ES', 'España' ),
	( 'UM', 'Islas ultramarinas de Estados Unidos' ),
	( 'US', 'Estados Unidos' ),
	( 'EE', 'Estonia' ),
	( 'ET', 'Etiopía' ),
	( 'FO', 'Islas Feroe' ),
	( 'PH', 'Filipinas' ),
	( 'FI', 'Finlandia' ),
	( 'FJ', 'Fiyi' ),
	( 'FR', 'Francia' ),
	( 'GA', 'Gabón' ),
	( 'GM', 'Gambia' ),
	( 'GE', 'Georgia' ),
	( 'GS', 'Islas Georgias del Sur y Sandwich del Sur' ),
	( 'GH', 'Ghana' ),
	( 'GI', 'Gibraltar' ),
	( 'GD', 'Granada' ),
	( 'GR', 'Grecia' ),
	( 'GL', 'Groenlandia' ),
	( 'GP', 'Guadalupe' ),
	( 'GU', 'Guam' ),
	( 'GT', 'Guatemala' ),
	( 'GF', 'Guayana Francesa' ),
	( 'GN', 'Guinea' ),
	( 'GQ', 'Guinea Ecuatorial' ),
	( 'GW', 'Guinea-Bissau' ),
	( 'GY', 'Guyana' ),
	( 'HT', 'Haití' ),
	( 'HM', 'Islas Heard y McDonald' ),
	( 'HN', 'Honduras' ),
	( 'HK', 'Hong Kong' ),
	( 'HU', 'Hungría' ),
	( 'IN', 'India' ),
	( 'ID', 'Indonesia' ),
	( 'IR', 'Irán' ),
	( 'IQ', 'Iraq' ),
	( 'IE', 'Irlanda' ),
	( 'IS', 'Islandia' ),
	( 'IL', 'Israel' ),
	( 'IT', 'Italia' ),
	( 'JM', 'Jamaica' ),
	( 'JP', 'Japón' ),
	( 'JO', 'Jordania' ),
	( 'KZ', 'Kazajstán' ),
	( 'KE', 'Kenia' ),
	( 'KG', 'Kirguistán' ),
	( 'KI', 'Kiribati' ),
	( 'KW', 'Kuwait' ),
	( 'LA', 'Laos' ),
	( 'LS', 'Lesotho' ),
	( 'LV', 'Letonia' ),
	( 'LB', 'Líbano' ),
	( 'LR', 'Liberia' ),
	( 'LY', 'Libia' ),
	( 'LI', 'Liechtenstein' ),
	( 'LT', 'Lituania' ),
	( 'LU', 'Luxemburgo' ),
	( 'MO', 'Macao' ),
	( 'MK', 'ARY Macedonia' ),
	( 'MG', 'Madagascar' ),
	( 'MY', 'Malasia' ),
	( 'MW', 'Malawi' ),
	( 'MV', 'Maldivas' ),
	( 'ML', 'Malí' ),
	( 'MT', 'Malta' ),
	( 'FK', 'Islas Malvinas' ),
	( 'MP', 'Islas Marianas del Norte' ),
	( 'MA', 'Marruecos' ),
	( 'MH', 'Islas Marshall' ),
	( 'MQ', 'Martinica' ),
	( 'MU', 'Mauricio' ),
	( 'MR', 'Mauritania' ),
	( 'YT', 'Mayotte' ),
	( 'MX', 'México' ),
	( 'FM', 'Micronesia' ),
	( 'MD', 'Moldavia' ),
	( 'MC', 'Mónaco' ),
	( 'MN', 'Mongolia' ),
	( 'MS', 'Montserrat' ),
	( 'MZ', 'Mozambique' ),
	( 'MM', 'Myanmar' ),
	( 'NA', 'Namibia' ),
	( 'NR', 'Nauru' ),
	( 'NP', 'Nepal' ),
	( 'NI', 'Nicaragua' ),
	( 'NE', 'Níger' ),
	( 'NG', 'Nigeria' ),
	( 'NU', 'Niue' ),
	( 'NF', 'Isla Norfolk' ),
	( 'NO', 'Noruega' ),
	( 'NC', 'Nueva Caledonia' ),
	( 'NZ', 'Nueva Zelanda' ),
	( 'OM', 'Omán' ),
	( 'NL', 'Países Bajos' ),
	( 'PK', 'Pakistán' ),
	( 'PW', 'Palau' ),
	( 'PS', 'Palestina' ),
	( 'PA', 'Panamá' ),
	( 'PG', 'Papúa Nueva Guinea' ),
	( 'PY', 'Paraguay' ),
	( 'PE', 'Perú' ),
	( 'PN', 'Islas Pitcairn' ),
	( 'PF', 'Polinesia Francesa' ),
	( 'PL', 'Polonia' ),
	( 'PT', 'Portugal' ),
	( 'PR', 'Puerto Rico' ),
	( 'QA', 'Qatar' ),
	( 'GB', 'Reino Unido' ),
	( 'RE', 'Reunión' ),
	( 'RW', 'Ruanda' ),
	( 'RO', 'Rumania' ),
	( 'RU', 'Rusia' ),
	( 'EH', 'Sahara Occidental' ),
	( 'SB', 'Islas Salomón' ),
	( 'WS', 'Samoa' ),
	( 'AS', 'Samoa Americana' ),
	( 'KN', 'San Cristóbal y Nevis' ),
	( 'SM', 'San Marino' ),
	( 'PM', 'San Pedro y Miquelón' ),
	( 'VC', 'San Vicente y las Granadinas' ),
	( 'SH', 'Santa Helena' ),
	( 'LC', 'Santa Lucía' ),
	( 'ST', 'Santo Tomé y Príncipe' ),
	( 'SN', 'Senegal' ),
	( 'CS', 'Serbia y Montenegro' ),
	( 'SC', 'Seychelles' ),
	( 'SL', 'Sierra Leona' ),
	( 'SG', 'Singapur' ),
	( 'SY', 'Siria' ),
	( 'SO', 'Somalia' ),
	( 'LK', 'Sri Lanka' ),
	( 'SZ', 'Suazilandia' ),
	( 'ZA', 'Sudáfrica' ),
	( 'SD', 'Sudán' ),
	( 'SE', 'Suecia' ),
	( 'CH', 'Suiza' ),
	( 'SR', 'Surinam' ),
	( 'SJ', 'Svalbard y Jan Mayen' ),
	( 'TH', 'Tailandia' ),
	( 'TW', 'Taiwán' ),
	( 'TZ', 'Tanzania' ),
	( 'TJ', 'Tayikistán' ),
	( 'IO', 'Territorio Británico del Océano Índico' ),
	( 'TF', 'Territorios Australes Franceses' ),
	( 'TL', 'Timor Oriental' ),
	( 'TG', 'Togo' ),
	( 'TK', 'Tokelau' ),
	( 'TO', 'Tonga' ),
	( 'TT', 'Trinidad y Tobago' ),
	( 'TN', 'Túnez' ),
	( 'TC', 'Islas Turcas y Caicos' ),
	( 'TM', 'Turkmenistán' ),
	( 'TR', 'Turquía' ),
	( 'TV', 'Tuvalu' ),
	( 'UA', 'Ucrania' ),
	( 'UG', 'Uganda' ),
	( 'UY', 'Uruguay' ),
	( 'UZ', 'Uzbekistán' ),
	( 'VU', 'Vanuatu' ),
	( 'VE', 'Venezuela' ),
	( 'VN', 'Vietnam' ),
	( 'VG', 'Islas Vírgenes Británicas' ),
	( 'VI', 'Islas Vírgenes de los Estados Unidos' ),
	( 'WF', 'Wallis y Futuna' ),
	( 'YE', 'Yemen' ),
	( 'DJ', 'Yibuti' ),
	( 'ZM', 'Zambia' ),
	( 'ZW', 'Zimbabue' );
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------