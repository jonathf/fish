function _pure_prompt_jobs --description "Display number of running jobs"
    set --local njobs (count (jobs -p))
    set --local jobs_color (set_color normal)
    if test $njobs -gt 0
        echo "$jobs_color"$njobs
    end
end
