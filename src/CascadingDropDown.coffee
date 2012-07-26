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
      onLoaded: null,
      onError: null
    , options)
    optionTag = "<option></option>"
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
        
      clear =()->
        $this.empty()
        #set disabled
        $this.attr "disabled", "disabled"
        
      reset = () ->
        clear()
        #set the prompt text
        $this.append $(optionTag).attr("value", "").text(settings.promptText)
       
      loaded = () ->
        $this.removeAttr "disabled"
      
      postError =() ->
        clear();
        $this.append($(optionTag).attr("value", "").text(settings.errorText));
        $.isFunction(settings.onError) and settings.onError.call($this)
      
      post = () ->
        $.isFunction(settings.onLoading) and settings.onLoading.call($this)
        $.ajax
          url: actionPath
          type: "POST"
          dataType: "json"
          data: (settings.postData) or $(source).serialize()
          success: (data) ->
            reset()
            $.each data, ->
              $this.append $(optionTag).attr("value", @Value).text(@Text)
        
            loaded()
            $.isFunction(settings.onLoaded) and settings.onLoaded.call($this)
        
          error: ->
            postError()
        
      loaded = () ->
        $this.removeAttr 'disabled'
       
      initialize()
) jQuery