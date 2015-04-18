# Proyecto Oracle
Allan Rojas Duran


# Proyecto I  Bases de Datos II
ITCR - Cartago 
Profesor : Lic. José A. Stradi Granados, M. Sc.


En la Carpeta "Entregables" se encuentran divididas en carpetas especificadas por nombre
para los entregables solicitados en el documento del proyecto. 

///////////////////////////
/// Definicion Proyecto ///
///////////////////////////

INSTITUTO TECNOLOGICO DE COSTA RICA
DEPARTAMENTO DE COMPUTACION
INGENIERIA EN COMPUTACION, BASE DE DATOS II,  I  SEMESTRE 2015
Profesor:   Lic. José A. Stradi Granados, M. Sc.

Proyecto I

Se requiere el desarrollo de una base de datos  de un sistema  para la emisión de cotizaciones de una empresa dedicada al ensamblaje de equipos electrónicos.   Se debe llevar el registro  de clientes, proveedores,  los artículos ofrecidos por o a ellos,  así como también calcular los precios de los productos cotizados considerando el comportamiento de índices económicos. 

Para cada artículo se registran los siguientes datos: código, descripción,  familia,  unidad de medida,  marca, modelo, cantidades mínima y máxima,  cantidad, precios de mercado en colones y dólares, fecha de actualización de precios de mercado,  usuario que actualizó los precios, usuario que registró el artículo, fecha en que se registró,  estado.  Los valores válidos para el estado son: activo, no activo.

El código del artículo está estructurado de acuerdo con la familia a que pertenece el artículo, con el fin de brindar información de características estructurales. Ejemplos:

	FTCO2175, dentro de la familia de monitores, el código indica monitor plano (FT) a color (CO) de veintiun pulgadas con una tasa de refrescamiento horizontal de 75 Hz.
	SL02.8G08ME500SSD dentro de la familia de los CPUs, indica carcaza “slim”, 2.8 GHz de procesador, 8 GB de memoria RAM, 500 GB disco duro.
	INCOHO dentro de la familia de las impresoras, indica inyección de tinta, a color, para el hogar. 

Los artículos se agrupan en familias por ejemplo: procesadores,  tarjetas de video,  discos duros, memorias,  impresoras,  monitores,  escáneres,  unidades de CD-ROM, CPU, microcomputadores, PLC, soluciones integradas, sistema operativo, software de oficina,  ambiente de desarrollo, software de base de datos,  en otras.  Para cada familia se requiere registrar el código, descripción, porcentaje de impuesto aplicable a la compra del artículo, si aplica el impuesto ventas,  código del índice económico asociado.

Los artículos ofrecidos a los clientes pueden ser  ensamblados como el caso de los CPU, microcomputadores,   por lo que se quiere llevar un registro de éstos.  

Las unidades de medida son unidades principalmente, pero pensando en que el sistema soporte la cotización de artículos compuestos se considera que es conveniente manejarla como una entidad registrando un código y una descripción.  Por ejemplo: UN para unidad, HR para una hora de técnico.

Se tienen listas de precios que aplican a grupos de artículos.   Las listas implican la aplicación de tres porcentajes al costo de ensamblaje de un artículo: por concepto de gastos administrativos, otros gastos y utilidad.  Cada lista es identificada por un código y tiene una descripción.   Ejemplos de listas: sector público, cliente contado, cliente frecuente-contado,  cliente de crédito, importados.

Para cada índice económico se debe registrar el código, la descripción,  el número de valores reales que se utilizaran para realizar la proyección y el número de meses a proyectar.

Para los clientes  y proveedores se requiere registrar: cédula jurídica, nombre comercial,  direcciones,  apartados postales,  teléfonos, correos electrónicos y contactos,  faxes.

Los valores de los índices económicos son registrados periódicamente por ejemplo: mensualmente.  Un índice es por ejemplo el valor del colón respecto al dólar, valores obtenidos usualmente del Banco Central.   De acuerdo con el número de valores  requeridos para realizar la proyección (por ejemplo: el diferencial promedio del tipo cambio mensual)  y proyectarlo por el número de meses que se requiera.

Los precios de mercado  de los artículos son registrados de las facturas de compra,  registrando entre otros datos: código del artículo, código del proveedor, fecha de la compra,  precio en colones,  precio en dólares,  fecha en que se registraron los datos,  usuario que registró.     Cuando se actualicen éstos datos también deberá actualizarse el precio de mercado en la tabla de artículos.

Cuando se realice una cotización a un cliente se deberá registrar: número, fecha,  código del cliente,  código de vendedor,  condiciones de pago,  condiciones de entrega,  vigencia , observaciones,  lista de precios utilizada,  moneda (dólares, colones, euros),  estado (vigente, anulada, vencida, con factura).  Para los artículos cotizados se requiere: código, cantidad, unidad de medida,  descuento (porcentaje), costo unitario, grabado, monto total para la línea.

Todo artículo que no esté asociado a una familia, se asociará por omisión a la familia “default”. 

Hasta que se facture se asociaran los códigos de artículo con los números de series que se entregan al cliente, aspecto que está fuera del alcance del proyecto.

En caso de que no exista proyección del tipo de cambio a la fecha de entrega de la cotización se debe el emitir  el mensaje “No existe proyección para el mes de entrega”.

El proceso para la realización de las cotizaciones es el siguiente:

	Registro de  tipos de cambio: se debe verificar que esté registrado el tipo de cambio para el mes actual para las monedas utilizadas.  Las fechas deben ser primero de cada mes, y deben  existir al menos  tantos registros  como se requieran para realizar las proyecciones.

	Proyección de índices económicos:   se debe verificar que esté registrado el tipo  cambio del mes actual, valor a partir del cual el sistema generará la proyección  para los meses siguientes,  según  el número de meses que se requiera proyectar.

	Registro de artículos y sus componentes:   si el artículo  no está registrado en el sistema debe ingresarse, así como sus componentes.

	Listar componentes:   una vez registrado el artículo  se deben listar sus componentes.  En listado aparecen las cantidades y los costos según el último costo registrado en el sistema, así como el total general.

	Asignar al artículo la lista de precios “prueba”: no debe existir ningún artículo asignado a la lista de precios “prueba”.  Para determinar la correctitud del cálculo del sistema para determinar el costo proyectado de un artículo compuesto es conveniente incluirlo en esta lista (siendo así miembro único).

	Generar la lista de precios “prueba”:   Se debe generar la lista de precios y consultar los costos proyectados para el artículo.   Básicamente el sistema tomará  el último costo en dólares para cada componente y lo convierte a colones utilizando el tipo de cambio proyectado para el mes que se solicitó.

A la sumatoria de los costos proyectados de los componentes el sistema aplica los porcentajes asignados a lista de precios de “prueba”  para obtener el costo total  del artículo (no incluye impuesto de ventas).

	Verificar los costos de los componentes del nuevo artículo en la lista precios.

	Asignar el artículo a las listas de precios definitivos: se debe eliminar como miembro de la lista precios “pruebas”  y asignarlo a las definitivas para hacer posteriormente la generación. A partir de ese punto se podrá cotizar el artículo.

Se requiere llevar una bitácora de cambios a los datos de las cotizaciones realizadas.

El sistema debe soportar las siguientes consultas:

	Para un artículo determinado listar:
o	sus componentes,  o
o	de cuáles artículos es componente

	Listado de cotizaciones para un período dado, en un estado determinado.

Supuestos:

	No contempla el manejo de seguridad.  Simplemente se supone la existencia de un código de usuario.
	el sistema no incluye soporte para conversiones de medida(pensando en una generalización),
	no se incluyen utilitarios para reducir labores de digitación,  por ejemplo la importación de datos de facturas de proveedores directamente de hojas en Excel. 
	no se incluye la especificación interfaces a los módulos de:
o	ordenes de trabajo(ejecutar lo cotizado), 
o	facturación,
o	recursos humanos.

1.	Desarrolle un esquema en una base de datos Oracle para el problema descrito. Utilizar el “Data Modeler” para la realización de los diagramas de base de datos y clases.  Definir un estándar para asignar nombres a las tablas y campos.   Hacer un estimado de volúmenes de filas por tabla, y con base en este ajustar las características de almacenamiento.

	Entregable:
o	Diagramas de base datos y clases
o	Diccionario de datos
o	Script con la definición del esquema

2.	Desarrolle un “script” para la carga de los siguientes datos de prueba de al menos las siguientes tablas:

Familias
Monedas
Artículos
Componentes
Lista de precios

3.	Desarrolle procedimientos almacenados activados por evento:

•	tal que antes  de  eliminar  una cotización, cuyo estado sea emitida, grabe en tablas de históricos los datos de  ésta y sus líneas,

•	para actualizar de los precios de los artículos cuando se registran las facturas de los proveedores.

Entregable:
o	Código de los procedimientos almacenados y del “script” que lo registra como “trigger”.

4.	Desarrolle procedimientos almacenados en PL/SQL para:

•	que reciba como parámetros, el código de una lista de precios y el número de meses a proyectar.    El procedimiento debe generar una tabla  de proyecciones con el código del producto, el mes, y la proyección del precio en colones. 

•	la inserción, modificación, borrado de artículos y componentes,

•	un paquete que incluya los dos procedimientos anteriores, y los publique utilizando JDeveloper en un servidor de aplicaciones WebLogic como un servicio web.

•	un paquete que incluya las consultas solicitadas en el problema y lo publique utilizando JDeveloper en un servidor de aplicaciones WebLogic como un servicio web.

Entregable:

o	Código de los paquetes debidamente comentados.

5.	Desarrolle un cliente java para el mantenimiento de las tablas  artículos y componentes.  Las operaciones de mantenimiento incluyen: inserción, modificación, borrado, navegación, consulta.

	Entregable:
o	Aplicación debidamente comentada.
o	Diseño gráfico de la interface, junto la especificación de:
	tablas utilizadas
	controles implantados

Fecha de entrega: 17-04-2015.   En la entrega del proyecto se debe presentar la siguiente documentación impresa:

	Portada
	Tabla de contenidos
	Introducción
	Descripción del problema
	Diagramas de clases y base de datos
	Diccionario de datos
	Conclusiones
•	puntos concluidos y pendientes
•	experiencia adquirida y recomendaciones
•	distribución de la carga de trabajo entre los integrantes del grupo
	 Bibliografía 
	Anexo  
•	 “Scripts” 





