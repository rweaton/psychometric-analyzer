function [beh_p, beheff, xrange, beh_curve, se, pars1]=make_2par_logistic5(allstim,allbeh,rowser,prestimes)

    %length(prestimes)

    %%%%%DO BEH FITS
	for ll=1:length(prestimes)
 		xer=prestimes(ll);
  		zz=find(allstim==xer);
  		beheff(1,ll)=sum(allbeh(zz))./length(zz);
  		
        k(1,ll) = sum(allbeh(zz));
        n(1,ll) = length(zz);
        
        clear xer zz;
    end	
    
    %length(k)
	data=[repmat(1, [length(allstim),1]) allstim allbeh];   
	[pars, pars1, pars2, se]=logistfit(data);% 2 parm-fit
	%[parsx]=logistfit(data); %%4 parm fit
	behpar=pars';
	%behpar4=parsx';
	%clear data pars pars1 pars2 parsx
    clear data pars pars2 parsx
	clear allcounts allstim allbeh allneur crit_neuralval cov kk 
	clear allstim allbeh allneur

	%%%%NOW YOU SHOULD HAVE THE DATA LIKE YOU DO IN THE GBLI-FITS-COV
	%endparms_beh=unlogit_sra(behpar4(3:4));

	%beh_p=[behpar4(1:2) endparms_beh];

    beh_p=behpar;
	beheff=beheff(1,:);

	%%getcurves	
	%xrange=[-10:.1:10];
	xrange=[min(prestimes):1:max(prestimes)];
    beh_curve=get_2parm_fit_vals(beh_p, xrange);
