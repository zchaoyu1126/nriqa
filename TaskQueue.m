classdef TaskQueue
    properties (Access = private)
        tasks = {}; % 存储任务的数组
    end
    
    methods
        function obj = addTask(obj, task)
            obj.tasks{end+1} = task;
        end
        
        function [obj, task] = getNextTask(obj)
            if isempty(obj.tasks)
                task = [];
            else
                task = obj.tasks{1};
                obj.tasks = obj.tasks(2:length(obj.tasks));
            end
        end
        
        function len = getQueueLength(obj)
            len = length(obj.tasks);
        end

    end
end