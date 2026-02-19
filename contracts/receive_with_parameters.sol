pragma solidity >= 0.8.2;

contract C {
    uint x;

    receive(int y) external payable {
        x = 5;
    }
}

contract D {
    function f(address a) public {
        payable(a).transfer(1);
    }
}
