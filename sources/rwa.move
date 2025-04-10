/*
/// Module: rwa
module rwa::rwa;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module  rwa::tickets{
    use std::string::{Self,String};

    public struct Tickets has key,store{
        id:UID,
        info:String,
        state:u8,
    }

    public entry  fun create_tickets(){}
}