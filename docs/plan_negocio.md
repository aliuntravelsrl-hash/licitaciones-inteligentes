# Plan de Negocio de LicitIA 📊

**Versión:** 1.0  
**Fecha:** 8 de marzo de 2026  
**Autor:** Equipo LicitIA  

---

## 📋 Resumen ejecutivo

**LicitIA** es una plataforma tecnológica que actúa como **intermediario inteligente entre proveedores del estado y las licitaciones públicas**. Utiliza web scraping (Firecrawl) e inteligencia artificial (Claude/OpenAI) para detectar oportunidades, analizar pliegos y generar propuestas técnicas y económicas de forma automática.

El modelo de negocio se basa en:
- **Comisión por éxito** (porcentaje sobre el monto adjudicado).
- **Membresía mensual** para acceso a alertas premium y generación de propuestas.
- **Servicios complementarios** (consultoría, representación legal, etc.).

Con una inversión inicial baja (infraestructura ya existente) y costos operativos reducidos, proyectamos alcanzar la rentabilidad en el mes 4 y superar los **RD$ 8 millones en ingresos anuales** al final del primer año.

---

## 🎯 Propuesta de valor

### Para el proveedor (cliente)

| Problema | Solución LicitIA |
|----------|------------------|
| No tienen tiempo para monitorear licitaciones a diario | Scraping automático + alertas personalizadas |
| Desconocen licitaciones que se ajustan a su perfil | Clasificación IA y scoring de afinidad |
| Preparar propuestas es lento y propenso a errores | Generación automática de Sobres A y B |
| Se les escapan plazos o requisitos | Checklists y recordatorios automáticos |
| Alta competencia, difícil destacar | Propuestas optimizadas y profesionales |

### Valor añadido
- **Ahorro de tiempo:** De días/horas a minutos.
- **Mayor tasa de éxito:** Propuestas mejor preparadas y a tiempo.
- **Acceso a oportunidades:** Detectamos licitaciones que otros no ven.
- **Sin costo fijo:** Pagas solo cuando ganas (en el modelo de comisión pura).

---

## 💰 Modelo de ingresos

### 1. Comisión por éxito (core)

| Tramo de adjudicación | Comisión |
|-----------------------|----------|
| Hasta RD$ 5,000,000 | 10% |
| RD$ 5,000,001 – RD$ 20,000,000 | 7% |
| Más de RD$ 20,000,000 | 5% + fijo RD$ 500,000 |

*Ejemplo:* Si un cliente gana una licitación de RD$ 8,000,000, la comisión sería:  
- 10% de los primeros 5M = RD$ 500,000  
- 7% de los 3M restantes = RD$ 210,000  
**Total comisión:** RD$ 710,000

### 2. Membresía mensual (opcional)

| Plan | Precio | Incluye |
|------|--------|---------|
| Básico (gratuito) | RD$ 0 | Alertas de licitaciones públicas (sin filtrar) |
| Profesional | RD$ 5,000/mes | Alertas personalizadas + análisis IA + 2 propuestas/mes incluidas |
| Empresarial | RD$ 15,000/mes | Alertas ilimitadas + propuestas ilimitadas + dashboard dedicado + soporte prioritario |

### 3. Servicios premium (bajo demanda)

| Servicio | Precio estimado |
|----------|-----------------|
| Redacción profesional de propuesta (completa) | RD$ 25,000 – RD$ 50,000 |
| Revisión y optimización de propuesta existente | RD$ 10,000 – RD$ 20,000 |
| Representación legal en apertura de sobres | RD$ 15,000 + gastos |
| Gestión documental completa (legalización, apostilla, etc.) | Según caso |
| Capacitación al equipo del proveedor | RD$ 30,000 (taller de 4h) |

---

## 📈 Proyecciones financieras (primer año)

### Supuestos
- Inicio de operaciones: marzo 2026.
- Clientes iniciales: 2 (piloto, sin membresía, solo comisión).
- Crecimiento gradual de clientes de pago (membresía) a partir del mes 4.
- Tasa de conversión: 30% de propuestas presentadas → adjudicadas.
- Ticket promedio de adjudicación: RD$ 8,000,000.

### Tabla de proyección mensual (en RD$)

| Mes | Clientes membresía | Licitaciones detectadas | Propuestas presentadas | Contratos esperados | Ingreso comisiones | Ingreso membresías | **Ingreso total** |
|-----|--------------------|-------------------------|------------------------|----------------------|--------------------|--------------------|-------------------|
| 1   | 0                  | 30                      | 10                     | 0                    | 0                  | 0                  | **0** |
| 2   | 0                  | 40                      | 15                     | 1                    | 500,000            | 0                  | **500,000** |
| 3   | 1                  | 50                      | 20                     | 2                    | 1,000,000          | 5,000              | **1,005,000** |
| 4   | 3                  | 60                      | 25                     | 3                    | 1,500,000          | 15,000             | **1,515,000** |
| 5   | 5                  | 70                      | 30                     | 4                    | 2,000,000          | 25,000             | **2,025,000** |
| 6   | 7                  | 80                      | 35                     | 5                    | 2,500,000          | 35,000             | **2,535,000** |
| 7   | 9                  | 90                      | 40                     | 6                    | 3,000,000          | 45,000             | **3,045,000** |
| 8   | 11                 | 100                     | 45                     | 7                    | 3,500,000          | 55,000             | **3,555,000** |
| 9   | 13                 | 110                     | 50                     | 8                    | 4,000,000          | 65,000             | **4,065,000** |
| 10  | 15                 | 120                     | 55                     | 9                    | 4,500,000          | 75,000             | **4,575,000** |
| 11  | 17                 | 130                     | 60                     | 10                   | 5,000,000          | 85,000             | **5,085,000** |
| 12  | 20                 | 150                     | 70                     | 12                   | 6,000,000          | 100,000            | **6,100,000** |

**Total año 1 estimado:** **RD$ 33,000,000 – 35,000,000** (dependiendo de la estacionalidad de licitaciones).

---

## 💸 Estructura de costos (mensual)

| Concepto | Costo (USD) | Costo (RD$ aprox) | Observaciones |
|----------|--------------|--------------------|---------------|
| Firecrawl (plan profesional) | $49 | RD$ 2,800 | Plan recomendado para 10k créditos/mes |
| n8n (self-hosted en VPS) | $20 | RD$ 1,150 | VPS de Hostinger (4GB RAM, 2 vCPU) |
| Supabase (Plan Pro) | $25 | RD$ 1,450 | Base de datos + almacenamiento |
| API OpenAI/Claude | $150 – $400 | RD$ 8,600 – 23,000 | Variable según uso intensivo |
| Hostinger Horizons | $12 | RD$ 700 | Hosting del dashboard |
| Dominio + SSL | $3 | RD$ 170 | Anual prorrateado |
| Total estimado | $259 – $509 | RD$ 14,900 – 29,300 | |

**Costo anual aproximado:** **RD$ 180,000 – 350,000** (fácilmente cubierto con 1 contrato pequeño).

---

## 🧩 Análisis de mercado

### Tamaño de mercado
- En República Dominicana, el portal DGCP publica **más de 2,000 procesos de compra al año** (obras, bienes y servicios).
- Solo en construcción (MIDEREC, MOPC, INVI), se estiman **más de 500 licitaciones anuales** por montos superiores a RD$ 10M.
- Proveedores activos registrados: **más de 15,000 empresas**.

### Clientes objetivo
- **Constructoras medianas** (5–50 empleados) que ya participan en licitaciones pero quieren crecer.
- **Empresas de servicios** (limpieza, seguridad, alimentación) que buscan contratos con el estado.
- **Consultores y profesionales independientes** (ingenieros, arquitectos) que necesitan apoyo administrativo.

### Competencia indirecta
- Plataformas de e-procurement (Ariba, Oracle, Jaggaer) → orientadas al comprador, no al vendedor.
- Consultoras tradicionales → servicio manual, caro y lento.
- Proveedores internos (equipo propio del cliente) → costoso y poco eficiente.

### Ventaja competitiva
- **Enfoque en el proveedor** (no en el comprador).
- **IA generativa** aplicada a propuestas (diferenciador clave).
- **Modelo de pago por éxito** (reduce barrera de entrada).
- **Tecnología moderna y escalable** (n8n + Firecrawl + Supabase).

---

## ⚖️ Estructura de comisiones (detalle legal)

### Acuerdo con el cliente
- Contrato de servicios firmado digitalmente (vía DocuSign o similar).
- Cláusula de **exclusividad durante el proceso** (no pueden presentar la misma propuesta por otro medio sin nuestra participación).
- Comisión aplica **sobre el monto total adjudicado** (incluyendo reajustes y adendas).
- Pago de comisión: **dentro de los 10 días hábiles** posteriores al primer pago del estado al proveedor.
- En caso de rescisión del contrato principal por causas imputables al proveedor, la comisión se mantiene (por el trabajo ya realizado).

### Protección de datos
- Toda la información del proveedor (RNC, certificaciones, balances) se maneja bajo **confidencialidad**.
- Los documentos generados son propiedad del proveedor, pero LicitIA puede usarlos como caso de éxito (con permiso).

---

## 📊 Indicadores clave de rendimiento (KPI)

| KPI | Meta | Frecuencia |
|-----|------|------------|
| Número de licitaciones detectadas | > 100/mes | Mensual |
| Tasa de propuestas presentadas | > 30% de las alertas aceptadas | Mensual |
| Tasa de adjudicación | > 25% de las propuestas presentadas | Trimestral |
| Ingreso promedio por cliente | RD$ 500,000/año | Anual |
| Satisfacción del cliente (NPS) | > 50 | Semestral |
| Churn (clientes que se dan de baja) | < 10% anual | Anual |

---

## 🛣️ Próximos pasos

1. **Fase 1 (actual):** MVP con scraping y alertas básicas (marzo 2026).
2. **Fase 2:** Incorporar IA para clasificación y enriquecimiento (abril 2026).
3. **Fase 3:** Generación automática de propuestas con cliente piloto (mayo 2026).
4. **Fase 4:** Escalamiento a múltiples clientes y optimización (junio 2026 en adelante).

---

## 📌 Notas finales

- Este plan es dinámico y se irá ajustando según la retroalimentación del mercado.
- La inversión inicial es prácticamente **cero en capital** (solo tiempo y herramientas ya adquiridas).
- El mayor riesgo es la **aceptación del mercado** (que los proveedores confíen en la IA para preparar propuestas), por eso priorizamos un piloto con 1-2 clientes reales.

---

**¿Listos para transformar las licitaciones públicas?** 🚀

*Documento confidencial – Proyecto LicitIA*
