% RERUN Data script

tt1_temp = [];
ss1_temp = [];

for j = 1:length(tt1)
   if  ~isnan(tt1(j,1))
      tt1_temp = [tt1_temp; tt1(j,1)];
      ss1_temp = [ss1_temp; ss1(j,1)];
   end
end;

[beh_p1,beheff1,xrange,beh_curve,se, llik]=make_2par_logistic5(ss1_temp,tt1_temp,tt1_temp,unfoldedsoas);
[ErrVec, n, junk] = CalcErrorBars(ss1_temp, tt1_temp, tt1_temp, unfoldedsoas);

figure
%plot(unfoldedsoas,beheff1,'mo');
errorbar(unfoldedsoas,beheff1,ErrVec,'k.')
hold on
plot(xrange,beh_curve,'m');
xlabel('soa, ms');
ylabel('proportion chose B');
text(100,.1,sprintf('a=%3.2f b=%3.2f',beh_p1));
temp=sprintf('%s %s %s','uc-gb-soa-ryan.m',date,fname);
toptitle(temp);