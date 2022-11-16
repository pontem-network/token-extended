/// Extended Aptos token module to allow to transfer NFTs if "opt in" enabled.
module token_exdened::transfer {
    use aptos_std::string::String;
    use aptos_token::token;

    /// Transfer token from `from` account to `to` if "opt in" enabled.
    public entry fun transfer_with_opt_in(
        from: &signer,
        creator: address,
        collection_name: String,
        token_name: String,
        token_property_version: u64,
        to: address,
        amount: u64,
    ) {
        let token_id = token::create_token_id_raw(creator, collection_name, token_name, token_property_version);
        token::transfer(from, token_id, to, amount);
    }
}
