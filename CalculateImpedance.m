function impedance=CalculateImpedance(beta,z,Z0,ZL)
%Date: 2022.10.30
%Author:xtang225@foxmail.com

%�����迹�ֲ�ͼ
temp1=ZL*cos(beta*z)+j*Z0*sin(beta*z);%���ߵȵ�ų������Ϲ�ʽ4.1.30���Ӳ���
temp2=Z0*cos(beta*z)+j*ZL*sin(beta*z);%���ߵȵ�ų������Ϲ�ʽ4.1.30��ĸ����
impedance=Z0*(temp1./temp2);%z����迹����һ������

end