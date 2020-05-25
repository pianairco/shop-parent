<app name="vsidebar"></app>

<html-template>
    <div>
        <nav class="navbar navbar-expand navbar-dark bg-primary"> <a href="#menu-toggle" v-on:click="menuToggle" id="menu-toggle" class="navbar-brand"><span class="navbar-toggler-icon"></span></a> <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample02" aria-controls="navbarsExample02" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
            <div class="collapse navbar-collapse" id="navbarsExample02">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active"> <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a> </li>
                    <li class="nav-item"> <a class="nav-link" href="#">Link</a> </li>
                </ul>
                <form class="form-inline my-2 my-md-0"> </form>
            </div>
        </nav>
        <div id="wrapper" class="toggled">
            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand"> <a href="#"> Start Bootstrap </a> </li>
                    <li> <router-link to="/root/login">login</router-link> </li>
                    <li> <router-link to="/root/home">home</router-link> </li>
                    <li> <router-link to="/root/home/book">book</router-link> </li>>
                    <li> <a href="#">About</a> </li>
                    <li> <a href="#">Services</a> </li>
                    <li> <a href="#">Contact</a> </li>
                </ul>
            </div> <!-- /#sidebar-wrapper -->
            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <router-view></router-view>
                </div>
            </div> <!-- /#page-content-wrapper -->
        </div>
    </div>
</html-template>

<script>
    var $app$ =Vue.component('$app$', {
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
        methods: {
            menuToggle: function (event) {
                event.preventDefault();
                $("#wrapper").toggleClass("toggled");
            },
            x: function () {
                axios.post('/action', this.user, {headers: {"action": "$bean$", "activity": "x"}})
                    .then((response) => { this.message = response.data; })
                    .catch((err) => { this.message = err; });
            }
        },
        mounted(){
            $("#wrapper").toggleClass("toggled");
        }
    });
</script>
