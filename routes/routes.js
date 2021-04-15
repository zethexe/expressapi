
const pool = require('../data/config');
const jwt = require('jsonwebtoken');



const router = app => {
    // MENSAJE DE BIENVENIDA
    app.get('/', (request, response) => {
        response.send({
            message: 'Welcome to the Node.js Express REST API!'
        });
    });

    // VALIDACION DE TOKEN
    function ensureToken(request,response,next){
        const bearerHeader = request.headers["authorization"];
        if(typeof bearerHeader !== 'undefined'){
            const bearer = bearerHeader.split(" ");
            const bearerToken = bearer[1];
            request.token = bearerToken;
            jwt.verify(bearerToken,'my_secret_key',function(err){
                if(err){
                    response.sendStatus(403);
                    
                }else{
                   next(); 
                }
            });
        }else{
            response.sendStatus(403);
        }
    }

    // CLASIFICACION
    app.get('/clasificacion',ensureToken, (request, response) => {
        pool.query('SELECT * FROM tblclasificacion', (error, result) => {
            if (error) throw error;

            response.send(result);
        });
    });

  
    app.get('/clasificacion/:clave',ensureToken, (request, response) => {
        const clave = request.params.clave;

        pool.query('SELECT * FROM tblclasificacion WHERE clave = ?', clave, (error, result) => {
            if (error) throw error;

            response.send(result);
        });
    });

    
    app.post('/clasificacion',ensureToken, (request, response) => {
        
        pool.query('INSERT INTO tblclasificacion SET ?', request.body, (error, result) => {
            if (error) throw error;

            response.status(201).send(`Clasificacion added successfully`);
        });
    });

  
    app.put('/clasificacion/:clave',ensureToken, (request, response) => {
        const clave = request.params.clave;

        pool.query('UPDATE tblclasificacion SET ? WHERE clave = ?', [request.body, clave], (error, result) => {
            if (error) throw error;

            response.send('Clasificacion updated successfully.');
        });
    });

 
    app.delete('/clasificacion/:clave',ensureToken, (request, response) => {
        const clave = request.params.clave;

        pool.query('DELETE FROM tblclasificacion WHERE clave = ?', clave, (error, result) => {
            if (error) throw error;
            response.send('Clasificacion deleted.');
        });
    });


    //ACTOR
    app.get('/actor',ensureToken, (request, response) => {
        
        pool.query('SELECT * FROM tblactor', (error, result) => {
            if (error) throw error;

            response.send(result);
        });
    });

    app.get('/actor/:idactor',ensureToken, (request, response) => {
        const idactor = request.params.idactor;

        pool.query('SELECT * FROM tblactor WHERE idactor = ?', idactor, (error, result) => {
            if (error) throw error;

            response.send(result);
        });
    });

    app.post('/actor',ensureToken, (request, response) => {
        pool.query('INSERT INTO tblactor SET ?', request.body, (error, result) => {
            if (error) throw error;

            response.status(201).send(`actor added successfully`);
        });
    });

    app.put('/actor/:idactor',ensureToken, (request, response) => {
        const idactor = request.params.idactor;

        pool.query('UPDATE tblactor SET ? WHERE idactor = ?', [request.body, idactor], (error, result) => {
            if (error) throw error;

            response.send('actor updated successfully.');
        });
    });

    app.delete('/actor/:idactor',ensureToken, (request, response) => {
        const idactor = request.params.idactor;

        pool.query('DELETE FROM tblactor WHERE idactor = ?', idactor, (error, result) => {
            if (error) throw error;
            response.send('actor deleted.');
        });
    });


    //DIRECTOR
    app.get('/director',ensureToken, (request, response) => {
        pool.query('SELECT * FROM tbldirector', (error, result) => {
            if (error) throw error;

            response.send(result);
        });
    });

    app.get('/director/:iddirector',ensureToken, (request, response) => {
        const iddirector = request.params.iddirector;

        pool.query('SELECT * FROM tbldirector WHERE iddirector = ?', iddirector, (error, result) => {
            if (error) throw error;

            response.send(result);
        });
    });

    app.post('/director',ensureToken, (request, response) => {
        //console.log(request.body)
        pool.query('INSERT INTO tbldirector SET ?', request.body, (error, result) => {
            if (error) throw error;

            response.status(201).send(`director added successfully`);
        });
    });

    app.put('/director/:iddirector',ensureToken, (request, response) => {
        const iddirector = request.params.iddirector;

        pool.query('UPDATE tbldirector SET ? WHERE iddirector = ?', [request.body, iddirector], (error, result) => {
            if (error) throw error;

            response.send('director updated successfully.');
        });
    });

    app.delete('/director/:iddirector',ensureToken, (request, response) => {
        const iddirector = request.params.iddirector;

        pool.query('DELETE FROM tbldirector WHERE iddirector = ?', iddirector, (error, result) => {
            if (error) throw error;
            response.send('director deleted.');
        });
    });


    //GENERO
    app.get('/genero',ensureToken, (request, response) => {
        pool.query('SELECT * FROM tblgenero', (error, result) => {
            if (error) throw error;

            response.send(result);
        });
    });

    app.get('/genero/:idgenero',ensureToken, (request, response) => {
        const idgenero = request.params.idgenero;

        pool.query('SELECT * FROM tblgenero WHERE idgenero = ?', idgenero, (error, result) => {
            if (error) throw error;

            response.send(result);
        });
    });

    app.post('/genero',ensureToken, (request, response) => {
        //console.log(request.body)
        pool.query('INSERT INTO tblgenero SET ?', request.body, (error, result) => {
            if (error) throw error;

            response.status(201).send(`genero added successfully`);
        });
    });

    app.put('/genero/:idgenero',ensureToken, (request, response) => {
        const idgenero = request.params.idgenero;

        pool.query('UPDATE tblgenero SET ? WHERE idgenero = ?', [request.body, idgenero], (error, result) => {
            if (error) throw error;

            response.send('genero updated successfully.');
        });
    });

    app.delete('/genero/:idgenero',ensureToken, (request, response) => {
        const idgenero = request.params.idgenero;

        pool.query('DELETE FROM tblgenero WHERE idgenero = ?', idgenero, (error, result) => {
            if (error) throw error;
            response.send('genero deleted.');
        });
    });


    //PELICULAS
    app.get('/peliculas',ensureToken, (request, response) => {
        pool.query('SELECT * FROM tblpeliculas', (error, result) => {
            if (error) throw error;

            response.send(result);
        });
    });

    app.get('/peliculas/:idpelicula',ensureToken, (request, response) => {
        const idpelicula = request.params.idpelicula;

        pool.query('SELECT * FROM tblpeliculas WHERE idpelicula = ?', idpelicula, (error, result) => {
            if (error) throw error;

            response.send(result);
        });
    });

    app.post('/peliculas',ensureToken, (request, response) => {
        //console.log(request.body)
        pool.query('INSERT INTO tblpeliculas SET ?', request.body, (error, result) => {
            if (error) throw error;

            response.status(201).send(`peliculas added successfully`);
        });
    });

    app.put('/peliculas/:idpelicula',ensureToken, (request, response) => {
        const idpelicula = request.params.idpelicula;

        pool.query('UPDATE tblpeliculas SET ? WHERE idpelicula = ?', [request.body, idpelicula], (error, result) => {
            if (error) throw error;

            response.send('peliculas updated successfully.');
        });
    });

    app.delete('/peliculas/:idpelicula',ensureToken, (request, response) => {
        const idpelicula = request.params.idpelicula;

        pool.query('DELETE FROM tblpeliculas WHERE idpelicula = ?', idpelicula, (error, result) => {
            if (error) throw error;
            response.send('peliculas deleted.');
        });
    });


    //REPARTO
    
    app.get('/reparto',ensureToken, (request, response) => {
        pool.query('SELECT * FROM tblreparto', (error, result) => {
            if (error) throw error;

            response.send(result);
        });
    });

    app.get('/reparto/:idreparto',ensureToken, (request, response) => {
        const idreparto = request.params.idreparto;

        pool.query('SELECT * FROM tblreparto WHERE idreparto = ?', idreparto, (error, result) => {
            if (error) throw error;

            response.send(result);
        });
    });

    app.post('/reparto',ensureToken, (request, response) => {
        //console.log(request.body)
        pool.query('INSERT INTO tblreparto SET ?', request.body, (error, result) => {
            if (error) throw error;

            response.status(201).send(`reparto added successfully`);
        });
    });

    app.put('/reparto/:idreparto',ensureToken, (request, response) => {
        const idreparto = request.params.idreparto;

        pool.query('UPDATE tblreparto SET ? WHERE idreparto = ?', [request.body, idreparto], (error, result) => {
            if (error) throw error;

            response.send('reparto updated successfully.');
        });
    });


    app.delete('/reparto/:idreparto',ensureToken, (request, response) => {
        const idreparto = request.params.idreparto;

        pool.query('DELETE FROM tblreparto WHERE idreparto = ?', idreparto, (error, result) => {
            if (error) throw error;
            response.send('reparto deleted.');
        });
    });


    
}



// Export the router
module.exports = router;