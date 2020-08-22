pragma solidity 0.6.12;

contract MATH {
    
    function isPrime(uint n) public pure returns(bool){
        if (n % 2 == 0) {
            return false;
        } else {
            for (uint i = 0; i<= (n % 2); i++) {
                if (n % i == 0) {
                    return false;
                }
            }
            return true;
        }
    }
    
    function mcd(uint a, uint b) public pure returns(uint){
        if (b == 1) {
            return a;
        }
        if (a % b == 0){
            return b;
        }
        while (a % b != 0) {
            a = b;
            b = a % b;
        }
        return b;
    }
    
    function factorial(uint n) public pure returns(uint){
        uint res = 1;
        for (uint i = 1; i <= n; i++) {
            res *= i;
        }
        return res;
    }
}
