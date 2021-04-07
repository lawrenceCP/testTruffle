const Adoption = artifacts.require("Adoption");

contract("Adoption",(accounts)=>{
    let adoption;
    let expectedPetId;
    before(async()=>{
        adoption = await Adoption.deployed();
    });
    describe("adoption a pet and retrieve account address", async()=>{
        before("adopt a pet using accounts[0]", async()=>{
            await adoption.adopt(8,{from: accounts[0]});
            expectedAdopter = accounts[0];
        });
        it("can fetch address of owner by pet Id", async()=>{
            const adopter = await adoption.adopters(8);
            assert.equal(adopter,expectedAdopter,"owner of the pet is the first account")
        })
        it("can fetch all pet owners", async()=>{
            const adopter = await adoption.getAdopters();
            assert.equal(adopter[8],expectedAdopter,"Pass 8 and getting 8");
        })
    })
    
})