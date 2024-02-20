import Vue from 'vue'
import Vuex from 'vuex'
import router, {resetRouter} from "@/router";

Vue.use(Vuex)

const store = new Vuex.Store({
    state: {
        currentPathName: '',
        user: Object,
        device: [{name:"消毒餐车1",value:0},{name:"消毒餐车2",value:0},{name:"消毒餐车3",value:0},{name:"消毒餐车0",value:0},
            {name:"洗碗车1",value:0},{name:"洗碗车2",value:0},{name:"洗碗车3",value:0},{name:"洗碗车4",value:0},],
    },
    mutations: {
        setPath (state) {
            state.currentPathName = localStorage.getItem("currentPathName")
        },
        logout() {
            // 清空缓存
            localStorage.removeItem("user")
            localStorage.removeItem("menus")
            router.push("/login")

            // 重置路由
            resetRouter()
        }
    }
})

export default store

/*console.log(this.$store.state.user)*/
