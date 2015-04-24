$(function() {
    var smoothiecpu = new SmoothieChart({minValue: -10.0, 
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
    var smoothienetrx = new SmoothieChart({minValue: -100.0,
                                         maxValue: 10240.0,
                                         millisPerPixel:50,
                                         grid:{strokeStyle: '#009966',
                                         sharpLines:true, millisPerLine:10000}
    });
    var smoothienettx = new SmoothieChart({minValue: -100.0,
                                         maxValue: 10240.0,
                                         millisPerPixel:50,
                                         grid:{strokeStyle: '#009966',
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
    updateMemChartData = function(mem){
      console.log(mem);
      line2.append(new Date().getTime(), mem);
    }

    smoothienetrx.streamTo(document.getElementById("chartnetrxcanvas"));
    smoothienettx.streamTo(document.getElementById("chartnettxcanvas"));
    lineRx = new TimeSeries();
    lineTx = new TimeSeries();
    smoothienetrx.addTimeSeries(lineRx);
    smoothienettx.addTimeSeries(lineTx);
    updateNetChartData = function(net){
      lineRx.append(new Date().getTime(), net.RxBps);
      lineTx.append(new Date().getTime(), net.TxBps);
    }
});
