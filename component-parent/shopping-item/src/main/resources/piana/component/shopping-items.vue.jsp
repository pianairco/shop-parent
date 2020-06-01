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
                    axios.post('/action', this.user, {headers: {"action": "$bean$", "activity": "shoppingItems"}})
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

                public Function<RequestEntity, ResponseEntity> shoppingItems = (r) -> {
                    Map body = (Map) r.getBody();
                    return ResponseEntity.ok("ok")/*(Arrays.asList(
                            new ItemModel()
                                    .setId(1).setCode("1").setTitle("خرم بهبهان")
                                    .setImageSrc("/images/1.jpg")
                                    .setPrice(10000).setDiscountPercent(40).setPriceUnit("تومان")
                                    .setMeasurement(1).setMeasurementUnit("کیلورم"),
                            new ItemModel()
                                    .setId(2).setCode("2").setTitle("خرم بهبهان")
                                    .setImageSrc("/images/2.jpg")
                                    .setPrice(10000).setDiscountPercent(40).setPriceUnit("تومان")
                                    .setMeasurement(1).setMeasurementUnit("کیلورم"),
                            new ItemModel()
                                    .setId(3).setCode("3").setTitle("خرم بهبهان")
                                    .setImageSrc("/images/3.jpg")
                                    .setPrice(10000).setDiscountPercent(40).setPriceUnit("تومان")
                                    .setMeasurement(1).setMeasurementUnit("کیلورم")
                    ))*/;
                };
            }
        %>
    </action>
</bean>



