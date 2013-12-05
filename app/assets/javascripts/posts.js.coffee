# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ = jQuery
$(document).on "ready page:load", ->	
	if $("#wysi-editor").length > 0
		data = 
			toolbar: "wysi-toolbar"
			parserRules: wysihtml5ParserRules
		editor = new wysihtml5.Editor("wysi-editor",data)
	
