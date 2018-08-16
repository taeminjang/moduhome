function taxonomy(obj,sval,val,idx){
	if (!idx) idx = 0;

	if (!idx){
		taxonomy_event(obj);
	}

	if (typeof sval=="string"){
		var r = [];
		r[0] = sval.substr(0,3);
		r[1] = sval.substr(0,6);
		r[2] = sval.substr(0,9);
		r[3] = sval.substr(0,12);
		sval = r;
	}

	obj = $("select[name='" + obj + "']");
	if (idx>=obj.length) return;
	for (var i=obj.length-1; i>=idx; i--) obj[i].options.length = 1;
	if (idx>0 && val=='') return;

	var params = {};
	params.parent = val;

	$.getJSON("/MODA/dist/taxonomy.php", params, function(data){
		var items = [];
		$.each( data, function( k, v ) {
			items.push( "<option value='" + k + "'>" + v + "</option>" );
		});
		obj[idx].options.length = 1;
		obj.eq(idx).append(items.join(""));
		if (sval[idx]){
			obj.eq(idx).find('option[value=' + sval[idx] + ']').attr('selected','selected');
			taxonomy('tid[]',sval,sval[idx],idx+1);
		}
	});
}

function taxonomy_event(obj){
	$("select[name='" + obj + "']").live("change",function(){
		taxonomy(obj,[],$(this).find("option:selected").val(),$(this).index()+1);
	});
}