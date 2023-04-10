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
gcf=figure()
cats=categorical(["Frontal"; "Striatal"]);
bar(cats,BMS.DCM.rfx.family.xp,'FaceColor',[0.3010 0.7450 0.9330] )
xlabel("Family");
ylabel("Family exceedence probability");
title(" Bayesian model evidence: First family-inference");
exportgraphics(gcf,'bar_family1.jpg','Resolution',300)

% BMS.DCM.rfx.model.xp
gcf=figure()
cats=categorical(["1"; "2"; "3"; "4"; "5"; "6"; "7"]);
bar(cats,BMS.DCM.rfx.model.xp(1:7),'FaceColor',[0.3010 0.7450 0.9330] )
xlabel("Models");
ylabel("Model exceedence probability");
title(" Bayesian model evidence: First family-inference");
exportgraphics(gcf,'bar_models1.jpg','Resolution',300)

%%
clear all
close all
set(0,'defaulttextinterpreter','latex');


% Second family 
load('BMS_secondmodelspace.mat')

gcf=figure()
bar(BMS.DCM.rfx.model.xp,'FaceColor',[0.3010 0.7450 0.9330] );
xticklabels = ["Frontal" "ACC" "Striatum" ];
ylim = ([0 1]);
xlabel("Models");
ylabel("Model protected exceedence probability");
title( " Bayesian model evidence: Second family-inference");
exportgraphics(gcf,'bar_models2.jpg','Resolution',300)

gcf=figure()
cat2=categorical(["Frontal" ; "ACC"; "Striatum" ]);
bar(cat2, BMS.DCM.rfx.family.xp,'FaceColor',[0.3010 0.7450 0.9330] );
xticklabels = ["Frontal" "ACC" "Striatum" ];
ylim = ([0 1]);
xlabel("Family");
ylabel("Model protected exceedence probability");
title( " Bayesian model evidence: Second family-inference");
exportgraphics(gcf,'bar_family2.jpg','Resolution',300)



