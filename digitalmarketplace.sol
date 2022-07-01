// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.3;


import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "hardhat/console.sol";

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    address contractAddress;

    constructor(address marketplaceAddress) ERC721("VIPIN's Digital Marketplace", "VDMP"){
        contractAddress = marketplaceAddress;
    }

    function createToken(string memory tokenURI) public returns(uint){
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        //setApprovalforAll(contractAddress, true);
        return newItemId;


    }
    
    

}

contract NFTmarket is ReentrancyGuard {
    using Counters for Counters.Counter;
    Counters.Counter private _itemIds;
    Counters.Counter private _itemsSold;

    address payable owner;
    uint256 listingPrice = 10 ether;

    constructor() {
        owner = payable(msg.sender);
    }

    struct MarketItem{
        uint itemId;
        address nftContract;
        uint256 tokenId;
        address payable seller;
        address payable owner;
        uint256 price;
    }
    
    mapping(uint256 => MarketItem) private idToMarketItem;

    event MarketItemCreated(
        uint indexed itemId,
        address indexed nftContract,
        uint256 indexed tokenId,
        address seller,
        address owner,
        uint256 price
    );

    function createMarketItem(address nftContract, uint256 tokenId, uint256 price) public payable nonReentrant{
        require(price>0, "Price must be more than 1 wei");
        require( msg.value == listingPrice, "Price must be equal to the listing price");

        _itemIds.increment();
        uint256 itemId = _itemIds.current();

        idToMarketItem[itemId] = MarketItem(itemId, nftContract, tokenId, payable(msg.sender), payable(address(0)), price);

    }

    function createMarketSale(address nftContract, uint256 itemId) public payable nonReentrant{
        uint price = idToMarketItem[itemId].price;
        uint tokenId = idToMarketItem[itemId].tokenId;

        require( msg.value == price, "pay the asking price" );

        idToMarketItem[itemId].seller.transfer(msg.value);
        IERC721(nftContract).transferFrom(address(this), msg.sender, tokenId);
        idToMarketItem[itemId].owner = payable (msg.sender);
        _itemsSold.increment();
        payable(owner).transfer(listingPrice);
    }

    function fetchMarketItems() public view returns(MarketItem[] memory){
       uint itemCount =  _itemIds.current();
       uint unsoldItemCount = itemCount - _itemsSold.current();
       uint currentIndex = 0;


       MarketItem[] memory items = new MarketItem[](unsoldItemCount);
       for (uint i= 0 ; i< itemCount ; i++){
           if(idToMarketItem[i+1].owner == address(0)) {
               uint currentId = idToMarketItem[i+1].itemId;
               MarketItem storage currentItem = idToMarketItem[currentId];
               items[currentIndex] = currentItem;
               currentIndex +=1 ;
           }
       }
       return items;
    }

    function fetchMyNFTs() public view returns(MarketItem[] memory){
        uint totalItemCount = _itemIds.current();
        uint itemCount = 0 ;
        uint currentIndex = 0;

        MarketItem[] memory items = new MarketItem[](itemCount);
        for(uint i = 1; i<totalItemCount; i++){
            if(idToMarketItem[i+1].owner == msg.sender){
                itemCount += 1;
                uint currentId = idToMarketItem[i+1].itemId;
                MarketItem storage currentItem = idToMarketItem[currentId];
                items[currentIndex] = currentItem;
                currentIndex +=1 ;

            }
        }
        return items;
    }








}