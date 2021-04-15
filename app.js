const express = require('express');
const jwt = require('jsonwebtoken');
const port = 3002;
const bodyParser = require('body-parser');
const routes = require('./routes/routes')
const app = express();

//BODYPARSER COMO MIDDLEWARE
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true,
}));

routes(app);

//AUTENTICACION
app.post('/login', (request, response) =>{
    const user = {id:3};
    const token=jwt.sign({user},'my_secret_key'); //GENERAMOS EL TOKEN
    response.json({
        token: token
    })
});

// INICIAMOS EL SERVIDOR
const server = app.listen(port, (error) => {
    if (error) return console.log(`Error: ${error}`);

    console.log(`Server listening on port ${server.address().port}`);
});

