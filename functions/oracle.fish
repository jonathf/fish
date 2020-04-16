# Defined in - @ line 1
function oracle --description 'alias oracle pdsh -R ssh -w oracle1,oracle2,oracle3,oracle4,oracle5,oracle6'
	pdsh -R ssh -w oracle1,oracle2,oracle3,oracle4,oracle5,oracle6 $argv;
end
