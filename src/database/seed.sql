DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS regions;
DROP TABLE IF EXISTS communes;
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS favorite_books;
DROP TABLE IF EXISTS carts;
DROP TABLE IF EXISTS cart_details;

CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	lastname VARCHAR(50),
	email VARCHAR(100) UNIQUE NOT NULL,
	birthday DATE NOT NULL,
	password VARCHAR(60) NOT NULL,
	is_admin boolean NOT NULL DEFAULT FALSE
);

CREATE TABLE regions(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	delivery_price INT
);

CREATE TABLE communes(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	region_id INT REFERENCES regions(id) ON DELETE CASCADE
);

CREATE TABLE addresses(
	id SERIAL PRIMARY KEY,
	address VARCHAR(255) NOT NULL,
	commune_id INT REFERENCES communes(id) ON DELETE CASCADE,
	user_id INT REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE categories(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE authors(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE books(
	id SERIAL PRIMARY KEY,
	title VARCHAR NOT NULL,
	image VARCHAR,
	description VARCHAR,
	price INT NOT NULL,
	stock INT NOT NULL,
	category_id INT REFERENCES categories(id) ON DELETE CASCADE,
	author_id INT REFERENCES authors(id) ON DELETE CASCADE
);

CREATE TABLE carts(
	id SERIAL PRIMARY KEY,
	created_at TIMESTAMP NOT NULL DEFAULT NOW(),
	total INT,
	user_id INT REFERENCES users(id) ON DELETE CASCADE,
	address_id INT REFERENCES addresses(id) ON DELETE CASCADE,
	delivery_price INT
);

CREATE TABLE cart_details(
    id SERIAL PRIMARY KEY,
	quantity SMALLINT NOT NULL,
	price INT NOT NULL,
	sub_total INT NOT NULL,
    cart_id INT REFERENCES carts(id) ON DELETE CASCADE,
    book_id INT REFERENCES books(id) ON DELETE CASCADE
);

CREATE TABLE favorite_books(
 	id SERIAL PRIMARY KEY,
 	user_id INT REFERENCES users(id) ON DELETE CASCADE,
 	book_id INT REFERENCES books(id) ON DELETE CASCADE
);


--INSERTAR REGIONES
INSERT INTO regions (name, delivery_price) VALUES('Arica y Parinacota', 3990);
INSERT INTO regions (name, delivery_price) VALUES('Tarapacá', 3990);
INSERT INTO regions (name, delivery_price) VALUES('Antofagasta', 3990);
INSERT INTO regions (name, delivery_price) VALUES('Atacama', 3990);
INSERT INTO regions (name, delivery_price) VALUES('Coquimbo', 3990);
INSERT INTO regions (name, delivery_price) VALUES('Valparaíso', 2990);
INSERT INTO regions (name, delivery_price) VALUES('Región del Libertador Gral. Bernardo O’Higgins', 2990);
INSERT INTO regions (name, delivery_price) VALUES('Región del Maule', 3990);
INSERT INTO regions (name, delivery_price) VALUES('Región del Biobío', 3990);
INSERT INTO regions (name, delivery_price) VALUES('Región de la Araucanía', 3990);
INSERT INTO regions (name, delivery_price) VALUES('Región de Los Ríos', 3990);
INSERT INTO regions (name, delivery_price) VALUES('Región de Los Lagos', 3990);
INSERT INTO regions (name, delivery_price) VALUES('Región Aisén del Gral. Carlos Ibáñez del Campo', 5990);
INSERT INTO regions (name, delivery_price) VALUES('Región de Magallanes y de la Antártica Chilena', 9990);
INSERT INTO regions (name, delivery_price) VALUES('Región Metropolitana de Santiago', 1990);

-- INSERTAR COMUNAS
INSERT INTO communes (name, region_id) VALUES('Arica', 1);
INSERT INTO communes (name, region_id) VALUES('Camarones', 1);
INSERT INTO communes (name, region_id) VALUES('Putre', 1);
INSERT INTO communes (name, region_id) VALUES('General Lagos', 1);
INSERT INTO communes (name, region_id) VALUES('Iquique', 2);
INSERT INTO communes (name, region_id) VALUES('Alto Hospicio', 2);
INSERT INTO communes (name, region_id) VALUES('Pozo Almonte', 2);
INSERT INTO communes (name, region_id) VALUES('Camiña', 2);
INSERT INTO communes (name, region_id) VALUES('Colchane', 2);
INSERT INTO communes (name, region_id) VALUES('Huara', 2);
INSERT INTO communes (name, region_id) VALUES('Pica', 2);
INSERT INTO communes (name, region_id) VALUES('Antofagasta', 3);
INSERT INTO communes (name, region_id) VALUES('Mejillones', 3);
INSERT INTO communes (name, region_id) VALUES('Sierra Gorda', 3);
INSERT INTO communes (name, region_id) VALUES('Taltal', 3);
INSERT INTO communes (name, region_id) VALUES('Calama', 3);
INSERT INTO communes (name, region_id) VALUES('Ollagüe', 3);
INSERT INTO communes (name, region_id) VALUES('San Pedro de Atacama', 3);
INSERT INTO communes (name, region_id) VALUES('Tocopilla', 3);
INSERT INTO communes (name, region_id) VALUES('María Elena', 3);
INSERT INTO communes (name, region_id) VALUES('Copiapó', 4);
INSERT INTO communes (name, region_id) VALUES('Caldera', 4);
INSERT INTO communes (name, region_id) VALUES('Tierra Amarilla', 4);
INSERT INTO communes (name, region_id) VALUES('Chañaral', 4);
INSERT INTO communes (name, region_id) VALUES('Diego de Almagro', 4);
INSERT INTO communes (name, region_id) VALUES('Vallenar', 4);
INSERT INTO communes (name, region_id) VALUES('Alto del Carmen', 4);
INSERT INTO communes (name, region_id) VALUES('Freirina', 4);
INSERT INTO communes (name, region_id) VALUES('Huasco', 4);
INSERT INTO communes (name, region_id) VALUES('La Serena', 5);
INSERT INTO communes (name, region_id) VALUES('Coquimbo', 5);
INSERT INTO communes (name, region_id) VALUES('Andacollo', 5);
INSERT INTO communes (name, region_id) VALUES('La Higuera', 5);
INSERT INTO communes (name, region_id) VALUES('Paiguano', 5);
INSERT INTO communes (name, region_id) VALUES('Vicuña', 5);
INSERT INTO communes (name, region_id) VALUES('Illapel', 5);
INSERT INTO communes (name, region_id) VALUES('Canela', 5);
INSERT INTO communes (name, region_id) VALUES('Los Vilos', 5);
INSERT INTO communes (name, region_id) VALUES('Salamanca', 5);
INSERT INTO communes (name, region_id) VALUES('Ovalle', 5);
INSERT INTO communes (name, region_id) VALUES('Combarbalá', 5);
INSERT INTO communes (name, region_id) VALUES('Monte Patria', 5);
INSERT INTO communes (name, region_id) VALUES('Punitaqui', 5);
INSERT INTO communes (name, region_id) VALUES('Río Hurtado', 5);
INSERT INTO communes (name, region_id) VALUES('Valparaíso', 6);
INSERT INTO communes (name, region_id) VALUES('Casablanca', 6);
INSERT INTO communes (name, region_id) VALUES('Concón', 6);
INSERT INTO communes (name, region_id) VALUES('Juan Fernández', 6);
INSERT INTO communes (name, region_id) VALUES('Puchuncaví', 6);
INSERT INTO communes (name, region_id) VALUES('Quintero', 6);
INSERT INTO communes (name, region_id) VALUES('Viña del Mar', 6);
INSERT INTO communes (name, region_id) VALUES('Isla de Pascua', 6);
INSERT INTO communes (name, region_id) VALUES('Los Andes', 6);
INSERT INTO communes (name, region_id) VALUES('Calle Larga', 6);
INSERT INTO communes (name, region_id) VALUES('Rinconada', 6);
INSERT INTO communes (name, region_id) VALUES('San Esteban', 6);
INSERT INTO communes (name, region_id) VALUES('La Ligua', 6);
INSERT INTO communes (name, region_id) VALUES('Cabildo', 6);
INSERT INTO communes (name, region_id) VALUES('Papudo', 6);
INSERT INTO communes (name, region_id) VALUES('Petorca', 6);
INSERT INTO communes (name, region_id) VALUES('Zapallar', 6);
INSERT INTO communes (name, region_id) VALUES('Quillota', 6);
INSERT INTO communes (name, region_id) VALUES('Calera', 6);
INSERT INTO communes (name, region_id) VALUES('Hijuelas', 6);
INSERT INTO communes (name, region_id) VALUES('La Cruz', 6);
INSERT INTO communes (name, region_id) VALUES('Nogales', 6);
INSERT INTO communes (name, region_id) VALUES('San Antonio', 6);
INSERT INTO communes (name, region_id) VALUES('Algarrobo', 6);
INSERT INTO communes (name, region_id) VALUES('Cartagena', 6);
INSERT INTO communes (name, region_id) VALUES('El Quisco', 6);
INSERT INTO communes (name, region_id) VALUES('El Tabo', 6);
INSERT INTO communes (name, region_id) VALUES('Santo Domingo', 6);
INSERT INTO communes (name, region_id) VALUES('San Felipe', 6);
INSERT INTO communes (name, region_id) VALUES('Catemu', 6);
INSERT INTO communes (name, region_id) VALUES('Llaillay', 6);
INSERT INTO communes (name, region_id) VALUES('Panquehue', 6);
INSERT INTO communes (name, region_id) VALUES('Putaendo', 6);
INSERT INTO communes (name, region_id) VALUES('Santa María', 6);
INSERT INTO communes (name, region_id) VALUES('Quilpué', 6);
INSERT INTO communes (name, region_id) VALUES('Limache', 6);
INSERT INTO communes (name, region_id) VALUES('Olmué', 6);
INSERT INTO communes (name, region_id) VALUES('Villa Alemana', 6);
INSERT INTO communes (name, region_id) VALUES('Rancagua', 7);
INSERT INTO communes (name, region_id) VALUES('Codegua', 7);
INSERT INTO communes (name, region_id) VALUES('Coinco', 7);
INSERT INTO communes (name, region_id) VALUES('Coltauco', 7);
INSERT INTO communes (name, region_id) VALUES('Doñihue', 7);
INSERT INTO communes (name, region_id) VALUES('Graneros', 7);
INSERT INTO communes (name, region_id) VALUES('Las Cabras', 7);
INSERT INTO communes (name, region_id) VALUES('Machalí', 7);
INSERT INTO communes (name, region_id) VALUES('Malloa', 7);
INSERT INTO communes (name, region_id) VALUES('Mostazal', 7);
INSERT INTO communes (name, region_id) VALUES('Olivar', 7);
INSERT INTO communes (name, region_id) VALUES('Peumo', 7);
INSERT INTO communes (name, region_id) VALUES('Pichidegua', 7);
INSERT INTO communes (name, region_id) VALUES('Quinta de Tilcoco', 7);
INSERT INTO communes (name, region_id) VALUES('Rengo', 7);
INSERT INTO communes (name, region_id) VALUES('Requínoa', 7);
INSERT INTO communes (name, region_id) VALUES('San Vicente', 7);
INSERT INTO communes (name, region_id) VALUES('Pichilemu', 7);
INSERT INTO communes (name, region_id) VALUES('La Estrella', 7);
INSERT INTO communes (name, region_id) VALUES('Litueche', 7);
INSERT INTO communes (name, region_id) VALUES('Marchihue', 7);
INSERT INTO communes (name, region_id) VALUES('Navidad', 7);
INSERT INTO communes (name, region_id) VALUES('Paredones', 7);
INSERT INTO communes (name, region_id) VALUES('San Fernando', 7);
INSERT INTO communes (name, region_id) VALUES('Chépica', 7);
INSERT INTO communes (name, region_id) VALUES('Chimbarongo', 7);
INSERT INTO communes (name, region_id) VALUES('Lolol', 7);
INSERT INTO communes (name, region_id) VALUES('Nancagua', 7);
INSERT INTO communes (name, region_id) VALUES('Palmilla', 7);
INSERT INTO communes (name, region_id) VALUES('Peralillo', 7);
INSERT INTO communes (name, region_id) VALUES('Placilla', 7);
INSERT INTO communes (name, region_id) VALUES('Pumanque', 7);
INSERT INTO communes (name, region_id) VALUES('Santa Cruz', 7);
INSERT INTO communes (name, region_id) VALUES('Talca', 8);
INSERT INTO communes (name, region_id) VALUES('ConsVtución', 8);
INSERT INTO communes (name, region_id) VALUES('Curepto', 8);
INSERT INTO communes (name, region_id) VALUES('Empedrado', 8);
INSERT INTO communes (name, region_id) VALUES('Maule', 8);
INSERT INTO communes (name, region_id) VALUES('Pelarco', 8);
INSERT INTO communes (name, region_id) VALUES('Pencahue', 8);
INSERT INTO communes (name, region_id) VALUES('Río Claro', 8);
INSERT INTO communes (name, region_id) VALUES('San Clemente', 8);
INSERT INTO communes (name, region_id) VALUES('San Rafael', 8);
INSERT INTO communes (name, region_id) VALUES('Cauquenes', 8);
INSERT INTO communes (name, region_id) VALUES('Chanco', 8);
INSERT INTO communes (name, region_id) VALUES('Pelluhue', 8);
INSERT INTO communes (name, region_id) VALUES('Curicó', 8);
INSERT INTO communes (name, region_id) VALUES('Hualañé', 8);
INSERT INTO communes (name, region_id) VALUES('Licantén', 8);
INSERT INTO communes (name, region_id) VALUES('Molina', 8);
INSERT INTO communes (name, region_id) VALUES('Rauco', 8);
INSERT INTO communes (name, region_id) VALUES('Romeral', 8);
INSERT INTO communes (name, region_id) VALUES('Sagrada Familia', 8);
INSERT INTO communes (name, region_id) VALUES('Teno', 8);
INSERT INTO communes (name, region_id) VALUES('Vichuquén', 8);
INSERT INTO communes (name, region_id) VALUES('Linares', 8);
INSERT INTO communes (name, region_id) VALUES('Colbún', 8);
INSERT INTO communes (name, region_id) VALUES('Longaví', 8);
INSERT INTO communes (name, region_id) VALUES('Parral', 8);
INSERT INTO communes (name, region_id) VALUES('ReVro', 8);
INSERT INTO communes (name, region_id) VALUES('San Javier', 8);
INSERT INTO communes (name, region_id) VALUES('Villa Alegre', 8);
INSERT INTO communes (name, region_id) VALUES('Yerbas Buenas', 8);
INSERT INTO communes (name, region_id) VALUES('Concepción', 9);
INSERT INTO communes (name, region_id) VALUES('Coronel', 9);
INSERT INTO communes (name, region_id) VALUES('Chiguayante', 9);
INSERT INTO communes (name, region_id) VALUES('Florida', 9);
INSERT INTO communes (name, region_id) VALUES('Hualqui', 9);
INSERT INTO communes (name, region_id) VALUES('Lota', 9);
INSERT INTO communes (name, region_id) VALUES('Penco', 9);
INSERT INTO communes (name, region_id) VALUES('San Pedro de la Paz', 9);
INSERT INTO communes (name, region_id) VALUES('Santa Juana', 9);
INSERT INTO communes (name, region_id) VALUES('Talcahuano', 9);
INSERT INTO communes (name, region_id) VALUES('Tomé', 9);
INSERT INTO communes (name, region_id) VALUES('Hualpén', 9);
INSERT INTO communes (name, region_id) VALUES('Lebu', 9);
INSERT INTO communes (name, region_id) VALUES('Arauco', 9);
INSERT INTO communes (name, region_id) VALUES('Cañete', 9);
INSERT INTO communes (name, region_id) VALUES('Contulmo', 9);
INSERT INTO communes (name, region_id) VALUES('Curanilahue', 9);
INSERT INTO communes (name, region_id) VALUES('Los Álamos', 9);
INSERT INTO communes (name, region_id) VALUES('Tirúa', 9);
INSERT INTO communes (name, region_id) VALUES('Los Ángeles', 9);
INSERT INTO communes (name, region_id) VALUES('Antuco', 9);
INSERT INTO communes (name, region_id) VALUES('Cabrero', 9);
INSERT INTO communes (name, region_id) VALUES('Laja', 9);
INSERT INTO communes (name, region_id) VALUES('Mulchén', 9);
INSERT INTO communes (name, region_id) VALUES('Nacimiento', 9);
INSERT INTO communes (name, region_id) VALUES('Negrete', 9);
INSERT INTO communes (name, region_id) VALUES('Quilaco', 9);
INSERT INTO communes (name, region_id) VALUES('Quilleco', 9);
INSERT INTO communes (name, region_id) VALUES('San Rosendo', 9);
INSERT INTO communes (name, region_id) VALUES('Santa Bárbara', 9);
INSERT INTO communes (name, region_id) VALUES('Tucapel', 9);
INSERT INTO communes (name, region_id) VALUES('Yumbel', 9);
INSERT INTO communes (name, region_id) VALUES('Alto Biobío', 9);
INSERT INTO communes (name, region_id) VALUES('Chillán', 9);
INSERT INTO communes (name, region_id) VALUES('Bulnes', 9);
INSERT INTO communes (name, region_id) VALUES('Cobquecura', 9);
INSERT INTO communes (name, region_id) VALUES('Coelemu', 9);
INSERT INTO communes (name, region_id) VALUES('Coihueco', 9);
INSERT INTO communes (name, region_id) VALUES('Chillán Viejo', 9);
INSERT INTO communes (name, region_id) VALUES('El Carmen', 9);
INSERT INTO communes (name, region_id) VALUES('Ninhue', 9);
INSERT INTO communes (name, region_id) VALUES('Ñiquén', 9);
INSERT INTO communes (name, region_id) VALUES('Pemuco', 9);
INSERT INTO communes (name, region_id) VALUES('Pinto', 9);
INSERT INTO communes (name, region_id) VALUES('Portezuelo', 9);
INSERT INTO communes (name, region_id) VALUES('Quillón', 9);
INSERT INTO communes (name, region_id) VALUES('Quirihue', 9);
INSERT INTO communes (name, region_id) VALUES('Ránquil', 9);
INSERT INTO communes (name, region_id) VALUES('San Carlos', 9);
INSERT INTO communes (name, region_id) VALUES('San Fabián', 9);
INSERT INTO communes (name, region_id) VALUES('San Ignacio', 9);
INSERT INTO communes (name, region_id) VALUES('San Nicolás', 9);
INSERT INTO communes (name, region_id) VALUES('Treguaco', 9);
INSERT INTO communes (name, region_id) VALUES('Yungay', 9);
INSERT INTO communes (name, region_id) VALUES('Temuco', 10);
INSERT INTO communes (name, region_id) VALUES('Carahue', 10);
INSERT INTO communes (name, region_id) VALUES('Cunco', 10);
INSERT INTO communes (name, region_id) VALUES('Curarrehue', 10);
INSERT INTO communes (name, region_id) VALUES('Freire', 10);
INSERT INTO communes (name, region_id) VALUES('Galvarino', 10);
INSERT INTO communes (name, region_id) VALUES('Gorbea', 10);
INSERT INTO communes (name, region_id) VALUES('Lautaro', 10);
INSERT INTO communes (name, region_id) VALUES('Loncoche', 10);
INSERT INTO communes (name, region_id) VALUES('Melipeuco', 10);
INSERT INTO communes (name, region_id) VALUES('Nueva Imperial', 10);
INSERT INTO communes (name, region_id) VALUES('Padre las Casas', 10);
INSERT INTO communes (name, region_id) VALUES('Perquenco', 10);
INSERT INTO communes (name, region_id) VALUES('Pitrufquén', 10);
INSERT INTO communes (name, region_id) VALUES('Pucón', 10);
INSERT INTO communes (name, region_id) VALUES('Saavedra', 10);
INSERT INTO communes (name, region_id) VALUES('Teodoro Schmidt', 10);
INSERT INTO communes (name, region_id) VALUES('Toltén', 10);
INSERT INTO communes (name, region_id) VALUES('Vilcún', 10);
INSERT INTO communes (name, region_id) VALUES('Villarrica', 10);
INSERT INTO communes (name, region_id) VALUES('Cholchol', 10);
INSERT INTO communes (name, region_id) VALUES('Angol', 10);
INSERT INTO communes (name, region_id) VALUES('Collipulli', 10);
INSERT INTO communes (name, region_id) VALUES('Curacautín', 10);
INSERT INTO communes (name, region_id) VALUES('Ercilla', 10);
INSERT INTO communes (name, region_id) VALUES('Lonquimay', 10);
INSERT INTO communes (name, region_id) VALUES('Los Sauces', 10);
INSERT INTO communes (name, region_id) VALUES('Lumaco', 10);
INSERT INTO communes (name, region_id) VALUES('Purén', 10);
INSERT INTO communes (name, region_id) VALUES('Renaico', 10);
INSERT INTO communes (name, region_id) VALUES('Traiguén', 10);
INSERT INTO communes (name, region_id) VALUES('Victoria', 10);
INSERT INTO communes (name, region_id) VALUES('Valdivia', 11);
INSERT INTO communes (name, region_id) VALUES('Corral', 11);
INSERT INTO communes (name, region_id) VALUES('Lanco', 11);
INSERT INTO communes (name, region_id) VALUES('Los Lagos', 11);
INSERT INTO communes (name, region_id) VALUES('Máfil', 11);
INSERT INTO communes (name, region_id) VALUES('Mariquina', 11);
INSERT INTO communes (name, region_id) VALUES('Paillaco', 11);
INSERT INTO communes (name, region_id) VALUES('Panguipulli', 11);
INSERT INTO communes (name, region_id) VALUES('La Unión', 11);
INSERT INTO communes (name, region_id) VALUES('Futrono', 11);
INSERT INTO communes (name, region_id) VALUES('Lago Ranco', 11);
INSERT INTO communes (name, region_id) VALUES('Río Bueno', 11);
INSERT INTO communes (name, region_id) VALUES('Puerto Montt', 12);
INSERT INTO communes (name, region_id) VALUES('Calbuco', 12);
INSERT INTO communes (name, region_id) VALUES('Cochamó', 12);
INSERT INTO communes (name, region_id) VALUES('Fresia', 12);
INSERT INTO communes (name, region_id) VALUES('FruVllar', 12);
INSERT INTO communes (name, region_id) VALUES('Los Muermos', 12);
INSERT INTO communes (name, region_id) VALUES('Llanquihue', 12);
INSERT INTO communes (name, region_id) VALUES('Maullín', 12);
INSERT INTO communes (name, region_id) VALUES('Puerto Varas', 12);
INSERT INTO communes (name, region_id) VALUES('Castro', 12);
INSERT INTO communes (name, region_id) VALUES('Ancud', 12);
INSERT INTO communes (name, region_id) VALUES('Chonchi', 12);
INSERT INTO communes (name, region_id) VALUES('Curaco de Vélez', 12);
INSERT INTO communes (name, region_id) VALUES('Dalcahue', 12);
INSERT INTO communes (name, region_id) VALUES('Puqueldón', 12);
INSERT INTO communes (name, region_id) VALUES('Queilén', 12);
INSERT INTO communes (name, region_id) VALUES('Quellón', 12);
INSERT INTO communes (name, region_id) VALUES('Quemchi', 12);
INSERT INTO communes (name, region_id) VALUES('Quinchao', 12);
INSERT INTO communes (name, region_id) VALUES('Osorno', 12);
INSERT INTO communes (name, region_id) VALUES('Puerto Octay', 12);
INSERT INTO communes (name, region_id) VALUES('Purranque', 12);
INSERT INTO communes (name, region_id) VALUES('Puyehue', 12);
INSERT INTO communes (name, region_id) VALUES('Río Negro', 12);
INSERT INTO communes (name, region_id) VALUES('San Juan de la Costa', 12);
INSERT INTO communes (name, region_id) VALUES('San Pablo', 12);
INSERT INTO communes (name, region_id) VALUES('Chaitén', 12);
INSERT INTO communes (name, region_id) VALUES('Futaleufú', 12);
INSERT INTO communes (name, region_id) VALUES('Hualaihué', 12);
INSERT INTO communes (name, region_id) VALUES('Palena', 12);
INSERT INTO communes (name, region_id) VALUES('Coihaique', 13);
INSERT INTO communes (name, region_id) VALUES('Lago Verde', 13);
INSERT INTO communes (name, region_id) VALUES('Aisén', 13);
INSERT INTO communes (name, region_id) VALUES('Cisnes', 13);
INSERT INTO communes (name, region_id) VALUES('Guaitecas', 13);
INSERT INTO communes (name, region_id) VALUES('Cochrane', 13);
INSERT INTO communes (name, region_id) VALUES('O’Higgins', 13);
INSERT INTO communes (name, region_id) VALUES('Tortel', 13);
INSERT INTO communes (name, region_id) VALUES('Chile Chico', 13);
INSERT INTO communes (name, region_id) VALUES('Río Ibáñez', 13);
INSERT INTO communes (name, region_id) VALUES('Punta Arenas', 14);
INSERT INTO communes (name, region_id) VALUES('Laguna Blanca', 14);
INSERT INTO communes (name, region_id) VALUES('Río Verde', 14);
INSERT INTO communes (name, region_id) VALUES('San Gregorio', 14);
INSERT INTO communes (name, region_id) VALUES('Cabo de Hornos (Ex Navarino)', 14);
INSERT INTO communes (name, region_id) VALUES('Antártica', 14);
INSERT INTO communes (name, region_id) VALUES('Porvenir', 14);
INSERT INTO communes (name, region_id) VALUES('Primavera', 14);
INSERT INTO communes (name, region_id) VALUES('Timaukel', 14);
INSERT INTO communes (name, region_id) VALUES('Natales', 14);
INSERT INTO communes (name, region_id) VALUES('Torres del Paine', 14);
INSERT INTO communes (name, region_id) VALUES('Cerrillos', 15);
INSERT INTO communes (name, region_id) VALUES('Cerro Navia', 15);
INSERT INTO communes (name, region_id) VALUES('Conchalí', 15);
INSERT INTO communes (name, region_id) VALUES('El Bosque', 15);
INSERT INTO communes (name, region_id) VALUES('Estación Central', 15);
INSERT INTO communes (name, region_id) VALUES('Huechuraba', 15);
INSERT INTO communes (name, region_id) VALUES('Independencia', 15);
INSERT INTO communes (name, region_id) VALUES('La Cisterna', 15);
INSERT INTO communes (name, region_id) VALUES('La Florida', 15);
INSERT INTO communes (name, region_id) VALUES('La Granja', 15);
INSERT INTO communes (name, region_id) VALUES('La Pintana', 15);
INSERT INTO communes (name, region_id) VALUES('La Reina', 15);
INSERT INTO communes (name, region_id) VALUES('Las Condes', 15);
INSERT INTO communes (name, region_id) VALUES('Lo Barnechea', 15);
INSERT INTO communes (name, region_id) VALUES('Lo Espejo', 15);
INSERT INTO communes (name, region_id) VALUES('Lo Prado', 15);
INSERT INTO communes (name, region_id) VALUES('Macul', 15);
INSERT INTO communes (name, region_id) VALUES('Maipú', 15);
INSERT INTO communes (name, region_id) VALUES('Ñuñoa', 15);
INSERT INTO communes (name, region_id) VALUES('Pedro Aguirre Cerda', 15);
INSERT INTO communes (name, region_id) VALUES('Peñalolén', 15);
INSERT INTO communes (name, region_id) VALUES('Providencia', 15);
INSERT INTO communes (name, region_id) VALUES('Pudahuel', 15);
INSERT INTO communes (name, region_id) VALUES('Quilicura', 15);
INSERT INTO communes (name, region_id) VALUES('Quinta Normal', 15);
INSERT INTO communes (name, region_id) VALUES('Recoleta', 15);
INSERT INTO communes (name, region_id) VALUES('Renca', 15);
INSERT INTO communes (name, region_id) VALUES('San Joaquín', 15);
INSERT INTO communes (name, region_id) VALUES('San Miguel', 15);
INSERT INTO communes (name, region_id) VALUES('San Ramón', 15);
INSERT INTO communes (name, region_id) VALUES('Santiago centro', 15);
INSERT INTO communes (name, region_id) VALUES('Vitacura', 15);
INSERT INTO communes (name, region_id) VALUES('Puente Alto', 15);
INSERT INTO communes (name, region_id) VALUES('Pirque', 15);
INSERT INTO communes (name, region_id) VALUES('San José de Maipo', 15);
INSERT INTO communes (name, region_id) VALUES('Colina', 15);
INSERT INTO communes (name, region_id) VALUES('Lampa', 15);
INSERT INTO communes (name, region_id) VALUES('Tiltil', 15);
INSERT INTO communes (name, region_id) VALUES('San Bernardo', 15);
INSERT INTO communes (name, region_id) VALUES('Buin', 15);
INSERT INTO communes (name, region_id) VALUES('Calera de Tango', 15);
INSERT INTO communes (name, region_id) VALUES('Paine', 15);
INSERT INTO communes (name, region_id) VALUES('Melipilla', 15);
INSERT INTO communes (name, region_id) VALUES('Alhué', 15);
INSERT INTO communes (name, region_id) VALUES('Curacaví', 15);
INSERT INTO communes (name, region_id) VALUES('María Pinto', 15);
INSERT INTO communes (name, region_id) VALUES('San Pedro', 15);
INSERT INTO communes (name, region_id) VALUES('Talagante', 15);
INSERT INTO communes (name, region_id) VALUES('El Monte', 15);
INSERT INTO communes (name, region_id) VALUES('Isla de Maipo', 15);
INSERT INTO communes (name, region_id) VALUES('Padre Hurtado', 15);
INSERT INTO communes (name, region_id) VALUES('Peñaflor', 15);

-- INSERTAR CATEGORÍAS LIBROS
INSERT INTO categories (name) VALUES
('Sagas'),
('Novela'),
('Ciencia ficción'),
('Novela psicológica'),
('Realismo mágico'),
('Terror'),
('Literatura Juvenil'),
('Clásicos y cuentos'),
('Policial'),
('Literatura latinoamericana'),
('Poesía'),
('Clásicos');

-- INSERTAR AUTORES LIBROS
INSERT INTO authors (name) VALUES
('J.K. Rowling'),
('George R. R. Martin'),
('J.R.R. Tolkien'),
('F. Scott Fitzgerald'),
('George Orwell'),
('Jane Austen'),
('Gabriel García Márquez'),
('Miguel de Cervantes'),
('Fyodor Dostoevsky'),
('Franz Kafka'),
('Juan Rulfo'),
('Ray Bradbury'),
('Aldous Huxley'),
('Albert Camus'),
('Stephen King'),
('William Peter Blatty'),
('Bram Stoker'),
('Oscar Wilde'),
('John Green'),
('Rainbow Rowell'),
('Harper Lee'),
('Alice Kellen'),
('Andrea Tomé'),
('Edgar Allan Poe'),
('Paula Hawkins'),
('James Ellroy'),
('Arthur Conan Doyle'),
('Ernesto Sábato'),
('Julio Cortázar'),
('Laura Esquivel'),
('Mario Benedetti'),
('Jorge Luis Borges'),
('Alejandra Pizarnik'),
('Gabriela Mistral'),
('Homero'),
('Emily Brontë'),
('Jonathan Swift'),
('Antoine de Saint-Exupéry');

-- INSERTAR LIBROS
INSERT INTO books (title, image, description, price, stock, category_id, author_id) VALUES
('El Gran Gatsby', '/books-img/gatsby.webp', 'El Gran Gatsby, considerada por la crítica como la gran novela norteamericana del siglo XX, se sumerge en lo más profundo de los locos años 20, época marcada por la recuperación económica tras la Primera Guerra Mundial y la Ley Seca. Jay Gatsby, un enigmático millonario que se ha hecho a sí mismo, ícono del sueño americano, construye en torno a su figura un mundo frívolo y lujoso, a través del cual pretende recuperar un amor perdido. Pero el vértigo de aquellos años, el vano resplandor de sus apariencias, acabará muy pronto... y con él, las esperanzas de su héroe.', 9990, 50, 2, 4),
('1984', '/books-img/1984.webp', 'UEn el año 1984 Londres es una ciudad lúgubre en la que la Policía del Pensamiento controla de forma asfixiante la vida de los ciudadanos. Winston Smith es un peón de este engranaje perverso y su cometido es reescribir la historia para adaptarla a lo que el Partido considera la versión oficial de los hechos. Hasta que decide replantearse la verdad del sistema que los gobierna y somete.', 14990, 55, 3, 5),
('Orgullo y prejuicio', '/books-img/orgulloyprejuicio.webp', 'Satírica, antirromántica, profunda y mordaz a un tiempo, la obra de Jane Austen nace de la observación de la vida doméstica y de un profundo conocimiento de la condición humana. Orgullo y prejuicio ha fascinado a generaciones de lectores por sus inolvidables personajes y su desopilante retrato de una sociedad, la Inglaterra victoriana y rural, tan contradictoria como absurda. Con la llegada del rico y apuesto señor Darcy a su región, las vidas de los Bennet y sus cinco hijas se vuelven del revés. El orgullo y la distancia social, la astucia y la hipocresía, los malentendidos y los juicios apresurados abocan a los personajes al escándalo y al dolor, pero también a la comprensión, el conocimiento y el amor verdadero.', 12990, 58, 2, 6),
('Cien años de soledad', '/books-img/ciensoledad.webp', '«Muchos años después, frente al pelotón de fusilamiento, el coronel Aureliano Buendía había de recordar aquella tarde remota en que su padre lo llevo a conocer el hielo». Con estas palabras empieza una novela legendaria, una de las aventuras literarias más fascinantes del siglo XX. La familia Buendía-lguarán, con sus milagros, fantasías, obsesiones, tragedias, incestos, adulterios, rebeldías, descubrimientos y condenas, representa al mismo tiempo el mito y la historia, la tragedia y el amor del mundo entero.', 17990, 43, 5, 7),
('Don Quijote de la Mancha', '/books-img/donquijote.webp', '«En un lugar de la Mancha, de cuyo nombre no quiero acordarme, no hace mucho tiempo que vivía un hidalgo de los de lanza en astillero, adarga antigua, rocín flaco y galgo corredor. » El clásico de las letras españolas entra a formar parte de esta colección única. En el año en que se celebra la efeméride, el cuarto centenario de la publicación de la Segunda parte de El Quijote, presentamos esta obra en edición especial, con la versión a cargo de Alberto Blecua.', 24990, 66, 12, 8),
('Crimen y Castigo', '/books-img/crimenycastigo.webp', 'Considerada por la crítica como la primera obra maestra de Dostoievski, es un profundo análisis psicológico de su protagonista, el joven estudiante Raskolnikov, cuya firme creencia en que los fines humanitarios justifican la maldad le conduce al asesinato de un usurero petersburgués. Pero, desde que comete el crimen, la culpabilidad será una pesadilla constante con la que el estudiante será incapaz de convivir.', 12000, 45, 4, 9),
('La metamorfosis', '/books-img/metamorfosis.webp', 'La metamorfosis narra la forma en que un hombre, producto de la rutina y el desamor, abandona su condición humana y se convierte en un monstruoso insecto. Franz Kafka profundiza en una problemática muy propia del mundo contemporáneo, en donde la soledad y la incomunicación se expanden como una letal epidemia.', 10990, 50, 2, 10),
('El amor en los tiempos del cólera ', '/books-img/elamor.webp', 'La historia de amor entre Fermina Daza y Florentino Ariza, en el escenario de un pueblecito portuario del Caribe y a lo largo de más de sesenta años, podría parecer un melodrama de amantes contrariados que al final vencen por la gracia del tiempo y la fuerza de sus propios sentimientos, ya que García Márquez se complace en utilizar los más clásicos recursos de los folletines tradiciones. Pero este tiempo -por una vez sucesivo, y no circular-, este escenario y estos personajes son como una mezcla tropical de plantas y arcilla que la mano del maestro moldea y con las que fantasea a su placer, para al final ir a desembocar en los territorios del mito y la leyenda. Los jugos, olores y sabores del trópico alimentan una prosa alucinatoria que en esta ocasión llega al puerto oscilante del final feliz. ', 14960, 24, 5, 7),
('Pedro Páramo', '/books-img/pedroparamo.webp', 'Un joven en busca de su padre perdido, un pueblo fantasma y un sin fin de personajes misteriosos y enigmaticos. Esta es la historia de Pedro Paramo, creada por el novelista y cuentista mexicano Juan Rulfo, quien nos presenta en esta intrigante novela ese sabor que caracteriza a los literatos latinos e hispanos: la pasion dramatica. Esta apasionante historia nos relata la busqueda de un muchacho por su padre, quien es el mismisimo Pedro Paramo. Y mas que una busqueda por un padre al cual nunca habia visto, Juan Preciado, el muchacho que se aventura a la penumbra de un destino fatal, es la busqueda prometida a la muerte de su madre, del regreso de aquello que le fue arrebatado, es decir, el cobro hacia su padre por haberles abandonado.', 14020, 61, 5, 11),
('Fahrenheit 451', '/books-img/fahrenheit.webp', 'Fahrenheit 451: la temperatura a la que el papel se enciende y arde. Guy Montag es un bombero y el trabajo de un bombero es quemar libros, que están prohibidos porque son causa de discordia y sufrimiento. El Sabueso Mecánico del Departamento de Incendios, armado con una letal inyección hipodérmica, escoltado por helicópteros, está preparado para rastrear a los disidentes que aún conservan y leen libros.', 8990, 48, 3, 12),
('Harry Potter y la Piedra Filosofal', '/books-img/hp-1.jpg', 'Harry Potter se ha quedado huérfano y vive en casa de sus abominables tíos y del insoportable primo Dudley. Se siente muy triste y solo; hasta que un buen día recibe una carta que cambiará su vida para siempre. En ella le comunican que ha sido aceptado como alumno en el colegio interno Hogwarts de magia y hechicería. A partir de ese momento; la suerte de Harry da un vuelco espectacular. En esa escuela tan especial aprenderá encantamientos; trucos fabulosos y tácticas de defensa contra las malas artes. Se convertirá en el campeón escolar de quidditch; especie de fútbol aéreo que se juega montado sobre escobas; y hará un puñado de buenos amigos... aunque también algunos temibles enemigos. Pero; sobre todo; conocerá los secretos que le permitirán cumplir con su destino. Pues; aunque no lo parezca a primera vista; Harry no es un chico común y corriente. ¡Es un verdadero mago!', 15960, 36, 1, 1),
('Harry Potter y la Cámara Secreta', '/books-img/hp2.webp', 'Mientras Harry espera impaciente en casa de sus insoportables tíos el inicio del segundo curso del Colegio Hogwarts de Magia y Hechicería, un elfo aparece en su habitación y le advierte de que una amenaza mortal se cierne sobre la escuela. Harry no se lo piensa dos veces y, acompañado de Ron, se dirige a Hogwarts en un coche volador. Allí, Harry oye extraños susurros en los pasillos desiertos y, de pronto... los ataques comienzan. La siniestra predicción del elfo parece hacerse realidad.', 16990, 55, 1, 1),
('Harry Potter y el Prisionero de Azcaban', '/books-img/hp3.jpg', 'Harry aguarda con impaciencia el inicio del tercer curso en el Colegio Hogwarts de Magia y Hechicería. Tras haber cump lido trece años, solo y lejos de sus amigos de Hogwarts, Ha rry se pelea con su bigotuda tía Marge, a la que convierte en globo, y debe huir en un autobús mágico. Mientras tant o, de la prisión de Azkaban se ha escapado un terrible vill ano, Sirius Black, un asesino en serie con poderes mágicos que fue cómplice de lord Voldemort y que parece dispuesto a eliminar a Harry del mapa. Y por si esto fuera poco, Harry debe enfrentarse también a unos terribles monstruos, los de mentores, seres abominables capaces de robarles la felicidad a los magos y de borrar todo recuerdo hermoso de aquellos q ue osan mirarlos. Lo que ninguno de estos malvados personaje s sabe es que Harry, con la ayuda de sus fieles amigos Ron y Hermione, es capaz de todo y mucho más.', 13820, 45, 1, 1),
('Harry Potter y el Cáliz de Fuego', '/books-img/hp4.jpg', 'Habrá tres pruebas, espaciadas en el curso escolar, que medirán a los campeones en muchos aspectos diferentes: sus habilidades mágicas, su osadía, sus dotes de deducción y, por supuesto, su capacidad para sortear el peligro. Se va a celebrar en Hogwarts el Torneo de los Tres Magos. Sólo los alumnos mayores de diecisiete años pueden participar en esta competición, pero, aun así, Harry sueña con ganarla. En Halloween, cuando el cáliz de fuego elige a los campeones, Harry se lleva una sorpresa al ver que su nombre es uno de los escogidos por el cáliz mágico. Durante el torneo deberá enfrentarse a desafíos mortales, dragones y magos tenebrosos, pero con la ayuda de Ron y Hermione, sus mejores amigos, ¡quizá logre salir con vida!', 24740, 60, 1, 1),
('Harry Potter y la Orden del Fénix', '/books-img/hp5.jpg', 'napolitana', 28490, 43, 1, 1),
('Harry Potter y el Misterio del Príncipe', '/books-img/hp6.jpg', 'Con dieciséis años cumplidos, Harry inicia el sexto curso en Hogwarts en medio de terribles acontecimientos que asolan Inglaterra. Elegido capitán de quidditch, los entrenamientos, los exámenes y las chicas ocupan todo su tiempo, pero la tranquilidad dura poco. A pesar de los férreos controles de seguridad que protegen la escuela, dos alumnos son brutalmente atacados. Dumbledore sabe que se acerca el momento, anunciado por la Profecía, en que Harry y Voldemort se enfrentarán a muerte: "El único con poder para vencer al Señor Tenebroso se acerca... Uno de los dos debe morir a manos del otro, pues ninguno de los dos podrá vivir mientras siga el otro con vida". El anciano director solicitará la ayuda de Harry y juntos emprenderán peligrosos viajes para intentar debilitar al enemigo, para lo cual el joven mago, contará con la ayuda de un viejo libro de pociones perteneciente a un misterioso príncipe, alguien que se hace llamar Príncipe Mestizo.', 23780, 48, 1, 1),
('Harry Potter y las Reliquias de la Muerte', '/books-img/hp7.jpg', 'Harry Potter y las reliquias de la muerte es el séptimo y último volumen de la ya clásica serie fantástica de la autora británica J.K. Rowling. «Entregadme a Harry Potter -dijo la voz de Voldemort- y nadie sufrirá ningún daño. Entregadme a Harry Potter y dejaré el colegio intacto. Entregadme a Harry Potter y seréis recompensados.» Cuando se monta en el sidecar de la moto de Hagrid y se eleva en el cielo, dejando Privet Drive por última vez, Harry Potter sabe que lord Voldemort y sus mortífagos se hallan cerca. El encantamiento protector que había mantenido a salvo a Harry se ha roto, pero él no puede seguir escondiéndose. El Señor Tenebroso se dedica a aterrorizar a todos los seres queridos de Harry, y, para detenerlo, éste habrá de encontrar y destruir los horrocruxes que quedan. La batalla definitiva debe comenzar: Harry tendrá que alzarse y enfrentarse a su enemigo...', 24910, 55, 1, 1),
('Misery', '/books-img/misery.jpg', 'Un famoso escritor queda atrapado en las garras de una obsesiva y sádica fanática que lo tortura física y mentalmente para mantenerlo cautivo y continuar escribiendo para ella.', 21990, 35, 6, 15),
('El retrato de Dorian Gray', '/books-img/elretrato.webp', 'La historia comienza cuando Dorian posa para un retrato pintado por su amigo Basil Hallward. A medida que Dorian contempla su retrato, desea fervientemente que el retrato envejezca en su lugar, preservando su juventud y belleza. Su deseo se cumple, y Dorian descubre que el retrato refleja no solo su apariencia física, sino también el deterioro moral y los pecados que comete.', 15950, 36, 6, 18),
('El teorema Katherine', '/books-img/teorema.webp', 'Colin Singleton es un adolescente prodigio de las matemáticas con dos peculiaridades: por un lado, ha sido abandonado 19 veces por una chica llamada Katherine, por otro, tiene la teoría de que puede predecir el futuro de cualquier relación amorosa gracias a una fórmula matemática', 9990, 28, 7, 19),
('Eleanor & Park', '/books-img/eleanor.jpg', 'Eleanor es una chica marginada con una vida familiar problemática; Park es un chico mitad coreano que ha logrado ser popular a su manera. Pese a sus diferencias, cuando se conocen en el autobús escolar, pronto surge un fuerte vínculo entre ellos.', 8990, 29, 7, 20),
('Matar un ruiseñor', '/books-img/matarunrui.jpg', 'Ambientada en la época de la Gran Depresión en Alabama, esta novela sigue a Scout Finch, una niña de seis años que vive con su hermano mayor y su padre, un abogado que defiende a un hombre negro acusado injustamente de violación.', 12990, 26, 7, 21),
('Todo lo que nunca fuimos', '/books-img/loquenuncafuimos.jpg', 'Leah es una joven que ha decidido renunciar a sus sueños por amor. Sin embargo, su perfecto universo se derrumba cuando Axel, su novio, la deja. Leah tendrá que tomar una decisión: cerrar su corazón al amor o dejar que la vida la sorprenda con nuevas oportunidades.', 15450, 47, 7, 22),
('El valle oscuro', '/books-img/valleoscuro.webp', 'Okinawa, Japón, Segunda Guerra Mundial. Momoko Akiyama es la hija de un matrimonio de intelectuales. Sus únicas preocupaciones son: los disidentes políticos que llegan a su casa de noche y se van de noche, las escapadas de su hermano los miércoles de madrugada y el acoso escolar. Jun Kobayashi, la hija del sepulturero, es violentamente tímida y a duras penas puede pronunciar una frase sin tartamudear. Pero todo lo que creían de su mundo pronto cambiará para siempre. Con una carta de alistamiento. Con una mentira. Con una traición. Con un hombre escondido en un arcón. Con la guerra llamando a sus puertas.', 16890, 40, 7, 23),
('Canción de Hielo y Fuego: Juego de Tronos', '/books-img/juegodetronos.jpg', 'En el legendario mundo de los Siete Reinos donde el verano puede durar décadas y el invierno toda una vida, y donde rastros de una magia inmemorial surgen en los rincones más sombríos, la tierra del norte, Invernalia, está reguardada por un colosal muro de hielo que detiene a fuerzas oscuras y sobrenaturales. En este majestuoso escenario, lord Stark y su familia se encuentra en el centro de un conflicto que desatará las pasiones: la traición y la lealtad, la compasión y la sed dé venganza, el amor y el poder, la lujuria y el incesto, todo ello para ganar la más mortal de las batallas: el trono de hierro, una poderosa trampa que atrapara a los personajes y al lector.', 15170, 100, 1, 2),
('Canción de Hielo y Fuego: Choque de reyes', '/books-img/choquedereyes.jpg', '"Cuando los reyes están en guerra, toda la tierra tiembla." He aquí la esperada secuela de Juego de tronos, segundo volumen de Canción de hielo y fuego, la saga fantástica que ha conquistado amillones de lectores en todo el mundo. "Ahora hay más reyes en el reino que ratas en un castillo", afirma uno de los personajes de Choque de reyes. Y es que después de la sospechosa muerte de Robert Baratheon, el monarca de los Siete Reinos, su hijo Joffrey ha sido impuesto por la fuerza, aunque quienes realmente gobiernan son su madre, un eunuco y un enano, como dice la voz del pueblo. Cuatro nobles se proclaman, a la vez, reyes legítimos, y las tierras de Poniente se estremecen entre guerras y traiciones. Y todo este horror se encuentra presidido por la más ominosa de las señales: un inmenso cometa color sangre suspendido en el cielo.', 21250, 60, 1, 2),
('Canción de Hielo y Fuego: Tormenta de espadas', '/books-img/tormentadeespadas.jpg', 'Las tropas de los inconstantes reyes de poniente arrasan con todo a su paso, empobreciendo aún más su entorno. El destino es titubeante, en cuanto surge un pacto el tiempo parece apresurarse para disolver los enlaces y, así. Los involucrados quedan una vez más con decisiones totalmente vagas. En las ciudades libres, Daenerys Targaryen intenta formar un ejército con el cual desembarcar en su tierra. Mientras la guardia de la noche, a pesar de sus escrupulosos métodos, se ve desbordada por los salvajes.', 11630, 15, 1, 2),
('Canción de Hielo y Fuego: Festín de cuervos', '/books-img/festindecuervos.jpg', 'Luego de siglos de guerras descarnadas, los siete poderes que dividen la tierra se han diezmado unos a otros hasta alcanzar una difícil tregua. Muy pocos reclamos legítimos existen ya por el Trono de Hierro, y la guerra que ha convertido al mundo en poco más que un desierto al fin ha terminado. O eso parece. Pero no pasa mucho tiempo antes de que los sobrevivientes, los proscritos, los renegados y los carroñeros de los Siete Reinos se reúnan. Ahora, como cuervos humanos que acechan un banquete de cenizas, nuevas intrigas y peligrosas alianzas se forman, a la vez que rostros sorprendentes algunos familiares, otros desconocidos emergen de un siniestro crepúsculo de caos y luchas pasadas para asumir los desafíos de los terribles tiempos que se avecinan. Nobles y plebeyos, soldados y hechiceros, asesinos y sabios se unen para hacer valer su vida y sus fortunas. Porque en un festín de cuervos, muchos son los invitados...pero sólo unos pocos logran sobrevivir.', 24990, 37, 1, 2),
('Canción de Hielo y Fuego: Danza de dragones', '/books-img/danzadragones.jpg', 'Después de una colosal batalla, el futuro de los Siete Reinos pende de un hilo, acuciado por nuevas amenazas que emergen de todos los rincones y en todas direcciones. En el este, Danaerys Targaryen, el último eslabón de la Casa Targaryen, gobierna con sus tres dragones como la reina de una ciudad construida sobre polvo y muerte. Pera Daenerys tiene miles de enemigos, y muchos se han propuesto dar con ella. A medida que ellos la buscan, un joven emprende su propio camino hacia la reina, con un objetivo diametralmente distinto. Tyrion Lannister también se dirige hacia Daenerys mientras escapa de Poniente, donde le han puesto precio a su cabeza. Sus nuevos aliados en esta huida, no obstante, no son los malhechores que aparentan ser, y entre ellos se encuentra aquel que podría impedir que Daenerys se haga del control de Poniente para siempre.', 18430, 34, 1, 2),
('El Hobbit', '/books-img/hobbit.webp', 'La historia narra el viaje de un hobbit llamado Bilbo Bolsón (tío de Frodo, uno de los protagonistas principales de El Señor de los Anillos), al que no le gustan las aventuras, a la Montaña Solitaria en busca del tesoro robado por el dragón Smaug años atrás. Todo empieza un inesperado día en el que Bilbo recibe la visita de Gandalf el Gris junto con 13 enanos, entre los que se cuenta a Thorin, Escudo-de-Roble, a cuya familia le fue robado el tesoro. Algunos de los hechos narrados en El Hobbit influirán en los acontecimientos posteriores de El Señor de los Anillos.', 9680, 71, 1, 3),
('El Señor de los Anillos: La comunidad del anillo', '/books-img/comunidaddelanillo.webp', 'La Comunidad del Anillo es el primer volumen de la trilogía El señor de los anillos, escrita por J.R.R. Tolkien. En este libro se narra el inicio de la aventura de Frodo Bolsón y sus compañeros para destruir el Anillo Único.', 20950, 50, 1, 3),
('El Señor de los Anillos: Las dos torres', '/books-img/dostorres.jpg', 'Las Dos Torres es el segundo volumen de la trilogía El señor de los anillos, escrita por J.R.R. Tolkien. En este libro se continúa la épica historia de Frodo y sus compañeros mientras se enfrentan a numerosos peligros en su camino hacia Mordor.', 15950, 48, 1, 3),
('El Señor de los Anillos: El retorno del rey', '/books-img/retornodelrey.jpg', 'El Retorno del Rey es el tercer y último volumen de la trilogía El señor de los anillos, escrita por J.R.R. Tolkien. En este libro se culmina la gran batalla entre las fuerzas del bien y del mal, mientras Frodo y Sam continúan su peligroso viaje hacia el Monte del Destino.', 14950, 25, 1, 3),
('Un mundo feliz', '/books-img/mundofeliz.webp', 'Un mundo feliz (en inglés Brave New World) es la novela más famosa del escritor británico Aldous Huxley, publicada por primera vez en 1932. La novela es una distopía que anticipa el desarrollo en tecnología reproductiva, cultivos humanos e hipnopedia, manejo de las emociones por medio de drogas (soma) que, combinadas, cambian radicalmente la sociedad.', 10990, 12, 3, 13),
('El extranjero', '/books-img/elextranjero.webp', 'Esta obra es considerada como una de las principales novelas existencialistas y aborda temas como la alienación, la indiferencia y la búsqueda de sentido en la vida. El protagonista, Meursault, es un hombre apático y desconectado emocionalmente que se enfrenta a las convenciones sociales y a las consecuencias de sus acciones en un ambiente opresivo. Explora la condición humana y cuestiona las normas y valores establecidos en la sociedad.', 25950, 33, 4, 14),
('El resplandor', '/books-img/elresplandor.jpg', 'En el aislamiento del Hotel Overlook, una familia se enfrenta a una presencia maligna que despierta los oscuros secretos de sus miembros y amenaza con consumirlos por completo.', 14990, 45, 6, 15),
('It', '/books-img/it.jpg', 'En la aterradora ciudad de Derry, un grupo de amigos se enfrenta a una entidad malévola que adopta la forma de sus peores miedos y que resurge cada 27 años para aterrorizar a la población.', 12990, 28, 6, 15),
('El exorcista', '/books-img/elexorcista.jpg', 'Una niña de doce años es poseída por una entidad demoníaca, y dos sacerdotes se enfrentan a una batalla aterradora para liberarla de la influencia del mal.', 6990, 46, 6, 16),
('Drácula', '/books-img/dracula.webp', 'El icónico vampiro, el Conde Drácula, seduce y aterroriza a las personas en su búsqueda por expandir su dominio y saciar su sed de sangre.', 9990, 40, 6, 17),
('Pet Sematary', '/books-img/petsematary.jpg', 'Una familia se muda a una casa cerca de un antiguo cementerio indio, donde descubren que los animales y las personas enterradas allí pueden volver a la vida, pero no de la misma manera.', 13990, 16, 6, 15),
('Bajo la misma estrella', '/books-img/bajolamisma.webp', 'Hazel y Gus son dos adolescentes cuyo amor nace en un grupo de ayuda para pacientes de cáncer. Juntos, intentarán vivir una historia de amor tan extraordinaria como luchadora, demostrando que "algunos infinitos son más grandes que otros infinitos".', 15490, 30, 7, 19),
('Ciudades de papel', '/books-img/ciudadesdepapel.jpg', 'Quentin Jacobsen ha vivido enamorado en secreto de la enigmática y aventurera Margo Roth Spiegelman. Una noche, Margo entra por la ventana de Quentin y le arrastra en un recorrido por la ciudad para vengarse de aquellos que le han hecho daño. Pero el día después, Margo desaparece sin dejar rastro.', 16490, 28, 7, 19),
('Fangirl', '/books-img/fangirl.jpg', 'Cath, una fan de Simon Snow, tiene que lidiar con su primer año de universidad, la falta de su gemela Wren, una profesora exigente de escritura, su adorable compañero de habitación, y un chico que sólo quiere robarle el corazón. Todo esto mientras intenta salir de su mundillo de Simon Snow y enfrentarse al mundo real.', 9890, 17, 7, 20),
('Segundas Oportunidades', '/books-img/segundasop.jpg', 'Cuando Georgie y Neal se conocieron, fue amor a primera vista, un amor  que parecía poder con cualquier inconveniente. Pero ahora tienen problemas, tienen problemas desde hace tiempo. Todavía se aman  profundamente, aunque eso parece no importar. O quizás nunca importó demasiado. Estas Navidades, Neal y Georgie van a hacer un viaje juntos, una  escapada que les permita retomar su relación. Pero un compromiso de  última hora obliga a Georgie a quedarse. Esa misma noche, cuando Georgie  llama a Neal para intentar arreglar las cosas, con quien realmente se  comunica es con un Neal más joven, el Neal que conoció hace tiempo,  antes de que todo empezara. No es un viaje en el tiempo, no exactamente,  pero ella siente que se le ha dado una oportunidad de arreglarlo todo antes de que empiece...', 12990, 15, 7, 20),
('Narraciones extraordinarias', '/books-img/narraciones.jpeg', 'Edgar Allan Poe fue uno de los pioneros del relato corto, célebre por sus historias de terror y misterio, y por haber fundado el género policial. El autor norteamericano supo insuflar vida a las regiones más oscuras del alma humana en cuentos como los que se presentan en esta edición. Este libro reúne una selección de sus mejores narraciones y varias de sus maravillosas composiciones poéticas, entre las que se encuentra «El cuervo». Los textos se acompañan de inquietantes ilustraciones creadas especialmente para esta edición.', 15950, 23, 8, 24),
('La chica del tren', '/books-img/lachicadeltren.webp', 'Rachel, una mujer alcohólica y deprimida, se obsesiona con una pareja que ve todos los días desde el tren. Cuando la mujer desaparece misteriosamente, Rachel se involucra en la investigación y descubre oscuros secretos.', 15950, 17, 9, 25),
('Punto Ciego', '/books-img/puntociego.webp', 'Desde que son niños Edie, Jake y Ryan han sido inseparables. Ellos tres contra el mundo. Edie pensaba que su amistad podría con todo, así que cuando su marido Jake es brutalmente asesinado y su mejor amigo, Ryan, acusado del crimen, su mundo se desmorona. Edie está sola por primera vez en muchos años en la casa del acantilado que compartía con Jake. Está en pleno duelo y tiene miedo, y no le falta razón para tenerlo, pues alguien la está vigilando, alguien que ha estado esperando este momento. Ahora que Edie es vulnerable, el pasado del que ha intentado huir desesperadamente está a punto de llamar a su puerta.', 15000, 30, 9, 25),
('La Dalia Negra', '/books-img/ladalianegra.jpg', 'El 15 de enero de 1947, en un solar de Los Ángeles, apareció el cadáver desnudo y seccionado en dos de una mujer joven. El médico forense determinó que la habían torturado durante días. Elizabeth Short, de 22 años, llamada la Dalia Negra, llevará a los detectives a los bajos fondos de Hollywood, para así involucrar a cierta s personas adineradas de Los Ángeles. Ambos están obsesionados por lo que fue la vida', 9990, 17, 9, 26),
('Estudio en escarlata', '/books-img/estudioenescarlata.webp', 'En Estudio en escarlata Holmes da inicio a su leyenda resolviendo el caso de la aparición de un cadáver hallado en extrañas circunstancias, mientras la policía se pierde en erróneas pistas y culpables que resultan no serlo. Sherlock Holmes da cuenta de su pericia y agudo olfato para descubrir que tras el asesinato hay toda una siniestra historia que se remonta al pasado.', 11190, 45, 9, 27),
('Los Crímenes de la Calle Morgue', '/books-img/loscrimenes.jpg', 'El asesinato de una madre y su hija ha sacudido a la sociedad parisina decimonónica debido a la crueldad con que fue cometido el crimen, pero sobre todo porque la policía ha sido incapaz de encontrar al asesino a pesar de haber entrevistado a numerosos testigos. Sin embargo, la vieja casona de la calle Morgue donde fueron encontradas muertas ambas mujeres es todo lo que necesita Augusto Dupin, un aristócrata venido a menos pero poseedor de una inteligencia fuera de lo común, para dilucidar un misterio que parecía irresoluble. "Los crímenes de la calle Morgue" es considerado el texto fundador de la novela de detectives.', 6990, 23, 9, 24),
('El túnel', '/books-img/eltunel.webp', ' El pintor Juan Pablo Castel, recluido en prisión acusado del asesinato de María Iribarne. Rememora durante su encierro la serie de acontecimientos que le llevaron a perder el control, a convertirse en un hombre con el interior oscuro, un hombre poseído por una insalvable soledad, aquella provocada por la ausencia de la mujer amada hasta el límite, la del engaño que ha convertido su corazón en un pedazo duro y frío de hielo y ha colocado entre sus manos el cuchillo que pone fin al sufrimiento.', 9500, 51, 10, 28),
('Sobre héroes y tumbas', '/books-img/sobreheroes.jpg', 'El dualismo entre el bien y el mal, la incomunicación, el sin sentido y otras angustias del hombre modernoUna novela donde Ernesto Sábato plantea toda su carga ideológica. Centrada en el personaje de Martín, un hombre en busca de sí mismo, el escritor argentino expone su particular visión sobre la soledad, tema clave en su narrativa. Cercana a ciertas obras del existencialismo francés despertó la admiración de Camus.', 16960, 24, 10, 28),
('La resistencia', '/books-img/laresistencia.jpg', 'Ernesto Sabato lanza un mensaje esperanzado al océano de individualismo y pobreza existencial en el que navegamos por estos tiempos. Y su palabra es una llamado a la capacidad de rebelarse. La resistencia es un libro para aquellos que saben leer los símbolos que se abisman entre uno y el universo: la incomunicación, el narcisismo, la reverencia a los dioses de la televisión, el trabajo deshumanizado, el imperio de la máquina sobre el ser, el sometimiento y la masificación, el creciente sentimiento de orfandad, la competencia feroz y el vértigo apocalíptico en el que toda posibilidad de diálogo desaparece. Entonces la pregunta es: ¿cómo resistir?', 9990, 16, 10, 28),
('El Coronel no tiene a quien le escriba', '/books-img/elcoronel.jpg', 'napolitanaTras el barroquismo faulkneriano de La hojarasca, esta segunda novela supone un paso hacia la ascesis, hacia la economía expresiva, y el estilo del escritor se hace más puro y transparente. Se trata también de una historia de injusticia y violencia: un viejo coronel retirado va al puerto todos los viernes a esperar la llegada de la carta oficial que responda a la justa reclamación de sus derechos por los servicios prestados a la patria. Pero la patria permanece muda.', 20000, 25, 10, 7),
('Rayuela', '/books-img/rayuela.jpg', 'Rayuela (1963) es la gran novela de Julio Cortázar. El libro donde el escritor argentino supo condensar sus propias obsesiones estéticas, literarias y vitales en un mosaico casi inagotable donde toda una época se vio maravillosamente reflejada. El amor turbulento de Oliveira y La Maga, los amigos del Club de la Serpiente, las caminatas por París en busca del cielo y el infierno tienen su contracara en la aventura simétrica de Oliveira, Talita y Traveler en una Buenos Aires teñida por el recuerdo. La aparición de Rayuela fue una verdadera revolución dentro de la novelística en lengua española: por primera vez, un escritor llevaba hasta las últimas consecuencias la voluntad de transgredir el orden tradicional de una historia y el lenguaje para contarla. El resultado es este libro único abierto a múltiples lecturas, lleno de humor, de riesgo y de úna originalidad sin precedentes.', 15950, 35, 10, 29),
('Todos los fuegos el fuego ', '/books-img/todoslosfuegos.jpg', 'Todos los fuegos el fuego (1966) ofrece ocho muestras rotundas de la plenitud creadora que alcanzan los cuentos de Cortázar. Desde la exasperada metáfora de las relaciones humanas que es “La autopista del sur” hasta la maestría de “El otro cielo”, Cortázar vuelve a abrir nuevos caminos con relatos que son referencia obligada para sus lectores y para los amantes del cuento en general. Una fiesta de inteligencia, de pasión y geni', 10000, 41, 10, 29),
('Como agua para chocolate', '/books-img/comoagua.jpg', 'Tita y Pedro se aman. Pero ella está condenada a permanecer soltera, cuidando a su madre hasta que éste muerta. Y pedro, para estar cerca  de Tita, se casa con la hermana de ella, Rosaura. Las recetas de cocina que Tita elabora, demás de construir narrativamente la novela, puntean el paso de las estaciones de su vida, siempre marcada por la presente ausencia de Pedro. Como agua para chocolate es una agridulce comedia de amores y desencuentro, una obra chispeante, tierna y pletórica de talento que se ha convertido en uno de los mayores éxitos de la literatura latinoamericana. «como agua para chocolate es una deliciosa historia sobre el amor y la pasión, la tradición y la buena comida. A medio camino entre la novela por entregas y el libro de recetas, es una comedia de amores y desamores, recetas de cocina y remedios caseros.»', 7750, 25, 10, 30),
('La tregua', '/books-img/latregua.webp', 'Martín Santomé está a punto de jubilarse. Aunque le ofrecen ser subgerente de la compañía si a cambio posterga dos años su retiro, no acepta: lo único que le produce cierta ilusión es pensar en no ir más a la oficina. Su vida corre por los rieles de la rutina absoluta, sin sorpresas, pero de pronto comienza a mirar con otros ojos a una nueva compañera que trabaja bajo sus órdenes. ¿Será capaz esta mujer de volver a hacerlo sentir vivo y sacarlo de su monótona soledad?', 9890, 22, 10, 31),
('Inventario uno', '/books-img/inventariouno.webp', 'Inventario Uno reúne todos los poemas publicados en libro por Mario Benedetti entre 1950 y 1985. Algunos textos, que fueron musicalizados, figuran en sus dos formas: poema y canción. Como explica el propio Benedetti, “el volumen se abre con la producción más reciente y concluye con la más antigua, quizá con la secreta esperanza de que el lector, al tener acceso a esta obra por la puerta más nueva y cercana, se vea luego tentado de ir abriendo otras puertas, a beneficio de inventario”. La vocación comunicante es permanente en la obra del autor, y los lectores –que regresamos una y otra vez a sus páginas– construimos con los poemas de Benedetti ese cierto “aire de familia” que se siente ante el paisaje conocido, el amor, la nostalgia del exilio y la maravilla de ver la desesperanza trocada en ilusión.', 36160, 37, 11, 31),
('Inventario dos', '/books-img/inventariodos.webp', 'Como complemento de Inventario Uno, este volumen reúne todos los poemas que Mario Benedetti publicó entre los años 1986 y 1991: Preguntas al azar (1986), Yesterday y mañana (1988), Despistes y franquezas (1990) y Las soledades de Babel (1991). Sin duda, este es un libro fundamental para gozar de la lectura y reafirmar el gusto por el autor. Este compendio de escritos ayuda a recuperar la sensación de felicidad que ofrece, generosamente, quien invita a la fiesta de la poesía, y entonces, la “soledad tan concurrida” se puebla de voces, ritmos y deseos.', 30900, 44, 11, 31),
('Inventario tres', '/books-img/inventariotres.jpg', 'Integran esta edición de Inventario Tres todos los poemas que Mario Benedetti publicó en libros entre 1995 y 2002: El olvido está lleno de memoria (1995), La vida, ese paréntesis (1998), Rincón de Haikus (1999) y El mundo que respiro (2001). Dueño de una escritura lúcida y directa, la obra de Mario Benedetti se inscribe en la mejor tradición de las letras latinoamericanas, en donde temas como la memoria, el espanto y el pasado atraviesan estás páginas junto a los más amenos y bienvenidos tópicos como la alegría de vivir, la esperanza y por sobre todo, la belleza de la palabra.', 31190, 37, 11, 31),
('Poesía completa', '/books-img/poesiacompleta.webp', 'Además de extraordinario narrador y ensayista, Borges fue un excelentepoeta. De hecho, puede decirse que la poesía es el alma de su obra.Indisociable de sus cuentos y ensayos, estos poemas son parteindispensable del universo borgiano y constituyen una indagaciónparalela a los asuntos que siempre le apasionaron: los libros, lamemoria, los laberintos, los espejos, el amor o la eternidad.', 14000, 17, 11, 32),
('Poesía completa', '/books-img/pizarnik.jpg', 'Alejandra Pizarnik es una figura de culto de las letras hispanas y una autora que se internó por infiernos raramente visitados por la literatura española. Su poesía se caracteriza por un hondo intimismo y una severa sensualidad o, en palabras de Octavio Paz, la obra de Pizarnik lleva a cabo una «cristalización verbal por amalgama de insomnio pasional y lucidez meridiana en una disolución de realidad sometida a las más altas temperaturas». Esta edición, a cargo de Ana Becciu, incluye los libros de poemas editados en vida de la autora y los poemas inéditos compilados a partir de manuscritos.', 13690, 34, 11, 33),
('Lagar', '/books-img/lagar.jpg', 'La experiencia del mundo que trasuntan los poemas de Lagar es compleja alerta, erizada, contradictoria- y el lenguaje en el que se manifiesta, si bien se estructura en la austeridad, en muchos momentos se hace incomprensible para la lectura que reduzca el efecto de la poesía a la narratividad y al sentimentalismo. Lagar es un libro importante en el ámbito de la poesía chilena. A cincuenta años de su publicación, su densidad material no ha sido aún del todo desmadejada, ni su retórica superada por los inexorables cambios que nos acarrea el tiempo. Nunca fue, probablemente, un libro joven, y por lo mismo se ha librado de la obligación de envejecer. ', 12520, 37, 11, 34),
('La Ilíada', '/books-img/iliada.webp', 'La Ilíada, compuesta en el siglo VIII a.C., narra una leyenda micénica situada en el siglo XIII a.C., una edad heroica dominada por los aspectos militares, el individualismo desenfrenado y la persecución de la riqueza y la gloria. La Ilíada cuenta un episodio de la epopeya de la rica y estratégica ciudad de Troya, o Ilión. Es el poema de la cólera de Aquiles, hijo de mortal y diosa y el más destacado de los combatientes griegos, en su afán de heroicidad y sus ansias de venganza. El poema de una gran guerra que afecta a multitud de seres humanos, víctimas del enfrentamiento personal de un reducido grupo de héroes en su particular lucha por el poder. El canto del dolor y el sufrimiento, de la caída de unos valores y de un modo de vida, refinado y aristocrático, que acaba en la muerte o en la esclavitud. Pero es también la exaltación de la belleza de la fascinación por la acción y la consecución de la gloria. ', 14890, 27, 12, 35),
('La Odisea', '/books-img/odisea.webp', 'La Odisea es el relato de las aventuras de Odiseo durante su viaje de regreso a Ítaca, después de conquistar Troya. Odiseo es el modelo del héroe errante que se enfrenta a la adversidad y, con fuerza, astucia y alguna ayuda de los dioses, supera las duras pruebas y situaciones que le separan tanto de sus seres queridos, su fiel esposa Penélope y su hijo Telémaco, como de su patria.', 9990, 23, 12, 35),
('Cumbres Borrascosas', '/books-img/cumbres.webp', 'La épica historia de Catherine Heathcliff, situada en los sombríos y desolados páramos de Yorkshire, constituye una asombrosa visión metafísica del destino, la obsesión, la pasión y la venganza. Publicada por primera vez en 1847, un año antes de morir su autora, esta obra rompía por completo con los cánones del "decoro" que la Inglaterra victoriana exigía a toda novela, tanto en el tema escogido como en la descripción de los personajes. Muchos la calificaron de "burda, desagradable y alarmante", pero en ningún momento se dudó de la singularidad de su estructura narrativa y de la fuerza de su lenguaje. Son estos valores los que con posterioridad crearon escuela y convirtieron la novela de Emily Bronte en una de las obras maestras de la literatura universal.', 20190, 17, 12, 36),
('Los viajes de Gulliver', '/books-img/losviajes.webp', 'Los viajes de Gulliver es una sátira en prosa del escritor y clérigo irlandés Jonathan Swift, que es a la vez una sátira sobre la naturaleza humana y el subgénero literario de los «relatos de viajes». Es la obra de narración larga más conocida de Swift, y un clásico de la literatura en inglés. La obra se considera un clásico de la literatura universal y ha inspirado numerosas adaptaciones y versiones.', 11000, 30, 12, 37),
('El Principito', '/books-img/elprincipito.webp', ' El Principito narra la historia de un niño príncipe que vive en un pequeño asteroide y que cae a la Tierra, donde conoce a un piloto varado en el desierto. Ambos entablan una conversación en clave poética donde hablan de filosofía, de crítica social, del amor, del honor y de mucho de lo que nos hace humanos.', 9990, 30, 12, 38);