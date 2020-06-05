<app name="shoppingItems"></app>

<html-template>
<div>
    <section class="sections random-product">
        <div class="container-fluid">
            <div class="container">
                <div class="row">
                    <div class="col-md-4" v-for="item in items">
                        <shopping-item  v-if="render" :item="item"></shopping-item>
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
            props: {
                action: String,
                activity: String,
            },
            data: function () {
                return {
                    message: 'Hello To Box',
                    render: false,
                    items: {
                        type: Array,
                        default: function () {
                            return [{
                                id: Number,
                                code: String,
                                imageSrc: String,
                                title: String,
                                priceUnit: String,
                                price: Number,
                                discountPercent: Number,
                                measurementUnit: String,
                                measurement: Number
                            }]
                        }
                    }
                }
            },
            methods: {
                x: function () {
                    axios.post('/action', this.user, {headers: {"action": this.action, "activity": this.activity}})
                        .then((response) => { this.items = response.data; this.render = true; })
                .catch((err) => { this.message = err; });
                }
            },
            mounted () {
                this.x();
            }
        })
    </script>
    <script for="state">
        <state name="formValue" />
    </script>
</vue-script>


<bean>
    <import>
        <%@ page import="org.springframework.http.RequestEntity" %>
        <%@ page import="org.springframework.http.ResponseEntity" %>
        <%@ page import="java.util.function.Function" %>
        <%@ page import="java.util.Map" %>
        <%@ page import="ir.piana.dev.springvue.core.action.Action" %>
        <%@ page import="java.util.Arrays" %>
    </import>
    <action>
        <%
            class $VUE$ extends Action {

            }
        %>
    </action>
</bean>



