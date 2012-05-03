###
CascadingDropDown jQuery plugin. https://github.com/shawnmclean/CascadingDropDown
Copyright (c) 2012 Shawn Mclean and CascadingDropDown.js contributors
###

(($) ->
  $.fn.CascadingDropDown = (source, actionPath, options) ->
    throw "A source element is required"  unless source
    throw "An action path is requried"  unless actionPath
    
    settings = $.extend(
      promptText: "-- Select --",
      loadingText: "Loading ..",
      errorText: "Error loading data.",
      postData: null,
      onLoading: null,
      onLoaded: null
    , options)
    
    @each ->    
      initialize = () ->
        #reset the list of nothing is in it
        reset()  if $this.children().size() is 0
        #request new data if a value is in source
        request()  if $(source).val()
        
        
      reset = () ->
       
       
      request = () ->
       
       
) jQuery