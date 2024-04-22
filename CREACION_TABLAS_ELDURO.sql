--TABLA DE PERSONA--

CREATE TABLE Persona
(
    id_persona  SERIAL PRIMARY KEY NOT NULL,
    Nombre      VARCHAR(100)       NOT NULL,
    DNI         VARCHAR(9) UNIQUE  NOT NULL,
    Correo      VARCHAR(100)       NOT NULL,
    Domicilio   VARCHAR(200)       NOT NULL,
    NickName    VARCHAR(100)       NOT NULL,
    Contrasenha VARCHAR(150)       NOT NULL
);

--TABLA DE PROFESOR--

CREATE TABLE Profesor
(
    id_profesor          INTEGER PRIMARY KEY NOT NULL,
    Num_Seguridad_Social VARCHAR(20)         NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES Persona (id_persona) ON DELETE CASCADE ON UPDATE CASCADE
);

--TABLA DE ADMINISTRADOR--

CREATE TABLE Administrador
(
    id_administrador INTEGER PRIMARY KEY NOT NULL,
    FOREIGN KEY (id_administrador) REFERENCES Persona (id_persona) ON DELETE CASCADE ON UPDATE CASCADE
);

--TABLA DE CLIENTE--

CREATE TABLE Cliente
(
    id_cliente INTEGER PRIMARY KEY NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Persona (id_persona) ON DELETE CASCADE ON UPDATE CASCADE
);

--TABLA DE TARIFA--

CREATE TABLE Tarifa
(
    Id_tarifa   SERIAL PRIMARY KEY                                                                       NOT NULL,
    Tipo        VARCHAR(18)    DEFAULT 'Bronze' CHECK (Tipo IN ('Bronze', 'Silver', 'Gold', 'Titanium')) NOT NULL,
    Descripcion VARCHAR(500),
    Importe     DECIMAL(10, 2) DEFAULT 0                                                                 NOT NULL,
    Duracion    INTEGER                                                                                  NOT NULL,
--     Vigencia VARCHAR(10) DEFAULT 'Vigente' CHECK (Vigencia IN ('Vigente', 'No vigente')) NOT NULL
    Vigente     BOOLEAN        DEFAULT TRUE                                                              NOT NULL
);

--TABLA FACTURA--

CREATE TABLE Factura
(
    Id_factura       SERIAL PRIMARY KEY                  NOT NULL,
    Fecha_expedicion DATE           DEFAULT CURRENT_DATE NOT NULL,
    Total            DECIMAL(10, 2) DEFAULT 0            NOT NULL
);

--TABLA DE GASTO--

CREATE TABLE Gasto
(
    Id_gasto      SERIAL PRIMARY KEY                  NOT NULL,
    Id_cliente    INTEGER                             NOT NULL,
    Id_tarifa     INTEGER                             NOT NULL,
    Fecha         DATE           DEFAULT CURRENT_DATE NOT NULL,
    Descuento     DECIMAL(5, 2)                       NOT NULL,
    Id_factura    INTEGER                             NULL,
    ImporteCobrar DECIMAL(10, 2) DEFAULT 0            NOT NULL,
-- todo: posible UNIQUE KEY que sería id_cliente, id_tarifa, fecha
    FOREIGN KEY (Id_cliente) REFERENCES Cliente (id_cliente) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Id_tarifa) REFERENCES Tarifa (Id_tarifa) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Id_factura) REFERENCES Factura (Id_factura) ON DELETE CASCADE ON UPDATE CASCADE
);

--DEFINICIÓN DEL ATRIBUTO CALCULADO IMPORTECOBRAR--

CREATE OR REPLACE FUNCTION calcular_importe_cobrar()
    RETURNS TRIGGER AS
$$
DECLARE
    importe_tarifa DECIMAL;
BEGIN
    --OBTENEMOS EL IMPORTE DE LA TARIFA CORRESPONDIENTE AL ID_TARIFA DE LA FILA ACTUAL DE GASTO--
    SELECT Importe INTO importe_tarifa FROM Tarifa WHERE Id_tarifa = NEW.Id_tarifa;

    --CALCULAMOS EL IMPORTECOBRAR--
    NEW.ImporteCobrar := importe_tarifa * (100 - NEW.Descuento) / 100;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--CREAMOS EL DISPARADOR PARA ACTIVAR LA FUNCIÓN ANTES DE INSERTAR O ACTUALIZAR EL IMPORTECOBRAR O EL DESCUENTO EN LA TABLA GASTO--
CREATE TRIGGER calcular_importe_cobrar_trigger
    BEFORE INSERT OR UPDATE OF ImporteCobrar, Descuento
    ON Gasto
    FOR EACH ROW
EXECUTE FUNCTION calcular_importe_cobrar();

--DEFINICIÓN DE LA FUNCIÓN PARA CALCULAR EL TOTAL DE LA FACTURA--
CREATE OR REPLACE FUNCTION calcular_total_factura(Id_factura_ INTEGER)
    RETURNS DECIMAL AS
$$
DECLARE
    total_factura DECIMAL;
BEGIN
    SELECT COALESCE(SUM(importeCobrar), 0)
    INTO total_factura
    FROM Gasto
    WHERE Gasto.Id_factura = Id_factura_;

    RETURN total_factura;
END;
$$ LANGUAGE plpgsql;

-- ACTUALIZAMOS EL TOTAL DE LA FACTURA MEDIANTE UN TRIGGER--
CREATE OR REPLACE FUNCTION actualizar_total_factura()
    RETURNS TRIGGER AS
$$
BEGIN
    -- ACTUALIZAMOS EL TOTAL DE LA FACTURA UTILIZANDO LA FUNCIÓN CALCULAR_TOTAL_FACTURA--
    UPDATE Factura
    SET Total = calcular_total_factura(NEW.id_factura)
    WHERE Id_factura = NEW.id_factura;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER calcular_total_factura_trigger
    AFTER INSERT OR UPDATE OR DELETE
    ON Gasto
    FOR EACH ROW
EXECUTE FUNCTION actualizar_total_factura();

--TABLA DE CONTRATO--

CREATE TABLE Contrato
(
    Id_contrato   SERIAL PRIMARY KEY                                                    NOT NULL,
    Id_profesor   INTEGER                                                               NOT NULL,
    Tipo          VARCHAR(20) CHECK (Tipo IN ('Formacion', 'Fijo', 'Fijo Discontinuo')) NOT NULL, -- todo: tal vez podamos hacer una tabla con tipos de contratos
    Fecha_firma   DATE DEFAULT CURRENT_DATE                                             NOT NULL,
    Fecha_fin     DATE DEFAULT CURRENT_DATE + INTERVAL '1 year'                         NOT NULL,
    Tipo_jornada  VARCHAR(20) CHECK (Tipo_jornada IN ('Completo', 'Parcial'))           NOT NULL, -- todo: ¿tabla nueva?
    Rango_horario VARCHAR(15) CHECK (Rango_horario IN ('Mañana', 'Tarde'))              NOT NULL, -- todo: ¿tabla nueva?
    FOREIGN KEY (Id_profesor) REFERENCES Profesor (id_profesor) ON DELETE CASCADE ON UPDATE CASCADE
);

--TABLA DE SALARIO--

CREATE TABLE Salario
(
    Id_salario    SERIAL PRIMARY KEY       NOT NULL,
    Id_contrato   INTEGER                  NOT NULL,
    Fecha_salario DATE,
    Total_a_pagar DECIMAL(10, 2) DEFAULT 0 NOT NULL,
    CONSTRAINT chk_total_a_pagar CHECK (Total_a_pagar >= 0),
    UNIQUE (id_contrato, Fecha_salario),
    FOREIGN KEY (Id_contrato) REFERENCES Contrato (Id_contrato) ON DELETE CASCADE ON UPDATE CASCADE
);


--DISPARADOR PARA ACTUALIZAR LA FECHA DE SALARIO AL PRIMER DÍA DEL MES SIGUIENTE--

CREATE OR REPLACE FUNCTION actualizar_fecha_salario() RETURNS TRIGGER AS
$$
DECLARE
    fecha_anterior DATE;
    nueva_fecha    DATE;
BEGIN
    --OBTENER LA FECHA DEL ÚLTIMO SALARIO REGISTRADO PARA EL MISMO ID_CONTRATO--
    SELECT MAX(Fecha_salario)
    INTO fecha_anterior
    FROM Salario
    WHERE Id_contrato = NEW.Id_contrato;

    --VERIFICAR SI SE ENCONTRÓ UNA FECHA ANTERIOR--

    IF fecha_anterior IS NOT NULL THEN
        --sumar un mes a la fecha anterior--
        nueva_fecha := fecha_anterior + INTERVAL '1 month';
    ELSE
        --SI NO HAY FECHA ANTERIOR, ESTABLECER LA FECHA ACTUAL COMO NUEVA FECHA--

        nueva_fecha := CURRENT_DATE;
    END IF;

    --AJUSTAR LA NUEVA FECHA PARA QUE SEA EL PRIMER DÍA DEL MES SIGUIENTE--

    nueva_fecha := nueva_fecha + INTERVAL '1 month' - EXTRACT(DAY FROM nueva_fecha) * INTERVAL '1 day';

    --ASIGNAMOS LA NUEVA FECHA AL REGISTRO ACTUAL--

    NEW.Fecha_salario := nueva_fecha;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--DISPARADOR PARA LA FUNCIONA DE ACTUALIZAR LÑA FECHA DE SALARIO--

CREATE TRIGGER actualizar_fecha_salario_trigger
    BEFORE INSERT OR UPDATE
    ON Salario
    FOR EACH ROW
EXECUTE FUNCTION actualizar_fecha_salario();

--FUNCION PARA CALCULAR EL SALARIO--

CREATE OR REPLACE FUNCTION actualizar_total_a_pagar()
    RETURNS TRIGGER AS
$$
DECLARE
    tipo_contrato_contrato VARCHAR(20);
    tipo_jornada_contrato  VARCHAR(20);
BEGIN

    -- OBTENEMOS EL TIPO DE CONTRATO Y LA JORNADA DEL CONTRATO CORRESPONDIENTE--

    SELECT Tipo, Tipo_jornada
    INTO tipo_contrato_contrato, tipo_jornada_contrato
    FROM Contrato
    WHERE Id_contrato = NEW.Id_contrato;

    -- ACTUALIZAMOS EL TOTAL_A_PAGAR EN FUNCIÓN DEL TIPO DE CONTRATO Y LA JORNADA--

    IF tipo_contrato_contrato = 'Fijo' AND tipo_jornada_contrato = 'Completo' THEN
        NEW.Total_a_pagar := 2100;
    ELSIF tipo_contrato_contrato = 'Fijo' AND tipo_jornada_contrato = 'Parcial' THEN
        NEW.Total_a_pagar := 1050;
    ELSIF tipo_contrato_contrato = 'Formacion' AND tipo_jornada_contrato = 'Completo' THEN
        NEW.Total_a_pagar := 1500;
    ELSIF tipo_contrato_contrato = 'Formacion' AND tipo_jornada_contrato = 'Parcial' THEN
        NEW.Total_a_pagar := 750;
    ELSIF tipo_contrato_contrato = 'Fijo Discontinuo' AND tipo_jornada_contrato = 'Completo' THEN
        NEW.Total_a_pagar := 2100;
    ELSIF tipo_contrato_contrato = 'Fijo Discontinuo' AND tipo_jornada_contrato = 'Parcial' THEN
        NEW.Total_a_pagar := 1050;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- CREAMOS UN DISPARADOR PARA EJECUTAR LA FUNCIÓN ACTUALIZAR_TOTAL_A_PAGAR--

CREATE TRIGGER actualizar_total_a_pagar_trigger
    BEFORE INSERT OR UPDATE OF Id_contrato
    ON Salario
    FOR EACH ROW
EXECUTE FUNCTION actualizar_total_a_pagar();

--TABLA DE ACTIVIDAD--

CREATE TABLE Actividad
(
    Id_actividad SERIAL PRIMARY KEY NOT NULL,
    Nombre       VARCHAR(20) UNIQUE NOT NULL,
    Descripcion  VARCHAR(500),
    Tipo         VARCHAR(50)        NOT NULL
);

--TABLA DE GRUPO--

CREATE TABLE Grupo
(
    Id_grupo     SERIAL PRIMARY KEY NOT NULL,
    Id_actividad INTEGER            NOT NULL,
    FOREIGN KEY (Id_actividad) REFERENCES Actividad (Id_actividad) ON DELETE CASCADE ON UPDATE CASCADE
);

--TABLA GRUPO TIENE CLIENTE--

CREATE TABLE Grupo_tiene_Cliente
(
    Id_grupo   INTEGER NOT NULL,
    Id_cliente INTEGER NOT NULL,
    PRIMARY KEY (Id_grupo, id_cliente),
    FOREIGN KEY (Id_grupo) REFERENCES Grupo (Id_grupo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente) ON DELETE CASCADE ON UPDATE CASCADE
);

--TABLA GRUPO TIENE PROFESOR--

CREATE TABLE Grupo_tiene_Profesor
(
    Id_grupo    INTEGER NOT NULL,
    Id_profesor INTEGER NOT NULL,
    PRIMARY KEY (Id_grupo, Id_profesor),
    FOREIGN KEY (Id_grupo) REFERENCES Grupo (Id_grupo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Id_profesor) REFERENCES Profesor (Id_profesor) ON DELETE CASCADE ON UPDATE CASCADE
);

--TABLA DE AULA--

CREATE TABLE Aula
(
    Id_aula SERIAL PRIMARY KEY  NOT NULL,
    Nombre  VARCHAR(100) UNIQUE NOT NULL,
    Aforo   INTEGER
);

--TABLA DE EQUIPAMIENTO--

CREATE TABLE Equipamiento
(
    Id_equipamiento     SERIAL       NOT NULL,
    Id_aula             INTEGER      NOT NULL,
    Nombre              VARCHAR(100) NOT NULL,
    Fecha_mantenimiento DATE         NOT NULL,
    Descripcion         VARCHAR(200),
    UNIQUE (Id_aula, id_equipamiento),
    FOREIGN KEY (Id_aula) REFERENCES Aula (Id_aula) ON DELETE CASCADE ON UPDATE CASCADE
);

--TABLA DE SESION--

CREATE TABLE Sesion
(
    Id_aula           INTEGER                   NOT NULL,
    Id_grupo          INTEGER                   NOT NULL,
    Id_reserva        SERIAL UNIQUE PRIMARY KEY NOT NULL,
    Fecha_hora_inicio TIMESTAMP                 NOT NULL,
    Fecha_hora_fin    TIMESTAMP                 NOT NULL,
    Duracion          INTERVAL                  NOT NULL,
    Descripcion       VARCHAR(200)              NOT NULL,
    FOREIGN KEY (Id_aula) REFERENCES Aula (Id_aula) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (Id_grupo) REFERENCES Grupo (Id_grupo) ON DELETE NO ACTION ON UPDATE NO ACTION
);

--CREAMOS UNA FUNCIÓN PARA CALCULAR LA DURACIÓN ENTRE DOS TIMESTAMPS--

CREATE OR REPLACE FUNCTION calcular_duracion_interval(fecha_hora_inicio TIMESTAMP, fecha_hora_fin TIMESTAMP)
    RETURNS INTERVAL AS
$$
BEGIN
    RETURN fecha_hora_fin - fecha_hora_inicio;
END;
$$ LANGUAGE plpgsql;

--CREAMOS UN DISPARADOR PARA CALCULAR LA DURACIÓN AL INSERTAR O ACTUALIZAR UNA SESIÓN--

CREATE OR REPLACE FUNCTION calcular_duracion_trigger()
    RETURNS TRIGGER AS
$$
BEGIN
    NEW.Duracion := calcular_duracion_interval(NEW.fecha_hora_inicio, NEW.fecha_hora_fin);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER calcular_duracion_trigger
    BEFORE INSERT OR UPDATE
    ON Sesion
    FOR EACH ROW
EXECUTE FUNCTION calcular_duracion_trigger();

--TABLA ESPECIALIDAD--

CREATE TABLE Especialidad
(
    Id_profesor         INTEGER      NOT NULL,
    Nombre_especialidad VARCHAR(100) NOT NULL,
    PRIMARY KEY (Id_profesor, Nombre_especialidad),
    FOREIGN KEY (Id_profesor) REFERENCES Profesor (Id_profesor) ON DELETE RESTRICT ON UPDATE CASCADE
);
