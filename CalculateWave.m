function trace=CalculateWave(time,numT,oumiga,beta,z,len,lambda,numLambda,T,A,Z0,ZL)
%Date: 2022.10.30
%Author:xtang225@foxmail.com

%���㲨��˲ʱͼ�������ھ���M���淵��
trace1=moviein(length(time));%������¼���Ķ�̬ͼƬ

for i=1:length(time)
    t=time(i);
    
    tempt=exp(j*oumiga*t);%ʱ������
    tempz1=exp(j*beta*z);%���򴫲��Ĳ��Ŀռ�����
    tempz2=exp(-j*beta*z);%���򴫲��Ĳ��Ŀռ�����
    V1=A;%���򴫲��Ĳ������
    GamaL=(ZL-Z0)/(ZL+Z0);%���صķ���ϵ��
    V2=V1*abs(GamaL);%���򴫲��Ĳ����
    wave1=V1*tempt*tempz1;%������ʽ�Ĳ����ʽ����Ҫ����eָ����ȡʵ�����ܵõ�ʱ����ʽ
    wave2=V2*tempt*tempz2;%������ʽ�Ĳ����ʽ����Ҫ����eָ����ȡʵ�����ܵõ�ʱ����ʽ
    wave1=real(wave1);
    wave2=real(wave2);
    wave=wave1+wave2;%�ϳɲ�
    subplot(211)
    setaxis=[0,numLambda,-2*V1,2*V1];%��ͼ��������
    plot(z/lambda,wave1,'color','blue');hold on;
    plot(z/lambda,wave2,'color','black');
    quiver(0,0,1.1*len ,0);%������
    legend('����','����');
    xlabel('z/lambda');
    title(['���������������򴫲��Ĳ�','  ','ZL=',num2str(ZL),'  ','time=',num2str(t/T),'T']);
    set(gca,'XDir','reverse')% ��תX��
    hold off%�����һ֡����
    
    subplot(212);%���ƺϳɲ�
%     plot(z/lambda,wave,'color','red');hold on;
    plot(z/lambda,abs(wave),'color','red');hold on%ȡ�˾���ֵ����
    quiver(0,0,1.1*len ,0);hold on;%��һ��������
    title(['����������ĺϳɲ�','  ','ZL=',num2str(ZL),'  ','time=',num2str(t/T),'T']);
    xlabel('z/lambda');
    axis(setaxis);
    set(gca,'XDir','reverse')% ��תX��
    hold off;
    pax=getframe();
    trace(i)=pax;%����ͼ��
end

end