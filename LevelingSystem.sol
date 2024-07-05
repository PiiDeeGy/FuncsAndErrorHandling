// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LevelingSystem {
    mapping(address => uint256) public playerEXP;
    mapping(address => uint256) public playerLevel;

    // Event emitted when a player earns experience points
    event ExpEarned(address indexed player, uint256 amount);

    // Event emitted when a player levels up
    event LevelUp(address indexed player, uint256 newLevel);

    // Function to allow a player to earn experience points
    function earnEXP(uint256 amount) external {
        require(amount > 0, "Amount must be greater than zero");

        playerEXP[msg.sender] += amount;

        emit ExpEarned(msg.sender, amount);
    }

    // Function to allow a player to level up if they have enough experience points
    function levelUp() external {
        uint256 currentLevel = playerLevel[msg.sender];
        uint256 newLevel = currentLevel + 1;
        uint256 requiredEXP = newLevel * 100;

        require(playerEXP[msg.sender] >= requiredEXP, "Not enough EXP to level up");

        playerEXP[msg.sender] -= requiredEXP; // Deduct required EXP per level

        playerLevel[msg.sender] = newLevel;

        assert(playerLevel[msg.sender] == currentLevel + 1); // Assert that the player's level increased by one

        emit LevelUp(msg.sender, newLevel);
    }

    // Example function demonstrating the use of revert()
    function heroUltimate() external view returns (string memory) {
        uint256 currentLevel = playerLevel[msg.sender];
        
        // Perform a check that might require reverting
        if (currentLevel < 6) {
            revert("Player level must be at least 6 to perform this action");
        }
        
        return "Meteor Swarm casted!";
    }
}
