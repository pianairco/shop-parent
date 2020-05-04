<app name="root"></app>

<html-template>
    <div style="background-color: #457e58">
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
