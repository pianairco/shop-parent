<app name="formCreator"></app>

<html-template>
<div class="container">
    <form>
        <div class="form-group" v-for="control in formModel.controls" v-if="render">
            <template v-if="control.type != uType && control.type != iType">
                <control-text :label="control.label" :name="control.name" :formName="name" :maskModel="control.maskModel"></control-text>
            </template>
            <template v-if="control.type == iType">
                <control-image :label="control.label" :name="control.name" :formName="name" :width="control.width" :height="control.height"></control-image>
            </template>
            <template v-if="control.type == uType">
                <file-upload :action="control.action" :activity="control.activity"></file-upload>
            </template>
        </div>
        <div>
            <button type="button" class="btn btn-success btn-block" v-on:click="save">save</button>
        </div>
    </form>
</div>
</html-template>

<script>
    var $app$ = Vue.component('$app$', {
        template: '$template$',
        props: {
          name: {
              default: 'form1',
              type: String
          }
        },
        data: function () {
            return {
                storeState: store.state,
                cType: 'text',
                dType: 'date',
                nType: 'number',
                uType: 'image-upload',
                iType: 'image',
                nPattern: '000',
                message: 'Hello To Box',
                render: false,
                formModel: {
                    type: Object,
                    default: function() {
                        return {
                            action: String,
                            activity: String,
                            controls: {
                                type: Array,
                                default: function () {
                                    return [{
                                        type: String,
                                        label: String,
                                        name: String,
                                        width: String,
                                        height: String,
                                        action: String,
                                        activity: String,
                                        regex: RegExp,
                                        maskModel: {
                                            type: Object,
                                            default: function () {
                                                return {
                                                    mask: String,
                                                    min: String,
                                                    max: String,
                                                    thousandsSeparator: String,
                                                    lazy: Boolean
                                                }
                                            }
                                        },
                                    }]
                                }
                            }
                        }
                    }
                },
            }
        },
        methods: {
            save: function() {
                console.log(this.name)
                console.log(this.storeState)
                console.log(this.storeState.formValue)
                console.log(this.storeState.formValue[this.name])
                axios.post('/action', this.storeState.formValue[this.name], {headers: {"action": "FormSaver", "activity": "save"}})
                    .then((response) => {
                        console.log('save success');
                }).catch((err) => { this.message = err; });
                console.log("save")
            },
            x: function () {
                axios.post('/action', {}, {headers: {"action": "$bean$", "activity": "x"}})
                    .then((response) => {
                        this.formModel = response.data;
                        // console.log(this.controls)
                        // cc = response.data;
                        // for(i = 0; i < cc.length; i++){
                        //     x = cc[i]['pattern'];
                        //     cc[i]['pattern'] = '\\d{1,2}/\\d{1,2}/\\d{4}';
                        //     console.log(x);
                        // }
                        // this.controls = cc;
                        this.render = true;
                    })
            .catch((err) => { this.message = err; });
            }
        },
        mounted: function () {
            // console.log("ddddd");
            obj = Object.assign({}, this.storeState.formValue);
            obj[this.name] = {};
            this.storeState.formValue = obj;
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
        <%@ page import="javax.servlet.http.HttpServletRequest" %>
        <%@ page import="ir.piana.dev.springvue.core.action.Action" %>
        <%@ page import="ir.piana.business.formcreator.data.model.ControlModel" %>
        <%@ page import="java.util.Arrays" %>
        <%@ page import="ir.piana.business.formcreator.data.model.MaskModel" %>
        <%@ page import="ir.piana.business.formcreator.data.model.FormModel" %>
    </import>
    <action>
        <%
            class $VUE$ extends Action {

                public Function<RequestEntity, ResponseEntity> x = (r) -> {
                    Map body = (Map) r.getBody();
                    return ResponseEntity.ok(new FormModel().setControls(Arrays.asList(
                            new ControlModel()
                                    .setType("text").setLabel("نام").setName("fname")
                                    .setMaskModel(new MaskModel()),
                            new ControlModel()
                                    .setType("text").setLabel("فامیلی").setName("lname")
                                    .setMaskModel(new MaskModel()),
                            new ControlModel()
                                    .setType("number").setLabel("سن").setName("age")
                                    .setMaskModel(new MaskModel("Number").setMin("1").setMax("120") ),
                            new ControlModel()
                                    .setType("text").setLabel("کد ملی").setName("nationalCode")
                                    .setMaskModel(new MaskModel("Text").setPattern("000-000000-0")),
                            new ControlModel()
                                    .setType("date").setLabel("تاریخ تولد").setName("birthDate")
                                    .setMaskModel(new MaskModel("Date")
                                            .setMin("1300-01-01").setMax("2040-01-01")),
                            new ControlModel()
                                    .setType("image").setLabel("تصویر").setName("profileImage")
                                    .setWidth("200px").setHeight("200px")
                                    .setAction("$bean$").setActivity("y"))
                    ).setAction("FormSaver").setActivity("save"));
                };

                public Function<RequestEntity, ResponseEntity> y = (r) -> {
                    Object body = r.getBody();
                    System.out.println(body);
                    return ResponseEntity.ok("success");
                };

//                public Function<HttpServletRequest, ResponseEntity> y = (r) -> {
//                    return ResponseEntity.ok("success");
//                };
            }
        %>
    </action>
</bean>



