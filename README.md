# MODELAMIENTO-DE-DATOS-
#CONTEXTO

EduCourses es una empresa que ofrece una variedad de cursos y programas de formación, principalmente en línea. Los cursos pueden ser de corta duración, como talleres, o de larga duración, como diplomados y certificaciones. La empresa vende estos cursos tanto a clientes individuales como a empresas que buscan capacitar a sus empleados.

El objetivo del sistema de base de datos es registrar y analizar las ventas para generar reportes que ayuden en la toma de decisiones estratégicas, tales como:

Identificar los cursos más populares.
Analizar las ventas por tipo de cliente.
Evaluar la efectividad de las campañas de marketing.
Segmentar los ingresos por diferentes tipos de programas.
# Requisitos del Sistema
# Clientes
# Clientes individuales: Se necesita registrar información básica como nombre, correo electrónico, teléfono, y país de residencia.
#Clientes corporativos: Además de la información básica, se requiere el nombre de la empresa, el número de empleados capacitados, y la industria.
# Cursos
Cada curso tiene un nombre, una categoría (tecnología, negocios, salud, etc.), una modalidad (en línea, presencial), una duración (en horas), y un precio.
# Ventas
Cada venta está asociada a un cliente y puede incluir uno o más cursos. Se debe registrar la fecha de la venta, los cursos comprados, la cantidad de cada curso, y el total de la venta.
# Pagos
Los clientes pueden realizar pagos para sus compras de cursos. Cada pago debe registrar la fecha, el monto pagado, el método de pago, y el saldo restante (si el curso permite pago en cuotas).
# Campañas de Marketing
EduCourses utiliza diversas campañas de marketing para promover sus cursos. Se debe registrar el nombre de la campaña, el canal de marketing (email, redes sociales, anuncios pagados), y el costo de la campaña.

Requisitos adicionales
Los clientes pueden adquirir varios cursos  activos al mismo tiempo. Es importante generar informes sobre el estado de cursos adquiridos 

Modelo Entidad-Relación (ERD)

# Normalización
Normaliza las tablas de tu modelo hasta la tercera forma normal (3NF) para evitar redundancias y asegurar la integridad de los datos. Consultas SQL:
# Escribe consultas SQL para
Obtener el total de ventas por categoría de curso
Mostrar el total de ventas realizadas por clientes corporativos
Calcular la efectividad de las campañas de marketing (retorno sobre inversión)
Obtener el total de pagos realizados y el saldo pendiente por venta
