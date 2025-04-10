module rwa::admin{

    use sui::transfer::{public_transfer};
    use std::vector::{empty};

    public struct F_Admin has key,store{
        id :UID,
    }
    public struct Admin has key,store{
        id:UID,
    }
    public struct Admins has key,store{
        id:UID,
        all:vector<Admin>,
    }
    // 管理员和管理员们
    fun init (ctx:&mut TxContext){
        let f_admin = F_Admin{
            id:object::new(ctx),
        };
        let mut admins = Admins{
          id:object::new(ctx),
          all:vector::empty<Admin>(),
        };
        vector::push_back(&mut admins,f_admin);
        public_transfer(f_admin,ctx.sender());
        public_transfer(admins,ctx.sender());
    }
}