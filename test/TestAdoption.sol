pragma solidity ^0.8.0;

import "truffle/Assert.sol";
import "truffle/Deployment.sol";
import "../contracts/Adoption.sol";

contract TestAdoption{
    Adoption adoption = Adoption(DeployedAddresses.Adoption());
    
    uint expectedPetId = 8;

    address expectedAdopter = address(this);

    function testUserCanAdoptPet() public{
        uint returnId = adoption.adopt(expectedPetId);

        Assert.equal(returnId, expectedPetId, "Adoption of expected match return");
    }
    function testGetAdopterAddressByPetId() public{
        address adopter = adoption.adopters(expectedPetId);
        Assert.equal(adopter,expectedAdopter,"Adopter address match with expected"); 
    }
    function testGetAdopterAddressByPetIdInArray() public{
        address[16] memory adopters = adoption.getAdopters();
        assert.equal(adopters[expectedPetId],expectedAdopter,"Pass pet ID 8 and expected same adopter");
    }
}
