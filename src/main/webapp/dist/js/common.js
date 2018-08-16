var regNum			= /^[0-9]+$/;
var regEmail		= /^[_a-zA-Z0-9-]+@[._a-zA-Z0-9-]+\.[a-zA-Z]+$/;
var regUrl			= /^(http\:\/\/)*[.a-zA-Z0-9-]+\.[a-zA-Z]+$/;
var regAlpha		= /^[a-zA-Z]+$/;
var regHangul		= /[가-힣]/;
var regHangulEng	= /[가-힣a-zA-Z]/;
var regHangulOnly	= /^[가-힣]*$/;
var regId			= /^[a-zA-Z]{1}[a-zA-Z0-9_-]{3,19}$/;
var regPass			= /^[a-zA-Z0-9_-]{4,12}$/;
var regFileName		= /^[.a-zA-Z0-9_-]+$/;

String.prototype.str_replace = function(str1,str2){ return this.split(str1).join(str2); }
String.prototype.trim = function(){ return this.replace(/(^\s*)|(\s*$)/g, ""); }
String.prototype.josa = function(nm) {
	var nm1 = nm.trim().substring(0, nm.trim().indexOf("/"));
	var nm2 = nm.trim().substring(nm.trim().indexOf("/") + 1, nm.trim().length);
	var a = this.substring(this.length - 1, this.length).charCodeAt();
	a = a - 44032;
	var jongsung = a % 28;
	return (jongsung) ? nm1 : nm2;
}

function json_decode(str){ return eval('(' + str + ')'); }
function tablesorter(val){
	var isdn = val.match(/ desc$/) ? 1 : 0;
	var key = val.replace(/ desc$/,"");
	if ($(".table-sorter th").is("[data-sort='" + key + "']")){
		$(".table-sorter th[data-sort='" + key + "']").addClass("active");
		if (isdn) $(".table-sorter th[data-sort='" + key + "']").addClass("sortdn");
		else $(".table-sorter th[data-sort='" + key + "']").addClass("sortup").data("sort",key + " desc");
	} else if ($(".table-sorter th").is("[data-sort='" + key + " desc']")){
		$(".table-sorter th[data-sort='" + key + " desc']").addClass("active");
		if (isdn) $(".table-sorter th[data-sort='" + key + " desc']").addClass("sortdn").data("sort",key);
		else $(".table-sorter th[data-sort='" + key + " desc']").addClass("sortup");
	}
}

function in_array(val,arr){
	for (var i=0;i<arr.length;i++){ if (arr[i]==val) return true; }
	return false;
}

function popup(src,width,height,name) {
	var scrollbars = "1";
	var resizable = "no";
	if (typeof(arguments[4])!="undefined") scrollbars = arguments[4];
	if (arguments[5]) resizable = "yes";
	var p = window.open(src,'popup'+name,'width='+width+',height='+height+',scrollbars='+scrollbars+',toolbar=no,status=no,resizable='+resizable+',menubar=no');
	p.focus();
}

function popupLayer(no){
	var $obj = $(".popup-layer");
	$obj.draggable();
	$obj.append("<div class='pl-bottom'><label class='checkbox-inline'><input type='checkbox' class='pl-close-day'>오늘 하루 열지 않기</label> <label class='checkbox-inline'><input type='checkbox' class='pl-close'>닫기</label></div>");
	$obj.css("left", $obj.data("x")).css("top", $obj.data("y")).fadeIn();
}
$(".popup-layer input[type=checkbox].pl-close-day").live("click", function(){
	var obj = $(this).parents(".popup-layer");
	obj.fadeOut();
	$.cookie("popuplayer", obj.data("no"), {expires: 1});
});
$(".popup-layer input[type=checkbox].pl-close").live("click", function(){
	var obj = $(this).parents(".popup-layer");
	obj.fadeOut();
});

function mpopupLayer(no){
	$(".mpopup-layer").draggable();
	$(".mpopup-layer").append("<div class='pl-bottom'><span class='col-sm-12 col-xs-12 pl-close-day'>오늘 하루 열지 않기</span><span class='col-sm-12 col-xs-12 pl-close'>닫기</span></div>");
	$(".mpopup-layer").fadeIn();
}
$(".mpopup-layer .pl-close-day").live("click", function(){
	var obj = $(this).parents(".mpopup-layer");
	$(".mmodal").fadeOut();
	obj.fadeOut();
	$.cookie("popuplayer", obj.data("no"), {expires: 1});
});
$(".mpopup-layer .pl-close").live("click", function(){
	var obj = $(this).parents(".mpopup-layer");
	$(".mmodal").fadeOut();
	obj.fadeOut();
});

function openDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			jQuery("input[name='zipcode[]']").eq(0).val(data.postcode1);
			jQuery("input[name='zipcode[]']").eq(1).val(data.postcode2);
			jQuery("input[name='address']").val(data.address);
			jQuery("input[name='address_sub']").val("").focus();
		}
	}).open();
}

function change_ea(obj,idx){
	var ea = parseInt($("input.input_ea",$(obj).parent().parent()).val()) + idx;
	if (ea<1){ alert("1개 이상을 주문하셔야 합니다"); return; }
	$("input.input_ea",$(obj).parent().parent()).val(ea);	
}