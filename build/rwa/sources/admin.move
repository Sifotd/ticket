module rwa::admin{

    use sui::transfer::{public_transfer};

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
    fun init (ctx:&mut TxContext){
        let f_admin = F_Admin{
            id:object::new(ctx),
        };
        public_transfer(f_admin,ctx.sender());
    }
}