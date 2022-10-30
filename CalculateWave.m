function trace=CalculateWave(time,numT,oumiga,beta,z,len,lambda,numLambda,T,A,Z0,ZL)
%Date: 2022.10.30
%Author:xtang225@foxmail.com

%计算波的瞬时图，储存在矩阵M里面返回
trace1=moviein(length(time));%用来记录波的动态图片

for i=1:length(time)
    t=time(i);
    
    tempt=exp(j*oumiga*t);%时间因子
    tempz1=exp(j*beta*z);%正向传播的波的空间因子
    tempz2=exp(-j*beta*z);%负向传播的波的空间因子
    V1=A;%正向传播的波的振幅
    GamaL=(ZL-Z0)/(ZL+Z0);%负载的反射系数
    V2=V1*abs(GamaL);%负向传播的波振幅
    wave1=V1*tempt*tempz1;%复数形式的波表达式，还要乘以e指数因取实部才能得到时域表达式
    wave2=V2*tempt*tempz2;%复数形式的波表达式，还要乘以e指数因取实部才能得到时域表达式
    wave1=real(wave1);
    wave2=real(wave2);
    wave=wave1+wave2;%合成波
    subplot(211)
    setaxis=[0,numLambda,-2*V1,2*V1];%绘图窗口设置
    plot(z/lambda,wave1,'color','blue');hold on;
    plot(z/lambda,wave2,'color','black');
    quiver(0,0,1.1*len ,0);%坐标轴
    legend('正向波','反向波');
    xlabel('z/lambda');
    title(['传输线上正负方向传播的波','  ','ZL=',num2str(ZL),'  ','time=',num2str(t/T),'T']);
    set(gca,'XDir','reverse')% 翻转X轴
    hold off%清除上一帧动画
    
    subplot(212);%绘制合成波
%     plot(z/lambda,wave,'color','red');hold on;
    plot(z/lambda,abs(wave),'color','red');hold on%取了绝对值波形
    quiver(0,0,1.1*len ,0);hold on;%画一条坐标轴
    title(['传输线上面的合成波','  ','ZL=',num2str(ZL),'  ','time=',num2str(t/T),'T']);
    xlabel('z/lambda');
    axis(setaxis);
    set(gca,'XDir','reverse')% 翻转X轴
    hold off;
    pax=getframe();
    trace(i)=pax;%保存图窗
end

end