pragma solidity ^0.6.11;

contract miContrato {
    uint256 public numero;
    
    function setNumero (uint _numero) public {
        numero = _numero;
    }
    
    bool public miBooleano;
    
    function setBooleano (bool _valor) public {
        miBooleano = _valor;
    }
    
    uint8 public miNumero;
    
    function aumentar() public {
        miNumero++;
    }
    
    function descender() public {
        miNumero--;
    }
    
    address public miDireccion;
    
    function setDireccion (address _direccion) public {
        miDireccion = _direccion;
    }
    
    function seeBalance() public view returns(uint){  //lo de view es par aindicar que lee valores, y no es de escritura
        return miDireccion.balance;  //esto da los Wei que hay (1eth = 10^18Wei)
    }
    
    string public miFrase;
    
    function setFrase (string memory _frase) public { //por algun motivo, los strings son caros en solidity (cuesta bastante gas)
        miFrase = _frase;                             //y además no se guardan en un espacio de memoria, hay que guardarlos en la memoria como tal, de ahí lo de memory
    }
    // cuando no se inicializa un valor, se pne por defecto como false, 0, o "" segun toque. Las public variables, generan una function
    //getter automaticamente.
    //Byte es una lista de longitud indeterminda de raw data. String es igual pero solo de caracteres. Ambos son caros
}
