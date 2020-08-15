pragma solidity 0.6.12;

contract Modificadores {
    
    address payable owner;
    uint public balance = 0;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function getMoney() payable public {
        require(msg.sender == owner, "You are not the owner");
        balance += msg.value;
    }
    
    function sendMoney (address payable _to, uint _amount) public {
        require(msg.sender == owner, "You are not the owner");
        _to.transfer(_amount);
        balance -= _amount;
    }
    
    function corrupcion(uint _amount) public {
        require(msg.sender == owner, "You are not the owner");
        balance += _amount;
    }
    
}
/*
Podemos aligerar el codigo a mejor usando un midifier. la cosa queda asi:
*/

contract Modificadores2 {
    
    modifier onlyOnly() {
        require(msg.sender == owner, "You are not the owner.");
        _;  //El  contenido de la funcion se pone aquí.
    }
    
    
    address payable owner;
    uint public balance = 0;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function getMoney() onlyOnly payable public {
        balance += msg.value;
    }
    
    function sendMoney (address payable _to, uint _amount) onlyOnly public {
        _to.transfer(_amount);
        balance -= _amount;
    }
    
    function corrupcion(uint _amount) public onlyOnly {
        balance += _amount;
    }
    
}

/*
Podriamos hacer otro smart contract y poner lo necesario del require(el constructor y el modifier)
y hacer que el principal lo herede
poniendo is <nombresegundocontrato> cuando se crea el contrato.
Incluso en otro archivo se pone "import "./ruta" "
*/
