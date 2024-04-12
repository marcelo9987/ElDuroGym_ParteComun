--TABLA DE PERSONA--

CREATE TABLE Persona (
    Nombre VARCHAR(100) NOT NULL,
    DNI VARCHAR(9) NOT NULL,
    Id_usuario VARCHAR(30) PRIMARY KEY NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    Domicilio VARCHAR(200) NOT NULL,
    Contraseña VARCHAR(128) NOT NULL
);

--TABLA DE PROFESOR--

CREATE TABLE Profesor (
    Id_usuario VARCHAR(30) NOT NULL,
    Num_Seguridad_Social VARCHAR(12) NOT NULL,
    Especialidad VARCHAR(20) NOT NULL,
    PRIMARY KEY (Id_usuario),
    FOREIGN KEY (Id_usuario) REFERENCES Persona(Id_usuario) ON DELETE CASCADE ON UPDATE CASCADE
);

--TABLA DE ADMINISTRADOR--

CREATE TABLE Administrador (
    Id_usuario VARCHAR(30) NOT NULL,
    PRIMARY KEY (Id_usuario),
    FOREIGN KEY (Id_usuario) REFERENCES Persona(Id_usuario) ON DELETE CASCADE ON UPDATE CASCADE
);

--TABLA DE CLIENTE--

CREATE TABLE Cliente (
    Id_usuario VARCHAR(30) NOT NULL,
    PRIMARY KEY (Id_usuario),
    FOREIGN KEY (Id_usuario) REFERENCES Persona(Id_usuario) ON DELETE CASCADE ON UPDATE CASCADE
);

--TABLA DE TARIFA--

CREATE TABLE Tarifa (
    Id_tarifa SERIAL PRIMARY KEY NOT NULL,
    Tipo VARCHAR(18) DEFAULT 'Bronze' CHECK (Tipo IN ('Bronze', 'Silver', 'Gold', 'Titanium')) NOT NULL,
    Descripcion VARCHAR(500),
    Importe DECIMAL  NOT NULL,
    Duracion INTEGER  NOT NULL,
    Vigencia VARCHAR(10) DEFAULT 'Vigente' CHECK (Vigencia IN ('Vigente', 'No vigente')) NOT NULL
);

--TABLA DE GASTO--

CREATE TABLE Gasto (
    Id_cliente VARCHAR(30),
    Id_tarifa SERIAL,
    Id_gasto SERIAL NOT NULL,
    Fecha DATE DEFAULT CURRENT_DATE NOT NULL,
    Descuento INTEGER NOT NULL,
    Factura INTEGER NOT NULL,
    ImporteCobrar DECIMAL NOT NULL,
    PRIMARY KEY (Id_cliente, Id_tarifa, Id_gasto),
    FOREIGN KEY (Id_cliente) REFERENCES Cliente(Id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Id_tarifa) REFERENCES Tarifa(Id_tarifa) ON DELETE CASCADE ON UPDATE CASCADE
    );

--DEFINICIÓN DEL ATRIBUTO CALCULADO IMPORTECOBRAR--
   
CREATE OR REPLACE FUNCTION calcular_importe_cobrar()
RETURNS TRIGGER AS $$
BEGIN
    RETURN ImporteCobrar * (100 - Descuento) / 100;
END;
$$ LANGUAGE plpgsql;

--CREAR EL DISPARADOR PARA CALCULAR EL IMPORTECOBRAR--

CREATE TRIGGER calcular_importe_cobrar_trigger
BEFORE INSERT OR UPDATE OF ImporteCobrar, Descuento ON Gasto
FOR EACH ROW EXECUTE FUNCTION calcular_importe_cobrar();

CREATE TABLE Factura (
    Id_factura SERIAL PRIMARY KEY NOT NULL,
    Fecha_expedicion DATE DEFAULT CURRENT_DATE NOT NULL,
    Total DECIMAL NOT NULL
);

--DEFINICIÓN DE LA FUNCIÓN PARA CALCULAR EL TOTAL DE LA FACTURA--

CREATE OR REPLACE FUNCTION calcular_total_factura(id_factura INTEGER)
RETURNS DECIMAL AS $$
DECLARE
    total_factura DECIMAL;
BEGIN
    SELECT COALESCE(SUM(importeCobrar), 0)
    INTO total_factura
    FROM Gasto
    WHERE factura = id_factura;

    RETURN total_factura;
END;
$$ LANGUAGE plpgsql;

--ACTUALIZACIÓN DEL TOTAL DE LA FACTURA MEDIANTE UN TRIGGER--

CREATE OR REPLACE FUNCTION actualizar_total_factura()
RETURNS TRIGGER AS $$
BEGIN
    NEW.Total := calcular_total_factura(NEW.Id_factura);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--DISPARADOR PARA LA FUNCIÓN DE CALCULAR EL TOTAL DE LA FACTURA--

CREATE TRIGGER calcular_total_factura_trigger
AFTER INSERT OR UPDATE OR DELETE ON Gasto
FOR EACH ROW EXECUTE FUNCTION actualizar_total_factura();

--TABLA DE CONTRATO--

CREATE TABLE Contrato (
    Id_contrato SERIAL PRIMARY KEY NOT NULL,
    Tipo VARCHAR(20) CHECK (Tipo IN ('Formacion', 'Fijo', 'Fijo Discontinuo')) NOT NULL,
    Fecha_firma DATE DEFAULT CURRENT_DATE NOT NULL,
    Fecha_fin DATE DEFAULT CURRENT_DATE + INTERVAL '1 year' NOT NULL,
    Tipo_jornada VARCHAR(20) CHECK (Tipo_jornada IN ('Completo', 'Parcial')) NOT NULL,
    Rango_horario VARCHAR(15) CHECK (Rango_horario IN ('Mañana', 'Tarde')) NOT NULL
);

--TABLA DE SALARIO--

CREATE TABLE Salario (
    Id_salario SERIAL NOT NULL,
    Id_profesor VARCHAR(30) NOT NULL,
    Id_contrato INTEGER NOT NULL,
    Fecha_salario DATE NOT NULL,
    Total_a_pagar DECIMAL NOT NULL,
    CONSTRAINT chk_total_a_pagar CHECK (Total_a_pagar >= 0),
    PRIMARY KEY (Id_salario, Id_profesor, Id_contrato),
    FOREIGN KEY (Id_profesor) REFERENCES Profesor(Id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Id_contrato) REFERENCES Contrato(Id_contrato) ON DELETE CASCADE ON UPDATE CASCADE
    
);

--FUNCIÓN PARA OBTENER EL PRIMER DÍA DEL SIGUIENTE MES--

CREATE OR REPLACE FUNCTION primer_dia_siguiente_mes(fecha DATE) RETURNS DATE AS $$
DECLARE
    siguiente_mes DATE;
BEGIN
    siguiente_mes := fecha + INTERVAL '1 month';
    RETURN siguiente_mes - EXTRACT(DAY FROM siguiente_mes)::INTEGER + 1;
END;
$$ LANGUAGE plpgsql;

--DISPARADOR PARA ACTUALIZAR LA FECHA DE SALARIO AL PRIMER DÍA DEL MES SIGUIENTE--

CREATE OR REPLACE FUNCTION actualizar_fecha_salario() RETURNS TRIGGER AS $$
BEGIN
    NEW.Fecha_salario := primer_dia_siguiente_mes(NEW.Fecha_salario);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--DISPARADOR PARA LA FUNCIONA DE ACTUALIZAR LÑA FECHA DE SALARIO--

CREATE TRIGGER actualizar_fecha_salario_trigger
BEFORE INSERT ON Salario
FOR EACH ROW EXECUTE FUNCTION actualizar_fecha_salario();

--TABLA DE ACTIVIDAD--

CREATE TABLE Actividad (
    Id_actividad SERIAL PRIMARY KEY NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    Descripcion VARCHAR(500),
    Tipo VARCHAR(50) NOT NULL
);

--TABLA DE GRUPO--

CREATE TABLE Grupo (
    Id_grupo SERIAL NOT NULL,
    Id_usuario VARCHAR(30) NOT NULL,
    Id_actividad SERIAL NOT NULL,
    PRIMARY KEY (Id_grupo, Id_usuario, Id_actividad),
    FOREIGN KEY (Id_usuario) REFERENCES Persona(Id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Id_actividad) REFERENCES Actividad(Id_actividad) ON DELETE CASCADE ON UPDATE CASCADE
);

--MODIFICAMOS LA TABLA GRUPO PARA QUE TENGA UNIQUE EN ID_GRUPO--

ALTER TABLE Grupo ADD CONSTRAINT UQ_Id_grupo UNIQUE (Id_grupo);

--TABLA DE AULA--

CREATE TABLE Aula (
    Id_grupo SERIAL NOT NULL,
    Id_aula SERIAL NOT NULL,
    PRIMARY KEY (Id_grupo, Id_aula),
    FOREIGN KEY (Id_grupo) REFERENCES Grupo(Id_grupo) ON DELETE RESTRICT
);

--MODIFICAMOS LA TABLA AULA PARA QUE TENGA UNIQUE EN ID_AULA--

ALTER TABLE Aula ADD CONSTRAINT UQ_Id_aula UNIQUE (Id_aula);

--TABLA DE EQUIPAMIENTO--

CREATE TABLE Equipamiento (
    Id_aula SERIAL NOT NULL,
    Id_equipamiento SERIAL NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    Fecha_mantenimiento DATE NOT NULL,
    Descripcion VARCHAR(200),
    PRIMARY KEY (Id_aula, Id_equipamiento),
    FOREIGN KEY (Id_aula) REFERENCES Aula(Id_aula)
);

--TABLA DE SESION--

CREATE TABLE Sesion (
    Id_aula SERIAL NOT NULL,
    Id_grupo SERIAL NOT NULL,
    Id_reserva SERIAL NOT NULL,
    Fecha_hora_inicio TIMESTAMP NOT NULL,
    Fecha_hora_fin TIMESTAMP NOT NULL,
    Duración INTERVAL NOT NULL,
    Descripcion VARCHAR(200) NOT NULL,
    PRIMARY KEY (Id_aula, Id_grupo, Id_reserva),
    FOREIGN KEY (Id_aula) REFERENCES Aula(Id_aula) ,
    FOREIGN KEY (Id_grupo) REFERENCES Grupo(Id_grupo)
);

--TABLA ESPECIALIDAD--

CREATE TABLE Especialidad (
	Id_profesor VARCHAR (20) NOT NULL,
	Tipo VARCHAR (20) NOT NULL,
	PRIMARY KEY (Id_profesor, Tipo),
	FOREIGN KEY (Id_profesor) REFERENCES Profesor(Id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE
);
