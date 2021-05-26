// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract CoinCoin {
  mapping(address => uint256) private _balances;
  mapping (address => mapping (address => uint256)) private _allowances; //
  string private _name;
  string private _symbol;
  uint256 private _totalSupply;

  event Transfered(address indexed sender, address indexed recipient, uint256 amount);
  event TransferedFrom(address indexed from,address indexed to, uint256 amount);

  constructor(address owner_, uint256 totalSupply_) {
    _name = "CoinCoin";
    _symbol = "COIN";
    _balances[owner_] = totalSupply_;
    emit Transfered(address(0), owner_, totalSupply_);
  }
  
  function name() public view returns (string memory) {
    return _name;
  }

  function symbol() public view returns (string memory) {
    return _symbol;
  }

  function totalSupply() public view returns (uint256) {
    return _totalSupply;
  }

  function balanceOf(address account) public view returns (uint256) {
    return _balances[account];
  }
//
  function transfered(address sender_, address recipient_, uint256 amount_) public {
    require( amount_ > 0, "CoinCoin: can not transfer 0 ether" );
    require(_balances[msg.sender] >= amount_, "CoinCoin: Not enough coin to transfer");
    require(recipient_ != address(0), "CoinCoin: transfer to the zero address");
        _balances[sender_] -= amount_;
        _balances[recipient_] += amount_;
        emit Transfered(sender_, recipient_, amount_);
  }
//
  function transferedFrom(address from_, address to_, uint256 amount_) public {
    require(_allowances[from_][to_] >= amount_, "CoinCoin: transfer amount exceeds allowance");
    _allowances[from_][to_] -= amount_;
    _balances[from_] -= amount_;
    _balances[to_] += amount_;
    emit TransferedFrom(from_, to_, amount_);
  }
//
  function approve(address sender, address spender_, uint256 totalSupply_) public {
    require(sender != address(0), "CoinCoin: Approve from the zero address");
    require(spender_ != address(0), "CoinCoin: Approve to the zero address");
    _allowances[sender][spender_] = totalSupply_;
    }
//
  function allowance(address owner_, address spender_) public view returns (uint256) {
    return _allowances[owner_][spender_];
  }

}