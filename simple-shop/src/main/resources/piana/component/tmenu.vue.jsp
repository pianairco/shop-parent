<app name="tmenu"></app>

<html-template>
    <div>
    <template v-for="(item, index) in mgroups" >
        <template v-if="checkCode(item) && item.code.length == 2">
            <li class="active sidebar-dropdown" >
                <a href="/" v-on:click="reset($event)">بازگشت
                </a>
            </li>
        </template>
        <template v-if="checkCode(item)">
            <li class="active sidebar-dropdown" >
                <a v-bind:href="item.link" v-on:click="changeState($event, item)">
                    <i v-if="item.icon" v-bind:class="item.icon"></i>
                    <span>{{item.title}}</span>
                </a>
            </li>
        </template>
        <template v-if="item.parentCode == mActiveParent.code">
            <li v-bind:class="getDropDownClass(item)" >
                <a v-bind:href="item.link" v-on:click="changeState($event, item)">
                    <i v-if="item.icon" v-bind:class="item.icon"></i>
                    <span>{{item.title}}</span>
                </a>
            </li>
        </template>
        <template v-if="item.parentCode != mActiveParent.code && item.groups.length > 0">
            <tmenu :mgroups="item.groups" :mActiveParent="mActiveParent"></tmenu>
        </template>
    </template>
    </div>
</html-template>

<script>
    Vue.component('$app$', {
        template: '$template$',
        props: {
            color: {
                type: Object,
                default: function () {
                    return {
                        r: Number,
                        g: Number,
                        b: Number
                    }
                }
            },
            mgroups: {
                type: Array,
                default: function () {
                    return [{
                        title: String,
                        icon: String,
                        role: String,
                        code: String,
                        open: Boolean,
                        groups: []
                    }]
                }
            },
            mActiveParent: {
                type: Object,
                default: function () {
                    return {
                        code: String
                    }
                }
            }
        },
        methods: {
            changeState: function (event, item){
                event.preventDefault();
                if(item.link && item.link != this.$route.path)
                    router.push(item.link);
                if(item.groups.length > 0) {
                    this.mActiveParent.code = item.code;
                    this.mgroups.forEach((value, index, array) => {
                        if(value != item)
                            value.open = false;
                    });
                    item.open = !item.open;
                }
                return false;
            },
            getDropDownClass(item) {
                return { 'sidebar-dropdown': item.groups.length > 0 }
            },
            checkCode: function (item) {
                cc = this.mActiveParent.code + '';
                do {
                    if(cc == item.code)
                        return true;
                    else
                        cc = cc.substr(2);
                } while (cc.length > 0)
                return false;
                // console.log(this.mActiveParent.code.length)
                // return this.mActiveParent.code == item.code;
            },
            reset: function (event) {
                this.mActiveParent.code = '';
                event.preventDefault();
                return false;
            }
        }
    });
</script>
