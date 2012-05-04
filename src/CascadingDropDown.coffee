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
      $this = $(this)
      $(source).on 'change', ->
        parent = $(this)
        unless parent.val() is ""
          post()
        else
          reset()
      
      initialize = () ->
        #reset the list of nothing is in it
        reset()  if $this.children().size() is 0
        #request new data if a value is in source
        post()  if $(source).val()
        
        
      reset = () ->
        alert 'reset'
       
      post = () ->
        settings.onLoading() if settings.onLoading?
        $.ajax
          url: actionPath
          type: "POST"
          dataType: "json"
          data: (if (typeof config.postData is "function") then config.postData() else config.postData) or $(source).serialize()
          success: (data) ->
            reset()
            $.each data, ->
              $this.append $(optionTag).attr("value", @Value).text(@Text)
        
            methods.loaded()
            $.isFunction(config.onLoaded) and config.onLoaded.call($this)
        
          error: ->
            methods.showError()
        alert 'post'
        
      loaded = () ->
        $this.removeAttr 'disabled'
       
       
) jQuery