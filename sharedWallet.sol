pragma solidity 0.6.12;

contract SharedAccount {
    
    address payable public owner;
    enum PERMISOS {NoPermiso, MandarDinero, SacarDinero}
    struct  Usuario {
        address cuenta;
        PERMISOS perm;
        uint maxAmount;
    }
    mapping(address => Usuario) public TablaUsuarios;
    mapping(address => bool) public UsuriosRegistrados;
    modifier OnlyOwner() {
        require(owner == msg.sender);
        _;
    }
    constructor() public {
        owner = msg.sender;
    }
    
    function registra_nuevo_usuario(address payable _nuevo, PERMISOS _permiso) OnlyOwner public {
        require(esta_registrado(_nuevo), "El usuario ya está registrado");
        UsuriosRegistrados[_nuevo] = true;
        Usuario memory nuevoUsuario;
        nuevoUsuario.cuenta = _nuevo;
        nuevoUsuario.perm = _permiso;
        nuevoUsuario.maxAmount = 0;
        TablaUsuarios[_nuevo] = nuevoUsuario;
    }
    
    function esta_registrado(address payable _posibleUsuario) view public returns(bool) {
        if (UsuriosRegistrados[_posibleUsuario]) {
            return true;
        } else {
            return false;
        }
    }
    
    function set_nuevo_permiso(address payable _to, PERMISOS _nuevoPermiso) OnlyOwner public {
        require(esta_registrado(_to), "Este usuario no esta registrado");
        TablaUsuarios[_to].perm = _nuevoPermiso;
    }
    
    function MandarElDinero (address payable _usuario, address payable _to, uint _amount) public {
        require(esta_registrado(_usuario), "Esta persona no esta registrada");
        require(TablaUsuarios[_to].perm == PERMISOS.MandarDinero, "esta persona no puede hacer esto");
        require(_amount < address(this).balance && _amount > 0, "cantidad inadecuada");
        require(_amount <= TablaUsuarios[_to].maxAmount, "Cantidad no permitida");
        _to.transfer(_amount);
    }
    
    function sacar_el_dinero(address payable _to, uint _amount) public {
        require(esta_registrado(_to), "Esta persona no esta registrada");
        require(TablaUsuarios[_to].perm == PERMISOS.SacarDinero, "esta persona no puede hacer esto");
        require(_amount < address(this).balance && _amount > 0, "cantidad inadecuada");
        require(_amount <= TablaUsuarios[_to].maxAmount, "Cantidad no permitida");
        _to.transfer(_amount);
    }
    
    function set_maxAcount(address payable _to, uint _amount) OnlyOwner public {
        require(esta_registrado(_to), "Este usuario no esta registrado");
        TablaUsuarios[_to].maxAmount = _amount;
    }
}
