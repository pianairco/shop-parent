<app name="home"></app>

<html-template>
    <div style="background-color: #457e58">
        <smap :markerCount="1"></smap>
        <h1>Home</h1>
        <router-link to="/book">book</router-link>
        <router-view></router-view>
    </div>
</html-template>

<script>
    var $app$ = Vue.component('$app$', {
        template: '$template$',
        components: {
            'l-map': window.Vue2Leaflet.LMap,
        }
    });
</script>
