%=== �������� #3.5 ===
% ������������ ������� ��� ���� (eeg1-p3.dat)
fs = 100;
eeg_1 = load('eeg1-p3.txt');
eeg1 = detrend(eeg_1);
t_1 = (0:length(eeg1)-1)/fs;
figure(35)
subplot(2,1,1); 
plot(t_1, eeg1);
title('C����� ��� (eeg1-p3.dat)');
xlabel('���'); ylabel('��������');

% ������������ ������� ��� ���� (eeg1-p4.dat)
eeg_2 = load('eeg1-p4.txt');
eeg2 = detrend(eeg_2);
t_2 = (0:length(eeg2)-1)/fs;
subplot(2,1,2); 
plot(t_2, eeg2);
title('C����� ��� (eeg1-p4.dat)');
xlabel('���'); ylabel('��������');

% �������� ����� ������� ��� �� t1 = 4,7 � �� t2 = 5,8 �
t1 = 4.7;
t2 = 5.8;
n1 = fix(t1*fs)+1;
n2 = fix(t2*fs)+1;
figure(36)
subplot(2,1,1); 
plot(t_1(n1:n2), eeg1(n1:n2)), grid on;
title('����� ������� ��� �� 4,7 � �� 5,8 �'); 
ylabel('��������');
subplot(2,1,2); 
plot(t_2(n1:n2), eeg2(n1:n2)), grid on;
xlabel('���'); ylabel('��������');

% ���������� ��� ������� ���
maxlag = 100;
vkf = xcorr(eeg1, eeg2, maxlag);
figure(37)
plot(vkf);
title('��� ������� ���');
xlabel('³����'); ylabel('��������');

% ���������� ������ ����������� �������� ������� ���
Sx = abs(fft(vkf)/length(vkf));
Sy = Sx(1:length(vkf)/2+1);
Sy(2:end-1) = 2*Sy(2:end-1);
f = fs*(0:(length(vkf)/2))/length(vkf);
figure(38)
plot(f,Sy), grid on;
title('����������� �������� ������� ���');
xlabel('�������'); ylabel('��������');