% Loading the dataset and converting it into double data type
load imagematrixPCA;
data = im2double(mydataPCA);
% 
% % we transpose the labels and data inorder to shuffle them
Tdata = transpose(data);
Tlabels = transpose(labels);

%we concatinate both so they become one for shuffling
Tlbadat = horzcat(Tdata, Tlabels);

%shuffling logic
nRows = size(Tlbadat,1); % number of rows
nSample = round(size(Tlbadat,1)*0.7); % number of training samples, 70% of the data
rndIDX = randperm(nRows); % for randomly swap the rows
TrainX = Tlbadat(rndIDX(1:nSample),1:end-15);  % training set input
TrainY = Tlbadat(rndIDX(1:nSample),end-14:end); % training set output
TestX = Tlbadat(rndIDX(nSample+1:end),1:end-15);  % testing set input, 30% of the data
TestY = Tlbadat(rndIDX(nSample+1:end),end-14:end); % testing set output

% we would like to put the divisons back so we vertically concatinate both
% matrix
lData = vertcat(TrainX, TestX);
lLabels = vertcat(TrainY, TestY);

% we transpose back because we need them in this order
myDataset = transpose(lData);
myLabels = transpose(lLabels);

