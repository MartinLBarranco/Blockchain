pragma solidity 0.6.12;


contract mates {
    
    address payable owner;
    mapping(address => bool) public Registro;
    mapping(address => uint) public Balance;
    
    
    modifier Seguro() {
        require(msg.sender.balance > 0, "No tienes permiso");
        owner.transfer(1 ether);
        _;
    }
    
    constructor() public {
        owner = msg.sender;
        Balance[owner] = owner.balance;
    }
    
    function suma(int _sum1, int _sum2) Seguro public returns(int){
        return _sum1+_sum2;
    }
    
    function resta(int _sum1, int _sum2) public Seguro returns(int){
        return _sum1-_sum2;
    }
    
    function multi(int _sum1, int _sum2) public Seguro returns(int){
        return _sum1*_sum2;
    }
    
    function potencia(int _sum1, int _sum2) public Seguro returns(int){
        for (uint i = 0; i<uint(_sum2); i++) {
            _sum1 *= _sum1;
        }
        return _sum1;
    }
    
    function divi(int _sum1, int _sum2) public Seguro returns(int){
        return _sum1/_sum2;
    }
}

contract calculadora is mates {
    
    function registraUsuario(address payable _to) public {
        require(msg.sender == owner, "No tienes permiso para hacer esto");
        if (!Registro[_to]) {
            Registro[_to] = true;
            Balance[_to] = _to.balance;
        }
    }
    
    function mandaDinero(address payable _newTo, uint _amount) public {
        require(msg.sender == owner, "No tienes permiso");
        assert(_amount < owner.balance);
        _newTo.transfer(_amount);
    }
    
}
