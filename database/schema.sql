La estructura debe reflejar las entidades que hemos discutido:

licitaciones: información extraída de los portales.

clientes: proveedores (empresas) que son nuestros clientes.

propuestas: propuestas generadas para un cliente y una licitación.

contratos: cuando una propuesta es adjudicada, registramos el contrato y la comisión.

También necesitamos una tabla de usuarios para acceso al dashboard (si aplica), pero quizás la gestión de usuarios la maneje Supabase Auth directamente. Podemos tener una tabla profiles vinculada a auth.users.

Además, podríamos necesitar una tabla de documentos asociados, pero por ahora lo dejamos fuera.

Vamos a crear un schema en PostgreSQL (Supabase) con las siguientes tablas:

licitaciones

clientes

propuestas

contratos

perfiles (opcional, para usuarios del sistema)

Incluiremos comentarios, índices, y políticas de seguridad RLS (Row Level Security) básicas, aunque se pueden ajustar después.

El archivo debe ser ejecutable en Supabase SQL editor.

Escribamos el contenido.

sql
-- database/schema.sql
-- Esquema inicial para LicitIA en Supabase (PostgreSQL)

-- Extensiones útiles
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ----------------------------------------------------------------------
-- Tabla: perfiles (vinculada a auth.users de Supabase)
-- ----------------------------------------------------------------------
CREATE TABLE perfiles (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    nombre_completo TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    rol TEXT NOT NULL DEFAULT 'usuario' CHECK (rol IN ('admin', 'usuario', 'cliente')),
    telefono TEXT,
    avatar_url TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Índices
CREATE INDEX idx_perfiles_email ON perfiles(email);
CREATE INDEX idx_perfiles_rol ON perfiles(rol);

-- Triggers para updated_at
CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_timestamp_perfiles
    BEFORE UPDATE ON perfiles
    FOR EACH ROW
    EXECUTE FUNCTION trigger_set_timestamp();

-- ----------------------------------------------------------------------
-- Tabla: clientes (empresas proveedoras que son nuestros clientes)
-- ----------------------------------------------------------------------
CREATE TABLE clientes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    rnc VARCHAR(20) UNIQUE NOT NULL,
    nombre_empresa TEXT NOT NULL,
    nombre_contacto TEXT,
    email_contacto TEXT,
    telefono_contacto TEXT,
    direccion TEXT,
    sector_comercial TEXT[] DEFAULT '{}', -- Ej: {'construccion', 'servicios'}
    certificaciones TEXT[] DEFAULT '{}',
    experiencia_previas TEXT, -- Descripción general
    monto_maximo_financiamiento DECIMAL(12,2), -- En RD$
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Índices
CREATE INDEX idx_clientes_rnc ON clientes(rnc);
CREATE INDEX idx_clientes_sector ON clientes USING GIN(sector_comercial);

CREATE TRIGGER set_timestamp_clientes
    BEFORE UPDATE ON clientes
    FOR EACH ROW
    EXECUTE FUNCTION trigger_set_timestamp();

-- ----------------------------------------------------------------------
-- Tabla: licitaciones (información extraída de portales)
-- ----------------------------------------------------------------------
CREATE TABLE licitaciones (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    expediente VARCHAR(100) UNIQUE NOT NULL,
    titulo TEXT NOT NULL,
    descripcion TEXT,
    institucion VARCHAR(200) NOT NULL,
    fecha_publicacion DATE NOT NULL,
    fecha_limite_presentacion TIMESTAMPTZ NOT NULL,
    fecha_apertura TIMESTAMPTZ,
    monto_estimado DECIMAL(12,2), -- RD$, si está disponible
    moneda VARCHAR(10) DEFAULT 'DOP',
    tipo_contrato VARCHAR(50), -- Ej: 'Obra', 'Servicio', 'Suministro'
    sector VARCHAR(100), -- Clasificación IA
    requisitos_extraidos JSONB, -- Guardar datos extraídos por IA (garantías, documentos, etc.)
    url_original TEXT,
    url_pliego TEXT,
    fuente VARCHAR(50), -- Ej: 'dgcp', 'miderec', 'mopc'
    datos_extra JSONB, -- Para campos adicionales no estructurados
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Índices
CREATE INDEX idx_licitaciones_expediente ON licitaciones(expediente);
CREATE INDEX idx_licitaciones_institucion ON licitaciones(institucion);
CREATE INDEX idx_licitaciones_fecha_limite ON licitaciones(fecha_limite_presentacion);
CREATE INDEX idx_licitaciones_sector ON licitaciones(sector);
CREATE INDEX idx_licitaciones_fuente ON licitaciones(fuente);

CREATE TRIGGER set_timestamp_licitaciones
    BEFORE UPDATE ON licitaciones
    FOR EACH ROW
    EXECUTE FUNCTION trigger_set_timestamp();

-- ----------------------------------------------------------------------
-- Tabla: propuestas (propuestas generadas para un cliente y licitación)
-- ----------------------------------------------------------------------
CREATE TABLE propuestas (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    cliente_id UUID NOT NULL REFERENCES clientes(id) ON DELETE CASCADE,
    licitacion_id UUID NOT NULL REFERENCES licitaciones(id) ON DELETE CASCADE,
    estado VARCHAR(50) NOT NULL DEFAULT 'borrador' CHECK (estado IN ('borrador', 'enviada', 'adjudicada', 'perdida', 'archivada')),
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    fecha_envio TIMESTAMPTZ,
    monto_ofertado DECIMAL(12,2), -- RD$ ofertado por el cliente
    sobre_a_url TEXT, -- URL del documento generado (PDF/Word)
    sobre_b_url TEXT,
    documentos_adjuntos JSONB, -- Lista de otros documentos
    notas TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE(cliente_id, licitacion_id) -- Evitar propuestas duplicadas para la misma licitación
);

-- Índices
CREATE INDEX idx_propuestas_cliente ON propuestas(cliente_id);
CREATE INDEX idx_propuestas_licitacion ON propuestas(licitacion_id);
CREATE INDEX idx_propuestas_estado ON propuestas(estado);

CREATE TRIGGER set_timestamp_propuestas
    BEFORE UPDATE ON propuestas
    FOR EACH ROW
    EXECUTE FUNCTION trigger_set_timestamp();

-- ----------------------------------------------------------------------
-- Tabla: contratos (cuando una propuesta es adjudicada)
-- ----------------------------------------------------------------------
CREATE TABLE contratos (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    propuesta_id UUID NOT NULL REFERENCES propuestas(id) ON DELETE CASCADE,
    cliente_id UUID NOT NULL REFERENCES clientes(id) ON DELETE CASCADE,
    licitacion_id UUID NOT NULL REFERENCES licitaciones(id) ON DELETE CASCADE,
    numero_contrato VARCHAR(100),
    monto_adjudicado DECIMAL(12,2) NOT NULL,
    moneda VARCHAR(10) DEFAULT 'DOP',
    fecha_adjudicacion DATE NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE,
    porcentaje_comision DECIMAL(5,2) NOT NULL, -- Ej: 7.5 para 7.5%
    monto_comision DECIMAL(12,2) GENERATED ALWAYS AS (monto_adjudicado * (porcentaje_comision / 100)) STORED,
    pagado BOOLEAN DEFAULT FALSE,
    fecha_pago_comision DATE,
    observaciones TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Índices
CREATE INDEX idx_contratos_propuesta ON contratos(propuesta_id);
CREATE INDEX idx_contratos_cliente ON contratos(cliente_id);
CREATE INDEX idx_contratos_licitacion ON contratos(licitacion_id);
CREATE INDEX idx_contratos_pagado ON contratos(pagado);

CREATE TRIGGER set_timestamp_contratos
    BEFORE UPDATE ON contratos
    FOR EACH ROW
    EXECUTE FUNCTION trigger_set_timestamp();

-- ----------------------------------------------------------------------
-- Políticas de seguridad (Row Level Security)
-- Asumiendo que los usuarios se autentican con Supabase Auth.
-- Aquí solo ejemplos básicos, ajustar según necesidades reales.
-- ----------------------------------------------------------------------

-- Habilitar RLS en todas las tablas
ALTER TABLE perfiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE clientes ENABLE ROW LEVEL SECURITY;
ALTER TABLE licitaciones ENABLE ROW LEVEL SECURITY;
ALTER TABLE propuestas ENABLE ROW LEVEL SECURITY;
ALTER TABLE contratos ENABLE ROW LEVEL SECURITY;

-- Políticas para perfiles: cada usuario puede ver/editar su propio perfil
CREATE POLICY perfiles_select_own ON perfiles
    FOR SELECT USING (auth.uid() = id);
CREATE POLICY perfiles_update_own ON perfiles
    FOR UPDATE USING (auth.uid() = id);

-- Políticas para clientes: solo usuarios autenticados pueden ver (según rol)
-- Simplificamos: todos los usuarios autenticados pueden leer clientes, pero solo admins pueden modificar.
CREATE POLICY clientes_select_all ON clientes
    FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY clientes_insert_admin ON clientes
    FOR INSERT WITH CHECK (EXISTS (SELECT 1 FROM perfiles WHERE id = auth.uid() AND rol = 'admin'));
CREATE POLICY clientes_update_admin ON clientes
    FOR UPDATE USING (EXISTS (SELECT 1 FROM perfiles WHERE id = auth.uid() AND rol = 'admin'));
CREATE POLICY clientes_delete_admin ON clientes
    FOR DELETE USING (EXISTS (SELECT 1 FROM perfiles WHERE id = auth.uid() AND rol = 'admin'));

-- Políticas para licitaciones: lectura para todos los autenticados, escritura solo para admins o sistema (mediante funciones)
CREATE POLICY licitaciones_select_all ON licitaciones
    FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY licitaciones_insert_service ON licitaciones
    FOR INSERT WITH CHECK (true); -- En realidad, solo debería insertarse mediante funciones de servicio, pero simplificamos.
CREATE POLICY licitaciones_update_admin ON licitaciones
    FOR UPDATE USING (EXISTS (SELECT 1 FROM perfiles WHERE id = auth.uid() AND rol = 'admin'));

-- Políticas para propuestas: un usuario puede ver propuestas de clientes a los que tiene acceso
-- Aquí asumimos que un perfil con rol 'cliente' está vinculado a un cliente específico (campo cliente_id en perfiles)
-- Pero no hemos añadido ese campo. Por simplicidad, dejamos solo admin puede todo.
CREATE POLICY propuestas_all_admin ON propuestas
    USING (EXISTS (SELECT 1 FROM perfiles WHERE id = auth.uid() AND rol = 'admin'));

-- Contratos similar
CREATE POLICY contratos_all_admin ON contratos
    USING (EXISTS (SELECT 1 FROM perfiles WHERE id = auth.uid() AND rol = 'admin'));

-- Nota: Estas políticas son muy básicas. En producción se deberían refinar según los casos de uso reales.
-- Por ejemplo, se podría añadir un campo cliente_id en perfiles y luego permitir acceso a propuestas de ese cliente.

-- ----------------------------------------------------------------------
-- Fin del esquema
-- ----------------------------------------------------------------------
