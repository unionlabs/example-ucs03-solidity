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
  address public constant relay = 0xD0081080Ae8493cf7340458Eaf4412030df5FEEb;
  address public constant usdc = 0xa833B03D8ED1228C4791cBfAb22b3ED57954429F;
  address public constant receiver = 0x1c7D4B196Cb0C7B01d743Fbc6116a902379C7238;

  function transferAsset() public {
    IERC20(usdc).approve(relay, 1000000);

    Ucs03(relay).transfer(
      90,
      hex"a833B03D8ED1228C4791cBfAb22b3ED57954429F",
      receiver,
      1000000,
      "usdc",
      1000000,
      1000000,
      0,
      bytes32("")
    );
  }
}
