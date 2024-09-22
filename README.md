# MODELAMIENTO-DE-DATOS para venta de cursos online
#CONTEXTO

EduCourses es una empresa que ofrece una variedad de cursos y programas de formación, principalmente en línea.necesita un sistema de base de datos para llevar un registro detallado de sus ventas, clientes, y cursos. El objetivo es generar reportes de ventas que faciliten la toma de decisiones estratégicas para optimizar las ofertas de cursos y mejorar las campañas de marketing. 
# Requisitos del Sistema
# Clientes
Información necesaria: Nombre completo, correo electrónico, número de celular, DNI, fecha de registro, .
# Cursos
Detalles del curso: Nombre del curso, categoría (por ejemplo:curso,especialización), nivel (básico, intermedio, avanzado), duración en horas, y precio , ID de curso.
# Asesor de venta 
 Detalles de la venta: Nombre completo, correo electrónico, ID vendedor
 # compra
 Detalles de la compra:  nombre de cliente, fecha de compra, nombre de asesor,Estado (Activa, Cancelada), nombre de curso
# Pagos
Detalles del pago: Identificación del pago, identificación de la venta, fecha del pago, monto pagado, y método de pago (tarjeta de crédito, PayPal, transferencia bancaria).
# cuotas
detalles de cuota: cuota, pago, monto y fecha de vencimiento.

Requisitos adicionales
Los clientes pueden adquirir varios cursos  activos al mismo tiempo, Una compra puede incluir varios cursos, y un curso puede estar en muchas comprast Es importante generar informes sobre el estado de cursos adquiridos se permite que las ventas puedan ser canceladas con 1 o varios pagos.

# TAREA
# Modelo Entidad-Relación (ERD)
Diseña un modelo entidad-relación que represente los datos y relaciones descritos en los requerimientos. Asegúrate de identificar las llaves primarias y foráneas, y de definir las cardinalidades entre las entidades.

# Normalización
s tablas de tu modelo hasta la tercera forma normal (3NF) para evitar redundancias y asegurar la integridad de los datos. Consultas SQL:

# Escribe consultas SQL para
Obtener el total de ventas por categoría de curso,
Mostrar los 3 cursos más vendidos y
Obtener el total de pagos realizados y el saldo pendiente por venta

DIAGRAMA ENTIDAD RELACIÓN


![Diagrama entidad relación de  Cursos Online ](https://github.com/user-attachments/assets/1e27af27-bdf3-4885-898c-ee9517ca4a78)

