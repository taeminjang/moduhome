$(function() {
	$(".datepicker").datepicker({
		dateFormat: 'yy-mm-dd',
		changeMonth: true,
		changeYear: true
		});
	$(".btn-back").live("click",function(){history.back();});
	$(".btn-delete").live("click",function(event){
		if (!confirm("정말로 삭제하시겠습니까?")){
			event.preventDefault();
			return false;
		}
	});
	/*
	$('input[type=text], input[type=password], textarea').focus(function() {
		$(this).animate({ borderColor: '#f86790', backgroundColor: '#f7f7f7' }, 300);
	}).blur(function() {
		$(this).animate({ borderColor: '#ccc', backgroundColor: '#fff' }, 300);
	});*/
	$('input, textarea').placeholder();
});

$("form input").blur(function(){	
	if (!$(this).data("rule")) return;
	patten = eval($(this).data("rule"));
	if ($(this).val() && !patten.test($(this).val())){
		$(this).focus(); $(this).val("");
		alert("입력형식이 잘못되었습니다");
	}
});
$("[data-toggle=popover]").popover().click(function(e) {
	e.preventDefault();
});
$(".table-sorter th[data-sort]").each(function(){
	$(this).append("<span></span>");
});
$(".table-sorter th[data-sort]").click(function(){
	var fm = $("form[data-form=table-sorter]");
	$("input[name=sort]",fm).val($(this).data("sort"));
	fm.submit();
});

$("input[type=checkbox].chkrev").click(function(){
	$("input[type=checkbox][name='" + $(this).data("name") + "']").attr("checked", $(this).is(":checked"));
});

$("form").submit(function(event){
	var _self = $(this);
	$(this).find("*").each(function(){	

		if ($(this).attr("name")=="password_confirm"){
			if ($(this).val() && $(this).val()!=$("input[name=MEMBER_PASSWORD]",_self).val()){
				alert("비밀번호가 일치하지 않습니다");
				$(this).val("").focus();
				event.preventDefault();
				return false;
			}
		}

		if ($(this).attr("required")=="required"){
			if ($(this).prop("tagName")=="SELECT"){
				if ($("option:selected",$(this)).val()) return;
			} else {
				if ($(this).attr("type")=="checkbox" || $(this).attr("type")=="radio"){
					// 회원가입 예외 처리
					if(($(this).attr('name') == 'agree' || $(this).attr('name') == 'agree2') 
						&& !$(this).is(':checked')) {
						alert($(this).attr("label").trim()+"에 동의 하셔야 회원가입이 가능합니다.");
						$(this).focus();
						event.preventDefault();
						return false;
					}

					if ($("input[name=" + $(this).attr('name') + "]").is(":checked")) return;
				} else if ($(this).val()) return;
			}
			
			var label = $(this).attr("label");
			
			if (typeof label=="undefined") label = ($(this).attr("placeholder")) ? $(this).attr("placeholder") : $(this).parent().prev().text();
			if ($(this).attr("alt")) alert($(this).attr("alt"));
			else alert(label.trim() + label.josa("을/를") + " 입력하세요");
			$(this).focus();
			event.preventDefault();
			return false;
		}

		if ($(this).data("validation")=="number" && !$.isNumeric($(this).val())){
			alert("숫자를 입력하세요");
			$(this).val("");
			$(this).focus();
			event.preventDefault();
			return false;
		}

		if ($(this).data("rule")){
			alert($(this).data("rule"));
			patten = eval($(this).data("rule"));
			if ($(this).val() && !patten.test($(this).val())){
				alert("입력형식이 잘못되었습니다");
				$(this).val("");
				$(this).focus();
				event.preventDefault();
				return false;
			}
		}
	});
});