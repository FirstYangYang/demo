
/*!
 * jQuery JavaScript Library v 1.0 beta1
 * http://llhdf.javaeye.com
 *
 * Copyright (c) 2009 
 × author: jason he, chang hong wei
 * blog: http://llhdf.javaeye.com
 * Dual licensed under the MIT and GPL licenses.
 *
 * Date: 2009-09-9 17:34:21 -0500 (Thu, 19 Feb 2009)
 */
(function($) {
	
	$.fn.mulitselector = function(options) { 
		
		if ($("#mulitSelector").length != 0) return;

		var $input = $(this);

		var ms_html;

		var settings = 
		{
			title: "请选择类别",
			data: null,
			winwidth:650,
			itemwidth:200,
			valuespliter:";",
			itemspliter:"|||"
		};

		if (options){
			jQuery.extend(settings, options);
		}

		function initialise(){
			initContent();
			initEvent();
		}

		function initEvent() {

			$("#ms_bt_ok").click(function() {
				var result = "";
				var obj = $("#allItems1 input:checked");
				for(var i=0; i<obj.length; i++)
					result += (i==0?"":settings.valuespliter)+obj[i].value.split(settings.itemspliter)[1];
				$input.val(result);
				ms_html.remove();
			});

			$("#ms_bt_clear").click(function() {
				ms_html.remove();
				$input.val("");
			});

			$("#ms_img_close").click(function() {
				ms_html.remove();
			});

		}

		function initContent() {

			var offset = $input.offset();
			var divtop = 1 + offset.top + document.getElementById($input.attr("id")).offsetHeight + 'px';
			var divleft = offset.left + 'px';
			var popmask = document.createElement('div');

			var html = [];	

			html.push('<div id="mulitSelector" style="display:block; top:'+divtop+';left:'+divleft+'; position: absolute; z-index: 1999;">');
			html.push('    <div id="pslayer"  class="alert_div sech_div ms_width" style="width:'+settings.winwidth+'">');
			html.push('        <div class="box">');
			html.push('            <h1><span id="psHeader">'+settings.title+'</span><A href="javascript:void(0);" class="butn3" id="ms_img_close"></A></h1>');
			html.push('			<div class="blk">');
			html.push('				<div id="divSelecting" class="sech_layt">');
			html.push('					<h3>');
			html.push('						<span id="selectingHeader"></span><b class="btn_fst">');
			html.push('						<input id="ms_bt_ok" name="" type="button" value="确定" />');
			html.push('						<input id="ms_bt_clear" name="" type="button" value="清空" /></b>');
			html.push('					</h3>');
			html.push('				</div>');
			html.push('				<div class="sech_layb"> ');
			html.push('					<h2 id="subHeader1"></h2>');
			html.push('					<ol id="allItems1">');
			
			var dataArray = settings.data;
			if (dataArray != null){
				var len = dataArray.length;
				for(var i=0; i<len; i++){
					var d = dataArray[i];
					var status = findStatus(d.name);
					html.push('						<li id=$'+d.id+' name=100 class="nonelay"  style="width:'+settings.itemwidth+'">');
					html.push('							<a href="###">');
					html.push('							<label for="'+d.id+'">');
					html.push('							<input id="'+d.id+'" type="checkbox" '+status+' value="'+(d.id+ settings.itemspliter+ d.name)+'" />'+d.name+'</label>');
					html.push('							</a>');
					html.push('						</li>');
				}
			}

			html.push('					</ol>');
			html.push('				</div>');
			html.push('			</div>');
			html.push('		</div>');
			html.push('   </div>');
			html.push('</div>');

			ms_html = $(html.join("")).appendTo('body');

		}

		function findStatus(d){

			var content = $input.val();
			if (jQuery.trim(content) == ""){
				return "";
			}

			var obj = content.split(settings.valuespliter);
			for(var i=0; i<obj.length; i++){
				if(obj[i] == d){
					return "checked"
				}
			}

		}

		initialise();

	}



})(jQuery);
