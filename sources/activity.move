module rwa::activity{

    use std::string::{String};
    use sui::transfer::{public_transfer, public_share};
    use rwa::admin::F_Admin;


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
        let  mut activities =Activities{
          all:vector::empty(),
        };
        public_share(new_activity);


    }

    //申请活动，活动通过就加入活动列表

    public entry fun apply(_admin:&F_Admin,activity:&Activiti,activities:&mut  Activities,ctx:&mut TxContext){
        vector::push_back(&mut activities.all,&activity.id);

    }

}