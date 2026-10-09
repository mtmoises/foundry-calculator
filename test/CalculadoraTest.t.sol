// SPDX-License-Identifier: MIT
pragma solidity ^0.8.37;

import "../src/Calculadora.sol";
import "forge-std/Test.sol";

contract CalculadoraTest is Test {

    Calculadora public calculadora; // minúscula y public
    uint256 public firstResultado = 100;
    address public admin = vm.addr(1);
    address public randomUser = vm.addr(2);

    function setUp() public {
        calculadora = new Calculadora(firstResultado, admin);
    }

    // unit testing 
    function testCheckFirstResultado() public view {
        uint256 firstResultado_ = calculadora.resultado();
        assert(firstResultado_ == firstResultado);
    }

    function testAddition() public {
        uint256 firstNumber_ = 5;
        uint256 secondNumber_ = 5;

        uint256 resultado_ = calculadora.addition(firstNumber_, secondNumber_);

        assert(resultado_ ==firstNumber_ + secondNumber_);
    }

        function testSubstraction() public {
        uint256 firstNumber_ = 5;
        uint256 secondNumber_ = 5;

        uint256 resultado_ = calculadora.substraction(firstNumber_, secondNumber_);

        assert(resultado_ == firstNumber_ - secondNumber_);
    }

   function testMultiplier() public {
    uint256 firstNumber_ = 5;
    uint256 secondNumber_ =5;

    uint256 resultado_ = calculadora.multiplier(firstNumber_, secondNumber_);
    assert(resultado_ == firstNumber_ * secondNumber_);
   }
   
   function testCanNotMultiply2LargeNumbers() public {
    uint256 firstNumber_ = 5;
    uint256 secondNumber_ = type(uint256).max - 1; // esto es 2**256 - 2

    vm.expectRevert();
    calculadora.multiplier(firstNumber_, secondNumber_);
   }

function testIfNotAdminCallsDivisionRevert() public {
    vm.prank(makeAddr("randomUser"));
    vm.expectRevert();
    calculadora.division(5, 2);
}
   
   function testAdmincanCallDivisionCorrectly() public {
    vm.prank(admin);
    uint256 result = calculadora.division(5,2);
    assertEq(result,2); 
   }
   
  function test_RevertWhen_DefaultSenderIsNotAdmin() public {
    address nonAdmin = makeAddr("nonAdmin");
    
    uint256 firstNumber_ = 5;
    uint256 secondNumber_ = 2;

    vm.prank(nonAdmin);
    vm.expectRevert();

    calculadora.division(firstNumber_, secondNumber_);
}
    function test_WhenCallerIsAdmin_ShouldReturnCorrectDivision() public {
    vm.prank(admin);

    uint256 firstNumber_ = 5;
    uint256 secondNumber_ = 2;
    
    uint256 result_ = calculadora.division(firstNumber_, secondNumber_);

    assertEq(result_, firstNumber_ / secondNumber_);
}
    function testCanNotDivisionbyZero() public {
       vm.prank(admin);

    uint256 firstNumber_ = 5;
    uint256 secondNumber_ = 2;
    

    uint256 result_ = calculadora.division(firstNumber_, secondNumber_);

    assertEq(result_, firstNumber_ / secondNumber_);  
    }
    
    function test_RevertWhen_DividingByZero() public {
    vm.prank(admin);

    uint256 firstNumber_ = 5;
    uint256 secondNumber_ = 0;

    vm.expectRevert();
    calculadora.division(firstNumber_, secondNumber_);
}
    
    // fuzzing testing
        // fuzzing testing
    function testFuzzingDivision(uint256 firstNumber_, uint256 secondNumber_) public {
        vm.assume(secondNumber_ != 0); 
        vm.startPrank(admin);

        calculadora.division(firstNumber_, secondNumber_);

        vm.stopPrank();
    }

}
