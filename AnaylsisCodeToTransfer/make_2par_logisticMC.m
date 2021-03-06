function beh_p = make_2par_logisticMC(allstim,allbeh,rowser,prestimes)



    %%%%%DO BEH FITS
	for ll=1:length(prestimes)
 		xer=prestimes(ll);
  		zz=find(allstim==xer);
  		beheff(1,ll)=sum(allbeh(zz))./length(zz);
  		clear xer zz
	end	
	data=[repmat(1, [length(allstim),1]) allstim allbeh];   
	[parsx, pars1, pars2, se]=logistfit(data);% 2 parm-fit
	%[parsx,llik,pred]=logistfit_parm4(data); %%4 parm fit
	%behpar=pars';
	behpar4=parsx';
	clear data pred parsx pars1 pars2 se
	clear allcounts allstim allbeh allneur crit_neuralval cov kk 
	clear allstim allbeh allneur

	%%%%NOW YOU SHOULD HAVE THE DATA LIKE YOU DO IN THE GBLI-FITS-COV
	%endparms_beh=unlogit_sra(behpar4(3:4));

	%beh_p=[behpar4(1:2) endparms_beh];
    beh_p = behpar4;
	%beheff=beheff(1,:);

	%%getcurves	
	%xrange=[-5:.1:5];
    %xrange=min(prestimes):1:max(prestimes);
	%beh_curve=get_4parm_fit_vals(beh_p, xrange);
