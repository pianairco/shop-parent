<app name="book"></app>

<html-template>
<div>
    <vmenu></vmenu>
    <h1>{{ message }}</h1>
</div>
</html-template>

<vue-script>
    <script for="component">
        var $app$ = Vue.component('$app$', {
            template: '$template$',
            data: function () {
                return {
                    message: 'Hello To Book'
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



