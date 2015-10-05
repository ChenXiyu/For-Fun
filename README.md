# clock.sh
在终端显示一个数码管时钟脚本，该时钟能根据终端大小自动调节大小。
效果如图所示：
![](http://7xl4y6.com1.z0.glb.clouddn.com/2015-10-05%2013%3A55%3A28%20的屏幕截图.png)
![](http://7xl4y6.com1.z0.glb.clouddn.com/2015-10-05%2013%3A55%3A52%20的屏幕截图.png)
![](http://7xl4y6.com1.z0.glb.clouddn.com/2015-10-05%2013%3A56%3A15%20的屏幕截图.png)
# NetScan
用于扫描某个网段内上线机器的脚本
判断在线的方法是能否ping通
ParseIpAddr是一个c语言程序，用于网段ip的遍历
NetScan.sh是shellScripts，用于参数解析和ping目标主机
已知bug：网段内主机较多的话并发的进程输出不受控制，输出混乱。
# brightnessCtl
用于屏幕亮度查看和亮度设置。
设置亮度时需要使用sudo
# battery_states.sh
终端下查看电池电亮的shellscripts
# ScreenSaver.sh
调用brightnessCtl.sh和cmatrix来实现屏幕保护，调用brightnessCtl.sh需要使用root权限
