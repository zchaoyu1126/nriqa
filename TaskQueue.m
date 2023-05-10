classdef TaskQueue
    properties (Access = private)
        tasks = {}; % 存储任务的数组
    end
    
    methods
        function obj = pushTask(obj, task)
            obj.tasks{end+1} = task;
        end
        
        function task = getNextTask(obj)
            if isempty(obj.tasks)
                task = [];
            else
                task = obj.tasks{1};
            end
        end
        
        function obj = popTask(obj)
            obj.tasks = obj.tasks(2:length(obj.tasks));
        end

        function len = getQueueLength(obj)
            len = length(obj.tasks);
        end
    end
end