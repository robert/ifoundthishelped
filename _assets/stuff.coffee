jQuery ->

  $.each $("[data-time]"), ( index, ele ) ->
    $(ele).html( prettyDate( new Date( $(this).data("time") ) ) )
  
  $(window).scroll ->
    scroll_pos = window.pageYOffset
    sidebar_pos = $("#sidebar").offset().top
    offset = if (scroll_pos > sidebar_pos && $(window).width() > 640) then scroll_pos - sidebar_pos + 10 else 5
    $("#sidebar").css("padding-top", offset + "px")
  

  # tracking stuff
  $.each $("a[id]"), (index, ele) ->
    $(ele).click (e) ->
      e.stopImmediatePropagation()
      _gaq.push ["_trackEvent", "Clicks", "clicked", e.target.id]

  $.each $("a:not([id])"), (index, ele) ->
    $(ele).click (e) ->
      e.stopImmediatePropagation()
      console.log e.currentTarget.innerText
      _gaq.push ["_trackEvent", "Visits", "clicked on " + e.currentTarget.innerText, e.currentTarget.href]

