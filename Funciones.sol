pragma solidity 0.6.12;

contract Funciones {
    
    mapping(address => uint) public balanceRecived;
    address payable owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function getOwner() public view returns(address) {
        return owner;
    }
    
    function selfDestruct() public {
        require(msg.sender == owner, "You don´t have permission");
        selfdestruct(owner);
    }
    
    function reciveMoney() public payable {
        assert(balanceRecived[msg.sender] + msg.value >= balanceRecived[msg.sender]);
    }
    
    function withDrawAllMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceRecived[msg.sender], "You dont have enough money");
        assert(balanceRecived[msg.sender] >= balanceRecived[msg.sender] - _amount);
        balanceRecived[_to] -= _amount;
        _to.transfer(_amount);
    }
    
    fallback() external payable {
        reciveMoney();
    }
    /*
    Una funcion fallback solo puede haber una por cada contrato. Su funcion consiste en que se 
    ejecuta cuando llega dinero así por que si. tambien cuando llega una transaccion que no llama a ninguna de nuestras funciones
    O cuando si llama a alguna, no la encuentra
    
    Los constrcores son cosas que se ejecutan una sola vez y es cuando se hace el deploy.
    
    Las funciones pueden ser (void, view, pure)
    las view permiten leer cosas sin cambiar nningun estado.
    Las pure es aquella qiue no actuan con storageable variables, es dcir, aquelllas que almacenas cosas. Pueden
    llamarse entre ellas pero a ninguna de cualquier otro tipo, las view puede llamar a pure y view, pero no void, y las
    void pueden llamar a todas.
    
    Ojo a la visibilidad de las funciones, estas pueden ser External, public, internal, y private.
    Sus caracterisiticas difieren en desde donde se pueden llamar (dentro del contrato, desde otro contrato, etc)
    Si se recive ether y no hay fallback function se produce una excepcion.
 */
}
