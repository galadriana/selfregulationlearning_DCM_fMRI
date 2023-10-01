%% Generate TABLES of results including numerical values 

% .F is the Free Energy (or log-model evidence) for each model/subject
%.SF contains the sum of the log-evidence (F) for each model


% First family 
clear all
close all
% First family 
BMS_1 = load('BMS_firstmodelspace.mat');

FREEENERGY_1 = BMS_1.BMS.DCM.rfx.F;
SUM_logevidence_1 = BMS_1.BMS.DCM.rfx.SF;

% Second family 
BMS_2= load('BMS_secondmodelspace.mat')

FREEENERGY_2 = BMS_2.BMS.DCM.rfx.F;
SUM_logevidence_2 = BMS_2.BMS.DCM.rfx.SF;


table_F_1 = array2table(double(FREEENERGY_1),...
    'VariableNames',{'Model 1','Model 2','Model 3', 'Model 4', 'Model 5', 'Model 6', 'Model 7','Model 8', 'Model 9','Model 10', 'Model 11','Model 12', 'Model 13', 'Model 14' });

%table_F_1.Variables =  round(table_F_1.Variables,1)

writetable(table_F_1,'table1.csv'); % x is the name of your table, the csv will be saved where your code is saved


table_F_2 = array2table(FREEENERGY_2,...
    'VariableNames',{'Model 1','Model 2','Model 3', 'Model 4', 'Model 5', 'Model 6', 'Model 7','Model 8', 'Model 9','Model 10', 'Model 11','Model 12', 'Model 13'});

writetable(table_F_2,'table2.csv'); % x is the name of your table, the csv will be saved where your code is saved


yvalues = {'1','2','3', '4', '5', '6', '7','8', '9','10', '11','12', '13', '14', '15', '16', '17', '18'};

xvalues_1 = {'1','2','3', '4', '5', '6', '7','8', '9','10', '11','12', '13', '14' };

xvalues_2 = {'1','2','3', '4', '5', '6', '7','8', '9','10', '11','12', '13'};



figure()
bar(SUM_logevidence_1);
title( 'Sum of the log-evidence for each model: First family inference');
xlabel ('Model');
%ylim([12.8,13])
ylabel ('Summatory of Free energy ');
set(gca, 'YScale', 'log');
exportgraphics(gcf,'1.Sum of the log-evidence for each model_1.jpg','Resolution',1200)


figure()
bar(SUM_logevidence_2);
title( 'Sum of the log-evidence for each model: Second family inference');
xlabel ('Model');
ylabel ('Summatory of Free energy ');
set(gca, 'YScale', 'log');
exportgraphics(gcf,'2.Sum of the log-evidence for each model_2.jpg','Resolution',1200)


figure()
h1_F = heatmap(xvalues_1,yvalues,FREEENERGY_1, 'ColorScaling','scaled', 'XDisplayData', [1,2,3,4,5,6,7,8,9,10,11,12,13,14]);
h1_F.Title = 'Free Energy for each subject and model: First family inference';
h1_F.XLabel = 'Model';
h1_F.YLabel = 'Subject';
h1_F.YLabel = 'Subject';

figure()
h2_F = heatmap(xvalues_2,yvalues,FREEENERGY_2, 'ColorScaling','scaled', 'XDisplayData', [1,2,3,4,5,6,7,8,9,10,11,12,13]);
h2_F.Title = 'Free Energy for each subject and model: Second family inference';
h2_F.XLabel = 'Model';
h2_F.YLabel = 'Subject';
h2_F.YLabel = 'Subject';


