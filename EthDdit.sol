pragma solidity 0.6.12;


contract EthDdit {
    address payable public owner;
    uint public numusuario = 0;
    uint public numsubreddit = 0;
    
    mapping(address => User) Usuarios;
    mapping(uint => Post) Posts;
    mapping(uint => Subreddit) SubReddits;
    
    struct User {
        address payable username;
        uint numeroserie;
        string password;
    }
    struct Post {
        User usuario;
        Subreddit comunidad;
        string content;
    }
    struct Subreddit {
        uint numeroserie;
        string nombreSubreddit;
        User moderator;
        mapping(uint => User) members;
        mapping(uint => Post) Posts;
    }
    
    constructor() public {
        owner = msg.sender;
    }
    
    
    function nuevoUsuario(address payable _username, string memory _password) public {
        numusuario++;
        Usuarios[_username] = User(_username, numusuario, _password);
    }
    
    function subirPost() public {
        
    }
    
    function seguirSubR() public {
        
    }
    
    function noSeguirSubR() public {
        
    }
    
    receive() external payable{}
}
