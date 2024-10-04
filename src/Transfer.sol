// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

import {IERC20} from "forge-std/interfaces/IERC20.sol";

struct LocalToken {
  address denom;
  uint128 amount;
}

struct Height {
  uint64 revisionNumber;
  uint64 revisionHeight;
}

interface IRelay {
  function send(
    string calldata sourceChannel,
    bytes calldata receiver,
    LocalToken[] calldata tokens,
    string calldata extension,
    Height calldata timeoutHeight,
    uint64 timeoutTimestamp
  ) external;
}

contract Transfer {
  // https://github.com/unionlabs/union/blob/main/evm/README.md#sepolia
  address public constant relay = 0xD0081080Ae8493cf7340458Eaf4412030df5FEEb;

  // https://github.com/unionlabs/union/blob/main/evm/contracts/apps/ucs/01-relay/Relay.sol#L54-L61
  function transferAsset() public {
    LocalToken[] memory tokens = new LocalToken[](1);
    tokens[0].denom = 0x1c7D4B196Cb0C7B01d743Fbc6116a902379C7238;
    tokens[0].amount = 1000000;

    IERC20(tokens[0].denom).approve(relay, 1000000);

    IRelay(relay).send(
      "channel-90",
      hex"a833B03D8ED1228C4791cBfAb22b3ED57954429F",
      tokens,
      "",
      Height({revisionNumber: 100, revisionHeight: 1000000}),
      0
    );
  }
}
