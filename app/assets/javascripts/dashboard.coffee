# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org

jQuery ->
  ctx = document.getElementById('body_chart').getContext('2d')
  # Place all the behaviors and hooks related to the matching controller here.
  # All this logic will automatically be available in application.js.
  # You can use CoffeeScript in this file: http://coffeescript.org

  jQuery ->
    ctx = document.getElementById('body_chart').getContext('2d')
    myChart = new Chart(ctx,
    type: 'line'
    data:
      datasets: [
        {
          data: $("#body_chart").data('weights')
          label: 'Body Weight (Kg)'
          borderColor: 'rgb(133,206,54)'
          backgroundColor: 'rgb(133,206,54)'
          fill: false
          yAxisID: 'left-y-axis'
        }
        {
          data: $("#body_chart").data('bodyfats')
          label: 'Body Fat (%)'
          borderColor: 'rgb(54, 162, 235)'
          backgroundColor: 'rgb(54, 162, 235)'
          fill: false
          yAxisID: 'right-y-axis'
        }
      ]
      labels: $("#body_chart").data('dates')
    options: scales:
      xAxes: [ {
        display: true
        scaleLabel:
          display: true
          labelString: 'Date'
      } ]
      yAxes: [
        {
          id: 'left-y-axis'
          type: 'linear'
          position: 'left'
          scaleLabel:
            display: true
            labelString: 'Weight'
        }
        {
          id: 'right-y-axis'
          type: 'linear'
          position: 'right'
          scaleLabel:
            display: true
            labelString: 'Body Fat'
        }
      ])
