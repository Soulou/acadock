$(function() {
    var smoothie = new SmoothieChart();
    smoothie.streamTo(document.getElementById("chartcanvas"));
    line1 = new TimeSeries();
    smoothie.addTimeSeries(line1);
    updateCpuChartData = function(percentage)  {
      console.log(percentage);
      line1.append(new Date().getTime(), percentage);
    }
});
