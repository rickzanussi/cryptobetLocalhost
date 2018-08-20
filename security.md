

Reentrancy

1) buynumber function of Generic bet contract
the add to betPrize is made by an internal value not by the value send by the player
the transfer of the value exceeding the standard value pof buying a new number is given back to the sender. The function buyNumber have to be called with a value. so in case of reentrancy the money considerede to be given back is the value in the parameters of the new buyNumber function called

2) end bet function of Generic bet contract
in case of reentrancy, the value of betprize is already set to zero before the possible call to another function
