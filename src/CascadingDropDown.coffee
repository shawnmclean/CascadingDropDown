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
      $(source).on "change", ->
        
) jQuery