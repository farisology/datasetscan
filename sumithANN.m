%labels_target>>getData>>customNet


% Associating the inputs and outputs with with our data and labels
inputs = myDataset;
targets = myLabels;

% Setting the layers of the network
hiddenLayerSize = [ 90, 500, 17];
%hiddenLayerSize = [5 6 500 8];
%hiddenLayerSize = [11 5 3 9 8 7 4 5 6 3 2 1];

% Initializing the network
net = patternnet(hiddenLayerSize);
net.trainParam.max_fail = 20;
%net.trainParam.goal = 0.05;
% Sub dividing the data into Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;


% using train method we train the network
[net,tr] = train(net,inputs,targets);

% Testing the network performance
outputs = net(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net,targets,outputs)

Accuracy = 100 * (1 - performance)

% To visuaize the network uncomment the line below
%view(net)
