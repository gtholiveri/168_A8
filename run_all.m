function run_all()
% Runs all homework scripts, saves figures as PNGs and console output as
% text files to the output/ directory.

outputDir = "output";
if ~exist(outputDir, 'dir')
    mkdir(outputDir);
end

close all;

scripts = { ...
    "Oliveri_TAC168_HW08_P1.m", "P1"; ...
    "Oliveri_TAC168_HW08_P2.m", "P2"; ...
    "Oliveri_TAC168_HW08_P3.m", "P3"; ...
    "Oliveri_TAC168_HW08_P4.m", "P4"; ...
    "Oliveri_TAC168_HW08_P5.m", "P5"  ...
};

for ii = 1:size(scripts, 1)
    scriptName = scripts{ii, 1};
    prefix     = scripts{ii, 2};
    fprintf("Running %s...\n", scriptName);

    % captureScript isolates the child script's workspace so that its
    % clear/clc calls don't wipe this function's local variables.
    textOut = captureScript(scriptName);

    % Save console output if non-empty
    if ~isempty(strtrim(textOut))
        fid = fopen(fullfile(outputDir, prefix + "_output.txt"), 'w');
        fprintf(fid, '%s', textOut);
        fclose(fid);
    end

    % Collect figures in creation order (findall returns newest-first)
    figs = flip(findall(0, 'Type', 'figure'));

    if length(figs) == 1
        exportgraphics(figs(1), fullfile(outputDir, prefix + ".png"), 'Resolution', 150);
    else
        for jj = 1:length(figs)
            exportgraphics(figs(jj), fullfile(outputDir, prefix + "_" + jj + ".png"), 'Resolution', 150);
        end
    end

    close all;
end

fprintf("Done. Output saved to '%s/'\n", outputDir);
end

function textOut = captureScript(scriptName)
% Runs scriptName in this function's isolated workspace so that clear/clc
% inside the homework script cannot disturb the caller's variables.
textOut = evalc("run('" + scriptName + "')");
end
