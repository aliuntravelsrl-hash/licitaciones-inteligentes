LicitIA 🚀
Inteligencia Artificial para Licitaciones Públicas

https://img.shields.io/badge/Estado-Prototipo%2520Activo-yellow
https://img.shields.io/badge/Licencia-MIT-blue
https://img.shields.io/badge/Hecho%2520con-n8n-%2523ea4aaa
https://img.shields.io/badge/Web%2520Scraping-Firecrawl-orange

LicitIA es un sistema inteligente que actúa como puente entre proveedores del estado y las oportunidades de licitación pública. Automatiza la detección, análisis y preparación de propuestas para maximizar la tasa de adjudicación y minimizar el trabajo manual.

Nacido para el mercado dominicano, se conecta con portales como el de la DGCP y ministerios (MIDEREC, MOPC, etc.) para extraer, clasificar y enriquecer convocatorias, y luego genera propuestas técnicas y económicas listas para presentar.

🎯 Propósito del Proyecto
Muchos proveedores del estado pierden oportunidades porque:

No tienen tiempo para monitorear licitaciones a diario.

Se les escapan plazos o requisitos críticos.

Preparar propuestas es tedioso y propenso a errores.

LicitIA resuelve esto ofreciendo:

🔍 Detección temprana de licitaciones relevantes.

🤖 Análisis inteligente de pliegos y requisitos.

📝 Generación automática de propuestas personalizadas.

💰 Modelo de negocio basado en comisiones por éxito (ganamos cuando el cliente gana).

✨ Características principales
Módulo	Descripción
Scraping automático	Usa Firecrawl + n8n para extraer licitaciones de portales públicos (DGCP, ministerios, etc.)
Clasificación IA	Clasifica por sector (construcción, servicios, suministros), detecta requisitos y evalúa afinidad con el perfil del proveedor
Alertas en tiempo real	Notifica por email/WhatsApp cuando aparece una oportunidad que encaja
Generación de propuestas	Rellena automáticamente Sobres A y B con los datos del cliente y la información de la licitación
Seguimiento de comisiones	Dashboard con pipeline de oportunidades, estado y comisiones generadas
Gestión documental	Almacena y versiona todos los documentos asociados a cada licitación
🛠️ Stack tecnológico
Componente	Tecnología	Uso
Web Scraping	Firecrawl	Extracción de datos de portales dinámicos
Orquestación	n8n (self-hosted en VPS)	Flujos de trabajo automatizados
Base de datos	Supabase (PostgreSQL)	Almacenamiento de licitaciones, clientes, propuestas
IA / NLP	OpenAI API / Claude API	Clasificación, extracción de entidades, generación de textos
Frontend	Hostinger Horizons	Dashboard para clientes y administración
Backend API	FastAPI (Python)	Conexión entre n8n, IA y base de datos
Notificaciones	WhatsApp Business API / Twilio / Email SMTP	Alertas a clientes
🗺️ Roadmap (MVP + Fases)
gantt
    title Roadmap LicitIA
    dateFormat  YYYY-MM-DD
    section Fase 1 (MVP)
    Configuración de scraping DGCP/MIDEREC    :done, 2026-03-01, 7d
    Extracción de campos clave                :done, 2026-03-05, 5d
    Almacenamiento en Supabase                 :done, 2026-03-08, 3d
    Alertas básicas por email                  :active, 2026-03-09, 5d
    Dashboard simple (Hostinger)               :2026-03-12, 7d
    section Fase 2 (IA)
    Integración con OpenAI/Claude              :2026-03-19, 10d
    Clasificación automática de licitaciones   :2026-03-25, 7d
    Extracción de requisitos y garantías        :2026-03-28, 7d
    section Fase 3 (Propuestas)
    Generación de Sobres A y B                  :2026-04-05, 14d
    Validación automática de documentos         :2026-04-15, 7d
    Primer cliente piloto                       :2026-04-20, 7d
    section Fase 4 (Escalamiento)
    Múltiples clientes y perfiles               :2026-05-01, 30d
    Integración con otras plataformas (Ariba, Oracle) :2026-06-01, 30d
    Dashboard avanzado con analytics            :2026-07-01, 30d
🚀 Primeros pasos (para desarrolladores)
Requisitos
Node.js 18+ (para n8n si se usa local)

Python 3.10+ (para scripts personalizados)

Cuenta en Firecrawl

Cuenta en Supabase

API Key de OpenAI o Claude

VPS (recomendado: Hostinger VPS) para n8n y backend

Instalación rápida
Clona el repositorio

bash
git clone https://github.com/tuusuario/licitia.git
cd licitia
Configura el entorno

bash
cp .env.example .env
# Edita .env con tus credenciales (Firecrawl, Supabase, OpenAI, etc.)
Levanta n8n (si usas Docker)

bash
docker run -it --rm --name n8n -p 5678:5678 -v ~/.n8n:/home/node/.n8n n8nio/n8n
O despliega en tu VPS siguiendo la documentación oficial.

Importa los flujos base

Los flujos de n8n predefinidos están en la carpeta /n8n-flows.

Impórtalos desde la UI de n8n.

Configura la base de datos en Supabase

Ejecuta el script SQL de /supabase/schema.sql para crear las tablas necesarias.

Ejecuta el backend (opcional)

bash
cd backend
pip install -r requirements.txt
uvicorn main:app --reload
🤝 Contribuir
¡Las contribuciones son bienvenidas! Si tienes ideas para mejorar el scraping, la IA o el dashboard, abre un issue o envía un pull request.

Guía rápida
Fork el proyecto.

Crea una rama (git checkout -b feature/nueva-funcionalidad).

Haz commit de tus cambios (git commit -m 'Añade nueva funcionalidad').

Push a la rama (git push origin feature/nueva-funcionalidad).

Abre un Pull Request.

Por favor, asegúrate de que tu código sigue las buenas prácticas y documenta los cambios.

📄 Licencia
Este proyecto está bajo la licencia MIT. Ver el archivo LICENSE para más detalles.

📬 Contacto
Email: contacto@licitia.com (próximamente)

Twitter: @licitia (placeholder)

Web: https://licitia.com (en construcción)

LicitIA - Transformando la forma en que los proveedores acceden a las licitaciones públicas. 🇩🇴✨

