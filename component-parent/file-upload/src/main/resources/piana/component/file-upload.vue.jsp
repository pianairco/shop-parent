<app name="fileUpload"></app>

<html-template>
    <div>
        <label>File
            <input type="file" id="file" ref="file" v-on:change="handleFileUpload"/>
        </label>
        <button type="button" v-on:click="submitFile()">Submit</button>
    </div>
</html-template>

<script>
    var $app$ = Vue.component('$app$', {
        template: '$template$',
        props: {
            action: String,
            activity: String
        },
        data: function() {
            return {
                message: '',
                file: ''
            }
        },
        methods: {
            handleFileUpload: function(event) {
                console.log(event.target.files[0]);
                console.log(this.$refs.file.files[0]);
                this.file = this.$refs.file.files[0];
            },
            submitFile: function() {
                console.log(this.file);
                let formData = new FormData();
                formData.append('file', this.file);
                let actn = this.action ? this.action : '$bean$';
                let actv = this.activity ? this.activity : 'x';
                axios.post('/action/servlet', formData, {
                    headers: {
                        "action": actn,
                        "activity": actv,
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
        <%@ page import="ir.piana.dev.springvue.core.action.Action" %>
        <%@ page import="org.springframework.http.ResponseEntity" %>
        <%@ page import="javax.servlet.http.HttpServletRequest" %>
        <%@ page import="java.util.function.Function" %>
    </import>
    <action>
        <%
            class $VUE$ extends Action {
                public Function<HttpServletRequest, ResponseEntity> x = (r) -> {
                    return ResponseEntity.status(404).body("action and activity not provided!");
                };
            }
        %>
    </action>
</bean>



