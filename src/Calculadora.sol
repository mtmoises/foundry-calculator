// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Calculadora {
    uint256 public resultado;
    address public admin;

    event Addition(uint256 firstNumber_, uint256 secondNumber_, uint256 resultado_);
    event Substraction(uint256 firstNumber_, uint256 secondNumber_, uint256 resultado_);
    event Multiplier(uint256 firstNumber_, uint256 secondNumber_, uint256 resultado_);
    event Division(uint256 firstNumber_, uint256 secondNumber_, uint256 resultado_);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not allowed");
        _;
    }
    
    constructor(uint256 firstResultado_, address admin_) {
        require(admin_ != address(0), "Admin no puede ser direccion cero");
        resultado = firstResultado_;
        admin = admin_;
    }

    function addition(uint256 firstNumber_, uint256 secondNumber_) external returns(uint256 resultado_) {
        resultado_ = firstNumber_ + secondNumber_;
        resultado = resultado_;
        emit Addition(firstNumber_, secondNumber_, resultado_);
    }

    function substraction(uint256 firstNumber_, uint256 secondNumber_) external returns(uint256 resultado_) {
        resultado_ = firstNumber_ - secondNumber_;
        resultado = resultado_;
        emit Substraction(firstNumber_, secondNumber_, resultado_);
    }

    function multiplier(uint256 firstNumber_, uint256 secondNumber_) external returns(uint256 resultado_) {
        resultado_ = firstNumber_ * secondNumber_;
        resultado = resultado_;
        emit Multiplier(firstNumber_, secondNumber_, resultado_);
    }

    function division(uint256 firstNumber_, uint256 secondNumber_) external onlyAdmin returns(uint256 resultado_) {
        require(secondNumber_ != 0, "Division by zero");
        resultado_ = firstNumber_ / secondNumber_;
        resultado = resultado_;
        emit Division(firstNumber_, secondNumber_, resultado_);
    }
}




