# Cryptobet is an application to generate, manage and play bets


PLEASE when you download the project from github, in your ubuntu change the cryptobet-master directoyr in cryptobet
(For some reason, truffle dont rebuild files with links to the new directory. sure my few knowledge of github)

## Useful links

### Rubric points and explanation
https://github.com/rickzanussi/cryptobet/blob/master/explanation_grading_rubric.md

### Pattern descriptions
https://github.com/rickzanussi/cryptobet/blob/master/design_pattern_decisions.md

### Security decisions
https://github.com/rickzanussi/cryptobet/blob/master/avoiding_common_attacks.md

### Rinkeby addresses
https://github.com/rickzanussi/cryptobet/blob/master/deployed_addresses.txt

### URL application (give some seconds to display)

http://18.223.68.224:8080/home

(Metamask is only when the menu Metamask is clicked)

## There are two contracts: MainBet and GenericBet
MainBet is deployed with the parameters to generate a sequence of bets. The parameters are given once and all the generated bets implement the same parameters of their MainBet. To have a sequence of bets with different parameter it is sufficient deploy another MainBet contract with different parameters. From a MainBet, a bet can be deployed only when the former bet of the same sequence is finished with a winner, with the function createBet The GenericBet contract store the parameters of the bet, initialize all the variable for bet and manage the bet of the players and the end of the bet. It the basic functions are: buyNumber, combineNumbers and endBet (internal)

## Parameters
The parameters to generate a MainBet contract (and that are passed to the new bet) are
* feeAccount: the account where the fee for the Manager is payed when a bet has a winner
* feePercentage: the percentage of the bet going to the manager fee
* newNumberPrice: the cost of buying a random number
* betName: name of the Bet
* numberOfNumbers: numbers can be bought (max.100)
* numberOfPossibleWinners: length of the range of numbers that can win. (Always less the numberOfNumbers)
* sumNumbers: sum of all the numberOfNumbers (ex: in case of numberOfNumbers = 100, this number is 5050. It is as parameters not to be computed inside a smart contract to reduce the number of loops)

## Roles 
There are two roles: manager: a manager can generate a mainbet with parameter, can generate instantiate a single bet from the mainbet and have the power to pause it player: a player interact with the instance of a bet, can buy a random number with a fee and combine two number to have another one

## Flow of the game

1. (Generate a sequence of bets) the manager instantiate the contract MainBet passing the parameters EX: Given numberOfNumbers value 100; I can choose - example - numberOfPossibleNumbers as 10. It means that just 10 out of 100 numbers can be the winner number (a winning zone). The 10 consecutive numbers are chosen randomly by the contract
2. {Generate a bet). The manager execute the function CreateBet on the contract MainBet to create a contract GenericBet. This function is the most expensive of the application because prepare all the fields for the bet. Intentionally all the heavy executions are here, so the gas is paid by the manager From this moment player, knowing the address of the contract, can bet
3. Player can buy a number paying a fee (establish as parameter when the sequence of bet is created). The number is chosen randomly by the contract
4. To make the game more interesting and allow players to have strategies instead of pure luck, a function to combine two numbers is allowed. This function take two number (both owned by the player) sum them and divide for two. (if the result of the sum is not divisible for two, it is decreased by 1). So a player with numbers out of the winning zone but with one bigger and one lower, can combine to have a number in the winning zone. If the result number is already owned, the combine is unsuccessful. The two number used for the combine are set free again. The computed number is free and assigned to the message sender While buying a random number implies a fee, combine two number not: the player have already paid fee for two numbers used in the combine and he will lose these numbers. So effectively, the combined number will cost a double fee.
5. All the fee paid for buying numbers are put in a basket 
6)When all the number in the winning zone are bought the bet is finished by the smart contract. The contract choose randomly a number between the numbers in the winning zone and the owner of this number is the winner. A fee (equal to the feePercentage*basket amount) is given to feeAccount, all the remaining money is given to the owner of the winning number and the bet is put to Ended. The Manager can now generate another bet of the same family

## Truffle

ubuntu 16.04 node 10.4.1 truffle 4.1.11 (core 4.1.11) solidity v0.4.24 (solc.js) ganache-cli v6.1.6 (ganache-core 2.1.5) 
### **The test are run with GANACHE-CLI**

## Test
There are 5 test The contract MainBet.sol is deployed. The contract contains the source of the two contracts the make the application : MainBet and GenericBet

1. The function CreateBet is called to generate the single instance of a bet the asserts tests if the contract is generated checking the address as return value of the function and as variable
2. check is on the of the parameters in the sequence of the bet is passed and created correctly in the GenericBet contract
3. To keep in account of the number bought, a variable is passed when the sequence of bets is created containing the sum of all the possible numbers. Anytime a number is bought, the value of the bought number is subtracted from this value. the tets execute the function buyNumber and check that the new sum of numbers values is equal to the former value less the value of the bought number
4. the function combineNumbers is called. (to have two number to combine, a new buyNumber function is called and the number boguht by the former test is reused) the assert check is the computation of the combined number is correct and if the combined number is effectively assigned
5. the function of buyNumber is called in a loop until the bet is finished (because all the numbers in the winning zone are bought). The contract automatically call the endBet function, choose a random number and assign a winner the assert check if the winning number is in the winning zone

## Web application

There a web application to check some functionalities of the contracts. The web application allow to buy numbers and combine numbers. 
The web application is made completely in Node (i dont have a deep knowledge of javascript) for this reason I couldn’t use metamask in Node. I made a special page to use metamask with one transaction

### **The web application rely on contracts deployed in Rinkeby**




