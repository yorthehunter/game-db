# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery(document).ready ->

  $("[data-date-picker=true]").datepicker()
  $(".js-date-picker").datepicker()

  $('body').on 'hidden.bs.modal', '.modal', ->
    $(this).removeData 'bs.modal'

  $('body').on 'loaded.bs.modal', '.modal', ->
    $("[data-date-picker=true]").datepicker()