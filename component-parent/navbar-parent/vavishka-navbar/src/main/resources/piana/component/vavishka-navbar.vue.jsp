<app name="vavishkaNavbar"></app>

<html-template>
    <div class="container-fluid">
        <div id="my_carousel" class="carousel slide" data-ride="false">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="https://sergeiki.github.io/bs0/img/slide1.jpg" alt="First slide">
                    <div class="carousel-caption d-none d-md-block text-right">
                        <h5><a class="text-success" href="https://www.flickr.com/photos/ittfworld/collections/72157690129937915/">Source Photos:<br>2017<br>World Junior<br>Table Tennis<br>Championships</a></h5>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="https://sergeiki.github.io/bs0/img/slide2.jpg" alt="Second slide">
                    <div class="carousel-caption d-none d-md-block text-left">
                        <h5><a class="text-warning" href="https://www.flickr.com/photos/ittfworld/collections/72157690129937915/">Source Photos:<br>2017<br>World Junior<br>Table Tennis<br>Championships</a></h5>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="https://sergeiki.github.io/bs0/img/slide3.jpg" alt="Third slide">
                    <div class="carousel-caption d-none d-md-block text-left">
                        <h5><a class="text-info" href="https://www.flickr.com/photos/ittfworld/collections/72157690129937915/">Source Photos:<br>2017 World Junior<br>Table Tennis Championships</a></h5>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="https://sergeiki.github.io/bs0/img/slide4.jpg" alt="Third slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5><a class="text-danger" href="https://www.flickr.com/photos/ittfworld/collections/72157690129937915/">Source Photos:<br>2017<br>World Junior<br>Table Tennis<br>Championships</a></h5>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#my_carousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#my_carousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
            <ol class="carousel-indicators">
                <li data-target="#my_carousel" data-slide-to="0" class="active"></li>
                <li data-target="#my_carousel" data-slide-to="1"></li>
                <li data-target="#my_carousel" data-slide-to="2"></li>
                <li data-target="#my_carousel" data-slide-to="3"></li>
            </ol>
        </div>

        <div class="pos-f-t">
            <nav class="navbar navbar-dark bg-dark">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <span class="navbar-brand pl-3"><em>واویشکا شاپ</em></span>
            </nav>
            <div class="collapse bg-dark p4" id="navbarToggleExternalContent">
                <multiLevelMenu :color="{r: 10, g: 10, b: 10}" :mgroups="groups" :mActiveParent="activeParent"></multiLevelMenu>
            </div>
        </div>
<!--        <nav aria-label="breadcrumb" role="navigation">-->
<!--            <ol class="breadcrumb m-0">-->
<!--                <li class="breadcrumb-item"><a class="text-success" href="http://getbootstrap.com/">getbootstrap.com</a></li>-->
<!--                <li class="breadcrumb-item"><a class="text-info" href="http://getbootstrap.com/docs/4.0/getting-started/introduction/">Documentation</a></li>-->
<!--                <li class="breadcrumb-item active" aria-current="page">Components</li>-->
<!--                <li class="breadcrumb-item active text-danger" aria-current="page"><-- <em>Breadcrumb Component</em></li>-->
<!--                <li class="breadcrumb-item active text-danger" aria-current="page"><em> ^^ Carousel Component ^^ </em></li>-->
<!--            </ol>-->
<!--        </nav>-->

        <div class="row mx-0 py-3 page-content">
            <div class="container-fluid">
                <router-view></router-view>
            </div>
        </div> <!-- class row mx-0 -->
    </div>
</html-template>

<vue-script>
    <script for="component">
        var $app$ = Vue.component('$app$', {
            template: '$template$',
            props: {
            },
            data: function() {
                return {
                    storeState: store.state,
                    message: ''
                }
            },
            methods: {
            },
            computed: {
            },
            watch: {
            },
            mounted: function () {
            }
        })
    </script>
    <script for="state">
        <state name="vavishkaNavbar" />
    </script>
</vue-script>
