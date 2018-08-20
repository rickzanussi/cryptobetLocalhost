Patterns

Emergency stop

Owner of the bet can pause the GenericBet contract with a pause switch. buynumbers and combine numbers functions are stopped (and consequently also endBet is not called)


Contract updates

Choice was done to deployed a new contract for every sequence of bet and a contract for every bet in the sequence (deployed from the the cotract). 
So if the contract needs an update, it will be deployed with the next generation of family of bets
To allow the deployed of the contract from a web interface, the idea is (but not done for time restriction
 in this version), store the bitcode and the ABI in IPFS and let the Manager choose what version use for the next family of bet

Generic Bet contract

It is also possible deploying the Generic Bet contract without passing through the mainBet contract. It is designed in this way
The use will lose the "easiness" to geberate automatically the bet with the same parameters.
In future release, more functions will be added to the Main Bet Contract to manage the bets

Pseudo-Random number

The routine to generate deterministic random number are based on the contract address and to the sumNumbers - sum of all the already bought numbers. It is intened that it is not completely random but - IMHO - if somebody crack the algorythm, he laso has to buy a without waiting for another user buy a number. 

Freenumbers system

I tried to not to make lop in any place not to elevate the cost of buying/combine number for the user
The only loops are to initiate array and mapping when a generic bet contract is deployed (instantiated).
Buy number nad combine number funtions dont have loop to check is a number is free



Public fields

All the fileds fields are public to allow debugging. In a future more safe version, care will be taken to hide not necesary public fields

EndBet function

It is private so nobody can call it to arbitrarly finishing a bet without winner

Polymorphism

The function to generate random number could be done with polymorphism. But the feeling is that there is some problem in oslidity with that. My safe choice is not to use polymorphism
