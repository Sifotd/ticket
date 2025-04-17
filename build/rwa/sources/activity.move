module rwa::activity {

    use std::string::{String};
    use sui::tx_context::TxContext;
    use sui::object::{UID};
    use sui::transfer::{public_share_object};
    use rwa::admin::F_Admin;
    use sui::object::uid_to_address;

    // 活动结构体
    public struct Activiti has key, store {
        id: UID,
        info: String,
        admin: address,
    }

    // 活动列表结构体
    public struct Activities has key, store {
        id: UID,
        all: vector<address>,
    }

    // 初始化活动列表
    public entry fun init_activities(ctx: &mut TxContext) {
        let activities = Activities {
            id: object::new(ctx),
            all: vector::empty(),
        };
        public_share_object(activities);
    }

    // 创建活动
    public entry fun create_activity(info: String, activities: &mut Activities, ctx: &mut TxContext) {
        let new_activity = Activiti {
            id: object::new(ctx),
            info,
            admin: ctx.sender(),
        };
        let new_address =uid_to_address(&new_activity.id);
        vector::push_back(&mut activities.all, new_address); //加入
        public_share_object(new_activity);
    }

    // 创建之后apply,申请活动
    public entry fun apply(_admin: &F_Admin, activity: &Activiti, activities: &mut Activities, ctx: &mut TxContext) {

        let  apply_address = uid_to_address(&activity.id);

        let exists = vector::contains(&activities.all, &apply_address); // 使用值而不是引用
        assert!(!exists, 1); // 如果活动已存在，抛出错误
        vector::push_back(&mut activities.all, apply_address); // 使用值而不是引用
    }
}