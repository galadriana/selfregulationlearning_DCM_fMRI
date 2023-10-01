%
%
%
%% Generate bar plots with model evidence
clear all
close all
set(0,'defaulttextinterpreter','latex');
% First family 
load('BMS_firstmodelspace.mat');

% 
gcf=figure();
subplot(1,2,1)
cats=categorical(["Frontal"; "Striatal"]);
bar(cats,BMS.DCM.rfx.family.xp,'FaceColor',[0.3010 0.7450 0.9330] )
xlabel("Family");
ylabel("Family exceedence probability");
title(" Bayesian model evidence: First family-inference");
exportgraphics(gcf,'bar_family1.jpg','Resolution',300)

% BMS.DCM.rfx.model.xp
subplot(1,2,2)
bar(BMS.DCM.rfx.model.xp(:),'FaceColor',[0.3010 0.7450 0.9330] )
xlabel("Models");
ylabel("Model exceedence probability");
title(" Bayesian model evidence: First family-inference");
exportgraphics(gcf,'6.Bars_family1.jpg','Resolution',400)


%%
clear all
close all
set(0,'defaulttextinterpreter','latex');


% Second family 
load('BMS_secondmodelspace.mat')

gcf=figure();
subplot(2,1,1)
bar(BMS.DCM.rfx.family.xp,'FaceColor',[0.3010 0.7450 0.9330] );
xticklabels = ["Frontal" "ACC" "Striatum" ];
set(gca, 'XTick', [1 2 3])
set(gca, 'XTickLabel', {"Frontal" "ACC" "Striatum" })
set(gca, 'Ylim',[0 1] )
xlabel("Family");
ylabel("Model protected exceedence probability");
title( "Bayesian model evidence: Second family-inference");
subplot(2,1,2)
bar(BMS.DCM.rfx.model.xp,'FaceColor',[0.3010 0.7450 0.9330] );
set(gca, 'Ylim',[0 1] )
xlabel("Models");
ylabel("Model pxp");
title( " Bayesian model evidence: Second family-inference");
exportgraphics(gcf,'7.Bar_family2.jpg','Resolution',400)



