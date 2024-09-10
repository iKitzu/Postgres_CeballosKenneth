-- Deshabilitar temporalmente la verificación de claves foráneas
SET session_replication_role = 'replica';

-- Tabla 'departamento'
CREATE TABLE IF NOT EXISTS departamento (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla 'grado'
CREATE TABLE IF NOT EXISTS grado (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla 'curso_escolar'
CREATE TABLE IF NOT EXISTS curso_escolar (
    id SERIAL PRIMARY KEY,
    anyo_inicio INT NOT NULL,
    anyo_fin INT NOT NULL
);

-- Tabla 'profesor'
CREATE TABLE IF NOT EXISTS profesor (
    id SERIAL PRIMARY KEY,
    nif VARCHAR(9) NOT NULL,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25),
    direccion VARCHAR(50),
    telefono VARCHAR(9),
    fecha_nacimiento DATE,
    sexo CHAR(1) CHECK (sexo IN ('H', 'M')),
    id_departamento INT,
    CONSTRAINT fk_profesor_departamento FOREIGN KEY (id_departamento) 
        REFERENCES departamento(id)
);

-- Tabla 'asignatura'
CREATE TABLE IF NOT EXISTS asignatura (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos FLOAT NOT NULL,
    tipo CHAR(1) CHECK (tipo IN ('O', 'E', 'B')), -- O: Obligatoria, E: Electiva, B: Básica
    curso TINYINT NOT NULL,
    cuatrimestre TINYINT NOT NULL,
    id_profesor INT,
    id_grado INT,
    CONSTRAINT fk_asignatura_profesor FOREIGN KEY (id_profesor) 
        REFERENCES profesor(id),
    CONSTRAINT fk_asignatura_grado FOREIGN KEY (id_grado) 
        REFERENCES grado(id)
);

-- Tabla 'alumno'
CREATE TABLE IF NOT EXISTS alumno (
    id SERIAL PRIMARY KEY,
    nif VARCHAR(9) NOT NULL,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR
