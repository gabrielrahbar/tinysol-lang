faucet 0xA 100

deploy 0xA:0xR() "Receiver" "contracts/ReceiveTest.sol"
deploy 0xA:0xN() "NoReceive" "contracts/ReceiveTest.sol"
deploy 0xA:0xS() "Sender" "contracts/ReceiveTest.sol"

faucet 0xS 50

// Transfer to contract WITH receive() => receive() is triggered
0xA:0xS.sendTo("0xR", 10)
assert 0xR this.balance==10
assert 0xR x==5
assert 0xS this.balance==40

// Transfer to contract WITHOUT receive() => reverts
0xA:0xS.sendTo("0xN", 10)
assert lastReverted
assert 0xS this.balance==40
assert 0xN this.balance==0

// Transfer to EOA => succeeds normally
0xA:0xS.sendTo("0xA", 5)
assert 0xS this.balance==35
assert 0xA this.balance==105
