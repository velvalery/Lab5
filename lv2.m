%=== �������� #2.1 ===
% ������������ ������� ��� ���� (eeg1-p4.dat)
fs = 100;
eeg = load('eeg1-p4.txt');
eeg1 = detrend(eeg);
t = (0:length(eeg1)-1)/fs;
figure(21)
plot(t, eeg1); 
title('C����� ���');
xlabel('���'); ylabel('��������');

%=== �������� #2.2 ===
% �������� ����� ������� ��� �� t1 = 4,7 � �� t2 = 5,8 �
t1 = 4.7;
t2 = 5.8;
n1 = fix(t1*fs)+1;
n2 = fix(t2*fs)+1;
figure(22)
plot(t(n1:n2), eeg1(n1:n2)), grid on;
title('����� ������� ��� �� 4,7 � �� 5,8 �');
xlabel('���'); ylabel('��������');

%=== �������� #2.3 ===
% ���������� �������� ������ ��� ������� ���
maxlag1 = fix(0.8*length(eeg1));
akf = xcorr(eeg1, maxlag1, 'unbiased');
figure(23)
plot(akf);
title('�������� ������ ��� ������� ���');
xlabel('³����'); ylabel('��������');

%=== �������� #2.5 ===
% ���������� ����������� �������� �������
Sx = abs(fft(eeg1)/length(eeg1));
Sy = Sx(1:length(eeg1)/2+1);
Sy(2:end-1) = 2*Sy(2:end-1);
f = fs*(0:(length(eeg1)/2))/length(eeg1);
figure(25)
plot(f,Sy), grid on;
title('����������� �������� ��� �������');
xlabel('�������'); ylabel('��������');

%=== �������� #2.6 ===
% ������������ ������� ��� ���� (eeg1-f3.dat)
eeg_ = load('eeg1-f3.txt');
eeg_1 = detrend(eeg_);
t_ = (0:length(eeg_1)-1)/fs;
figure(26)
plot(t_, eeg_1); 
title('C����� ���');
xlabel('���'); ylabel('��������');

% �������� ����� ������� ��� �� t1 = 4,2 � �� t2 = 4,96 �
t_1 = 4.2;
t_2 = 4.96;
n_1 = fix(t_1*fs)+1;
n_2 = fix(t_2*fs)+1;
figure(27)
plot(t_(n_1:n_2), eeg_1(n_1:n_2)), grid on;
title('����� ������� ��� �� 4,2 � �� 4,96 �');
xlabel('���'); ylabel('��������');

% ���������� �������� ������ ��� ������� ���
maxlag2 = fix(0.8*length(eeg_1));
akf2 = xcorr(eeg_1, maxlag2, 'unbiased');
figure(28)
plot(akf2);
title('�������� ������ ��� ��� �������');
xlabel('³����'); ylabel('��������');

% ���������� ����������� �������� �������
Sx = abs(fft(eeg_1)/length(eeg_1));
Sy = Sx(1:length(eeg_1)/2+1);
Sy(2:end-1) = 2*Sy(2:end-1);
f = fs*(0:(length(eeg_1)/2))/length(eeg_1);
figure(29)
plot(f,Sy), grid on;
title('����������� �������� ��� �������');
xlabel('�������'); ylabel('��������');