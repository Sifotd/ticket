module rwa::activity{

    use std::string::{String};



    public struct Activity has key,store{
        id:UID,
        info:String,

    }

    public struct Activities has key,store{
        id:UID,
        all:vector<Activity>,
    }
    //    fun init(){}

    // public entry fun create_activity(_admin:,activity:Activity,activities:& mut Activities){

    // }
}