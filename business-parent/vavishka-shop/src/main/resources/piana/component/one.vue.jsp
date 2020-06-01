<app name="one"></app>

<html-template>
<div>
    <h1>{{ message }}</h1>
    <input type="text" v-model="user.firstName" />
    <input type="text" v-model="user.lastName" />
    <button v-on:click="x()" >ok</button>
    <two></two>
    <div style="height: 300px;" id="mymap">
    </div>
</div>
</html-template>

<vue-script>
    <script for="component">
        Vue.component('$app$', {
            template: '$template$',
            data: function() {
                return {
                    user: {
                        firstName: '',
                        lastName: ''
                    },
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
                },
                x: function () {
                    axios.post('/action', this.user, {headers: {"action": "$bean$", "activity": "x"}})
                        .then((response) => { this.message = response.data; })
                .catch((err) => { this.message = err; });
                }
            }
        });
    </script>
    <script for="state">
        <state name="formValue" />
    </script>
</vue-script>

<bean>
    <import>
        <%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
        <%@ page import="org.springframework.http.RequestEntity" %>
        <%@ page import="org.springframework.http.ResponseEntity" %>
        <%@ page import="java.util.function.Function" %>
        <%@ page import="java.util.List" %>
        <%@ page import="java.util.Map" %>
        <%@ page import="ir.piana.dev.springvue.core.action.Action" %>
    </import>
    <action>
        <%
            class $VUE$ extends Action {


                public Function<RequestEntity, ResponseEntity> x = (r) -> {
                    Map body = (Map) r.getBody();
                    String firstName = (String)body.get("firstName");
                    String lastName = (String)body.get("lastName");
                    return ResponseEntity.ok("Hello ".concat(firstName).concat(" ").concat(lastName));
                };
            }
        %>
    </action>
</bean>
