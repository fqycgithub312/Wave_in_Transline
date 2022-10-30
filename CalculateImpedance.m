function impedance=CalculateImpedance(beta,z,Z0,ZL)
%Date: 2022.10.30
%Author:xtang225@foxmail.com

%计算阻抗分布图
temp1=ZL*cos(beta*z)+j*Z0*sin(beta*z);%《高等电磁场》书上公式4.1.30分子部分
temp2=Z0*cos(beta*z)+j*ZL*sin(beta*z);%《高等电磁场》书上公式4.1.30分母部分
impedance=Z0*(temp1./temp2);%z点的阻抗，是一个复数

end