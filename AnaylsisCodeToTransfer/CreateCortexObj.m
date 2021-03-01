function [ss1, tt1] = CreateCortexObj(path, fname, unfoldgrp, unfoldedsoas, MaskTypeDelimitingConditions)

%(1) file,
%(2) condition group (all conditions in trial order -1)
%(3) trial number
%(4) pair onset (from sample);
%(5) saccade latency
%(6) cue latency (from pair), 
%(7) response
%(8) actual condition
%(9) stimulus duration
%(10) SOA (targeted SOA)
%(11) choice [0 if he picks A 1 if he picks B]


%robj.conds [the conditions to include in your analysis]
%robj.resps [the responses to include]

%fobj.resps %response
%fobj.conds %conditions
%fobj.times %time of each event code
%fobj.codes %event code

%clear classes;

incresps=[0 5 6 2];
cresps=[0 5];%correct trials
%robj=rules;
robj=key;
robj.resps=incresps;%0 correct on tie, 5 correct early 6 incorrect on time 2 incorrect early
ii=-1;

%load file
%path='/Users/thug/Documents/JagadeeshRotation/GabeData/GBSOAM12/';

fname2=strcat(path,fname);
cname=1;
fobj=cortex(fname2,[1:2]);% opens data file; last argument is the number of trials to process in the datafile
condsuse=[min(fobj.cond):max(fobj.conds)];
%condsuse = [29:56];


%calculate latencies
[pairsac,pairsacT]=latency(fobj,robj,27,44);%27 onset of the pair 44 is the saccade
[paircue,paircueT]=latency(fobj,robj,27,31);%27 onset of pair, 31 the cue
[samppair,samppairT]=latency(fobj,robj,23,27);%23 onset of sample 27 onset of pair
[samppair0,samppair0T]=latency(fobj,robj,24,27);%24 onset of mask to pair

cuelat=NaN.*ones(length(pairsacT),1); %create empty list
cuelat(ismember(pairsacT,paircueT))=paircue; %set trials with cue to cue latency

samppair0(ismember(pairsacT,samppairT))=samppair; %change durations where sample was presented

[stimdur,stimdurT]=latency(fobj,robj,23,24); %stimulus duration

stimdurN=NaN.*ones(length(pairsacT),1); %create empty list
stimdurN(ismember(pairsacT,stimdurT))=stimdur; %set stimdurs that are non-zero
stimdurN(~ismember(pairsacT,stimdurT))=0; %set 0 stim durations, these should correspond to 0 ms conditions

trs=pairsacT;
ntrs=length(trs);

codelist=[repmat(cname,ntrs,1),repmat(ii,ntrs,1),trs',samppair0',pairsac',cuelat,fobj.resps(trs),fobj.conds(trs),stimdurN];


%recode, by SOA & choice
%unfoldgrp=[[min(fobj.conds):2:max(fobj.conds)];[min(fobj.conds)+1:2:max(fobj.conds)]]
%unfoldgrp=[[1:2:27];[2:2:28]];
%unfoldgrp=[[29:2:55];[30:2:56]];
%unfoldgrp=[[57:2:83];[58:2:84]];
%unfoldedsoas=[0 0 -10 10 -20 20 -40 40 -80 80 -160 160 -320 320 0 0 -10 10 -20 20 -40 40 -80 80 -160 160 -320 320 0 0 -10 10 -20 20 -40 40 -80 80 -160 160 -320 320];
%unfoldedsoas=[0 0 -10 10 -20 20 -40 40 -80 80 -160 160 -320 320];
%unfoldedsoas=[0 0 -10 10 -20 20 -40 40 -80 80 -160 160];

%[nc,ng]=size(unfoldgrp);
[nc,ng] = size(unfoldedsoas);

%recode conditions (by SOA)
tmp=NaN.*ones(ntrs,1);

for j = 1:length(MaskTypeDelimitingConditions)
    
    [junk, StartIndex] = find(unfoldgrp(1,:) == MaskTypeDelimitingConditions(j));
    % [StartIndex, junk] = loc;
    
    for ii=1:ng
        Index = (StartIndex - 1) + ii;
        seltrials=ismember(codelist(:,8),unfoldgrp(:,Index));
    
        %tmp(seltrials) = 
        tmp(seltrials) = unfoldedsoas(ii);

    end;
    
end; 

% %recode conditions (by SOA)
% tmp=NaN.*ones(ntrs,1);
% for ii=1:ng
%     seltrials=ismember(codelist(:,8),unfoldgrp(:,ii));
%     tmp(seltrials)=unfoldedsoas(ii);
% end

tmp(~isfinite(tmp))=0;
codelist=[codelist,tmp];


%recode choices [1 means chose "B"; 0 means chose "A"]
tmp=NaN.*ones(ntrs,1);
for ii=1:length(unfoldedsoas)
    seltrials1=ismember(codelist(:,10),unfoldedsoas(ii));
    seltrials2=seltrials1;
    seltrials1=seltrials1&ismember(codelist(:,7),cresps);
    seltrials2=seltrials2&~ismember(codelist(:,7),cresps);
    if unfoldedsoas(ii)<0
        tmp(seltrials1)=0;
        tmp(seltrials2)=1;
    end
    if unfoldedsoas(ii)>0;
        tmp(seltrials1)=1;
        tmp(seltrials2)=0;
    end
    if unfoldedsoas(ii)==0
        seltrials1T=seltrials1&ismember(codelist(:,8),condsuse(1:2));
        seltrials2T=seltrials2&ismember(codelist(:,8),condsuse(1:2));
        tmp(seltrials1T)=0;
        tmp(seltrials2T)=1;
        seltrials1T=seltrials1&ismember(codelist(:,8),condsuse(3:4));
        seltrials2T=seltrials2&ismember(codelist(:,8),condsuse(3:4));
        tmp(seltrials1T)=1;
        tmp(seltrials2T)=0;
    end
end
codelist=[codelist,tmp];

%analyze data (by latency)
latsgrp=[[0:20:2500]',[0+200:20:2500+200]'];

ssoas=unfoldedsoas;
creckAll=[];
for jj=1:length(latsgrp)
    seltrials1=ismember(codelist(:,5),[latsgrp(jj,1):latsgrp(jj,2)]);
    seltrials1=seltrials1&ismember(codelist(:,10),ssoas);
    seltrials2=seltrials1;
    seltrials1=seltrials1&ismember(codelist(:,7),incresps);
    aa=sum(seltrials1);
    seltrials2=seltrials2&ismember(codelist(:,7),cresps);
    bb=sum(seltrials2);
    creckAll=[creckAll;[bb,aa]];
end

strs=creckAll(:,2)>5;

% figure
% subplot(2,2,1);
% plot(latsgrp(strs,2),creckAll(strs,1)./creckAll(strs,2));
% xlabel('end latency, 200 ms bins, 20 ms steps');
% ylabel('proportion correct');
% line([0 2000],[.5 .5]);
% subplot(2,2,3);
% plot(latsgrp(strs,2),creckAll(strs,2));
% xlabel('end latency, 200 ms bins, 20 ms steps');
% ylabel('n responses');
% subplot(2,2,2);
% seltrials1=ismember(codelist(:,8),condsuse);
% hist(codelist(seltrials1,5),[0:50:2500]);
% 
% temp=sprintf('%s %s %s','uc-gb-soa-ryan.m',date,fname);
% toptitle(temp);

%analyze data (by condition group, i.e. SOA);
latsdn=950;latsup=10000;
seltrials1=ismember(codelist(:,5),[latsdn:latsup]);

ss1=codelist(seltrials1,10);tt1=codelist(seltrials1,11);

% filter out NaNs
tmp = ~isnan(tt1);
ss1 = ss1(tmp);
tt1 = tt1(tmp);

% filter out nonrelevant entries
% tt1_temp = [];
% ss1_temp = [];
% 
% for j = 1:length(tt1)
%    if  ~isnan(tt1(j,1))
%       tt1_temp = [tt1_temp; tt1(j,1)];
%       ss1_temp = [ss1_temp; ss1(j,1)];
%    end
% end;
% 
% tt1 = tt1_temp;
% ss1 = ss1_temp;

% [beh_p1,beheff1,xrange,beh_curve,se, llik]=make_2par_logistic5(ss1_temp,tt1_temp,tt1_temp,unfoldedsoas);
% [ErrVec, n, junk] = CalcErrorBars(ss1_temp, tt1_temp, tt1_temp, unfoldedsoas);
% 
% figure
% %plot(unfoldedsoas,beheff1,'mo');
% errorbar(unfoldedsoas,beheff1,ErrVec,'k.')
% hold on
% plot(xrange,beh_curve,'m');
% xlabel('soa, ms');
% ylabel('proportion chose B');
% text(100,.1,sprintf('a=%3.2f b=%3.2f',beh_p1));
% temp=sprintf('%s %s %s','uc-gb-soa-ryan.m',date,fname);
% toptitle(temp);


%analyze data (by condition group, i.e. SOA);
% latsdn=950;latsup=10000;
% seltrials1=ismember(codelist(:,5),[latsdn:latsup]);
% 
% ss1=codelist(seltrials1,10);tt1=codelist(seltrials1,11);
% 
% [beh_p1,beheff1,xrange,beh_curve]=make_4par_logistic4(ss1,tt1,tt1,unfoldedsoas);
% 
% figure
% plot(unfoldedsoas,beheff1,'mo');
% hold on
% plot(xrange,beh_curve,'m');
% xlabel('soa, ms');
% ylabel('proportion chose B');
% text(100,.1,sprintf('a=%3.2f b=%3.2f c=%3.2f d=%3.2f',beh_p1));
% temp=sprintf('%s %s %s','uc-gb-soa-ryan.m',date,fname);
% toptitle(temp);

end

