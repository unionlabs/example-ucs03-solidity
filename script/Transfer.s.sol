pragma solidity ^0.8.27;

import {Script, console} from "forge-std/Script.sol";
import {Transfer} from "../src/Transfer.sol";
import {IERC20} from "forge-std/interfaces/IERC20.sol";

contract TransferScript is Script {
  address public constant muno = 0xF2865969cF99A28Bb77e25494fE12D5180fE0efD;

  function run() public {
    uint256 privateKey = vm.envUint("PRIVATE_KEY");
    vm.startBroadcast(privateKey);
    Transfer transfer = new Transfer();

    IERC20(muno).transfer(address(transfer), 1500000);

    console.log("transferring");
    transfer.transferAsset();
    console.log("complete");
    vm.stopBroadcast();
  }
}
