# LevelingSystem Contract

## Description
The LevelingSystem contract is a Solidity smart contract designed for managing player progression in a gaming application. It tracks and updates player experience points (EXP) and levels based on predefined rules. Players can earn EXP through various in-game activities and use it to level up their characters. The contract includes functions for earning EXP, leveling up when sufficient EXP is accumulated, and a safeguard using the `revert()` statement to prevent actions if players do not meet specific level requirements.

## Functions

### `earnEXP(uint256 amount) external`
Allows a player to earn experience points (EXP).
- Parameters: `amount` - The amount of EXP to be earned.
- Requirements: `amount` must be greater than zero.
- Effects: Increases the player's `playerEXP` by `amount`.
- Events: Emits `ExpEarned` event with player's address and `amount`.

### `levelUp() external`
Allows a player to level up if they have enough experience points (EXP).
- Requirements: Checks if the player's `playerEXP` is sufficient for the next level, calculated as `currentLevel * 100`.
- Effects: Deducts required EXP from the player's `playerEXP` upon leveling up.
- Assertions: Asserts that the player's level increased by one (`playerLevel[msg.sender] == currentLevel + 1`).
- Events: Emits `LevelUp` event with player's address and new level.

### `heroUltimate() external view returns (string memory)`
Provides an example of using the `revert()` statement.
- Purpose: Demonstrates a check that might require reverting if the player's level is below 6.
- Returns: "Meteor Swarm casted!" if the player's level is sufficient.
- Reverts: "Player level must be at least 6 to perform this action" if the player's level is below 6.

## Authors
- Angel Cruz - https://github.com/PiiDeeGy
