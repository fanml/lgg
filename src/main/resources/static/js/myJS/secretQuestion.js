// <%--点击3个问题下拉框--%>
//        function loadQue() {
//            var q1 = $("#question1").val();
//            var q2 = $("#question2").val();
//            var q3 = $("#question3").val();
//
//            for (var i = 0; i < ques.data.length; i++) {
//                if (ques.data[i].id == q1 || ques.data[i].id == q2 || ques.data[i].id == q3) {
//                    ques.value.push(ques.data[i]);
//                    for (var i = 0; i < ques.value.length; i++) {
//                        if (ques.value[i].id == q1 || ques.value[i].id == q2 || ques.value[i].id == q3) {
//                            $("option.option" + ques.value[i].id).attr("disabled", "disabled");
////                        } else {
////                            $("option.option" + ques.value[i].id).removeAttr("disabled");
////                        }
//                        }
//                    }
//                }
//            }
//        }
//           <%--点击3个问题下拉框--%>
function loadQue1() {
    var q1 = $("#question1").val();
    var q2 = $("#question2").val();
    var q3 = $("#question3").val();

    for (var i = 1; i < resultListSize+1; i++) {
        if (i == q1 || i == q2 || i == q3) {
            $("option.option" + i).attr("disabled", "disabled");
        } else {
            $("option.option" + i).removeAttr("disabled");
        }
    }
}

//        添加密保提交
function submitForm() {
    $(":selected").removeAttr("disabled");
    $("#form1").submit();
}
//        验证答案是否正确
function answerValidate(i) {
    var username=$("#username").val();
    var questionId=$("#question"+i).val();
    var answer=$("#answer"+i).val();
    console.log(username)
    $.ajax({
        url : "${pageContext.request.contextPath}/answerValidate", //后台查询验证的方法
        data : {
            "username" :username,
            "questionId":questionId,
            "answer":answer
        }, //携带的参数
        type : "post",
        success : function(msg) {
            //根据后台返回前台的msg给提示信息加HTML
            if ("true" != msg) {
                var htmldata = "<font color='red'>抱歉" + username + " ,答案错误！</font>";
                $("#result"+i).html(htmldata)
            } else {
                var htmldata  = "<font color='green'>恭喜" + username + "  ,答案正确！</font>";
                $("#result"+i).html(htmldata)
            }
        }
    });
}