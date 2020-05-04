<app name="login"></app>

<html-template>
<div>
    <div id="login">
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-12" >
                    <div id="login-box" class="col-md-12">
                        <div id="login-form" class="form pt-5" >
<!--                            <h3 class="text-center text-info">Login</h3>-->
                            <div class="form-group" v-if="!showLogin">
                                <button v-on:click="onSignIn()" class="btn btn-danger btn-block btn-md">ورود با حساب گوگل</button>
                            </div>
                            <div class="form-group" v-if="showLogin">
                                <button v-on:click="onLogin()" class="btn btn-danger btn-block btn-md">تکمیل فرآیند</button>
                            </div>
                            <div class="form-group">
                                <img src="">
                            </div>
<!--                            <div class="form-group">-->
<!--                                <label for="username" class="text-info">Mobile:</label><br>-->
<!--                                <input type="text" id="username" v-model="user.mobile" class="form-control">-->
<!--                            </div>-->
<!--                            <div class="form-group">-->
<!--                                <label for="password" class="text-info">Password:</label><br>-->
<!--                                <input type="text" id="password" v-model="user.password" class="form-control">-->
<!--                            </div>-->
<!--                            <div class="form-group">-->
<!--                                <button v-on:click="x()" class="btn btn-info btn-md">Login</button>-->
<!--                            </div>-->
<!--                            <div id="register-link" class="text-right">-->
<!--                                <span>{{message}}</span>-->
<!--                                <button v-on:click="y()" class="btn btn-warning btn-link">Send new Password</button>-->
<!--                            </div>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</html-template>

<script>
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
                        store.addNumber(45);
                        console.group(response.data);
                        console.group(response);
                        console.group(this.storeState.numbers);
                        console.log(store.getLoggedIn());
                        store.setLoggedIn(true);
                        console.log(response.headers.Authorization);
                        store.setAuthorization(response.headers.Authorization);
                        console.log(store.getLoggedIn());
                        console.log(response.headers);
                        console.log(response["headers"]);
                        this.message = response.data;
                    })
                    .catch((err) => { this.message = err; });
            },
            onSignIn: function (googleUser) {
                // store.addNumber(45);
                auth2.grantOfflineAccess().then(this.signInCallback);
                // var profile = googleUser.getBasicProfile();
                // console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
                // console.log('Name: ' + profile.getName());
                // console.log('Image URL: ' + profile.getImageUrl());
                // console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
            },
            signInCallback: function(authResult) {
                console.log(authResult);
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

<bean>
    <import>
        <%@ page import="ir.piana.dev.springvue.core.action.Action" %>
        <%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
        <%@ page import="org.springframework.http.RequestEntity" %>
        <%@ page import="org.springframework.http.ResponseEntity" %>
        <%@ page import="javax.persistence.EntityManager" %>
        <%@ page import="java.util.Map" %>
        <%@ page import="java.util.function.Function" %>
        <%@ page import="ir.piana.business.simpleshop.service.LoginService" %>
        <%@ page import="com.google.api.client.googleapis.auth.oauth2.GoogleCredential" %>
        <%@ page import="java.io.FileInputStream" %>
        <%@ page import="java.io.InputStream" %>
        <%@ page import="java.io.IOException" %>
        <%@ page import="java.util.Arrays" %>
        <%@ page import="ir.piana.business.simpleshop.data.model.GoogleUserEntity" %>
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
