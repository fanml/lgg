
// <%--表单提交--%>
function submit() {
    document.getElementById("loginForm").submit();
}
// <%--记住密码复选框--%>
function check(){
    if(document.getElementById("saveCheck").checked){
        document.getElementById("savePwd").value="yes";
    }else{
        document.getElementById("savePwd").value="no";
    }
}
// <%--清空username，pwd text--%>
function pswClear() {
    document.getElementById("pwd").value="";
}
function usernameClear() {
    document.getElementById("username").value="";
}
// <%--换验证码btn--%>
function refresh() {
    var url = "http://localhost:8080/dream/user/check.jpg?number="+Math.random();
    $("#img").attr("src",url);
}
// <%--记住密码后check 默认checked--%>
$(function() {
    if($("#username").val()!=null){
        $("#saveCheck").attr("checked","checked");
    }
    $("table tr:nth-child(even)").addClass("even");
});
// <%--跳转到注册页面--%>
function toRegister() {
    location.href="http://localhost:8080/dream/toRegister";
}
// <%--跳转到密保页面--%>
function toSecretQuestion() {
    location.href="http://localhost:8080/dream/toSecretQuestion?type=login&username="+$("#username").val();
}
// <%--密码加密--%>
function mdjia(){
    var pwd=$("#pwd").val();
    var pwdMD5=$.md5(pwd);
    $("#pwdMD5").val(pwdMD5);
}