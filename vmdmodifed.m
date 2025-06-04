aa=xlsread('E:\vmddata1.xlsx');
[imf,res]=emd(aa);
pxx1=periodogram(imf(:,1));
pxx2=periodogram(imf(:,2));
pxx3=periodogram(imf(:,3));
pxx4=periodogram(imf(:,4));
pxx5=periodogram(imf(:,5));
figure;
f=0:1:2048;
plot(f,pxx1,'.-b');
xlim([0 50])
hold on;
plot(f,pxx2,'.-r');
plot(f,pxx3,'.-g');
plot(f,pxx4,'.-m');
plot(f,pxx5,'.-y');
hold off;
xlabel('Frequency (Hz)');
ylabel('Power spectral')
lgd=legend('imf1','imf2','imf3','imf4','imf5');
lgd.FontSize=10.5;
set(gcf,'color','w');
set(gca,'FontSize',11)
set(gcf, 'Position',  [100, 100, 450, 350])


%VMD plot_ hunt
figure;
subplot(7,1,1)
plot(aa)
ylabel('VGRF')
subplot(7,1,2)
[imf,res]=emd(aa);
plot(imf(:,1));
ylabel('IMF1');
subplot(7,1,3)
plot(imf(:,2))
ylabel('IMF2')
subplot(7,1,4)
plot(imf(:,3))
ylabel('IMF3')
subplot(7,1,5)
plot(imf(:,4))
ylabel('IMF4')
subplot(7,1,6)
plot(imf(:,5))
ylabel('IMF5')
subplot(7,1,7)
plot(res)
ylabel('Res')
xlabel('Data samples')
set(gcf,'color','w');
%set(gca,'FontSize',11)
set(gcf, 'Position',  [200, 200, 650, 450])