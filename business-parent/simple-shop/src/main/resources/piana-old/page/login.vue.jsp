<app name="login"></app>

<template>
<div>
    <vmenu></vmenu>
    <div id="login">
        <h3 class="text-center text-white pt-5">Login form</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="" method="post">
                            <h3 class="text-center text-info">Login</h3>
                            <div class="form-group">
                                <label for="username" class="text-info">Username:</label><br>
                                <input type="text" name="username" id="username" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <input type="text" name="password" id="password" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="remember-me" class="text-info"><span>Remember me</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">
                            </div>
                            <div id="register-link" class="text-right">
                                <a href="#" class="text-info">Register here</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</template>

<script>
    var $app$ = Vue.component('$app$', {
        template: '$template$',
        data: function() {
            return {
                menu: [{ title: 'root', route: '/#/' }]
            }
        }
    });
</script>

<bean>
    <import>
        <%@ page import="com.kavenegar.sdk.KavenegarApi" %>
        <%@ page import="com.kavenegar.sdk.models.SendResult" %>
        <%@ page import="ir.piana.dev.springvue.core.action.Action" %>
        <%@ page import="org.springframework.http.RequestEntity" %>
        <%@ page import="org.springframework.http.ResponseEntity" %>
        <%@ page import="java.util.function.Function" %>
        <%@ page import="java.util.Map" %>
    </import>
    <action>
        <%
            class $VUE$ extends Action {

                public Function<RequestEntity, ResponseEntity> x = (r) -> {
                    Map body = (Map) r.getBody();
                    String mobile = (String)body.get("mobile");
                    KavenegarApi api= new KavenegarApi("6B6773663258696B304F65576F4433516739573856513D3D");
                    SendResult Result = api.send("10006600060060", mobile, "1234");
                    return ResponseEntity.ok("Sent To You");
                };
            }
        %>
    </action>
</bean>
