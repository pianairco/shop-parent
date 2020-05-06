<app name="formCreator"></app>

<html-template>
<div>
    <form>
        <div class="form-group" v-for="control in controls" v-if="render">
            <template v-if="control.type == cType">
                <control-text :label="control.label" :name="control.name"></control-text>
            </template>
            <template v-if="control.type == uType">
                <file-upload :action="$bean$" :activity="x"></file-upload>
            </template>
        </div>
    </form>
</div>
</html-template>

<script>
    var $app$ = Vue.component('$app$', {
        template: '$template$',
        data: function () {
            return {
                cType: 'text',
                uType: 'image-uploader',
                message: 'Hello To Box',
                render: false,
                controls: {
                    type: Array,
                    default: function () {
                        return [{
                            type: String,
                            label: String,
                            name: String
                        }]
                    }
                }
            }
        },
        methods: {
            x: function () {
                axios.post('/action', {}, {headers: {"action": "$bean$", "activity": "x"}})
                    .then((response) => { this.controls = response.data; this.render = true; })
            .catch((err) => { this.message = err; });
            }
        },
        mounted () {
            // console.log("ddddd");
            this.x();
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
        <%@ page import="ir.piana.business.formcreator.data.model.ControlModel" %>
        <%@ page import="java.util.Arrays" %>
    </import>
    <action>
        <%
            class $VUE$ extends Action {

                public Function<RequestEntity, ResponseEntity> x = (r) -> {
                    Map body = (Map) r.getBody();
                    return ResponseEntity.ok(Arrays.asList(
                            new ControlModel()
                                    .setType("text").setLabel("نام").setName("fname"),
                            new ControlModel()
                                    .setType("text").setLabel("فامیلی").setName("lname"),
                            new ControlModel()
                                    .setType("image-uploader").setLabel("فامیلی").setName("profileImage")
                    ));
                };
            }
        %>
    </action>
</bean>



