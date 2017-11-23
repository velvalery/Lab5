%=== �������� #1.1 ===
% ����������� ������������� ����������� �������
fs = 200;
f0 = 5;
A = 0.5;
D = 0.25;
n = 1000;
t = (0:(n-1))/fs; % ������ ����
s = A*cos(2*pi*f0*t);
v = randn(size(t))*sqrt(D);
x = s + v;
% ������� ��������� �������
figure(11)
subplot(3,1,1), plot(t,x);
title('x(t)'); 
ylim([-2 2]); 
ylabel('��������');
subplot(3,1,2), plot(t,s);
title('s(t)');
ylabel('��������')
subplot(3,1,3), plot(t,v);
title('v(t)');
xlabel('���'); ylabel('��������');

%=== �������� #1.2 ===
% ���������� ������ ������� ����, ������� ������� �� ��������� ���/������
fprintf('�������� ������� = %4.3g\n', var(s))
fprintf('�������� ���� = %4.3g\n', var(v))
fprintf('³�������� ���/������ = %4.3g\n', snr(s, v))

%=== �������� #1.3 ===
% ���������� �������� ������ ��� �������������� �������  
maxlag = fix(0.2*length(x));
[v, lags] = xcorr(x, maxlag, 'unbiased');
figure(12)
plot(lags, v);
title('�������� ��� �������������� �������');
xlim([-5 5]);
xlabel('³����'); ylabel('��������');

%=== �������� #1.4 ===
% ���������� ������ ������ ��� �������������� �������  
maxlag2 = fix(0.8*length(x));
[v2, lags2] = xcorr(x, maxlag2, 'biased');
figure(13)
plot(lags2, v2); 
title('������ ��� �������������� �������');
xlim([-5 5]);
xlabel('³����'); ylabel('��������');

%=== �������� #1.5 ===
% ���������� ������ ��� �������������� ������� ��� �������� ��������� ������� 
%t=100
t3 = 0:100; % ������ ����
v3 = randn(size(t3))*sqrt(D);
s3 = A*cos(2*pi*f0*t3);
x3 = s3 + v3;

maxlag3 = fix(0.3*length(x3));
[r3, lags3] = xcorr(x3, maxlag3, 'unbiased');
[r_3, lags_3] = xcorr(x3, maxlag3, 'biased');
figure(14)
subplot(2,1,1); plot(lags3,r3); 
title('�������� ��� ��� t = 100');
xlim([-30 30]);
ylabel('��������');
subplot(2,1,2); plot(lags_3,r_3); 
title('������ ��� ��� t = 100');
xlim([-30 30]);
xlabel('³����'); ylabel('��������');

%t=1000
t4 = 0:1000; % ������ ����
v4 = randn(size(t4))*sqrt(D);
s4 = A*cos(2*pi*f0*t4);
x4 = s4 + v4;

maxlag4 = fix(0.3*length(x4));
[r4, lags4] = xcorr(x4, maxlag4, 'unbiased');
[r_4, lags_4] = xcorr(x4, maxlag4, 'biased');
figure(15)
subplot(2,1,1); plot(lags4,r4); 
title('�������� ��� ��� t = 1000');
xlim([-30 30]);
ylabel('��������');
subplot(2,1,2); plot(lags_4,r_4); 
title('������ ��� ��� t = 1000');
xlim([-30 30]);
xlabel('³����'); ylabel('��������');