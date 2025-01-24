pragma solidity ^0.8.27;

import {IERC20} from "forge-std/interfaces/IERC20.sol";

interface Ucs03 {
  function transfer(
      uint32 channelId,
      bytes calldata receiver,
      address baseToken,
      uint256 baseAmount,
      bytes calldata quoteToken,
      uint256 quoteAmount,
      uint64 timeoutHeight,
      uint64 timeoutTimestamp,
      bytes32 salt
  ) external;
}

contract Transfer {
    address public constant relay = 0x7B7872fEc715C787A1BE3f062AdeDc82b3B06144;
    address public constant muno = 0xF2865969cF99A28Bb77e25494fE12D5180fE0efD;
    bytes32 public constant salt = bytes32("0xF2865969cF99A28Bb77e25494fE1");

  function transferAsset() public {
    IERC20(muno).approve(relay, 1000000);

    Ucs03(relay).transfer(
      90,
      hex"1c7D4B196Cb0C7B01d743Fbc6116a902379C7238",
      muno,
      1000000,
      "muno",
      1000000,
      1000000000000,
      2737670312,
      salt
    );
  }
}
