use core::fmt::{Display, Error, Formatter, Debug};
use starknet::{contract_address_to_felt252, ContractAddress, contract_address_const};

impl DisplayContractAddress of Display<starknet::ContractAddress> {
    fn fmt(self: @starknet::ContractAddress, ref f: Formatter) -> Result<(), Error> {
        write!(f, "{}", contract_address_to_felt252(*self))
    }
}

impl DebugContractAddress of Debug<ContractAddress> {
    fn fmt(self: @starknet::ContractAddress, ref f: Formatter) -> Result<(), Error> {
        Display::fmt(self, ref f)
    }
}

impl DefaultContractAddress of Default<ContractAddress> {
    fn default() -> ContractAddress {
        contract_address_const::<0>()
    }
}

mod utils {
    mod order_types;
}

mod interfaces {
    mod nft_transfer_manager;
}

mod mocks {
    mod account;
    mod erc20;
    mod erc1155;
    mod erc721;
    mod strategy;
}

mod contract_deployer;
mod currency_manager;
mod execution_manager;
mod marketplace;
mod proxy;
mod royalty_fee_manager;
mod royalty_fee_registry;
mod signature_checker;
mod signature_checker2;
mod strategy_any_item_from_collection_for_fixed_price;
mod strategy_highest_bidder_auction_sale;
mod strategy_private_sale;
mod strategy_standard_sale_for_fixed_price;
mod strategy_yolo_buy;
mod transfer_manager_ERC721;
mod transfer_manager_ERC1155;
mod transfer_selector_NFT;

