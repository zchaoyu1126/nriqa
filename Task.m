classdef Task
    properties (Access = public)
        method function_handle
        paths
        fileName
    end
    
    methods
        function obj = init(obj, method, paths, fileName)
            obj.method = method;
            obj.paths = paths;
            obj.fileName = fileName;
        end

        function execute(obj)
            n = length(obj.paths);
            scores = zeros(n, 1);
            times = zeros(n, 1);
            for i = 1 : n
                filepath = obj.paths{i};
                [time, scores(i)] = obj.method(i, filepath);
                times(i) = milliseconds(time);
            end 
            save(obj.fileName, 'scores', 'times');
        end
    end

end