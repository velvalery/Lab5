
%=== �������� #3.6 ===
% ������������ ������� ��� ���� (eeg1-f3.dat)
fs = 100;
eeg_1 = load('eeg1-f3.txt');
eeg1 = detrend(eeg_1);
t_1 = (0:length(eeg1)-1)/fs;
figure(39)
subplot(2,1,1); 
plot(t_1, eeg1);
title('������ ��� (eeg1-f3.txt)');
xlabel('���'); ylabel('��������');

% ������������ ������� ��� ���� (eeg1-f4.dat)
eeg_2 = load('eeg1-f4.txt');
eeg2 = detrend(eeg_2);
t_2 = (0:length(eeg2)-1)/fs;
subplot(2,1,2); 
plot(t_2, eeg2);
title('������ ��� (eeg1-f4.txt)');
xlabel('���'); ylabel('��������');

% �������� ����� ������� ��� �� t1 = 4,13 � �� t2 = 4,96 � 
% �� t3 = 1,43 � �� t4 = 2,26 �
t1 = 4.13;
t2 = 4.96;
t3 = 1.43;
t4 = 2.26;
n1 = fix(t1*fs)+1;
n2 = fix(t2*fs)+1;
n3 = fix(t3*fs)+1;
n4 = fix(t4*fs)+1;
figure(40)
subplot(2,1,1);
plot(t_1(n1:n2), eeg1(n1:n2)), grid on;
title('����� ������� ��� �� 4,13 � �� 4,96 �'); 
ylabel('��������');
subplot(2,1,2); 
plot(t_2(n3:n4), eeg2(n3:n4)), grid on;
title('����� ������� ��� �� 1,43 � �� 2,26 �');
xlabel('���'); ylabel('��������');

% ���������� ��� ������� ���
maxlag = 250;
vkf = xcorr(eeg1, eeg2, maxlag);
figure(41)
plot(vkf);
title('��� ������� ���');
xlabel('³����'); ylabel('��������');

% ���������� ������ ����������� �������� ������� ���
Sx = abs(fft(vkf)/length(vkf));
Sy = Sx(1:length(vkf)/2+1);
Sy(2:end-1) = 2*Sy(2:end-1);
f = fs*(0:(length(vkf)/2))/length(vkf);
figure(42)
plot(f,Sy), grid on;
title('����������� �������� ������� ���');
xlabel('�������'); ylabel('��������');