// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LostAndFoundRegistry {

    struct Item {
        string itemName;
        string description;
        address owner;
        string status;  // "Lost", "Found", "Resolved"
    }

    Item[] public items;

    event ItemReported(uint itemId, string itemName, address owner);
    event ItemFound(uint itemId, address finder);
    event ItemResolved(uint itemId, address owner);

    // Report a lost item
    function reportLost(string memory _itemName, string memory _description) public {
        items.push(Item({
            itemName: _itemName,
            description: _description,
            owner: msg.sender,
            status: "Lost"
        }));

        emit ItemReported(items.length - 1, _itemName, msg.sender);
    }

    // Mark an item as found
    function markFound(uint _itemId) public {
        require(_itemId < items.length, "Invalid item ID");
        require(keccak256(bytes(items[_itemId].status)) == keccak256(bytes("Lost")), "Item not in Lost state");

        items[_itemId].status = "Found";

        emit ItemFound(_itemId, msg.sender);
    }

    // Mark item as resolved
    function markResolved(uint _itemId) public {
        require(_itemId < items.length, "Invalid item ID");
        require(msg.sender == items[_itemId].owner, "Only owner can resolve");

        items[_itemId].status = "Resolved";

        emit ItemResolved(_itemId, msg.sender);
    }

    // Get total lost items
    function getTotalItems() public view returns (uint) {
        return items.length;
    }

    // Get item details
    function getItem(uint _itemId) public view returns(
        string memory,
        string memory,
        address,
        string memory
    ) {
        require(_itemId < items.length, "Invalid item ID");
        Item memory item = items[_itemId];
        return (item.itemName, item.description, item.owner, item.status);
    }
}
