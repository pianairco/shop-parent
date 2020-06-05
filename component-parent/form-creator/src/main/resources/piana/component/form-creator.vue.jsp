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
            <div class="btn-group" style="width: 100%;" v-if="render">
                <template v-for="button in formModel.buttons">
                    <button v-if="button.type === bBean"
                            style="margin-top: 0px;"
                            type="button" class="btn btn-success btn-block"
                            v-on:click="saveJava(button.action, button.activity)">{{button.title}}</button>
                    <button v-if="button.type === bJS"
                            style="margin-top: 0px;"
                            type="button" class="btn btn-warning btn-block" >{{button.title}}</button>
                    <button v-if="button.type === bReset"
                            style="margin-top: 0px;"
                            v-on:click="reset"
                            type="button" class="btn btn-danger btn-block" >{{button.title}}</button>
                </template>
            </div>
        </form>
    </div>
</html-template>

<vue-script>
    <script for="component">
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
                    bBean: 'bean',
                    bJS: 'js',
                    bReset: 'reset',
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
                reset: function() {
                    obj = Object.assign({}, this.storeState.formValue[this.name]);
                    console.log(this.name)
                    console.log(obj)
                    this.formModel.controls.forEach((c) => {
                        if(c.type === this.iType) {
                        obj[c.name] = null;
                        console.log("iType");
                    } else {
                        obj[c.name] = null;
                        console.log("oType");
                    }
                });
                    console.log(obj)
                    this.storeState.formValue[this.name] = obj;
                },
                saveJava: function(action, activity) {
                    axios.post('/action', this.storeState.formValue[this.name], {headers: {"action": action, "activity": activity}})
                        .then((response) => {
                        console.log('save success');
                }).catch((err) => { this.message = err; });
                    console.log("save")
                },
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
                    // axios.post('/action', {}, {headers: {"action": "$bean$", "activity": "x"}})
                    axios.post('/action', {}, {headers: {"action": "FormSaver", "activity": "loadForm"}})
                        .then((response) => {
                        this.formModel = response.data;
                    this.render = true;
                })
                .catch((err) => { this.message = err; });
                }
            },
            mounted: function () {
                obj = Object.assign({}, this.storeState.formValue);
                obj[this.name] = {};
                this.storeState.formValue = obj;
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
        <%@ page import="javax.servlet.http.HttpServletRequest" %>
        <%@ page import="ir.piana.dev.springvue.core.action.Action" %>
        <%@ page import="ir.piana.business.vavishkanavbar.data.model.ControlModel" %>
        <%@ page import="java.util.Arrays" %>
        <%@ page import="ir.piana.business.vavishkanavbar.data.model.MaskModel" %>
        <%@ page import="ir.piana.business.vavishkanavbar.data.model.FormModel" %>
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
