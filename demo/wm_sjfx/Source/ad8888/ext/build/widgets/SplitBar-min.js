/*
 * Ext JS Library 2.0 Beta 1
 * Copyright(c) 2006-2007, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */

Ext.SplitBar=function(C,E,B,D,A){this.el=Ext.get(C,true);this.el.dom.unselectable="on";this.resizingEl=Ext.get(E,true);this.orientation=B||Ext.SplitBar.HORIZONTAL;this.minSize=0;this.maxSize=2000;this.animate=false;this.useShim=false;this.shim=null;if(!A){this.proxy=Ext.SplitBar.createProxy(this.orientation)}else{this.proxy=Ext.get(A).dom}this.dd=new Ext.dd.DDProxy(this.el.dom.id,"XSplitBars",{dragElId:this.proxy.id});this.dd.b4StartDrag=this.onStartProxyDrag.createDelegate(this);this.dd.endDrag=this.onEndProxyDrag.createDelegate(this);this.dragFormats={};this.adapter=new Ext.SplitBar.BasicLayoutAdapter();this.adapter.init(this);if(this.orientation==Ext.SplitBar.HORIZONTAL){this.placement=D||(this.el.getX()>this.resizingEl.getX()?Ext.SplitBar.LEFT:Ext.SplitBar.RIGHT);this.el.addClass("x-splitbar-h")}else{this.placement=D||(this.el.getY()>this.resizingEl.getY()?Ext.SplitBar.TOP:Ext.SplitBar.BOTTOM);this.el.addClass("x-splitbar-v")}this.addEvents({"resize":true,"moved":true,"beforeresize":true,"beforeapply":true});Ext.SplitBar.superclass.constructor.call(this)};Ext.extend(Ext.SplitBar,Ext.util.Observable,{onStartProxyDrag:function(A,E){this.fireEvent("beforeresize",this);this.overlay=Ext.DomHelper.append(document.body,{cls:"x-drag-overlay",html:"&#160;"},true);this.overlay.unselectable();this.overlay.setSize(Ext.lib.Dom.getViewWidth(true),Ext.lib.Dom.getViewHeight(true));this.overlay.show();Ext.get(this.proxy).setDisplayed("block");var C=this.adapter.getElementSize(this);this.activeMinSize=this.getMinimumSize();this.activeMaxSize=this.getMaximumSize();var D=C-this.activeMinSize;var B=Math.max(this.activeMaxSize-C,0);if(this.orientation==Ext.SplitBar.HORIZONTAL){this.dd.resetConstraints();this.dd.setXConstraint(this.placement==Ext.SplitBar.LEFT?D:B,this.placement==Ext.SplitBar.LEFT?B:D);this.dd.setYConstraint(0,0)}else{this.dd.resetConstraints();this.dd.setXConstraint(0,0);this.dd.setYConstraint(this.placement==Ext.SplitBar.TOP?D:B,this.placement==Ext.SplitBar.TOP?B:D)}this.dragFormats.startSize=C;this.dragFormats.startPoint=[A,E];Ext.dd.DDProxy.prototype.b4StartDrag.call(this.dd,A,E)},onEndProxyDrag:function(C){Ext.get(this.proxy).setDisplayed(false);var B=Ext.lib.Event.getXY(C);if(this.overlay){this.overlay.remove();delete this.overlay}var A;if(this.orientation==Ext.SplitBar.HORIZONTAL){A=this.dragFormats.startSize+(this.placement==Ext.SplitBar.LEFT?B[0]-this.dragFormats.startPoint[0]:this.dragFormats.startPoint[0]-B[0])}else{A=this.dragFormats.startSize+(this.placement==Ext.SplitBar.TOP?B[1]-this.dragFormats.startPoint[1]:this.dragFormats.startPoint[1]-B[1])}A=Math.min(Math.max(A,this.activeMinSize),this.activeMaxSize);if(A!=this.dragFormats.startSize){if(this.fireEvent("beforeapply",this,A)!==false){this.adapter.setElementSize(this,A);this.fireEvent("moved",this,A);this.fireEvent("resize",this,A)}}},getAdapter:function(){return this.adapter},setAdapter:function(A){this.adapter=A;this.adapter.init(this)},getMinimumSize:function(){return this.minSize},setMinimumSize:function(A){this.minSize=A},getMaximumSize:function(){return this.maxSize},setMaximumSize:function(A){this.maxSize=A},setCurrentSize:function(B){var A=this.animate;this.animate=false;this.adapter.setElementSize(this,B);this.animate=A},destroy:function(A){if(this.shim){this.shim.remove()}this.dd.unreg();Ext.removeNode(this.proxy);if(A){this.el.remove()}}});Ext.SplitBar.createProxy=function(B){var C=new Ext.Element(document.createElement("div"));C.unselectable();var A="x-splitbar-proxy";C.addClass(A+" "+(B==Ext.SplitBar.HORIZONTAL?A+"-h":A+"-v"));document.body.appendChild(C.dom);return C.dom};Ext.SplitBar.BasicLayoutAdapter=function(){};Ext.SplitBar.BasicLayoutAdapter.prototype={init:function(A){},getElementSize:function(A){if(A.orientation==Ext.SplitBar.HORIZONTAL){return A.resizingEl.getWidth()}else{return A.resizingEl.getHeight()}},setElementSize:function(B,A,C){if(B.orientation==Ext.SplitBar.HORIZONTAL){if(!B.animate){B.resizingEl.setWidth(A);if(C){C(B,A)}}else{B.resizingEl.setWidth(A,true,0.1,C,"easeOut")}}else{if(!B.animate){B.resizingEl.setHeight(A);if(C){C(B,A)}}else{B.resizingEl.setHeight(A,true,0.1,C,"easeOut")}}}};Ext.SplitBar.AbsoluteLayoutAdapter=function(A){this.basic=new Ext.SplitBar.BasicLayoutAdapter();this.container=Ext.get(A)};Ext.SplitBar.AbsoluteLayoutAdapter.prototype={init:function(A){this.basic.init(A)},getElementSize:function(A){return this.basic.getElementSize(A)},setElementSize:function(B,A,C){this.basic.setElementSize(B,A,this.moveSplitter.createDelegate(this,[B]))},moveSplitter:function(A){var B=Ext.SplitBar;switch(A.placement){case B.LEFT:A.el.setX(A.resizingEl.getRight());break;case B.RIGHT:A.el.setStyle("right",(this.container.getWidth()-A.resizingEl.getLeft())+"px");break;case B.TOP:A.el.setY(A.resizingEl.getBottom());break;case B.BOTTOM:A.el.setY(A.resizingEl.getTop()-A.el.getHeight());break}}};Ext.SplitBar.VERTICAL=1;Ext.SplitBar.HORIZONTAL=2;Ext.SplitBar.LEFT=1;Ext.SplitBar.RIGHT=2;Ext.SplitBar.TOP=3;Ext.SplitBar.BOTTOM=4;