pragma solidity ^0.6.12;

contract SendMoneyExample {
    
    uint public balanceRecived;   //inicializa una variable que es el dinero de este smart contract
    
    function reciveMoney() public payable {   //suma la cantidad recibida
        balanceRecived += msg.value;
    }
    
    function getBalance() public view returns(uint) {   //devuelve el balance de este smart contract
        return address(this).balance;   //para referirse al propio smart contract, se hace esto
    }
    
    function withDrawMoney() public {   //funcion primitiva para mandar ether a la cuenta ("la ultima" en contactar) que nos mandó ether
        address payable to = msg.sender;
        to.transfer(this.getBalance());
    }
    
    function withDrawMoneyTo (address payable _to) public {  //funcion mas refiniada para mandar dinero
        _to.transfer(this.getBalance());
    }
}

//Hay dos tipos de accounts: externally owned accounts (EOA) y Contract account. No se muy bien la diferencia but ok
