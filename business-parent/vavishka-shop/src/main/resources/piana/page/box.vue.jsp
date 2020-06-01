<app name="box"></app>

<html-template>
<div>
    <section class="sections random-product">
        <div class="container-fluid">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card">
                            <img class="card-img-top" src="http://www.mihanmedia.ir/userfile/736708307-580x567.jpg" alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">
                                    <a href="#" class="text-dark">ترازدستی 40 سانتی متر اسلوونی MTC</a>
                                </h5>
                            </div>
                            <div class="card-footer">
                                <div class="badge badge-danger float-right">30%</div>
                                <div class="float-left">
                                    <a href="#" class="text-danger">1900 تومان</a>
                                    <br>
                                    <small class="text-muted"><del>2000 تومان</del></small>
                                </div>
                            </div>
                        </div>
                    </div><!--.col-->
                </div>
            </div>
        </div>
    </section>
</div>
</html-template>

<vue-script>
    <script for="component">
        var $app$ = Vue.component('$app$', {
            template: '$template$',
            data: function () {
                return {
                    message: 'Hello To Box'
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



