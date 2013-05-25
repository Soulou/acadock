$(function() {
    var smoothiecpu = new SmoothieChart({minValue: 0.0, 
                                        maxValue: 100.0,
                                        millisPerPixel:50,
                                        grid:{strokeStyle:'#369CD4',
                                        sharpLines:true, millisPerLine:10000}
    });
    var smoothiemem = new SmoothieChart({minValue: 0.0,
                                         maxValue: 128000000.0,
                                         millisPerPixel:50,
                                         grid:{strokeStyle: '#992E35',
                                         sharpLines:true, millisPerLine:10000}
    });

    smoothiecpu.streamTo(document.getElementById("chartcanvas"));
    line1 = new TimeSeries();
    smoothiecpu.addTimeSeries(line1);
    updateCpuChartData = function(percentage)  {
      console.log(percentage);
      line1.append(new Date().getTime(), percentage);
    }

    smoothiemem.streamTo(document.getElementById("chartmemcanvas"));
    line2 = new TimeSeries();
    smoothiemem.addTimeSeries(line2);
    updateMemChartData = function(percentage){
      console.log(percentage);
      line2.append(new Date().getTime(), percentage);
    }
});
