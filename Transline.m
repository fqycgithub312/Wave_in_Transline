%Date: 2022.10.30
%Author:xtang225@foxmail.com

%仿真传输线上面的波
clc;clear;close all;
%定义物理变量
c=3*10^8;%光速
lambda=1;%波长
frequency=c/lambda;%电磁波频率
T=1/frequency;%信号周期
oumiga=2*pi*frequency;%角频率
beta=2*pi/lambda;%相位常数
alpha=0.5;%衰减常数
numT=5;time=linspace(0,numT*T,50);%numT是仿真的时间包含的收其数目
numLambda=4;%仿真的长度包含的波长数量
len=numLambda*lambda;%传输线的物理长度
z=linspace(0,len,100);%传输线上面点的坐标
A=1;%波振幅，是一个实数


%1.仿真三种驻波状态：短路 开路 纯虚数，分别对应负载ZL=0,+INF ,jXL
Z0=50;%传输线特性阻抗
ZL=j*20;%负载阻抗，可以通过改变ZL的值ZL=0,+INF ,jXL，得到另外的驻波
A=1;
trace1=moviein(length(time));%用来记录波形
impedance1=[];%用来记录阻抗信息
figure(1);
impedance1=CalculateImpedance(beta,z,Z0,ZL)/Z0;%g关于特征阻抗归一化；
plot(z/lambda,real(impedance1),'color','red');hold on;
plot(z/lambda,imag(impedance1),'color','blue');hold on;
quiver(0,0,1.1*len ,0);hold on;%坐标轴展现
xlabel('z/lambda');title(['传输线上阻抗分布图','  ','ZL=',num2str(ZL)]);
set(gca,'XDir','reverse')% 翻转X轴
% axis(setaxis);
legend('阻抗实部','阻抗虚部');
figure(2);
trace1=CalculateWave(time,numT,oumiga,beta,z,len,lambda,numLambda,T,A,Z0,ZL);
movie(trace1,3,3);%动态演示传输线上面的波


%%2.仿真任意负载阻抗的波，分别对应负载ZL=0,+INF ,jXL
Z0=50;%传输线特性阻抗
ZL2=40+j*20;%负载阻抗
A=1;
trace2=moviein(length(time));%用来记录波形
impedance2=[];%用来记录阻抗信息
figure(3);
impedance2=CalculateImpedance(beta,z,Z0,ZL2)/Z0;%g关于特征阻抗归一化；
plot(z/lambda,real(impedance2),'color','red');hold on;
plot(z/lambda,imag(impedance2),'color','blue');hold on;
quiver(0,0,1.1*len ,0);hold on;%坐标轴展现
xlabel('z/lambda');title(['传输线上阻抗分布图','  ','ZL=',num2str(ZL2)]);
set(gca,'XDir','reverse')% 翻转X轴
hold on
legend('阻抗实部','阻抗虚部');

figure(4);
trace2=CalculateWave(time,numT,oumiga,beta,z,len,lambda,numLambda,T,A,Z0,ZL2);
movie(trace2,3,3);%动态演示传输线上面的波

 
fprintf('程序运行结束\n');   
