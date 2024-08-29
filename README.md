# MODELAMIENTO-DE-DATOS para venta de cursos online-
#CONTEXTO

EduCourses es una empresa que ofrece una variedad de cursos y programas de formación, principalmente en línea.necesita un sistema de base de datos para llevar un registro detallado de sus ventas, clientes, y cursos. El objetivo es generar reportes de ventas que faciliten la toma de decisiones estratégicas para optimizar las ofertas de cursos y mejorar las campañas de marketing. 
# Requisitos del Sistema
# Clientes
Información necesaria: Nombre completo, correo electrónico, país de residencia, fecha de registro, y la categoría de cliente (nuevo o recurrente).
# Cursos
Detalles del curso: Nombre del curso, categoría (por ejemplo, tecnología, negocios, salud, etc.), nivel (básico, intermedio, avanzado), duración en horas, y precio.
# Ventas
 Detalles de la venta: Identificación de la venta, fecha de la venta, cliente que realizó la compra, curso(s) comprado(s), cantidad de cada curso, y el total de la venta.
# Pagos
Detalles del pago: Identificación del pago, identificación de la venta, fecha del pago, monto pagado, y método de pago (tarjeta de crédito, PayPal, transferencia bancaria).
# Campañas de Marketing
Detalles de las campañas: Identificación de la campaña, nombre de la campaña, canal utilizado (redes sociales, email marketing, anuncios pagados), y el costo de la campaña.
# Conversión de Leads
Detalles de conversión: Identificación del lead, fecha de contacto, fuente de lead (campaña, orgánico, referido), estado del lead (convertido o no convertido).

# TAREA

# Modelo Entidad-Relación (ERD)

Requisitos adicionales
Los clientes pueden adquirir varios cursos  activos al mismo tiempo. Es importante generar informes sobre el estado de cursos adquiridos.
# Normalización:
Normaliza las tablas de tu modelo hasta la tercera forma normal (3NF) para evitar redundancias y asegurar la integridad de los datos. Consultas SQL

# Modelo Entidad-Relación (ERD)

# Normalización
Normaliza las tablas de tu modelo hasta la tercera forma normal (3NF) para evitar redundancias y asegurar la integridad de los datos. Consultas SQL:
# Escribe consultas SQL para
Obtener el total de ventas por categoría de curso
Mostrar el total de ventas realizadas por clientes nuevos y recurrentes
Listar las ventas generadas por cada campaña de marketing
Calcular el retorno sobre inversión (ROI) de las campañas de marketing
Obtener el total de pagos realizados y el saldo pendiente por venta:
