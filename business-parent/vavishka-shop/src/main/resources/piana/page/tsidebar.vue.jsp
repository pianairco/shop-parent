<app name="tsidebar"></app>

<html-template>
    <div class="page-wrapper chiller-theme" v-bind:class="{ toggled: toggled }">
        <span id="show-sidebar" class="btn btn-sm btn-dark" v-on:click="showSidebarClick">
            <i class="fas fa-bars"></i>
        </span>
        <nav id="sidebar" class="sidebar-wrapper">
            <div class="sidebar-content">
                <div class="sidebar-brand">
                    <a href="#"><img src="images/tsidebar-logo.png" ></a>

                    <div id="close-sidebar" v-on:click="closeSidebarClick">
                        <i class="fas fa-times"></i>
                    </div>
                </div>
                <div v-if="!storeState.loggedIn">
                    <login></login>
                </div>
                <div class="sidebar-header" v-if="storeState.loggedIn">
                    <div>
                        <div class="user-pic">
                            <img class="img-responsive img-rounded" src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg"
                                 alt="User picture">
                        </div>
                        <div class="user-info">
                        <span class="user-name">Jhon
                            <strong>Smith</strong>
                        </span>
                            <span class="user-role">Administrator</span>
                            <span class="user-status">
                            <i class="fa fa-circle"></i>
                            <span>Online</span>
                        </span>
                        </div>
                    </div><!--end-->
                </div>
                <!-- sidebar-header  -->
                <div class="sidebar-search">
                    <div>
                        <div class="input-group">
                            <input type="text" class="form-control search-menu" placeholder="Search...">
                            <div class="input-group-append">
              <span class="input-group-text">
                <i class="fa fa-search" aria-hidden="true"></i>
              </span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- sidebar-search  -->
                <div class="sidebar-menu">
                    <ul>
                        <li class="header-menu">
                            <span>دسته بندی</span>
                        </li>
                        <tmenu :color="{r: 10, g: 10, b: 10}" :mgroups="groups" :mActiveParent="activeParent"></tmenu>

<!--                        <component :is="compiledData" ></component>-->

                    </ul>
                </div>
                <!-- sidebar-menu  -->
            </div>
            <!-- sidebar-content  -->
            <div class="sidebar-footer">
                <a href="#">
                    <i class="fa fa-bell"></i>
                    <span class="badge badge-pill badge-warning notification">3</span>
                </a>
                <a href="#">
                    <i class="fa fa-envelope"></i>
                    <span class="badge badge-pill badge-success notification">7</span>
                </a>
                <a href="#">
                    <i class="fa fa-cog"></i>
                    <span class="badge-sonar"></span>
                </a>
                <a href="#">
                    <i class="fa fa-power-off"></i>
                </a>
            </div>
        </nav>
        <!-- sidebar-wrapper  -->
        <main class="page-content">
            <div class="container-fluid">
                <router-view></router-view>
            </div>
        </main>
        <!-- page-content" -->
    </div>
</html-template>

<vue-script>
    <script for="component">
        var $app$ = Vue.component('$app$', {
            template: '$template$',
            props: {
                menu: {
                    type: Array,
                    default: function () {
                        return [{
                            title: String,
                            route: String,
                        }]
                    }
                }
            },
            data: function() {
                return {
                    // groups: [],
                    toggled: false,
                    storeState: store.state
                }
            },
            methods: {
                changeState: function (item){
                    console.log('ooooooo');
                    console.log(item);
                    console.log(item.open);
                    item.open = !item.open;
                    console.log(item.open);
                    console.log('xxxxxxx');
                },
                menuToggle: function (event) {
                    event.preventDefault();
                    $("#wrapper").toggleClass("toggled");
                },
                x: function () {
                    axios.post('/action', this.user, {headers: {"action": "$bean$", "activity": "x"}})
                        .then((response) => { this.message = response.data; })
                .catch((err) => { this.message = err; });
                },
                showSidebarClick: function () {
                    this.toggled = true;
                },
                closeSidebarClick: function () {
                    this.toggled = false;
                },
                setMenuEvent: function () {
                    console.log("ddddddddd")
                    $(".sidebar-dropdown > a").click(function() {
                        $(".sidebar-submenu").hide( );
                        if (
                            $(this)
                                .parent()
                                .hasClass("active")
                        ) {
                            $(".sidebar-dropdown").removeClass("active");
                            $(this)
                                .parent()
                                .removeClass("active");
                        } else {
                            $(".sidebar-dropdown").removeClass("active");
                            $(this)
                                .next(".sidebar-submenu")
                                .show();
                            $(this)
                                .parent()
                                .addClass("active");
                        }
                    });
                }
            },
            computed: {
                compiledData () {
                    return {
                        template: '<div><template v-for="(item, index) in groups" v-if="groups.length > 0">\n' +
                            '                            <li class="sidebar-dropdown" v-bind:class="{active: item.open}" v-on:click="changeState(item)">\n' +
                            '                                <a href="#">\n' +
                            '                                    <i class="fa fa-tachometer-alt"></i>\n' +
                            '                                    <span>{{item.title}}</span>\n' +
                            '                                </a>\n' +
                            '                                <div class="sidebar-submenu">\n' +
                            '                                    <ul>\n' +
                            '                                        <li v-for="(itm, idx) in item.groups">\n' +
                            '                                            <a href="#">{{itm.title}}\n' +
                            '                                                <span class="badge badge-pill badge-success">Pro</span>\n' +
                            '                                            </a>\n' +
                            '                                        </li>\n' +
                            '                                    </ul>\n' +
                            '                                </div>\n' +
                            '                            </li>\n' +
                            '                        </template></div>'
                    }
                }
            },
            mounted(){
                // axios.post('/action', {}, {headers: {"action": "groupService", "activity": "groups"}})
                //     .then((response) => {
                //         console.log("aaaaa")
                //
                //         this.$nextTick(() => {
                //             this.groups = response.data;
                //             // this.setMenuEvent();
                //         });
                //     })
                //     .catch((err) => { this.message = err; });
            }
        });
    </script>
    <script for="state">
        <state name="formValue" />
    </script>
</vue-script>