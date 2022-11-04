//Especificamos la versión de Solidity, utilizando la versión semántica.
// Para mas info aqui: https://solidity.readthedocs.io/en/v0.5.10/layout-of-source-files.html#pragma
pragma solidity >=0.7.3;

//Definimos el contracto "hello_world".
// Un contrato es una colección de funciones y datos (su estado). Una vez desplegado, el contrato reside en una dirección específica de la Blockchain de Ethereum. Mas info aquí: https://solidity.readthedocs.io/en/v0.5.10/structure-of-a-contract.html
contract hello_world {
    //Emitido cuando se llama a la función de actualización 
    //Los eventos de los Smart Contracts son una forma de que tu contrato comunique algo que ha sucedido en la Blockchain a tu aplicación, que puede estar "escuchando" ciertos eventos y actuar cuando estos sucedan.
    event UpdateMessages( string oldStr, string newStr);

    //Declara una variable de estado 'menssage' de tipo 'string'.
    //Las variables de estado son variables cuyos valores se guardan permanentemente en el almacenamiento del contrato. La palabra clave 'public' hace que las variables sean accesibles desde fuera de un contrato y crea una función que otros contratos o clientes pueden llamar para acceder al valor.
    string public message;
    // Al igual que muchos lenguajes orientados a objetos basados en clases, un constructor es una función especial que sólo se ejecuta al crear el contrato.
    // Los constructores se utilizan para inicializar los datos del contrato. Mas info: https://solidity.readthedocs.io/en/v0.5.10/contracts.html#constructors
    constructor(string memory initMessage) {
        //Acepta un argumento de cadena 'initMessage' y establece el valor en la variable de almacenamiento 'message' del contrato.
        message = initMessage;
    }

    // Una función pública que acepta un argumento de cadena y actualiza la variable de almacenamiento 'message'.
    function update(string memory newMessage) public {
        string memory oldMsg = message;
        message = newMessage;
        emit UpdateMessages(oldMsg, newMessage);
    }
}
