<app name="shoppingItem"></app>

<html-template>
    <div class="card">
        <img class="card-img-top" v-bind:src="item.imageSrc" alt="Card image cap">
        <div class="card-body">
            <h5 class="card-title">
                <a href="#" class="text-dark">{{item.title}}</a>
            </h5>
        </div>
        <div class="card-footer">
            <div class="badge badge-danger float-right">{{item.discountPercent}}%</div>
            <div class="float-left">
                <a href="#" class="text-danger">{{item.price - item.price * item.discountPercent / 100}} تومان</a>
                <br>
                <small class="text-muted"><del>{{item.price}} تومان</del></small>
                <br>
                <small class="text-muted">{{message}}</small>
                <br>
                <button class="btn btn-outline-success">click</button>
            </div>
        </div>
    </div>
</html-template>

<script>
    var $app$ = Vue.component('$app$', {
        template: '$template$',
        props: {
            item: {
                type: Object,
                default: function () {
                    return {
                        id: Number,
                        code: String,
                        imageSrc: String,
                        title: String,
                        priceUnit: String,
                        price: Number,
                        discountPercent: Number,
                        measurementUnit: String,
                        measurement: Number
                    }
                }
            }
        },
        data: function () {
            return {
                message: 'Hello To Box'
            }
        }
    })
</script>

<bean>
    <import>
        <%@ page import="org.springframework.http.RequestEntity" %>
        <%@ page import="org.springframework.http.ResponseEntity" %>
        <%@ page import="java.util.function.Function" %>
        <%@ page import="java.util.Map" %>
        <%@ page import="ir.piana.dev.springvue.core.action.Action" %>
        <%@ page import="ir.piana.business.fileupload.data.model.ItemModel" %>
    </import>
    <action>
        <%
            class $VUE$ extends Action {

                public Function<RequestEntity, ResponseEntity> x = (r) -> {
                    Map body = (Map) r.getBody();
                    return ResponseEntity.ok(new ItemModel()
                            .setId(1).setCode("1").setTitle("خرم بهبهان")
                            .setImageSrc("/images/logo.png")
                            .setPrice(10000).setDiscountPercent(40).setPriceUnit("تومان")
                            .setMeasurement(1).setMeasurementUnit("کیلورم"));
                };
            }
        %>
    </action>
</bean>



