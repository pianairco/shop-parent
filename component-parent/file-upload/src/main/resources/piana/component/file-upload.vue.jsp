<app name="fileUpload"></app>

<html-template>
    <div>
        <label>File
            <input type="file" id="file" ref="file" v-on:change="handleFileUpload()"/>
        </label>
        <button v-on:click="submitFile()">Submit</button>
    </div>
</html-template>

<script>
    var $app$ = Vue.component('$app$', {
        template: '$template$',
        props: {
        },
        data: function () {
            return {
                message: '',
                file: ''
            }
        },
        methods: {
            handleFileUpload: function() {
                this.file = this.$refs.file.files[0];
            },
            submitFile: function() {
                let formData = new FormData();
                formData.append('file', this.file);
                axios.post('/action/file', formData, {
                    headers: {
                        "action": "FileUploadGateway",
                        "activity": "getFile",
                        'Content-Type': 'multipart/form-data'
                    }
                }).then(function(){
                    console.log('SUCCESS!!');
                }).catch(function(){
                    console.log('FAILURE!!');
                });
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



