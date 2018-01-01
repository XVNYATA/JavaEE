 $(function(){
 
	 $("tr[id^=data_]").hover(function(){
			//触发mouseover
			$(this).css({"backgroundColor":"#eeccff","cursor":"pointer"});
		},function(){
			//如果当前tr中checkbox选中的状态则不去掉背景色
			//this==>当前tr对应dom对象
			var trId = this.id;
			//获取checkbox的id
			var boxId = trId.replace("data","box");
			if(!$("#"+boxId).prop("checked")){
				//触发mouseout
				$(this).css("backgroundColor","#ffffff");
			}

		}).click(function(){
			
			//如果当前tr中checkbox选中的状态则不去掉背景色
			//this==>当前tr对应dom对象
			var trId = this.id;
			//获取checkbox的id
			var boxId = trId.replace("data","box");
			//$("#"+boxId).trigger("click");
			//判断当前tr对应的checkbox是否需要选中，将当前的checkbox状态取反
			$("#"+boxId).attr("checked", !$("#"+boxId).attr("checked"));
			//判断全选是否需要选中
         $("#checkAll").attr("checked",boxes.length==boxes.filter(":checked").length?true:false);
 
		})
		
		
		
		
		//获取所有的子checkbox
		var boxes = $("input[id^=box_]");
		//为所有的子checkbox绑定事件
		boxes.click(function(e){
			//取消事件默认行为
			e.stopPropagation();
			//判断子checkbox的个数是否等于选中的个数
			//$("#checkAll").prop("checked",boxes.length==boxes.filter(":checked").length+1);
			$("#checkAll").prop("checked",boxes.length==boxes.filter(":checked").length);
			
		})
		
		//为全选checkbox绑定事件
		$("#checkAll").click(function(){
			boxes.prop("checked",$(this).prop("checked"));
			//触发tr的mouseover或者mouseout事件
			$("tr[id^=data_]").trigger($("#checkAll").prop("checked")?"mouseover":"mouseout");
		}) 
 })

