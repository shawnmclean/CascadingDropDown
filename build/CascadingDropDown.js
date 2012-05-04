// Generated by CoffeeScript 1.3.1

/*
CascadingDropDown jQuery plugin. https://github.com/shawnmclean/CascadingDropDown
Copyright (c) 2012 Shawn Mclean and CascadingDropDown.js contributors
*/


(function() {

  (function($) {
    return $.fn.CascadingDropDown = function(source, actionPath, options) {
      var settings;
      if (!source) {
        throw "A source element is required";
      }
      if (!actionPath) {
        throw "An action path is requried";
      }
      settings = $.extend({
        promptText: "-- Select --",
        loadingText: "Loading ..",
        errorText: "Error loading data.",
        postData: null,
        onLoading: null,
        onLoaded: null
      }, options);
      return this.each(function() {
        var $this, initialize, loaded, post, reset;
        $this = $(this);
        $(source).on('change', function() {
          var parent;
          parent = $(this);
          if (parent.val() !== "") {
            return post();
          } else {
            return reset();
          }
        });
        initialize = function() {
          if ($this.children().size() === 0) {
            reset();
          }
          if ($(source).val()) {
            return post();
          }
        };
        reset = function() {
          return alert('reset');
        };
        post = function() {
          if (settings.onLoading != null) {
            settings.onLoading();
          }
          $.ajax({
            url: actionPath,
            type: "POST",
            dataType: "json",
            data: (typeof config.postData === "function" ? config.postData() : config.postData) || $(source).serialize(),
            success: function(data) {
              reset();
              $.each(data, function() {
                return $this.append($(optionTag).attr("value", this.Value).text(this.Text));
              });
              methods.loaded();
              return $.isFunction(config.onLoaded) && config.onLoaded.call($this);
            },
            error: function() {
              return methods.showError();
            }
          });
          return alert('post');
        };
        return loaded = function() {
          return $this.removeAttr('disabled');
        };
      });
    };
  })(jQuery);

}).call(this);
