// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0;

import './interfaces/IUniswapV2Factory.sol';
import './interfaces/IUniswapV2Pair.sol';


contract Arbitrage {
    address public factory;

    function startArbitrage(
        address token0, 
        address token1, 
        uint amount0, 
        uint amount1
    ) external {
        address pairAddress = IUniswapV2Factory(factory).getPair(token0, token1);
        require(pairAddress != address(0), 'This pool does not exist');
        IUniswapV2Pair(pairAddress).swap(
            amount0, 
            amount1, 
            address(this), 
            bytes('not empty')
        );
    }
}