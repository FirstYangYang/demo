/*
 * Ext JS Library 2.0 Beta 1
 * Copyright(c) 2006-2007, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */

Ext.grid.GroupingView=Ext.extend(Ext.grid.GridView,{hideGroupedColumn:false,showGroupName:true,startCollapsed:false,enableGrouping:true,enableGroupingMenu:true,enableNoGroups:true,emptyGroupText:"(None)",ignoreAdd:false,groupTextTpl:"{text}",gidSeed:1000,initTemplates:function(){Ext.grid.GroupingView.superclass.initTemplates.call(this);this.state={};var A=this.grid.getSelectionModel();A.on(A.selectRow?"beforerowselect":"beforecellselect",this.onBeforeRowSelect,this);if(!this.startGroup){this.startGroup=new Ext.XTemplate("<div id=\"{groupId}\" class=\"x-grid-group {cls}\">","<div id=\"{groupId}-hd\" class=\"x-grid-group-hd\" style=\"{style}\"><div>",this.groupTextTpl,"</div></div>","<div id=\"{groupId}-bd\" class=\"x-grid-group-body\">")}this.startGroup.compile();this.endGroup="</div></div>"},findGroup:function(A){return Ext.fly(A).up(".x-grid-group",this.mainBody.dom)},getGroups:function(){return this.hasRows()?this.mainBody.dom.childNodes:[]},onAdd:function(){if(this.enableGrouping&&!this.ignoreAdd){var A=this.getScrollState();this.refresh();this.restoreScroll(A)}else{if(!this.enableGrouping){Ext.grid.GroupingView.superclass.onAdd.apply(this,arguments)}}},onRemove:function(E,A,B,D){Ext.grid.GroupingView.superclass.onRemove.apply(this,arguments);var C=document.getElementById(A._groupId);if(C&&C.childNodes[1].childNodes.length<1){Ext.removeNode(C)}this.applyEmptyText()},refreshRow:function(A){if(this.ds.getCount()==1){this.refresh()}else{this.isUpdating=true;Ext.grid.GroupingView.superclass.refreshRow.apply(this,arguments);this.isUpdating=false}},beforeMenuShow:function(){var C=this.getGroupField();var B=this.hmenu.items.get("groupBy");if(B){B.setDisabled(this.cm.config[this.hdCtxIndex].groupable===false)}var A=this.hmenu.items.get("showGroups");if(A){A.setChecked(!!C)}},renderUI:function(){Ext.grid.GroupingView.superclass.renderUI.call(this);this.mainBody.on("mousedown",this.interceptMouse,this);if(this.enableGroupingMenu&&this.hmenu){this.hmenu.add("-",{id:"groupBy",text:this.groupByText,handler:this.onGroupByClick,scope:this,iconCls:"x-group-by-icon"});if(this.enableNoGroups){this.hmenu.add({id:"showGroups",text:this.showGroupsText,checked:true,checkHandler:this.onShowGroupsClick,scope:this})}this.hmenu.on("beforeshow",this.beforeMenuShow,this)}},onGroupByClick:function(){this.grid.store.groupBy(this.cm.getDataIndex(this.hdCtxIndex))},onShowGroupsClick:function(A,B){if(B){this.onGroupByClick()}else{this.grid.store.clearGrouping()}},toggleGroup:function(C,B){this.grid.stopEditing();C=Ext.getDom(C);var A=Ext.fly(C);B=B!==undefined?B:A.hasClass("x-grid-group-collapsed");this.state[A.dom.id]=B;A[B?"removeClass":"addClass"]("x-grid-group-collapsed")},toggleAllGroups:function(C){var B=this.getGroups();for(var D=0,A=B.length;D<A;D++){this.toggleGroup(B[D],C)}},expandAllGroups:function(){this.toggleAllGroups(true)},collapseAllGroups:function(){this.toggleAllGroups(false)},interceptMouse:function(B){var A=B.getTarget(".x-grid-group-hd",this.mainBody);if(A){B.stopEvent();this.toggleGroup(A.parentNode)}},getGroup:function(A,D,F,G,B,E){var C=F?F(A,{},D,G,B,E):String(A);if(C===""){C=this.cm.config[B].emptyGroupText||this.emptyGroupText}return C},getGroupField:function(){return this.grid.store.getGroupState()},renderRows:function(){var A=this.getGroupField();var D=!!A;if(this.hideGroupedColumn){var B=this.cm.findColumnIndex(A);if(!D&&this.lastGroupField!==undefined){this.mainBody.update("");this.cm.setHidden(this.cm.findColumnIndex(this.lastGroupField),false);delete this.lastGroupField}else{if(D&&this.lastGroupField===undefined){this.lastGroupField=A;this.cm.setHidden(B,true)}else{if(D&&this.lastGroupField!==undefined&&A!==this.lastGroupField){this.mainBody.update("");var C=this.cm.findColumnIndex(this.lastGroupField);this.cm.setHidden(C,false);this.lastGroupField=A;this.cm.setHidden(B,true)}}}}return Ext.grid.GroupingView.superclass.renderRows.apply(this,arguments)},doRender:function(D,G,P,A,O,R){if(G.length<1){return""}var Y=this.getGroupField();var N=this.cm.findColumnIndex(Y);this.enableGrouping=!!Y;if(!this.enableGrouping||this.isUpdating){return Ext.grid.GroupingView.superclass.doRender.apply(this,arguments)}var H="width:"+this.getTotalWidth()+";";var Q=this.grid.getGridEl().id;var F=this.cm.config[N];var B=F.groupRenderer||F.renderer;var C=this.startCollapsed?"x-grid-group-collapsed":"";var S=this.showGroupName?(F.groupName||F.header)+": ":"";var X=[],K,T,U,M;for(T=0,U=G.length;T<U;T++){var J=A+T;var L=G[T],E=L.data[Y],V=this.getGroup(E,L,B,J,N,P);if(!K||K.group!=V){M=Q+"-gp-"+Y+"-"+V;var I=C?C:(this.state[M]===false?"x-grid-group-collapsed":"");K={group:V,gvalue:E,text:S+V,groupId:M,startRow:J,rs:[L],cls:I,style:H};X.push(K)}else{K.rs.push(L)}L._groupId=M}var W=[];for(T=0,U=X.length;T<U;T++){var V=X[T];this.doGroupStart(W,V,D,P,O);W[W.length]=Ext.grid.GroupingView.superclass.doRender.call(this,D,V.rs,P,V.startRow,O,R);this.doGroupEnd(W,V,D,P,O)}return W.join("")},getGroupId:function(F){var D=this.grid.getGridEl().id;var C=this.getGroupField();var E=this.cm.findColumnIndex(C);var B=this.cm.config[E];var G=B.groupRenderer||B.renderer;var A=this.getGroup(F,{data:{}},G,0,E,this.ds);return D+"-gp-"+C+"-"+F},doGroupStart:function(A,D,B,E,C){A[A.length]=this.startGroup.apply(D)},doGroupEnd:function(A,D,B,E,C){A[A.length]=this.endGroup},getRows:function(){if(!this.enableGrouping){return Ext.grid.GroupingView.superclass.getRows.call(this)}var G=[];var F,C=this.getGroups();for(var E=0,A=C.length;E<A;E++){F=C[E].childNodes[1].childNodes;for(var D=0,B=F.length;D<B;D++){G[G.length]=F[D]}}return G},updateGroupWidths:function(){if(!this.enableGrouping||!this.hasRows()){return }var C=Math.max(this.cm.getTotalWidth(),this.el.dom.offsetWidth-this.scrollOffset)+"px";var B=this.getGroups();for(var D=0,A=B.length;D<A;D++){B[D].firstChild.style.width=C}},onColumnWidthUpdated:function(C,A,B){this.updateGroupWidths()},onAllColumnWidthsUpdated:function(A,B){this.updateGroupWidths()},onColumnHiddenUpdated:function(B,C,A){this.updateGroupWidths()},onLayout:function(){this.updateGroupWidths()},onBeforeRowSelect:function(D,C){if(!this.enableGrouping){return }var B=this.getRow(C);if(B&&!B.offsetParent){var A=this.findGroup(B);this.toggleGroup(A,true)}},groupByText:"Group By This Field",showGroupsText:"Show in Groups"});Ext.grid.GroupingView.GROUP_ID=1000;