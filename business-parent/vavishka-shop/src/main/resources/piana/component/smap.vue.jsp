<app name="smap"></app>

<html-template>
<div style="height: 300px">
    <l-map ref="map" :zoom="zoom" :center="center" @click="addMarker">
        <l-tile-layer :url="url" :attribution="attribution"></l-tile-layer>
        <l-marker v-for="marker, index in markers" :lat-lng="marker" @click="removeMarker(index)"></l-marker>
    </l-map>
</div>
</html-template>

<vue-script>
    <script for="component">
        Vue.component('$app$', {
            template: '$template$',
            components: {
                'l-map': window.Vue2Leaflet.LMap,
                'l-tile-layer': window.Vue2Leaflet.LTileLayer,
                'l-marker': window.Vue2Leaflet.LMarker
            },
            props: {
                markerCount: Number
            },
            data: function() {
                return {
                    map: null,
                    message: 'Hello To Spring Vue',
                    zoom: 14,
                    center: L.latLng(35.679326, 51.4879088),
                    url: 'http://{s}.tile.osm.org/{z}/{x}/{y}.png',
                    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
                    markers: [
                        // L.latLng(47.412, -1.218),
                        // L.latLng(47.413220, -1.219482),
                        // L.latLng(47.414, -1.22),
                    ]
                }
            },
            mounted() {
                console.log(this.markerCount);
                this.$nextTick(() => {
                    console.log(this.$refs.map);
                console.log(this.$refs.map.mapObject);
                console.log(this.$refs.map.mapObject.ANY_LEAFLET_MAP_METHOD);
                this.map = this.$refs.map.mapObject;
            });
                // this.initMap();
            },
            methods: {
                removeMarker(index) {
                    this.markers.splice(index, 1);
                },
                addMarker(event) {
                    console.log(event.latlng);
                    if(this.markerCount === undefined || this.markerCount === 1) {
                        this.markers.splice(0, 1);
                    } else if(this.markerCount === this.markers.length) {
                        this.markers.splice(0, 1);
                    }
                    this.markers.push(event.latlng);
                }
            }
        });
    </script>
    <script for="state">
        <state name="formValue" />
    </script>
</vue-script>
