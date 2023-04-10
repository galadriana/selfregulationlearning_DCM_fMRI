

% This code is to generate the matrix representation of the models 
% in the paper "Self-regulation learning as Active inferene: Dynamic causa modeling of an fMRI neurofeedback task" 
% Based on P.Ziedman, et al. 2019. A guide to group effective connectivity analysis, part 1: First level analysis with DCM for fMRI. Figure 3

clear all
close all

%% MODEL STRUCTURE 
% The directionality follow and 'inverse' reading, it is from the columns to the raws.
%areas = ['Striatum'  'ACC' 'Frontal' 'SMA-R'];
%% List of first family models
A{1}= ones(4); A{1}(1,3)=NaN;A{1}(3,1)=NaN;
B{1}= NaN(4);   
C{1}= NaN(4,1); C{1}(3, 1)=1;
% % 
A{2}= NaN(4); A{2}(2,3)=1;A{2}(3,2)=1;A{2}(1,2)=1;A{2}(2,1)=1;A{2}(1,4)=1;A{2}(4,1)=1;
B{2}= NaN(4); 
C{2}= NaN(4,1); C{2}(3, 1)=1;
% % 
A{3}= NaN(4); A{3}(1,2)=1;A{3}(2,1)=1; A{3}(2,3)=1;A{3}(3,2)=1;A{3}(2,4)=1;A{3}(4,2)=1;
B{3}= NaN(4);
C{3}= NaN(4,1); C{3}(3, 1)=1;
% % 
A{4}= NaN(4); A{4}(1,2)=1;A{4}(2,1)=1; A{4}(2,3)=1;A{4}(3,2)=1;A{4}(3,4)=1;A{4}(4,3)=1;
B{4}= NaN(4); 
C{4}= NaN(4,1); C{4}(3, 1)=1;
% % 
A{5}= NaN(4); A{5}(1,2)=1;A{5}(2,1)=1; A{5}(2,3)=1;A{5}(3,2)=1; A{5}(4,1)=1;A{5}(3,4)=1;
B{5}= NaN(4);
C{5}= NaN(4,1); C{5}(3, 1)=1;
% % 
A{6}= NaN(4); A{6}(1,2)=1;A{6}(2,1)=1; A{6}(2,3)=1;A{6}(3,2)=1;A{6}(4,2)=1;A{6}(3,4)=1;
B{6}= NaN(4); 
C{6}= NaN(4,1); C{6}(3, 1)=1;
% % 
A{7}= NaN(4); A{7}(2,1)=1;A{7}(1,2)=1;A{7}(3,1)=1;A{7}(4,3)=1;A{7}(2,4)=1;A{7}(4,2)=1;
B{7}= NaN(4); 
C{7}= NaN(4,1); C{7}(3, 1)=1;
% % 
A{8}=A{1};
B{8}=B{1};
C{8}= NaN(4,1); C{8}(1, 1)=1;
% % 
A{9}=A{2};
B{9}=B{2};
C{9}= NaN(4,1); C{9}(1, 1)=1;
% % 
A{10}=A{3};
B{10}=B{3};
C{10}= NaN(4,1); C{10}(1, 1)=1;
% % 
A{11}=A{4};
B{11}=B{4};
C{11}= NaN(4,1); C{11}(1, 1)=1;
% % 
A{12}=A{5};
B{12}=B{5};
C{12}= NaN(4,1); C{12}(1, 1)=1;
% % 
A{13}=A{6};
B{13}=B{6};
C{13}= NaN(4,1); C{13}(1, 1)=1;
% % 
A{14}=A{7};
B{14}=B{7};
C{14}= NaN(4,1); C{14}(1, 1)=1;

%% Family description
% Test axis configuration 
% Connection between F and target areas (models 1 and 4)
% Bottom-up connections from lower regions to the target area (models 2, 3, 5, 6). 
% ALSO  test if it is ACTIVE INFERENCE (input in F) or REINFORCEMENT
% LEARNING (input in S)

nummodels1 = size(A,2); 
models_topdown = [1, 4];
models_bottomup = [2, 3, 5, 6]; 
model_test = 7;

%% PLOT FIRST FAMILY 

set(0,'defaulttextinterpreter','latex');
%
gcf=figure()
subplot(1,2,1);
heatmap(A{models_topdown(1)}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Ae");
xlabel("From");
ylabel("To");

subplot(1,2,2);
heatmap(A{models_topdown(2)}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Ae");
xlabel("From");
ylabel("To");
sgtitle(sprintf(['Extrinsic between-region connections: \n Top-down models '])) ;
exportgraphics(gcf,"DCMAetopdown.jpeg","Resolution",300, 'BackgroundColor','none','ContentType','vector')

%
gcf=figure()
subplot(1,4,1);
heatmap(A{models_bottomup(1)}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Ae");
xlabel("From");
ylabel("To");

subplot(1,4,2);
heatmap(A{models_bottomup(2)}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Ae");
xlabel("From");
ylabel("To");

subplot(1,4,3);
heatmap(A{models_bottomup(3)}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Ae");
xlabel("From");
ylabel("To");

subplot(1,4,4);
heatmap(A{models_bottomup(4)}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Ae");
xlabel("From");
ylabel("To");

sgtitle(sprintf(['Extrinsic between-region connections: \n Bottom-up models '])) ;
exportgraphics(gcf,"DCMAebottomup.jpeg","Resolution",300, 'BackgroundColor','none','ContentType','vector')



gcf=figure()
heatmap(A{model_test}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Ae");
xlabel("From");
ylabel("To");
sgtitle(sprintf([' Extrinsic between-region connections: \n not F-ACC-S axis'])) ;

exportgraphics(gcf,"DCMAe7.jpeg","Resolution",300, 'BackgroundColor','none','ContentType','vector')


%
gcf=figure()
subplot(1,2,1);
heatmap(C{1}, 'ColorLimits',[0, 1.8], ...
    'MissingDataLabel','Off', ...
    'YData', {'S','ACC','F', 'SMA'}, ...
    'ColorbarVisible','off'); 
title(" C ")
xlabel("Input: Visual thermometer ")
ylabel("Region")

subplot(1,2,2);
heatmap(C{14}, 'ColorLimits',[0, 1.8], ...
    'MissingDataLabel','Off', ...
    'YData', {'S','ACC','F', 'SMA'}, ...
    'ColorbarVisible','off'); 
title(" C ")
xlabel("Input: Visual thermometer ")
ylabel("Region")
exportgraphics(gcf,"DCMC.jpeg","Resolution",300, 'BackgroundColor','none','ContentType','vector')

% 
Ai = NaN(4);
for i = 1:size(Ai,1)
    Ai(i,i) = 1;
end
gcf=figure()
heatmap(Ai, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Modulation of self-connections Ai");
xlabel("From");
ylabel("To");
exportgraphics(gcf,"DCMBi.jpeg","Resolution",300, 'BackgroundColor','none','ContentType','vector')



%% List of second family models

clear all
close all

A{1}= ones(4); A{1}(1,3)=0;A{1}(3,1)=0;
B{1}= NaN(4); B{1}(2,3)=1;   
C{1}= NaN(4,1); C{1}(3, 1)=1;
% %
A{2}= ones(4); A{2}(1,3)=0;A{2}(3,1)=0;
B{2}= NaN(4); B{2}(4,3)=1;
C{2}= NaN(4,1); C{2}(3, 1)=1;
% % 
A{3}= ones(4); A{3}(1,3)=0;A{3}(3,1)=0;
B{3}= NaN(4); B{3}(4,3)=1; B{3}(2,3)=1;
C{3}= NaN(4,1); C{3}(3, 1)=1;
% % 
A{4}= ones(4); A{4}(1,3)=0;A{4}(3,1)=0;
B{4}= NaN(4); B{4}(2,1)=1; 
C{4}= NaN(4,1); C{4}(3, 1)=1;
% % 
A{5}= ones(4); A{5}(1,3)=0;A{5}(3,1)=0;
B{5}= NaN(4); B{5}(4,1)=1; 
C{5}= NaN(4,1); C{5}(3, 1)=1;
% % 
A{6}= ones(4); A{6}(1,3)=0;A{6}(3,1)=0;
B{6}= NaN(4); B{6}(4,1)=1; B{6}(2,1)=1; 
C{6}= NaN(4,1); C{6}(3, 1)=1;
% % 
A{7}= ones(4); A{7}(1,3)=0;A{7}(3,1)=0;
B{7}= NaN(4); B{7}(4,2)=1;
C{7}= NaN(4,1); C{7}(3, 1)=1;
% % 
A{8}= ones(4); A{8}(1,3)=0;A{8}(3,1)=0;
B{8}= NaN(4); B{8}(4,2)=1; B{8}(3,2)=1;
C{8}= NaN(4,1); C{8}(3, 1)=1;
% % 
A{9}= ones(4); A{9}(1,3)=0;A{9}(3,1)=0;
B{9}= NaN(4); B{9}(1,2)=1; B{9}(4,2)=1;
C{9}= NaN(4,1); C{9}(3, 1)=1;
% % 
A{10}= ones(4); A{10}(1,3)=0;A{10}(3,1)=0;
B{10}= NaN(4); B{10}(3,2)=1;
C{10}= NaN(4,1); C{10}(3, 1)=1;
% % 
A{11}= ones(4); A{11}(1,3)=0;A{11}(3,1)=0;
B{11}= NaN(4); B{11}(1,2)=1; B{11}(3,2)=1; 
C{11}= NaN(4,1); C{11}(3, 1)=1;
% % 
A{12}= ones(4); A{12}(1,3)=0;A{12}(3,1)=0;
B{12}= NaN(4); B{12}(1,2)=1; 
C{12}= NaN(4,1); C{12}(3, 1)=1;
% %
A{13}= ones(4); A{13}(1,3)=0;A{13}(3,1)=0;
B{13}= NaN(4); B{13}(1,2)=1; B{13}(3,2)=1; B{13}(4,2)=1; 
C{13}= NaN(4,1); C{13}(3,1)=1;
A{11}=A{4};
B{11}=B{4};
C{11}= NaN(4,1); C{11}(1, 1)=1;
% % 
A{12}=A{5};
B{12}=B{5};
C{12}= NaN(4,1); C{12}(1, 1)=1;
% % 
A{13}=A{6};
B{13}=B{6};
C{13}= NaN(4,1); C{13}(1, 1)=1;
% % 
A{14}=A{7};
B{14}=B{7};
C{14}= NaN(4,1); C{14}(1, 1)=1;

%% Family description
% Test modulation of self-connections by self-regulation
% Frontal = models 1, 2 and 3
% ACC = models 4, 5, 6
% Striatum =  models 7, 8, 9, 10, 11, 12, 13


nummodels1 = size(B,2); 
models_frontal = [1, 2, 3];
models_acc = [7, 8, 9, 10, 11, 12, 13];
model_striatum = [4, 5, 6]; 


% PLOT SECOND FAMILY 
set(0,'defaulttextinterpreter','latex');

% FRONTAL
gcf=figure()
subplot(1,3,1);
heatmap(B{models_frontal(1)}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Bi");
xlabel("From");
ylabel("To");

subplot(1,3,2);
heatmap(B{models_frontal(2)}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Bi");
xlabel("From");
ylabel("To");

subplot(1,3,3);
heatmap(B{models_frontal(3)}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Bi");
xlabel("From");
ylabel("To");
sgtitle(sprintf(['Modulation of self-connections by self-regulation: \n Frontal models '])) ;
exportgraphics(gcf,"DCMBiFRONTAL.jpeg","Resolution",300, 'BackgroundColor','none','ContentType','vector')



% ACC
gcf=figure()
subplot(1,7,1);
heatmap(B{models_acc(1)}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Bi");
xlabel("From");
ylabel("To");

subplot(1,7,2);
heatmap(B{models_acc(2)}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Bi");
xlabel("From");
ylabel("To");

subplot(1,7,3);
heatmap(B{models_acc(3)}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Bi");
xlabel("From");
ylabel("To");

subplot(1,7,4);
heatmap(B{models_acc(3)}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Bi");
xlabel("From");
ylabel("To");


subplot(1,7,5);
heatmap(B{models_acc(3)}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Bi");
xlabel("From");
ylabel("To");


subplot(1,7,6);
heatmap(B{models_acc(3)}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Bi");
xlabel("From");
ylabel("To");


subplot(1,7,7);
heatmap(B{models_acc(3)}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Bi");
xlabel("From");
ylabel("To");
sgtitle(sprintf(['Modulation of self-connections by self-regulation: \n ACC models '])) ;
exportgraphics(gcf,"DCMBiACC.jpeg","Resolution",300, 'BackgroundColor','none','ContentType','vector')



% STRIATUM
gcf=figure()
subplot(1,3,1);
heatmap(B{model_striatum(1)}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Bi");
xlabel("From");
ylabel("To");

subplot(1,3,2);
heatmap(B{model_striatum(2)}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Bi");
xlabel("From");
ylabel("To");

subplot(1,3,3);
heatmap(B{model_striatum(3)}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Bi");
xlabel("From");
ylabel("To");
sgtitle(sprintf(['Modulation of self-connections by self-regulation: \n Striatal models '])) ;

exportgraphics(gcf,"DCMBiStriatum.jpeg","Resolution",300, 'BackgroundColor','none','ContentType','vector')




%

%% PLOT WINNING MODEL
%

clear all
close all

set(0,'defaulttextinterpreter','latex');

A{1}= ones(4); A{1}(1,3)=NaN;A{1}(3,1)=NaN;
B{1}= ones(4); 
B{1}(2,4) = NaN; 
B{1}(4, 2) = NaN; 
B{1}(1, 3) = NaN;
B{1}(3, 1) = NaN;
B{1}(1, 1) = NaN;
B{1}(2, 2) = NaN;
B{1}(3, 3) = NaN;
B{1}(4, 4) = NaN;
C{1}= NaN(4,1); C{1}(3, 1)=1;
% 
Ai = NaN(4);
for i = 1:size(Ai,1)
    Ai(i,i) = 1;
end

zeros

gcf = figure();
subplot(1,4,1);

heatmap(A{1}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); 
title("Ae");
xlabel("From");
ylabel("To");

subplot(1,4,2);

heatmap(B{1}, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); 
title("Bi");
xlabel("From");
ylabel("To");

subplot(1,4,3);

heatmap(C{1}, 'ColorLimits',[0, 1.8], ...
    'MissingDataLabel','Off', ...
    'YData', {'S','ACC','F', 'SMA'}, ...
    'ColorbarVisible','off'); 
title("C")
xlabel("Visual thermometer")
ylabel("Region")

subplot(1,4,4);

heatmap(Ai, 'ColorLimits',[0, 1.8], ...
    'XData',{'S','ACC','F','SMA'}, ...
    'YData',{'S','ACC','F','SMA'}, ...
    'MissingDataLabel','Off', ...
    'ColorbarVisible','off'); % 'CellLabelColor','none' 
title("Ai");
xlabel("From");
ylabel("To");

sgtitle(sprintf(['Model architecture for brain self-regulation learning'])) ;

%saveas(gcf, 'DCMWIN.jpg');
exportgraphics(gcf,"DCMWIN.jpeg","Resolution",300, 'BackgroundColor','none','ContentType','vector')



