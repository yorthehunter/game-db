$ ->

  $("#term").focus ->
    full = (if $("#poster").has("img").length then true else false)
    $("#poster").empty()  if full is false
    return

  getPoster = ->
    query = $("#term").val()
    if query is ""
      $("#poster").html "<h2 class='loading'>Ha! We haven't forgotten to validate the form! Please enter something.</h2>"
    else
      $("#poster").html "<h2 class='loading'>Your poster is on its way!</h2>"
      $.getJSON "http://www.giantbomb.com/api/search/?api_key=ae7a44eaf21ed5405c6cdc42f4dad44b44de4086&format=json&query='" + query +"'&resources=game", (json) ->
        unless json is "Nothing found."
          $("#poster").html "<h2 class=\"loading\">Well, gee whiz! We found you a poster, skip!</h2><img id=\"thePoster\" src=" + json[0].image.medium_url + " />"
        else
          console.log json
          $("#poster").html "<h2 class=\"loading\">We are afraid nothing was found for that search.</h2>"
          return

        return

    false

  $("#search").click getPoster
  $("#term").keyup (event) ->
    getPoster()  if event.keyCode is 13
    return

  return
