<app name="vmap"></app>

<html-template>
<div>
    <div style="height: 300px;" id="mymap"></div>
</div>
</html-template>

<script>
    Vue.component('$app$', {
        template: '$template$',
        data: function() {
            return {
                message: 'Hello To Spring Vue'
            }
        },
        mounted() {
            // this.$nextTick(() => {
            //     this.$refs.myMap.mapObject.ANY_LEAFLET_MAP_METHOD();
            // });
            this.initMap();
        },
        methods: {
            initMap() {
                var mymap = L.map('mymap').setView([35.679326, 51.4879088], 19);
                L.marker([35.679326, 51.4879088]).addTo(mymap);
                L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
                }).addTo(mymap);
            }
        }
    });
</script>
