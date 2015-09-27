# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('form.sign-up').submit ->
    $(this, '.welcome-hero h6').toggleClass('complete')
    $('.welcome-hero h6').css({
      'bottom': '40px', 
      'opacity': 1, 
      'transform': 'translateY(-30px)'
      })
  return