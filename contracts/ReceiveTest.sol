pragma solidity >= 0.8.2;

// Contract with receive()
contract Receiver {
    uint x;

    receive() external payable {
        x = 5;
    }
}

// Contract without receive()
contract NoReceive {
    uint x;

    function setX(uint v) public {
        x = v;
    }
}

// Contract that performs transfers
contract Sender {
    function sendTo(address a, uint amt) public {
        payable(a).transfer(amt);
    }
}
