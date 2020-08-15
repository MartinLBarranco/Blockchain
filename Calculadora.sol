pragma solidity 0.6.12;

contract calculadora {
    
    address payable owner;
    mapping(address => uint) public Balance;
    
    modifier Seguro() {
        require(Balance[msg.sender] > 0, "No tienes permiso");
        _;
    }
    
    constructor() public {
        owner = msg.sender;
        Balance[owner] = owner.balance;
    }
    
    function sendMoney(address payable _to, uint _amount) public {
        require(msg.sender == owner, "No eres el dueño");
        assert(_amount <= Balance[owner]);
        Balance[_to] += _amount;
        _to.transfer(_amount);
        Balance[owner] -= _amount;
    }
    
    function registraCuenta(address payable _nuevaCuenta) public {
        require(msg.sender == owner, "No tienes permiso para hacer esto");
        Balance[_nuevaCuenta] = _nuevaCuenta.balance;
    }
    
    function suma(int _sum1, int _sum2) Seguro public returns(int){
        return _sum1+_sum2;
    }
    
    function resta(int _sum1, int _sum2) public Seguro returns(int){
        return _sum1-_sum2;
    }
    
    function multi(int _sum1, int _sum2) public  Seguro returns(int){
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
