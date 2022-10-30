%Date: 2022.10.30
%Author:xtang225@foxmail.com

%���洫��������Ĳ�
clc;clear;close all;
%�����������
c=3*10^8;%����
lambda=1;%����
frequency=c/lambda;%��Ų�Ƶ��
T=1/frequency;%�ź�����
oumiga=2*pi*frequency;%��Ƶ��
beta=2*pi/lambda;%��λ����
alpha=0.5;%˥������
numT=5;time=linspace(0,numT*T,50);%numT�Ƿ����ʱ�������������Ŀ
numLambda=4;%����ĳ��Ȱ����Ĳ�������
len=numLambda*lambda;%�����ߵ�������
z=linspace(0,len,100);%����������������
A=1;%���������һ��ʵ��


%1.��������פ��״̬����· ��· ���������ֱ��Ӧ����ZL=0,+INF ,jXL
Z0=50;%�����������迹
ZL=j*20;%�����迹������ͨ���ı�ZL��ֵZL=0,+INF ,jXL���õ������פ��
A=1;
trace1=moviein(length(time));%������¼����
impedance1=[];%������¼�迹��Ϣ
figure(1);
impedance1=CalculateImpedance(beta,z,Z0,ZL)/Z0;%g���������迹��һ����
plot(z/lambda,real(impedance1),'color','red');hold on;
plot(z/lambda,imag(impedance1),'color','blue');hold on;
quiver(0,0,1.1*len ,0);hold on;%������չ��
xlabel('z/lambda');title(['���������迹�ֲ�ͼ','  ','ZL=',num2str(ZL)]);
set(gca,'XDir','reverse')% ��תX��
% axis(setaxis);
legend('�迹ʵ��','�迹�鲿');
figure(2);
trace1=CalculateWave(time,numT,oumiga,beta,z,len,lambda,numLambda,T,A,Z0,ZL);
movie(trace1,3,3);%��̬��ʾ����������Ĳ�


%%2.�������⸺���迹�Ĳ����ֱ��Ӧ����ZL=0,+INF ,jXL
Z0=50;%�����������迹
ZL2=40+j*20;%�����迹
A=1;
trace2=moviein(length(time));%������¼����
impedance2=[];%������¼�迹��Ϣ
figure(3);
impedance2=CalculateImpedance(beta,z,Z0,ZL2)/Z0;%g���������迹��һ����
plot(z/lambda,real(impedance2),'color','red');hold on;
plot(z/lambda,imag(impedance2),'color','blue');hold on;
quiver(0,0,1.1*len ,0);hold on;%������չ��
xlabel('z/lambda');title(['���������迹�ֲ�ͼ','  ','ZL=',num2str(ZL2)]);
set(gca,'XDir','reverse')% ��תX��
hold on
legend('�迹ʵ��','�迹�鲿');

figure(4);
trace2=CalculateWave(time,numT,oumiga,beta,z,len,lambda,numLambda,T,A,Z0,ZL2);
movie(trace2,3,3);%��̬��ʾ����������Ĳ�

 
fprintf('�������н���\n');   
