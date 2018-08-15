/* var MainBet = artifacts.require("./MainBet.sol");

module.exports = function(deployer) {
  deployer.deploy(MainBet("0x0", 2,2,10,1,15,"mb1"));
  
};
*/
const MainBet = artifacts.require("./MainBet.sol")

module.exports = (deployer, network, accounts) => {
  const userAddress = accounts[3];

const p2 = userAddress;
const p3 = 2;
const p4 = 2;
const p5 = 20;
const p6 = 3;
const p7 = 210;
const p8 = "mb1";
  deployer.deploy(MainBet, p2,p3,p4,p8,p5,p6,p7)
}
