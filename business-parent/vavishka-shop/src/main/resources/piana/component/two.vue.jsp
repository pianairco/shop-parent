<app name="two"></app>

<html-template>
<div>
    <div>
        <h2>{{ storeState.loggedIn }}</h2>
        <h2>{{ storeState.numbers }}</h2>
    </div>
    <h1>{{ message }}</h1>
    <button v-on:click="x()" >ok</button>
</div>
</html-template>

<vue-script>
    <script for="component">
        Vue.component('$app$', {
            template: '$template$',
            data: function () {
                return {
                    message: 'Hello To Spring Vue',
                    storeState: store.state
                }
            },
            methods: {
                x: function () {
                    axios.post('/action', this.user, {headers: {"action": "$bean$", "activity": "x"}})
                        .then((response) => { this.message = response.data; })
                .catch((err) => { this.message = err; });
                }
            }
        })
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
                    return ResponseEntity.ok("Hello Friend!");
                };
            }
        %>
    </action>
</bean>



