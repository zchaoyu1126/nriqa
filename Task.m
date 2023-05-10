classdef Task
    properties (Access = public)
        method function_handle
        paths
        fileName
        functionDir
    end
    
    methods
        function obj = init(obj, method, paths, fileName, functionDir)
            obj.method = method;
            obj.paths = paths;
            obj.fileName = fileName;
            obj.functionDir = functionDir;
        end

        function execute(obj)
            addpath(genpath(obj.functionDir));
            n = length(obj.paths);
            scores = zeros(n, 1);
            times = zeros(n, 1);
            for i = 1 : n
                filepath = obj.paths{i};
                [time, scores(i)] = obj.method(i, filepath);
                times(i) = milliseconds(time);
            end 
            save(obj.fileName, 'scores', 'times');
            rmpath(genpath(obj.functionDir));
        end
    end

end