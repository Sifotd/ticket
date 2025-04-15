module rwa::activity{

    use std::string::{String};
    use sui::transfer::{public_transfer};


    //活动和管理员类似
    public struct  Activiti has key,store{
        id:UID,
        info:String,
        admin:address,
    }

    public struct Activities has store{
        all:vector<UID>,

    }
    //创建活动
    public entry fun create_acticity(info:String,ctx:&mut TxContext){
        let new_activity = Activiti{
            id:object::new(ctx),
            info,
            admin:ctx.sender(),
        };
        public_transfer(new_activity,ctx.sender());

    }

    //申请活动
    public entry fun apply(activity:&Activiti,ctx:&mut TxContext){

    }

}