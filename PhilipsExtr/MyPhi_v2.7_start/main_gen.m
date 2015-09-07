% function dist = main(filename1,filename2)
% fprintf('%s&&%s\n',filename1,filename2)
%clc;
clear;
version='MyPhi_v2.7_start';

tic

method = 10;

        targf = 4000;     
%         FrameLen=2048; distunit = 16.201389  %for philips,method 10,5000,2048,1/2;        
%         FrameLen=2048;  distunit = 15.989583 %for philips,method 10,5000,2048,1/4;
       % FrameLen=2048;  distunit = 16.018503 %for philips,method 10,5000,2048,1/33;
        FrameLen=2048;  distunit = 16.012752 %for philips,method 10,5000,2048,1/33;,for targf = 4000


forsearch = 0;
%% ��ͬ��Ƶ
[x fs1]=wavread('..\..\exe-test\����1-���������-30s.wav');
[y fs2]=wavread('..\..\exe-test\����1-Exodus.wav');
% % % % % % 
% [x fs1]=wavread('..\..\exe-test\����1-���������-30s.wav');
% [y fs2]=wavread('..\..\exe-test\����2-Ӣ�۵�����.wav');
% % % % % % % % % % % % nkm   
% % % % % % % % % % % % % 
% [x fs1]=wavread('..\..\exe-test\����1-���������-30s.wav');
% [y fs2]=wavread('..\..\exe-test\���1-����-��������.wav');
% % % % % % % % % % % % % 
% [x fs1]=wavread('..\..\exe-test\����1-���������-30s.wav');
% [y fs2]=wavread('..\..\exe-test\���2-Ů��-�������δ���.wav');
% % % % % % % % % % 
% [x fs1]=wavread('..\..\exe-test\����1-���������-30s.wav');
% [y fs2]=wavread('..\..\exe-test\����2-Сƻ��-30s.wav');
%% ������Ƶ
% ����1�����1-pop
% ����1�����1-rock
% ����1�����1-classsical
% ����1�����1-ת32MP3
% ����1�����1-ת64MP3
% ����1�����1ת128MP3
% ����1�����1-ת256MP3
% ����1�����1-SNR50
% ����1�����1-SNR25
% ����1�����1-SNR10
% 
% [x fs1]=wavread('..\..\exe-test\����1-���������-30s.wav');
% [y fs2]=wavread('..\..\exe-test\����1-���������-30s-pop-�ߵ���������������.wav');
% % % % % % % % % % 
% % % % % % % % % % % 
% [x fs1]=wavread('..\..\exe-test\����1-���������-30s.wav');
% [y fs2]=wavread('..\..\exe-test\����1-���������-30s-rock-�ߵ���������������.wav');
% % % % % % % % % 
% % [x fs1]=wavread('..\..\exe-test\����1-���������-30s.wav');
% % [y fs2]=wavread('..\..\exe-test\����1-���������-30s-classical-�ߵ���������������.wav');
% % % % % % % % % % % % % % % % 
% % [x fs1]=wavread('..\..\exe-test\����1-���������-30s.wav');
% % [y fs2]=wavread('..\..\exe-test\����1-���������-30s-256.wav');
% % % % % % % 
% [x fs1]=wavread('..\..\exe-test\����1-���������-30s.wav');
% [y fs2]=wavread('..\..\exe-test\����1-���������-30s-snr5.wav');
% % % % % % % % % 
% [x fs1]=wavread('..\..\exe-test\BKADl-48k-m.wav');
% [y fs2]=wavread('..\..\exe-test\BKADr-48k-m.wav');
% % % % % % % % % % % % % % % % % % % % 
% [x fs1]=wavread('..\..\exe-test\BKADr-48k-m.wav');
% [y fs2]=wavread('..\..\exe-test\BKADr-48k-m-change4.wav');
% % % 
% 
% % % % % % % 
% 

if fs1~=targf
    x=resample(x,targf,fs1);
    fs1=targf;
end
if fs2~=targf
    y=resample(y,targf,fs2);
    fs2=targf;
end

% % %filter range
maxfrq=2000;
minfrq=0;

if forsearch 
    y = [zeros(10,1);y];
    cnt = 15;
else
    cnt = 1;
end
mean_dist = zeros(1,cnt);
for k=1:cnt
      
        BKADrorg= FeatureExtraction_Philips(x,FrameLen,fs1);
        BKADlorg= FeatureExtraction_Philips(y,FrameLen,fs2);
       % BKADrorg= FeatureExtraction_Philips_1div4(x,FrameLen,fs1);
       % BKADlorg= FeatureExtraction_Philips_1div4(y,FrameLen,fs2);
        mean_dist(k)=Dist_hanmin(BKADrorg,BKADlorg);
    
        y = y(11:end);
end
 toc;
 
 fprintf('%d,��һ��=%d\n',mean_dist(1),mean_dist(1)/distunit);
 fprintf('%f,��һ��=%7f\n\n\n',mean_dist(1),mean_dist(1)/distunit);
 
 if forsearch 
 mean_dist = mean_dist/distunit
 stem(mean_dist);
 title('rock 256 1/2');
 end

