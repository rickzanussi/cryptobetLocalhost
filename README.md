# cryptobet


Cryptobet is an application to generate, manage and play bets

Roles
There are tow roles: manager (he generate a family of bet with parameters, generate the single bet and have the power to pause it) and player (can buy a random number with a fee and combine two number to have another one)

Cryptobet is made by two contract: MainBet and GenericBet

MainBet is deployed with the parameters to generate a sequence of bets. The parameters are given once and all the generated bets implement the same parameters of their MainBet. To have a sequence of bets with different parameter it is sufficient deploy another MainBet contract with different parameters. 
From a MainBet, a bet can be deployed only when the former bet of the same family is finished with a winner

The parameters to generate a MainBet contract are
 - feeAccount
   the account where the fee for the Manager is payed when a bet has a winner
 - feePercentage 
   the percentage of the bet going to the manager fee
 - newNumberPrice
   the cost of buying a random number 
 - betName
   name of the Bet
 - numberOfNumbers
   numbers can be bought (max.100)
 - numberOfPossibleWinners
   length of the range of numbers that can win. (Always less the numberOfNumbers)
 - sumNumbers 
   sum of all the numberOfNumbers (ex: in case of numberOfNumbers = 100, this number is 5050. I is as parameters not to be computed inside a smart contract to reduce the number of loops)

Flow of the game (Through an Example)

Just give numberOfNumbers value 100; I can choose - example - numberOfPossibleNumbers as 10. It means that just 10 out of 100 numbers can be the winner number (a winning zone). 
When a player buy a number, the smart contract vie a random number in the range of 100. Of course 9/10 the bought number will be out of the range of possible winner.

To make the game more interesting and allow players to have strategies instead of pure luck, a function to combine two numbers is allowed. This function take two number (both owned by the player) sum them and divide for two. (if the result of the sum is not divisible ofr two, it is decreased by 1). So a player with numbers out of the winning zone but with one bigger and one lower, can combine to have a number in the winning zone. If the result number is already owned, the combine is unsuccesful. The two number used for the combine are set free again when the computed number is free and assigned to the message sender
While buying a random number implies a fee, combine two number not: the player have already paid fee for two numbers used in the combine and he will lose these numbers. So efectively, the combined number will cost a double fee. 

All the fee paid for buying numbers are put in a basket
When all the number in the winning zone are bought the bet is finished by the smart contract, a fee (equal to the feePercentage*basket amount) is given to feeAccount, all the remaining money is given to the owner of the winning number and the bet is put to Ended. The Manager can now generate another bet

