jQuery.validator.addMethod("mobile", function(value, element) {
  return this.optional(element) || /^1[3578][0-9]{9}$/.test(value);
}, "请输入规范的手机号码");

$(document).ready(function(){
	$('input[type=checkbox],input[type=radio],input[type=file]').uniform();

    $('select').select2();

    // Form Validation
    $("#basic_validate1").validate({
        rules: {
            username: {
                required: true,
				rangelength:[5,12],
                remote:{
                	url:ajaxUrl1,
                	type:'post',
                	dataType:'json',
                	data:{
                		_d:function(){
                			return new Date().getTime();
                		}
                	},
                	success:function(result){
                		console.log(result);
                	},
                	dataFilter: function(data) {　　　　//判断控制器返回的内容
                		var data = eval('('+data+')');
	                    if (data.status=="success") {
	                        return "true";
	                    } else {
	                        return "false";
	                    }
                	}
                }
            },
            email: {
                required: true,
                email: true,
                remote:{
                	url:ajaxUrl2,
                	type:'post',
                	dataType:'json',
                	data:{
                		_d:function(){
                			return new Date().getTime();
                		}
                	},
                	success:function(result){
                		console.log(result);
                	},
                	dataFilter: function(data) {　　　　//判断控制器返回的内容
                		var data = eval('('+data+')');
	                    if (data.status=="success") {
	                        return "true";
	                    } else {
	                        return "false";
	                    }
                	}
                }
            },

            mobile: {
                required: true,
                mobile: true
            },
            password: {
                required: true,
                rangelength:[6,12],
            }
        },
        messages: {
            username: {
                required: "请填写用户名！",
                remote: "用户名不能重复，请更换！"
            },
            email: {
                required: "请填写电子邮箱！",
                remote: "电子邮箱不能重复，请更换！"
            },
            password: {
                required: "请填写密码！",
                rangelength: "规范的密码长度在6-12位之间！"
            }
        },
        errorClass: "help-inline",
        errorElement: "span",
        highlight: function(element, errorClass, validClass) {
            $(element).parents('.control-group').addClass('error');
        },
        unhighlight: function(element, errorClass, validClass) {
            $(element).parents('.control-group').removeClass('error');
            $(element).parents('.control-group').addClass('success');
        }
    });
	}
);