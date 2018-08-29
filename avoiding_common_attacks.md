

# Security explanations

## 1) Reentrancy: buyNumber function of Generic bet contract
the add to betPrize is made by an internal value not by the value send by the player

the transfer of the value exceeding the standard value for buying a new number is given back to the sender. The function buyNumber have to be called with a value. so in case of reentrancy the money considered to be given back is the value in the parameters of the new buyNumber function called


## 2) Reentrancy: endBet function of Generic bet contract

In case of reentrancy, the value of betprize is already set to zero before the possible call to another function

*Checks-Effects-Interactions Pattern* is used: The transfer function is called as late as possible

## 3) Gas Limit  and Loops

Huge effort was put in making as few as possible loops. In fact the only loop is in the constructor of the contract genericBet. 
(That also allow not to penalize player lowering the gas cost of the bets)

## 3) tx.origin
is never used

## 4) Restrict the Amount of Ether

The contract add Ether not relying on the value from the call of the fucntion but from the value (public) necesary to buy a number, stored as internal variable

## 5) Stucked contract

A new bet cannot be made until the actual bet is in the state "ended=false". But the ended=true (and pause=true) is the first thing executed when a bet is ended. So, a new bet of the same family can be launched anyway

During buyNumber function somebody can stuck the contract make the transfer of the exceeding vlaur of the bet fails.
This is noticed: further version could not implement this function for security reason.

## 6) Integer Overflow and Underflow

All the computation with value passed from outside are made using SafeMath functions


# Pseudo-random numbers

Pseudo-random becuase a full randomo is not possible: all the node have to compute the same "random" number to verify the transaction..

In Cryptobet, the pseuo-random functions are use for
1) find the position of the range of the winning zone into all the possible numbers
2) fins the winning number between the number in the winning zone
3) find a number to buy when the buyNumber function is called


1) It is not giving problems becuase it is a simple choice of strating conditions
2) It is based on the address of the contract and the account  of the last buyer. Can be predetermined but this involved actually BUY the winner number and be the the buyer of the last number free in the winning zone...
3) This is really the tricky part. The number is randomized with as seeds the contract address and the sum of the numbers that are not bought at that time. This is a public variable, so can be retrieved and used to compute the next "random" number to be bought by the function buyNumber. 
What I think that this is ok but to execute that a player have to compute the next number for every block and immediately call the transaction buyNumber. But  of course it can be done by more than one player: so in case of two o more player try to launch the buyNumber transaction when they know that a precious number will be bought, means that the first transation  will have the number. 
But, for what we know, the order of transaction in a block is not fixed also if ,probably, the fee payed can have some effect. That means that to insure to have the wanted number in a buyNumber transation, a player have to offer an higher fee. And also with that, the player cannot be sure to really his transation is executed as first, and he cannot be sure that thae bought number will be the winner. 
So, it is another choice if the hacking game is worth or not. I think that this is something acceptable in this game



