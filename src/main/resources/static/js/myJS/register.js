// <%--表单提交--%>
function submit() {
    $("#registerForm").submit();
}
// <%--密码加密--%>
function mdjia(){
    if($.trim($("#psw").val())==$.trim($("#psw2").val())){
        var pwd=$("#psw").val();
        var pwdMD5=$.md5(pwd);
        $("#pwdMD5").val(pwdMD5);
    }else{
        alert("俩次密码不一致");
    }
}
// <%--用户名唯一验证--%>
function checkUsername() {
    var username=$("#username").val();
    var mess=$("#usernameMess");
    $.ajax({
        url : "http://localhost:8080/dream/findByUsername", //后台查询验证的方法
        data : {
            "username" : username
        }, //携带的参数
        type : "post",
        success : function(msg) {
            //根据后台返回前台的msg给提示信息加HTML
            if ("true" != msg) {
                // 账号已经存在
                var htmldata = "<font color='red'>抱歉，" + username + "已被注册，请更换！</font>";
                $("#usernameMess").html(htmldata)

            } else {
                // 账号不存在
                var htmldata  = "<font color='green'>恭喜，" + username + " 可以注册！</font>";
                $("#usernameMess").html(htmldata)
            }
        }
    });
}