<app name="login"></app>

<html-template>
<div>
    <div id="login">
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-12" >
                    <div id="login-box" class="col-md-12">
                        <div id="login-form" class="form pt-5" >
                            <div class="form-group" v-if="!showLogin">
                                <button v-on:click="onSignIn()" class="btn btn-danger btn-block btn-md">ورود با حساب گوگل</button>
                            </div>
                            <div class="form-group" v-if="showLogin">
                                <button v-on:click="onLogin()" class="btn btn-danger btn-block btn-md">تکمیل فرآیند</button>
                            </div>
                            <div class="form-group">
                                <img src="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</html-template>

<vue-script>
    <script for="component">
        var $app$ = Vue.component('$app$', {
            template: '$template$',
            data: function() {
                return {
                    showLogin: false,
                    user: {
                        mobile: '',
                        password: ''
                    },
                    message: '',
                    googleUser: {},
                    googleSignInParams: {
                        clientId: 'AIzaSyCJLxnzeCwrk_qKbIua-Okoydh4kIf_vGE.apps.googleusercontent.com'
                    },
                    storeState: store.state
                }
            },
            mounted() {
                this.$nextTick(() => {
                    console.log(gapi);
                gapi.load('auth2', function() {
                    auth2 = gapi.auth2.init({
                        client_id: '290205995528-o268sq4cttuds0f44jnre5sb6rudfsb5.apps.googleusercontent.com',
                        // Scopes to request in addition to 'profile' and 'email'
                        scope: 'https://www.googleapis.com/auth/userinfo.email'
                    });
                });
                console.log(gapi);
            });
            },
            methods: {
                onLogin: function (googleUser) {
                    axios.post('/login', {"username": this.googleUser["username"], "password":"1234"}, {headers: {}})
                        .then((response) => {
                    this.storeState.numbers.push(45);
                    this.storeState.loggedIn = true;
                    this.storeState.authorization = response.headers.Authorization;
                    this.message = response.data;
                })
                .catch((err) => { this.message = err; });
                },
                onSignIn: function (googleUser) {
                    auth2.grantOfflineAccess().then(this.signInCallback);
                },
                signInCallback: function(authResult) {
                    // axios.post('/action', authResult, {headers: {"action": "$bean$", "activity": "googleSignIn"}})
                    axios.post('/sample-shop/google-auth', authResult, {headers: {}})
                        .then((response) => {
                        this.message = response.data;
                    this.googleUser = response.data;
                    this.showLogin = true;
                })
                .catch((err) => { this.message = err; });
                },
                x: function () {
                    axios.post('/action', this.user, {headers: {"action": "$bean$", "activity": "x"}})
                        .then((response) => {
                        this.message = response.data;
                })
                .catch((err) => { this.message = err; });
                },
                y: function () {
                    axios.post('/action', this.user, {headers: {"action": "$bean$", "activity": "y"}})
                        .then((response) => {
                        this.message = response.data;
                    setTimeout(() => {
                        this.message = '';
                }, 1000);
                })
                .catch((err) => { this.message = err; });
                }
            }
        });
    </script>
    <script for="state">
        <state name="loggedIn" value="false" type="boolean" />
        <state name="numbers" value="[1, 2, 3]" type="array" />
        <state name="authorization" value="null" type="Object" />
    </script>
</vue-script>

<bean>
    <import>
        <%@ page import="ir.piana.dev.springvue.core.action.Action" %>
        <%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
        <%@ page import="org.springframework.http.RequestEntity" %>
        <%@ page import="org.springframework.http.ResponseEntity" %>
        <%@ page import="javax.persistence.EntityManager" %>
        <%@ page import="java.util.Map" %>
        <%@ page import="java.util.function.Function" %>
        <%@ page import="ir.piana.business.vavishkashop.service.LoginService" %>
        <%@ page import="com.google.api.client.googleapis.auth.oauth2.GoogleCredential" %>
        <%@ page import="java.io.FileInputStream" %>
        <%@ page import="java.io.InputStream" %>
        <%@ page import="java.io.IOException" %>
        <%@ page import="java.util.Arrays" %>
        <%@ page import="ir.piana.business.vavishkashop.data.model.GoogleUserEntity" %>
    </import>
    <action>
        <%
            class $VUE$ extends Action {

                @Autowired
                private LoginService loginService;

                public Function<RequestEntity, ResponseEntity> x = (r) -> {
                    Map body = (Map) r.getBody();
                    String mobile = (String)body.get("mobile");
                    String password = (String)body.get("password");
                    return ResponseEntity.ok("Login Success!");
                };

                public Function<RequestEntity, ResponseEntity> y = (r) -> {
                    Map body = (Map) r.getBody();
                    String mobile = (String)body.get("mobile");
//                    KavenegarApi api= new KavenegarApi("6B6773663258696B304F65576F4433516739573856513D3D");
//                    SendResult Result = api.send("10006600060060", mobile, "1234");

                    loginService.service(mobile);

                    return ResponseEntity.status(200).header("code", "1234").body("Code Sent");
                };

                public Function<RequestEntity, ResponseEntity> googleSignIn = (r) -> {
                    Map body = (Map) r.getBody();
                    String code = (String)body.get("code");
//

                    GoogleUserEntity googleUserModel = loginService.refreshToken(code);
                    if(googleUserModel != null) {
                        return ResponseEntity.status(200).header("code", code).body(googleUserModel);
                    }

                    return ResponseEntity.status(404).body("User Not Found");
                };

            }
        %>
    </action>
</bean>
