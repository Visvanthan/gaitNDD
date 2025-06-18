close all;
clear all;
a=xlsread('emddecomp.xlsx');
f1 = DistEn(a(:,1));
f2 = SpecEn(a(:,1));
f3 = DispEn(a(:,1));
f4 = SyDyEn(a(:,1));
f5 = IncrEn(a(:,1));
f6 = CoSiEn(a(:,1));
f7 = PhasEn(a(:,1));
f8 = BubbEn(a(:,1));
f9 = GridEn(a(:,1));
f10 = EnofEn(a(:,1));
f11 = AttnEn(a(:,1));
f12 = SlopEn(a(:,1));
feat = [f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12]
