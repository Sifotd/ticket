module rwa::admin{

    use sui::transfer::{public_transfer};
    use std::vector::{empty};

    // public struct F_Admin has key,store{
    //     id :UID,
    // }
    public struct Roledata has key, store{
         id:UID,
         roles:vector<address>,
    }
 
    // 管理员和管理员们
    fun init (ctx:&mut TxContext){
        // let f_admin = F_Admin{
        //     id:object::new(ctx),
        // };
        let  mut admins  = Roledata{
            id:object::new(ctx),
            roles:vector::empty(),
        };
        vector::push_back(&mut admins.roles,ctx.sender());
        public_transfer(admins,ctx.sender());
     
    }
}