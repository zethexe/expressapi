# expressapi

CLASIFICACION
	GET: /clasificacion/
	GET por ID: /clasificacion/id/
	POST:/clasificacion/, parametros (name,description)
	PUT:/clasificacion/id/, parametros (name,description)
	DELETE: /clasificacion/id/


GENERO
	GET: /genero/
	GET por ID: /genero/id/
	POST:/genero/, parametros (genero)
	PUT:/genero/id/, parametros (genero)
	DELETE: /genero/id/


ACTOR
	GET: /actor/
	GET por ID: /actor/id/
	POST:/actor/, parametros (nombre,nacionalidad)
	PUT:/actor/id/, parametros (nombre,nacionalidad)
	DELETE: /actor/id/


DIRECTOR
	GET: /director/
	GET por ID: /director/id/
	POST:/director/, parametros (nombre,nacionalidad)
	PUT:/director/id/, parametros (nombre,nacionalidad)
	DELETE: /director/id/


PELICULAS
	GET: /peliculas/
	GET por ID: /peliculas/id/
	POST:/peliculas/, parametros (titulo,duracion,sinopsis,fechaestreno,clasificacion(id),genero(id),director(id))
	PUT:/peliculas/id/, parametros (titulo,duracion,sinopsis,fechaestreno,clasificacion(id),genero(id),director(id))
	DELETE: /peliculas/id/


REPARTO
	GET: /reparto/
	GET por ID: /reparto/id/
	POST:/reparto/, parametros (personaje, actor(id),actor(id))
	PUT:/reparto/id/, parametros (personaje, actor(id),actor(id))
	DELETE: /reparto/id/
